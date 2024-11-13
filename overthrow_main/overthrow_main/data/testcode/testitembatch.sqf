private _containerCls = "B_Slingload_01_Cargo_F";

private _itemsFnc = {
	//Code to get list of items to add, should return array of strings
	((keys OT_allBags) + (keys OT_allHelmets)) - (keys OT_illegalGear)
};

private _items = [] call _itemsFnc;
private _pos = (getpos player) findEmptyPosition [5, 25, _containerCls];

private _container = _containerCls createVehicle _pos;
[_container] call DEDF_fnc_clearContainerCargo;

{
	[_container, _x, 1] call DEDF_fnc_simpleAddAny;
}foreach(_items);