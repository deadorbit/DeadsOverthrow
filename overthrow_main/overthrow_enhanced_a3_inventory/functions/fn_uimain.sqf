/*
	Original Title: Epoch Enhanced Arma3 Inventory - Gear armor calculation functions
    Original Authors: Author: Aaron Clark - EpochMod.com
	Licence: Arma Public License Share Alike (APL-SA) - https://www.bistudio.com/community/licenses/arma-public-license-share-alike
	Github: https://github.com/EpochModTeam/Enhanced-Arma3-Inventory
	
	Function: OT_INV_fnc_uiMain
	
	Changes From Orginal: 

    Example:
    _vestArmor = ["gear",(vest player)] call OT_INV_fnc_uiMain;

    Parameter(s):
		_type(String): - Sets mode for function, can be: "selectItem", "init", or "refresh":
			- selectItem retrieves the configName of the item associated with the currently dragged label 
			- init should be called when the player inventory display is opened and attaches neccesary eventHandlers and UI elements for the mod to work
        _this select 1: STRING - payload

	Returns: Nil
*/

params [["_type", "init"], ["_item", ""], ["_extra", -1]];
if (!OT_INV_scriptEnabled) exitWith {};


private _color 			= [0.19, 0.50, 0.81, 1.00];
private _colorCompare 	= [0.30, 0.07, 0.35, 0.90];
if(!(isNil "OT_INV_armorBarCurrentColor" || isNil "OT_INV_armorBarFutureColor")) then {
	_color 				= OT_INV_armorBarCurrentColor + [1.00];
	_colorCompare 		= OT_INV_armorBarFutureColor + [1.00];
};

