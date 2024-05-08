[] spawn {
	private _civcounter = 0;
	sleep(120);
	OT_Airdropped = false;
	while {true} do {
		sleep 60;
		_civcounter = _civcounter + 1;
		if((AllowAirD) && (!OT_Airdropped) && round(random 100) <= 3) then {
			[] spawn OT_fnc_createDrop;
		};
		if ((_civcounter % 5) == 0) then {
			[] spawn OT_fnc_townFlagUpdater;
			[] spawn OT_fnc_DespawnDeadWithTime;
		};
	};
};