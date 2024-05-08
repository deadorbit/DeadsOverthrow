params ["_group"];
sleep (round(random 10));
while{not (isnull _group)} do {
	while {true} do {
		if (isnull _group) exitwith {};
		sleep 15;
		private _unit = leader _group;
		if(NOT(((behaviour _unit) == "SAFE") || ((behaviour _unit) == "AWARE") || ((behaviour _unit) == "CARELESS")))  exitwith {};//They're busy, we should check back at a better time

		private _pos = getpos _unit;

		sleep 60;

		private _newpos = getpos _unit;

		if ((_pos distance _newpos) < 5) then {//They are just sitting there, not doing their jobs
			for "_i" from 0 to (count waypoints _group - 1) do {
				deleteWaypoint [_group, 0];
			};
			_group call OT_fnc_initGendarmPatrol;
		};
	};
};