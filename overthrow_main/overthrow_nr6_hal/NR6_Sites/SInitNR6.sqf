if (isNil ("RydHQ_Included")) then {RydHQ_Included = []};
if (isNil ("RydHQB_Included")) then {RydHQB_Included = []};
if (isNil ("RydHQC_Included")) then {RydHQC_Included = []};
if (isNil ("RydHQD_Included")) then {RydHQD_Included = []};
if (isNil ("RydHQE_Included")) then {RydHQE_Included = []};
if (isNil ("RydHQF_Included")) then {RydHQF_Included = []};
if (isNil ("RydHQG_Included")) then {RydHQG_Included = []};
if (isNil ("RydHQH_Included")) then {RydHQH_Included = []};

SpawnRGroupS = {

    private ["_grp","_SpawnPos","_SpawnRadius","_Side","_Pool","_SpawnRadius","_MinBuilding","_PatrolPercent","_Leaders"];

    _SpawnPos = _this select 0;
    _SpawnRadius = _this select 1;
    _Side = _this select 2;
    _Pool = _this select 3;
    _SpawnRadius = _this select 4;
    _MinBuilding = _this select 5;
    _PatrolPercent = _this select 6;
    _Leaders = _this select 7; 
    
    _grp = [([_SpawnPos,10,_SpawnRadius,10] call BIS_fnc_findSafePos),_Side, selectRandom _Pool] call BIS_fnc_spawnGroup; 
    _grp deleteGroupWhenEmpty true;
//    _grp setVariable ["zbe_cacheDisabled",true];
    _grp setVariable ["Unable",true];
    _grp setVariable ["Busy" + (str _grp),true];
    _grp setVariable ["Garrisoned" + (str _grp),true];
    [_grp,_SpawnPos,_SpawnRadius,_MinBuilding,_PatrolPercent] remoteExecCall ["NR6_fnc_CBA_Defend",(leader _grp)];

    {        
    if (isNull _x) then {} else 
        {
        if (_x==LeaderHQ) then {RydHQ_Included pushBack _grp;};
        if (_x==LeaderHQB) then {RydHQB_Included pushBack _grp;};
        if (_x==LeaderHQC) then {RydHQC_Included pushBack _grp;};
        if (_x==LeaderHQD) then {RydHQD_Included pushBack _grp;};
        if (_x==LeaderHQE) then {RydHQE_Included pushBack _grp;};
        if (_x==LeaderHQF) then {RydHQF_Included pushBack _grp;};
        if (_x==LeaderHQG) then {RydHQG_Included pushBack _grp;};
        if (_x==LeaderHQH) then {RydHQH_Included pushBack _grp;};

        if (_x==LeaderHQ) then {RydHQ_NoDef pushBack _grp;};
        if (_x==LeaderHQB) then {RydHQB_NoDef pushBack _grp;};
        if (_x==LeaderHQC) then {RydHQC_NoDef pushBack _grp;};
        if (_x==LeaderHQD) then {RydHQD_NoDef pushBack _grp;};
        if (_x==LeaderHQE) then {RydHQE_NoDef pushBack _grp;};
        if (_x==LeaderHQF) then {RydHQF_NoDef pushBack _grp;};
        if (_x==LeaderHQG) then {RydHQG_NoDef pushBack _grp;};
        if (_x==LeaderHQH) then {RydHQH_NoDef pushBack _grp;};
        }; 
            
    } forEach _Leaders;

};