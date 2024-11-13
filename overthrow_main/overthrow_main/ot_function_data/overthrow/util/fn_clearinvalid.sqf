params [["_container", objNull]];

private _magazines = magazineAmmoCargo _container;

{
	private _mag = _x;
	_mag params ["_item", "_ammo"];
	if (OT_noCopyMags getOrDefault [_item,false]) then {
		[_container, _item, 1, _ammo] call CBA_fnc_removeMagazineCargo;
	};
}foreach(_magazines);