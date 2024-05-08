params ["_pos","_unit"];

if (isnil "OT_JammingPos") then {
	OT_JammingPos = [];
};

[_unit, _unit] call ace_common_fnc_claim;

private _currentTown = _pos call OT_fnc_nearestTown;

OT_JammingPos pushBackUnique [_pos,_currentTown]; //Keep track of which town it is in case it needs to be removed when town captured
