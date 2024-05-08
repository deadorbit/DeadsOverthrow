closedialog 0;
createDialog "OT_dialog_logistics";
lbClear 1500;
ctrlShow [1602, false];
ctrlshow [2001,false];
ctrlshow [1103,false];
ctrlshow [1102,false];

private _s = [];

{
	if((_x call OT_fnc_hasOwner) && (_x call OT_fnc_playerIsOwner)) then {
		_s pushBackUnique _x;
	};
}foreach((entities "OT_Land_Cargo10_grey_F") + (entities "B_CargoNet_01_ammo_F") + (entities OT_item_Safe));

_s = [_s, [], { player distance2D _x }, "ASCEND"] call BIS_fnc_sortBy;

private _ctrl = (findDisplay 8001) displayCtrl 1101;
_ctrl ctrlSetStructuredText parseText format["<t size='1.7' shadow='2' align='left' valign = 'middle'>Logistics</t>"];

{
    private _veh = _x;
    private _cls = typeof _veh;
    private _name = _cls call OT_fnc_vehicleGetName;
	if (_veh getvariable["ace_cargo_customname",""] != "") then {
		_name = format["%1 (%2)",_veh getvariable "ace_cargo_customname",_name];
	};
    private _pic = getText(configFile >> "cfgVehicles" >> _cls >> "editorPreview");
    private _dis = round(_veh distance player);
    private _t = "m";
    if(_dis > 999) then {
		_dis = (_dis / 1000) toFixed 1;
		_t = "km";
    };

    _idx = lbAdd [1500,format["%1 (%2%3)",_name,_dis,_t]];
    lbSetPicture [1500,_idx,_pic];
    lbSetData [1500,_idx,_veh call BIS_fnc_netId];
    private _color = [0.9,0.9,0.9,1];

    lbSetColor [1500,_idx,_color];
}foreach(_s);
