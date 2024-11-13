params ["_faction","_score"];

private _pos = getpos OT_interactingWith;

_vehicles = nearestobjects[_pos,["Car","Tank","Air"],50];
_gear = spawner getvariable[format["facvehicles%1",_faction],[]];
private _target = "";

{
	if ((_target isEqualTo "") && ((typeof _x) in _gear)) then {
	private _cost = [typeof _x] call OT_fnc_getLegitScore;
		if (_cost >= _score) then {
			_target = _x;
		};
	};
}foreach(_vehicles);

_target