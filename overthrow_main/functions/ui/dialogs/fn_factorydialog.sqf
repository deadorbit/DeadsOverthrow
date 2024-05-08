private _IsFac = (_this select 0);


if(_IsFac) then {

createDialog 'OT_dialog_factory';

private _cursel = lbCurSel 1500;
lbClear 1500;
private _done = [];
private _numitems = 0;

ctrlEnable [1609,false];

if (call OT_fnc_playerIsGeneral) then {
	if (OT_factoryLevel < 3) then {
		ctrlEnable [1609,true];
	};
};

((findDisplay 8000) displayCtrl 1105) ctrlSetStructuredText parseText format["<t size='1' align='center'>Factory Level: %1/3</t>",OT_factoryLevel];

{
	if(_x isKindOf ["Default",configFile >> "CfgWeapons"]) then {
		_x = [_x] call BIS_fnc_baseWeapon;
	};

	if !(_x in _done) then {
		_done pushback _x;
		
		private _name = "";
		private _pic = "";

		_numitems = _numitems + 1;
		_x call {
			if(_this isKindOf "AllVehicles") exitWith {
				_name = _this call OT_fnc_vehicleGetName;
				_pic = _this call OT_fnc_vehicleGetPic;
			};
			if(_this isKindOf ["Default",configFile >> "CfgWeapons"]) exitWith {
				_name = _this call OT_fnc_weaponGetName;
				_pic = _this call OT_fnc_weaponGetPic;
			};
			if(_this isKindOf ["Default",configFile >> "CfgMagazines"]) exitWith {
				_name = _this call OT_fnc_magazineGetName;
				_pic = _this call OT_fnc_magazineGetPic;
			};
			if(_this isKindOf "Bag_Base") exitWith {
				_name = _this call OT_fnc_vehicleGetName;
				_pic = _this call OT_fnc_vehicleGetPic;
			};
		};

		private _idx = lbAdd [1500,format["%1",_name]];
		lbSetPicture [1500,_idx,_pic];
		lbSetData [1500,_idx,_x];
	};
}foreach(server getVariable ["GEURblueprints",[]]);

if(_cursel >= _numitems) then {_cursel = 0};
lbSetCurSel [1500, _cursel];

[] call OT_fnc_factoryRefresh;

}else{
	private _Business = (_this select 1);
	private _target = [];
	private _targetB = [];
	createDialog "OT_dialog_BusinessMenu";
 
	((findDisplay -1500) displayCtrl 1101) ctrlSetStructuredText parseText format["<t size='2' align='center' font = ""PuristaBold"">%1</t>",_Business];
 
	{
		if ((_x select 0) == _Business) then {_target = _x};
	}forEach OT_BusinessLevel;
	
		{
		if ((_x select 1) == _Business) then {_targetB = _x};
	}forEach OT_economicData;
 
	private _Level = _target select 1;
	private _HasLog = _target select 2;
	private _Production = "Money";
	
	if(count _targetB isEqualTo 5) then {
		private _Item = _targetB select 4;
		_Production = getText (configfile >> "CfgWeapons" >> _Item >> "displayName");
	}else{
		if(count _targetB isEqualTo 4) then {
			private _Item = _targetB select 3;
			_Production = getText (configfile >> "CfgWeapons" >> _Item >> "displayName");
		};
	};
	
	private _perhr = [OT_nation,"WAGE",0] call OT_fnc_getPrice;
	private _rate = server getVariable [format["%1employ",_Business],0];
 
/*	if !(_Production isEqualTo "Money") then {
		((findDisplay -1500) displayCtrl 1110) ctrlSetStructuredText parseText format["<t size='1' align='left' font = ""PuristaMedium"">Has Logistics Center: %1</t><br/><br/><t size='1' align='left' font = ""PuristaMedium"">Exporting To:</t><br/><br/><t size='1' align='left' font = ""PuristaMedium"">Export Fleet: ATVs (Level 1/4)</t><br/><t size='1' align='left' font = ""PuristaMedium"">Units Sold Per Run:</t><br/><t size='1' align='left' font = ""PuristaMedium"">Est. Profit Per Run:</t><br/><br/><t size='1' align='left' font = ""PuristaMedium"">Security: Squirt Guns (Level 1/4)</t><br/><t size='1' align='left' font = ""PuristaMedium"">Est. Chance of Failure: 60%</t>",_HasLog];
	}else{
		((findDisplay -1500) displayCtrl 1110) ctrlSetStructuredText "";
	};*/
	
	((findDisplay -1500) displayCtrl 1102) ctrlSetStructuredText parseText format["<t size='1' align='left' font = ""PuristaMedium"">Produces: %1</t><br/><t size='1' align='left' font = ""PuristaMedium"">Workers: %2</t><br/><t size='1' align='left' font = ""PuristaMedium"">Amnt Per Hour: %3</t><br/><t size='1' align='left' font = ""PuristaMedium"">Upkeep: $%4</t><br/><t size='1' align='left' font = ""PuristaMedium"">Level: %5</t>",_Production,_rate,(_rate * 3),(_rate * _perhr),_Level]; //--- ToDo: Localize;
	private _cost = 0;
	if (_Level == 1) then {_cost = 100000};
	if (_Level == 2) then {_cost = 250000};
	if (_Level == 3) then {_cost = 500000};
	if (_Level == 4) then {_cost = 750000};
	
	_cost = [_cost, 1, 0, true] call CBA_fnc_formatNumber;
	
	if (_Level < 5) then {
		private _cost = 0;
		if (_Level == 1) then {_cost = 100000};
		if (_Level == 2) then {_cost = 250000};
		if (_Level == 3) then {_cost = 500000};
		if (_Level == 4) then {_cost = 750000};
		((findDisplay -1500) displayCtrl 1600) ctrlSetText format["Upgrade Business: $%1",_cost];
		((findDisplay -1500) displayCtrl 1600) buttonSetAction "closeDialog 0; ['Expand'] spawn OT_fnc_buyBusinessDialog;";
	}else{
		((findDisplay -1500) displayCtrl 1600) ctrlSetText "Upgrade Business: At Max Level";
	};
 
//((findDisplay -10) displayCtrl -13) ctrlSetStructuredText parseText format["<t size='1' align='center'>Upgrade %1 (%2/5) by increasing its maximum number of workers for $%3?</t>",_Business,_target,_cost];
};
