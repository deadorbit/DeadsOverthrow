createDialog "OT_dialog_buy";
{
	private _civ = OT_interactingWith;
	_cls = _x select 0;
	private _town = (getpos player) call OT_fnc_nearestTown;
	private _standing = [_town] call OT_fnc_support;

	_price = [_town,_cls,_standing] call OT_fnc_getPrice;
	if("fuel depot" in (server getVariable "OT_NATOabandoned")) then {
		_price = round(_price * 0.5);
	};
	_idx = lbAdd [1500,format["%1",_cls call OT_fnc_vehicleGetName]];
	lbSetPicture [1500,_idx,_cls call OT_fnc_vehicleGetPic];
	lbSetData [1500,_idx,_cls];
	lbSetValue [1500,_idx,_price];
}foreach(OT_boats);