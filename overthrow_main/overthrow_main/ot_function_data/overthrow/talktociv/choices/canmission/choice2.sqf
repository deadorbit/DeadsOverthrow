private _civ = OT_interactingWith;
_faction = _civ getvariable ["faction",""];
private _standing = server getVariable [format["standing%1",_faction],0];
private _tstanding = [_town] call OT_fnc_support;

_gear = spawner getvariable[format["facweapons%1",_faction],[]];
_s = [];
{
	if (!((OT_allExplosives getOrDefault [_x, false]) || (OT_noCopyMags getOrDefault [_x, false])) then {
		_s pushback [_x,-1];
	};
}foreach(_gear);
createDialog "OT_dialog_buy";
private _discount = 1.2 - (0.4 * (_standing/200));
if(_discount < 0.8) then {_discount = 0.8};

[OT_nation,_tstanding,_s,_discount] call OT_fnc_buyDialog;