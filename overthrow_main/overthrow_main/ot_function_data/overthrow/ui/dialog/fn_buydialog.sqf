params ["_town","_standing","_s",["_multiplier", 1],["_fastbuy",false]];

private _civ = OT_interactingWith;
private _cat = "";
private _name = "";

if(vehicle player == player) then {
	_civ = OT_interactingWith;
	_name = name _civ;
	_cat = _civ getVariable ["OT_shopCategory","General"];
	if(_civ getvariable ["factionrep",false]) then {
		_cat = "Faction";
	};
}else{
	_name = "Cargo";
	_cat = ((nearestBuilding player) getVariable ["OT_shopCategory","Hardware"]);
};

if (_cat != "Pharmacy") then {
	_cat = _cat + " Store";
}; 

private _sorted = [_s,[],{tolower((_x select 0) call OT_fnc_anythinggetname)},"ASCEND"] call BIS_fnc_SortBy;

_textctrl = (findDisplay 8000) displayCtrl 1101;
_textctrl ctrlSetStructuredText parseText format["<t size='1.7' shadow='2' align='left' valign = 'middle'>%1 | %2</t>",_name,_cat];

lbClear 1500;
ctrlShow [2000, false];
ctrlenable [2000, false];

if (_fastbuy) then {
	ctrlSetText[2000,"1"];
	ctrlShow [2000, true];
	ctrlEnable [2000, true];
};
{
	_x params ["_cls", "_num", ["_enabled", true], ["_disabledText", "Not Available"]];
	
	private _price = [_town,_cls,_standing] call OT_fnc_getPrice;
	_price = _price * _multiplier;
	([_cls] call {
		params ["_cls", ["_name",""], ["_pic",""]];
		if(_cls isKindOf "All") exitWith {
			_name = _cls call OT_fnc_vehicleGetName;
			_pic = _cls call OT_fnc_vehicleGetPic;
			[_name, _pic]
		};
		if(_cls isKindOf ["None",configFile >> "CfgGlasses"]) exitWith {
			_name = _cls call OT_fnc_glassesGetName;
			_pic = _cls call OT_fnc_glassesGetPic;
			[_name, _pic]
		};
		if(_cls isKindOf ["Default",configFile >> "CfgMagazines"]) exitWith {
			_name = _cls call OT_fnc_magazineGetName;
			_pic = _cls call OT_fnc_magazineGetPic;
			[_name, _pic]
		};
		_name = _cls call OT_fnc_weaponGetName;
		_pic = _cls call OT_fnc_weaponGetPic;
		[_name, _pic]
	}) params ["_name", "_pic"];
	
	private _text = format["%1 x %2",_num,_name];
	if(_num isEqualTo -1) then {_text = _name};
	private _idx = lbAdd [1500,_text];
	lbSetPicture [1500,_idx,_pic];
	if !(_enabled) then {
		lbSetColor [1500,_idx,[0.3,0.3,0.3,1]];
		_price = -1;
		_cls = _disabledText;
	};
	lbSetValue [1500,_idx,_price];
	lbSetData [1500,_idx,_cls];
}foreach(_sorted);
