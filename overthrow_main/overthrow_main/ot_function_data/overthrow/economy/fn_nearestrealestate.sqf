params [["_centerPos", [0, 0, 0]]];

private _return = false;
private _building = objNull;
private _sorted = [];

if(isNil "OT_allBuyableBuildings" || isNil "OT_allRepairableRuins") exitWith {false};

if ((typeName _centerPos) isNotEqualTo "ARRAY") then {
	//Assume entity
	_centerPos = getPos _centerPos;
};


_sorted = [
	(_centerPos nearObjects ["Building",30]),
	[_centerPos],
	{_x distance _input0},
	"ASCEND"
] call BIS_fnc_SortBy;

if ((count _sorted) isEqualTo 0) exitWith {
	false
};

if(!isNil "modeTarget") then {
	_sorted = _sorted - [modeTarget];
};


{
	if ((typeof _x) in (OT_allBuyableBuildings + OT_allRepairableRuins)) exitWith {
		_building = _x;
	};
}foreach(_sorted);

if(_building isNotEqualTo objNull) then {
	private _data = _building call OT_fnc_getRealEstateData;
	if((_data select 1) isEqualTo -1) exitWith {false};
	
	_return = [_building] + _data;
};

_return
