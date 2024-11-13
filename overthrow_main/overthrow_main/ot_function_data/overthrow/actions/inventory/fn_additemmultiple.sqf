params [["_dest", objNull], ["_item", ""], ["_amnt", 1], ["_verify", false]];

private _count = 0;
while {_count < _amnt} do {
	[_dest, _item, _amnt, _verify] call CBA_fnc_addItemCargo;
	_count = _count + 1;
};