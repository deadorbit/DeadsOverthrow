params ["_unit","_object","_cost"];

if(_unit call OT_fnc_unitSeen) then {
    _unit setCaptive false;
	(format ["You were spotted by NATO while trying to build fortifications."]) remoteExec  [OT_fnc_notifyMinor,_unit];
};
