if (!isServer) exitwith {};

params ["_town","_spawnid"];

private _abandoned = server getVariable ["NATOabandoned",[]];
if (_town in _abandoned) exitWith {};

private _posTown = server getVariable _town;
private _groups = [];
private _numNATO = server getVariable format["garrison%1",_town];
private _count = 0;
private _range = 350;
private _population = server getVariable format ["population%1",_town];

if(_town in OT_capitals) then {
	_range = 900;
};

//record the spawn ID for job tasks
spawner setVariable [format["spawnid%1",_town],_spawnid];
/* Just dosnt work well
if ((_numNATO > 2) && (_population > 550)) then {
	if (random[0,5,10] > -1) then {
		private _home = _town call OT_fnc_getRandomRoadPosition;
		private _pos = [_home, 5, 75, 5, 0, 3, 0] call BIS_fnc_findSafePos;
		private _veh = OT_NATO_Vehicle_Police;
		private _group = createGroup west;
		
		_veh =  _veh createVehicle _pos;
		createVehicleCrew _veh;
		[_veh] joinSilent _group;
		
		private _civ = _group createUnit [OT_NATO_Unit_Police, _home, [],0, "NONE"];
		_civ setVariable ["garrison",_town,false];
		_group selectLeader _civ;
		[_civ] joinSilent _group;
		_civ setRank "CORPORAL";
		_civ setBehaviour "SAFE";
		_civ moveInCargo _veh;
		[_civ,_town] call OT_fnc_initGendarm;
		if (HCEnabled) then {
			[_civ,HC1] spawn OT_fnc_MoveToHC;
		};
		
		private _civ = _group createUnit [OT_NATO_Unit_Police, _home, [],0, "NONE"];
		_civ setVariable ["garrison",_town,false];
		[_civ] joinSilent _group;
		_civ setRank "PRIVATE";
		_civ setBehaviour "SAFE";
		_civ moveInCargo _veh;
		[_civ,_town] call OT_fnc_initGendarm;
		if (HCEnabled) then {
			[_civ,HC1] spawn OT_fnc_MoveToHC;
		};
		
		{
			[_x] joinSilent _group;
			_x setVariable ["garrison",_town,false];
			[_x,_town] call OT_fnc_initGendarm;
		}foreach(crew _veh);
		
		{
			_x addCuratorEditableObjects [[_veh]];
		}foreach(allcurators);
		
		sleep 0.5;
		_group call OT_fnc_initGendarmPatrol;
		
		_count = _count + 3;
	};
};

*/
private _groupsize = 1;
if(_numNato > 10) then {_groupsize = 2};//how many men follow the leader};
if(_numnato > 20) then {
	_groupsize = 3;
	_numnato = 20;
};

while {_count < _numNATO} do {

	private _home = _town call OT_fnc_getRandomRoadPosition;
	private _pos = _home findEmptyPosition [2,50];

	if !(_pos isEqualTo []) then {

		private _group = createGroup west;
		_group setVariable ["VCM_TOUGHSQUAD",true,true];
		_group setVariable ["VCM_NORESCUE",true,true];
		_group deleteGroupWhenEmpty true;
		_groups pushBack _group;

		private _civ = _group createUnit [OT_NATO_Unit_PoliceCommander, _home, [],0, "NONE"];

		_civ setVariable ["garrison",_town,false];
		[_civ] joinSilent _group;
		_civ setRank "CORPORAL";
		_civ setBehaviour "SAFE";
		[_civ,_town] call OT_fnc_initGendarm;
		if (HCEnabled) then {
			[_civ,HC1] spawn OT_fnc_MoveToHC;
		};
		_count = _count + 1;
		
		private _groupcount = 0;
		while{_groupcount < _groupsize && _count < _numNato} do {
			sleep 0.5;
			_civ = _group createUnit [OT_NATO_Unit_Police, _pos, [],0, "NONE"];
			_civ setVariable ["garrison",_town,false];
			[_civ] joinSilent _group;
			_civ setRank "PRIVATE";
			[_civ,_town] call OT_fnc_initGendarm;
			_civ setBehaviour "SAFE";
			if (HCEnabled) then {
				[_civ,HC1] spawn OT_fnc_MoveToHC;
			};
			_groupcount = _groupcount + 1;
			_count = _count + 1;
		};
		sleep 5;
		_range = _range + 50;
		{
			_x addCuratorEditableObjects[units _group,false];
		}foreach(allcurators);
		
		_group call OT_fnc_initGendarmPatrol;
		[_group] spawn OT_fnc_GendarmPatrolChange;
	};
};

spawner setvariable [_spawnid,(spawner getvariable [_spawnid,[]]) + _groups,false];