switch _type do {
    case "selectItem": {
        private ["_exit","_data","_name","_text","_pic"];
        _item params ["_control","_index"];
        if (_index isEqualType []) then {
            _index = (_index select 0) select 1;
        };
        _text = _control lbText _index;
        _data = _control lbData _index;
        _pic = _control lbPicture _index;
        _val = _control lbValue _index;
        if (_data == "") then {
            _container = switch (_extra) do {
                case 633: { uniformContainer player };
                case 638: { vestContainer player };
                case 632: { OT_INV_targetContainer };
                case 640: { OT_INV_secondaryContainer };
                default { backpackContainer player };
            };
            _weaponsAndItems = ((getWeaponCargo  _container) select 0);
            _weaponsAndItems append ((getItemCargo _container) select 0);
            _data = _weaponsAndItems param [_val,""];
        };
        uiNamespace setVariable ["OT_INV_interactedItem",[_text,_data,_pic,_val]];
    };
    case "init": {
		private ["_display", "_bar", "_remoteContainer", "_height", "_pos", "_small_height", "_existing_bar", "_bar_compare", "_displayEH", "_displayEHID"];
		
        _item params ["_unit","_targetContainer","_secondaryContainer"];
        OT_INV_targetContainer = _targetContainer;
        OT_INV_secondaryContainer = objNull;
        if !(isNull _secondaryContainer) then {
            OT_INV_targetContainer = _secondaryContainer;
            OT_INV_secondaryContainer = _targetContainer;
        };

        waitUntil {(!isNull findDisplay 602)};
        if (!isNull findDisplay 602) then {
            disableSerialization;
            _display = findDisplay 602;
			_displayEH = [];
			_displayEHID = uiNameSpace getVariable ["OT_INV_inventoryDisplayEH", -1];
			
			//If onMouseButtonUp has been made
			if (_displayEHID isEqualTo -1) then {
					//If not, make the eventHandler
					_displayEHID = ["mouseButtonUp", "[] call OT_INV_fnc_armorLBDrop"] call CBA_fnc_addDisplayHandler;
					uiNameSpace setVariable ["OT_INV_inventoryDisplayEH",_displayEHID];
			}else{
				_display getEventHandlerInfo ["mouseButtonUp", _displayEHID];
				_displayEH = _display getEventHandlerInfo ["mouseButtonUp", _displayEHID];
				if ((count _displayEH isEqualTo 0) || ((_displayEH select 0) isEqualTo false)) then {
					//If not, create the event
					_displayEHID = ["mouseButtonUp", "[] call OT_INV_fnc_armorLBDrop"] call CBA_fnc_addDisplayHandler;
					uiNameSpace setVariable ["OT_INV_inventoryDisplayEH",_displayEHID];
				};
			};
			private _backpackContainer 	= 619;
			private _groundContainer 	= 632;
			private _uniformContainer 	= 633;
			private _vestContainer 		= 638;
			private _soldierContainer 	= 640;
			private _playerContainers 	= [_backpackContainer, _uniformContainer, _vestContainer];
			private _foriegnContainers 	= [_groundContainer, _soldierContainer];
			
            // init custom sub menu handler
            {
                _container = _display displayCtrl _x;
                _container ctrlAddEventHandler ["LBDblClick",format["[_this,%1] call OT_INV_fnc_subMenu;",_x]];
            } forEach (_playerContainers);
			
            // armor stats init
            {
                _remoteContainer = _display displayCtrl _x;
				_remoteContainer ctrlAddEventHandler ["LBDrag", format["[_this, %1] call OT_INV_fnc_armorLBDrag", _x]];
            } forEach (_playerContainers + _foriegnContainers);
			
			//Mimic behavior of dragging player equipped item picture
			{
				_remoteContainer = _display displayCtrl _x;
                _remoteContainer ctrlAddEventHandler ["MouseButtonDown", "[_this] call OT_INV_fnc_armorImgClick"];
			} forEach [6240, 6331, 6381];

			//-------UNIFORM ARMOR BAR SETUP-------
            //Move and resize existing uniform bar
            _existing_bar = _display displayCtrl 6304;
            _pos = ctrlPosition _existing_bar;
            _height = (_pos select 3) / 2;
            _existing_bar ctrlSetPosition [_pos select 0,(_pos select 1)+_height,_pos select 2,_height];
            _existing_bar ctrlCommit 0;
			//Uniform armor bar
			_bar = _display ctrlCreate ["RscCustomProgress", 7304];
            _bar ctrlSetTextColor _colorCompare;
            _bar ctrlSetPosition [_pos select 0,_pos select 1,_pos select 2,_height];
            _bar ctrlCommit 0;
			//Uniform armor bar overlay
			_bar_compare = _display ctrlCreate ["RscCustomProgress", 7306];
			_bar_compare ctrlSetPosition [_pos select 0,_pos select 1,_pos select 2,_height];
            _bar_compare ctrlCommit 0;
			_bar_compare ctrlSetTextColor _color;
			uiNameSpace setVariable ["RscUniformArmorProgress", [_bar,_bar_compare]];
			//------------------------------------
			
			//--------VEST ARMOR BAR SETUP--------
            //Move and resize existing vest bar
            _existing_bar = _display displayCtrl 6305;
            _pos = ctrlPosition _existing_bar;
            _height = (_pos select 3) / 2;
            _small_height = _height;
            _existing_bar ctrlSetPosition [_pos select 0,(_pos select 1)+_height,_pos select 2,_height];
            _existing_bar ctrlCommit 0;
			// New Vest armor bar
            _bar = _display ctrlCreate ["RscCustomProgress", 7308];
            _bar ctrlSetTextColor _colorCompare;
            _bar ctrlSetPosition [_pos select 0,_pos select 1,_pos select 2,_height];
            _bar ctrlCommit 0;
			//Vest armor overlaying bar
			_bar_compare = _display ctrlCreate ["RscCustomProgress", 7310];
			_bar_compare ctrlSetPosition [_pos select 0,_pos select 1,_pos select 2,_height];
            _bar_compare ctrlCommit 0;
			_bar_compare ctrlSetTextColor _color;
			uiNameSpace setVariable ["RscVestArmorProgress", [_bar,_bar_compare]];
			//------------------------------------
			
			//------HEADGEAR ARMOR BAR SETUP------
            //Get headgear image size
            _existing_bar = _display displayCtrl 6240;
            _pos = ctrlPosition _existing_bar;
            _height = _pos select 3;
			//Create headgear armor bar
			_bar = _display ctrlCreate ["RscCustomProgress", 7312];
            _bar ctrlSetTextColor _colorCompare;
            _bar ctrlSetPosition [_pos select 0,(_pos select 1)+_height,_pos select 2,_small_height];
            _bar ctrlCommit 0;
			//Create headgear overlaying bar
			_bar_compare = _display ctrlCreate ["RscCustomProgress", 7314];
            _bar_compare ctrlSetTextColor _colorCompare;
            _bar_compare ctrlSetPosition [_pos select 0,(_pos select 1)+_height,_pos select 2,_small_height];
			_bar_compare ctrlCommit 0;
			_bar_compare ctrlSetTextColor _color;
			uiNameSpace setVariable ["RscHeadgearArmorProgress", [_bar,_bar_compare]];
			//------------------------------------

			//-------TOTAL ARMOR BAR SETUP--------
            //Shrink and move the existing totalload bar to fit the totalarmor bar;
            _existing_bar = _display displayCtrl 6308;
            _pos = ctrlPosition _existing_bar;
            _height = (_pos select 3) / 2;
            _existing_bar ctrlSetPosition [_pos select 0,(_pos select 1)+_height,_pos select 2,_height];
            _existing_bar ctrlCommit 0;
            //create base total armor bar;
            _bar = _display ctrlCreate ["RscTotalArmorProgress", 7316];
            _bar ctrlSetTextColor _colorCompare;
            _bar ctrlSetPosition [_pos select 0,_pos select 1,_pos select 2,_height];
            _bar ctrlCommit 0;
			//create second overlaying (covering) total armor bar
            _bar_compare = _display ctrlCreate ["RscCustomProgress", 7318];
            _bar_compare ctrlSetTextColor _color;
            _bar_compare ctrlSetPosition [_pos select 0,_pos select 1,_pos select 2,_height];
            _bar_compare ctrlCommit 0;
            uiNameSpace setVariable ["RscCustomProgressTotal", [_bar,_bar_compare]];
			//------------------------------------

            ["refresh"] call OT_INV_fnc_uiMain;
        };
    };
    case "refresh": {
        if ((findDisplay 602) isNotEqualTo displayNull) then {
			disableSerialization;
			
			//Basic vars
			private _equippedTotalArmor 	= 0;
			private _futureTotalArmor 		= 0;
			private _uniformBarFill			= 0;
			private _uniformOverBarFill	 	= 0;
			private _vestBarFill			= 0;
			private _vestOverBarFill 		= 0;
			private _headgearBarFill		= 0;
			private _headgearOverBarFill	= 0;
			//Fetch current armor values
			private _uniformArmor 			= ["uniform",(uniform player)] call DEDF_fnc_armorCalc;
			private _vestArmor 				= ["gear",(vest player)] call DEDF_fnc_armorCalc;
			private _headgearArmor 			= ["gear",(headgear player)] call DEDF_fnc_armorCalc;
			//Fetch GUI elements	
			private _uniformBarUI 			= uiNameSpace getVariable "RscUniformArmorProgress";
			private _uniformBar 			= _uniformBarUI select 0;
			private _uniformOverBar			= _uniformBarUI select 1;
			private _vestBarUI				= uiNameSpace getVariable "RscVestArmorProgress";
			private _vestBar 				= _vestBarUI select 0;
			private _vestOverBar			= _vestBarUI select 1;
			private _headgearBarUI			= uiNameSpace getVariable "RscHeadgearArmorProgress";
			private _headgearBar 			= _headgearBarUI select 0;
			private _headgearOverBar		= _headgearBarUI select 1;
			private _totalArmorUI 			= uiNameSpace getVariable "RscCustomProgressTotal";
			private _totalArmorBar			= _totalArmorUI select 0;
			private _totalArmorOverBar 		= _totalArmorUI select 1;
			//Item being dragged vars	
			private _interactedItem 		= uiNamespace getVariable ["OT_INV_interactedItem",[]];
			private _interactedItemType		= -1;
			private _interactedItemArmor 	= 0;
			private _interactedItemBar 		= controlNull;
			private _interactedItemOverBar	= controlNull;
			
			
			//Flag used by the inventory gear picture handlers to communicate what they belong to
			if(_extra isNotEqualTo -1) then {
				_interactedItemType 		= _extra;
			};
			//Fetch Item being dragged
			if (_interactedItem isNotEqualTo []) then {
				_interactedItem 			= _interactedItem select 1;
				_interactedItemType 		=  getnumber(configFile >> "CfgWeapons" >> _interactedItem >> "ItemInfo" >> "type");
				
				switch(_interactedItemType) do {
					case(801): {
						_interactedItemArmor	= (["uniform",_interactedItem] call OT_fnc_armorCalc);
						_interactedItemBar 		= _uniformBar;
						_interactedItemOverBar 	= _uniformOverBar;
					};
					case(701): {
						_interactedItemArmor 	= (["gear",_interactedItem] call OT_fnc_armorCalc);
						_interactedItemBar 		= _vestBar;
						_interactedItemOverBar 	= _vestOverBar;
					};
					case(605): {
						_interactedItemArmor 	= (["gear",_interactedItem] call OT_fnc_armorCalc);
						_interactedItemBar 		= _headgearBar;
						_interactedItemOverBar 	= _headgearOverBar;
					};
				};
			};

			//Reset Bar Colors
			_uniformBar 		ctrlSetTextColor _colorCompare;
			_vestBar 			ctrlSetTextColor _colorCompare;
			_headgearBar 		ctrlSetTextColor _colorCompare;
			_uniformOverBar 	ctrlSetTextColor _color;
			_vestOverBar 		ctrlSetTextColor _color;
			_headgearOverBar 	ctrlSetTextColor _color;
			_totalArmorBar 		ctrlSetTextColor _colorCompare;
			_totalArmorOverBar 	ctrlSetTextColor _color;

			private _totalArmorPercent 		= 0;
			private _futureArmorPercent 	= 0;
			private _data					= [0,0,0,0];
			
			//Uniform
			_data = [_uniformArmor, _interactedItemArmor, _interactedItemType, 801, 0] call OT_INV_fnc_armorUICalc;
			_data params ["_totalArmorPercent", "_futureArmorPercent", "_itemBarFill", "_itemOverBarFill"];
			
			_equippedTotalArmor 	= _equippedTotalArmor + _totalArmorPercent;
			_futureTotalArmor 		= _futureTotalArmor + _futureArmorPercent;
			_uniformBarFill 		= _itemBarFill;
			_uniformOverBarFill 	= _itemOverBarFill;
			
			if (_futureArmorPercent > _totalArmorPercent) then {
				_uniformBarFill 		= _itemOverBarFill;
				_uniformOverBarFill 	= _itemBarFill;
			};
			
			//Vest
			_data = [_vestArmor, _interactedItemArmor, _interactedItemType, 701, 1] call OT_INV_fnc_armorUICalc;
			_data params ["_totalArmorPercent", "_futureArmorPercent", "_itemBarFill", "_itemOverBarFill"];
			
			_equippedTotalArmor 	= _equippedTotalArmor + _totalArmorPercent;
			_futureTotalArmor 		= _futureTotalArmor + _futureArmorPercent;
			_vestBarFill 			= _itemBarFill;
			_vestOverBarFill 		= _itemOverBarFill;
			
			if (_futureArmorPercent > _totalArmorPercent) then {
				_vestBarFill 		= _itemOverBarFill;
				_vestOverBarFill 	= _itemBarFill;
			};
			
			
			//Helmet
			_data = [_headgearArmor, _interactedItemArmor, _interactedItemType, 605, 2] call OT_INV_fnc_armorUICalc;
			_data params ["_totalArmorPercent", "_futureArmorPercent", "_itemBarFill", "_itemOverBarFill"];
			
			_equippedTotalArmor 	= _equippedTotalArmor + _totalArmorPercent;
			_futureTotalArmor 		= _futureTotalArmor + _futureArmorPercent;
			_headgearBarFill 		= _itemBarFill;
			_headgearOverBarFill 	= _itemOverBarFill;
			
			if (_futureArmorPercent > _totalArmorPercent) then {
				_headgearBarFill 		= _itemOverBarFill;
				_headgearOverBarFill 	= _itemBarFill;
			};
			
			//Taking item off or selected item with less armor
			if (_futureTotalArmor > _equippedTotalArmor) then {
				private _temp 		= _equippedTotalArmor;
				_equippedTotalArmor = _futureTotalArmor;
				_futureTotalArmor	= _temp;
			};
			
			
			//Fill bars below gear images
			_uniformBar progressSetPosition _uniformBarFill;
			_uniformOverBar progressSetPosition _uniformOverBarFill;
			_vestBar progressSetPosition _vestBarFill;
			_vestOverBar progressSetPosition _vestOverBarFill;
			_headgearBar progressSetPosition _headgearBarFill;
			_headgearOverBar progressSetPosition _headgearOverBarFill;
			
			//Fill total armor bar
			_equippedTotalArmor = linearConversion [0, 1, _equippedTotalArmor, 0, 0.995, true];
			_totalArmorBar progressSetPosition _equippedTotalArmor;
			//Bar that is above the the first
			_futureTotalArmor = linearConversion [0, 1, _futureTotalArmor, 0, 0.995, true];
			_totalArmorOverBar progressSetPosition _futureTotalArmor;
        };
    };
};