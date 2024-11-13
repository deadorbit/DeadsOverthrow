params ["_type"];
private _found = "";
private _possible = [];

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
	if(_num > 0) then {
		private _weapon = [_cls] call BIS_fnc_itemType;
		private _weaponType = _weapon select 1;
		if(_weaponType == "AssaultRifle" && (_cls find "_GL_") > -1) then {_weaponType = "GrenadeLauncher"};
		if(_weaponType == "AssaultRifle" && (_x find "srifle_") == 0) then {_weaponType = "SniperRifle"};
		if(_weaponType == _type) then {_possible pushback _cls};
	};
}foreach(_itemVars);

if(count _possible > 0) then {
	private _sorted = [_possible,[],{(cost getvariable [_x,[200]]) select 0},"DESCEND"] call BIS_fnc_SortBy;
	_found = _sorted select 0;
};

_found
