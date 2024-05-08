params ["_vehicle","_waypoint"];

private _groups = _vehicle getVariable "tGroups";
private _commander = effectivecommander _vehicle;

/*(driver _vehicle) disableAI "MOVE";
_commander disableAI "MOVE";
_vehicle disableAI "move";*/

{ 
	SimulatedObjects pushbackunique _x; 
}foreach(_groups);

{
	_x leaveVehicle _vehicle;
}foreach(_groups);

/*(driver _vehicle) enableAI "MOVE";
_commander enableAI "MOVE";
_vehicle disableAI "MOVE";*/