params ["_town","_standing"];

lbClear 1500;

_civ = OT_interactingWith;
_name = name _civ;

_textctrl = (findDisplay 8000) displayCtrl 1101;
_textctrl ctrlSetStructuredText parseText format["<t size='1.7' shadow='2' align='left' valign = 'middle'>%1 | %2</t>",_name,"Clothing Store"];

ctrlShow [2000, false];
ctrlenable [2000, false];
{
	private _cls = _x;
	private _price = [_town,_cls,_standing] call OT_fnc_getPrice;
	private _c = _cls splitString "_";
	private _side = _c select 1;
	private _name = "";
	private _pic = "";
	if(((_cls == "V_RebreatherIA" || _side == "C" || _side == "I") && (_c select (count _c - 1) != "VR")) || (_cls in OT_AdditionalUnforms)) then {
		_name = _cls call OT_fnc_weaponGetName;
		_pic = _cls call OT_fnc_weaponGetPic;
	}else{
		_name = _cls call OT_fnc_glassesGetName;
		_pic = _cls call OT_fnc_glassesGetPic;
	};
	if(_name != "") then {
		private _idx = lbAdd [1500,_name];
		lbSetPicture [1500,_idx,_pic];
		lbSetValue [1500,_idx,_price];
		lbSetData [1500,_idx,_cls];
	};
}foreach(OT_Clothingstore);
