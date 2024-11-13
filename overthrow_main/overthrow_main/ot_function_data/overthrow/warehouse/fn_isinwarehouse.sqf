
params ["_cls","_num"];
private _ret = false;

private _town = (getpos player) call OT_fnc_nearestTown;
private _townwarehouse = warehouse getvariable [_town,nil];
if(isnil{_townwarehouse}) then {
	warehouse setvariable [_town,[]];
	_townwarehouse = warehouse getvariable _town;
};

private _itemVars = +_townwarehouse;
_itemVars sort true;

{
	private _Icls = _x select 0;
	private _Inum = _x select 1;
	if(_cls isEqualTo _Icls) exitwith{
		_ret = (_Inum >= _num);
	};
}foreach(_itemVars);
_ret
