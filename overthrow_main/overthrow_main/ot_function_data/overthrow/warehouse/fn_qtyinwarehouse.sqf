private _ret = 0;

private _town = (getpos player) call OT_fnc_nearestTown;
private _townwarehouse = warehouse getvariable [_town,nil];
if(isnil{_townwarehouse}) then {
	warehouse setvariable [_town,[]];
	_townwarehouse = warehouse getvariable _town;
};

private _itemVars = +_townwarehouse;
_itemVars sort true;

{
	private _cls = _x select 0;
	private _num = _x select 1;
	if(_cls isequalto _this) exitwith {
		_ret = _num;
	};
}foreach(_itemVars);

_ret
