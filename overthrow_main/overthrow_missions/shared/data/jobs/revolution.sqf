params ["_jobid","_jobparams"];
_jobparams params ["_town"];

//Here is where we might randomize the parameters a bit
private _reppos = getpos player;
private _currentTown = _reppos call OT_fnc_nearestTown;
private _abandoned = server getVariable ["NATOabandoned",[]];

private _posTown = server getVariable [_currentTown,[]];

private _radius = 1500; 
private _exp = "(randomGen 1 + forest + trees) * (1 - sea) * (1 - houses)"; 
private _prec = 50;
private _bestplace = selectBestPlaces [_posTown,_radius,_exp,_prec,1];
private _bestplace1 = (_bestplace select 0);
private _destination = (_bestplace1 select 0);
_markerPos = (_destination);

_params = [_Currenttown,_destination,_jobid];

//Build a mission description and title
private _description = format["It seems a group of so called 'patriots' have risen up and started a plot to overthrow the resistance and establish democracy in this town. I've already found out where there base of operatoins is, I'd advise elminiating their higher ups and the rest should sort itself out. <br/><br/>Reward: $750, +5 stabilty (%1)",_Currenttown];
private _title = format["Revolutionaries in %1",_currentTown];

//The data below is what is returned to the gun dealer/faction rep, _markerPos is where to put the mission marker, the code in {} brackets is the actual mission code, only run if the player accepts
[
    [_title,_description],
    _markerPos,
    {	
		params ["_Currenttown","_destination","_jobid"];
		private _start = (_destination) findEmptyPosition [10,50,"I_C_Soldier_Camo_F"];
	
		private _units = ["I_C_Soldier_Para_7_F","I_C_Soldier_Para_2_F","I_C_Helipilot_F","I_C_Soldier_Para_3_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_6_F","I_C_Soldier_Para_8_F","I_C_Soldier_Para_1_F","I_C_Soldier_Para_5_F"];
		private _numGoons = 4;
        private _count = 0;
        private _bgroup = creategroup [opfor,true];
		private _bgroup2 = creategroup [opfor,true];
		
		_ofi1 = _bgroup createUnit ["I_C_Soldier_Camo_F", _start, [],0, "NONE"];
		[_ofi1] joinSilent nil;
        [_ofi1] joinSilent _bgroup;
		
		{
			_x addCuratorEditableObjects [[_ofi1],true];
		} forEach allCurators;
		
		_start = (_destination) findEmptyPosition [10,50,"I_C_Soldier_Camo_F"];
		
		_ofi2 = _bgroup2 createUnit ["I_C_Soldier_Camo_F", _start, [],0, "NONE"];
		[_ofi2] joinSilent nil;
        [_ofi2] joinSilent _bgroup2;
		
		{
			_x addCuratorEditableObjects [[_ofi2],true];
		} forEach allCurators;

        _wp = _bgroup addWaypoint [_destination,0];
        _wp setWaypointType "GUARD";
        _wp = _bgroup addWaypoint [_destination,0];
        _wp setWaypointType "CYCLE";
		
		_wp = _bgroup2 addWaypoint [_destination,0];
        _wp setWaypointType "GUARD";
        _wp = _bgroup2 addWaypoint [_destination,0];
        _wp setWaypointType "CYCLE";
		
		
		_start = (_destination) findEmptyPosition [10,50,"I_C_Soldier_Camo_F"];
		while {(_count < _numGoons)} do {
			private _SelMan = selectRandom _units;
            private _civ = _bgroup createUnit [_SelMan, _start, [],0, "NONE"];
            [_civ] joinSilent nil;
            [_civ] joinSilent _bgroup;
            _civ setRank "SERGEANT";
            _civ setBehaviour "SAFE";
            _civ setVariable ["VCOM_NOPATHING_Unit",true,false];
            _civ disableAI "PATH";
            _civ addEventHandler ["FiredNear", {params ["_unit"];_unit enableAI "PATH"}];
			
			{
				_x addCuratorEditableObjects [[_civ],true];
			} forEach allCurators;
			
			sleep 1;
            _count = _count + 1;
        };
		
		_numGoons = 4;
        _count = 0;
		
		_start = (_destination) findEmptyPosition [10,50,"I_C_Soldier_Camo_F"];
		while {(_count < _numGoons)} do {
			private _SelMan = selectRandom _units;
			private _civ = _bgroup2 createUnit [_SelMan, _start, [],0, "NONE"];
			[_civ] joinSilent nil;
			[_civ] joinSilent _bgroup2;
			_civ setRank "SERGEANT";
			_civ setBehaviour "SAFE";
			_civ setVariable ["VCOM_NOPATHING_Unit",true,false];
			_civ disableAI "PATH";
			_civ addEventHandler ["FiredNear", {params ["_unit"];_unit enableAI "PATH"}];
			
			{
				_x addCuratorEditableObjects [[_civ],true];
			} forEach allCurators;
			
			sleep 1;
			_count = _count + 1;
        };
			
		_this pushback _ofi1;
		_this pushback _ofi2;
		
        true
    },
    {
        //Fail check...
		 params ["_Currenttown","_destination","_jobid","_ofi1","_ofi2"];
		 false
    },
    {
        //Success.. easy.. if target is dedded
		 params ["_Currenttown","_destination","_jobid","_ofi1","_ofi2"];
		 
        (!(alive _ofi1) && !(alive _ofi2));
    },
    {
        params ["_Currenttown","_destination","_jobid","_ofi1","_ofi2","_wassuccess"];

        //If mission was a success
        if (_wassuccess) then {
            [
                {
                    params ["_Currenttown","_destination","_jobid"];

					[750] call OT_fnc_money;
					[_Currenttown,5] call OT_fnc_stability;

                    format ["That'll teach them a lesson, sending you the $750 and feel free to take whatever you want from their camp. +(5 stabilty %1)",_Currenttown] remoteExec ["OT_fnc_notifyMinor",0,false];
                },
                [_Currenttown],
                2
            ] call CBA_fnc_waitAndExecute;

        };
        //Clean up
		spawner setVariable [format["fugitive%1",_jobid],nil,false];
        private _civ = spawner getVariable [format["fugitive%1",_jobid],objNull];
        [group _civ] call OT_fnc_cleanup;
    },
    _params
];