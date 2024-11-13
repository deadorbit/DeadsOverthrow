params ["_unit","_home"];
private _group = group _unit;
while{not (isnil {_group})} do {
	while {true} do {
		sleep 30;
		systemchat "Running";
		if((animationstate _unit isEqualTo "amovpsitmstpslowwrfldnon") || NOT(((behaviour _unit) == "SAFE") || ((behaviour _unit) == "AWARE") || ((behaviour _unit) == "CARELESS")) )  exitwith {};//They're busy, we should check back at a better time
		[_unit, "SIT_LOW", "FULL"] call BIS_fnc_ambientAnimCombat;
	};
};