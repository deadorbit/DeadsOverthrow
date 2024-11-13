if (!isServer) exitwith {};

params ["_town","_spawnid"];

private _abandoned = server getVariable ["NATOabandoned",[]];
if (_town in _abandoned) exitWith {};

private _posTown = server getVariable _town;
private _groups = [];
private _numNATO = server getVariable format["garrison%1",_town];
private _count = 0;
//private _range = 350;
private _population = server getVariable format ["population%1",_town];
private _isNationCapital = (_town isEqualTo OT_mainCapital);
private _isRegionalCapital = (_town in OT_capitals);
private _policeGroupLeader = OT_policeUnitCaptain;
private _spawnTable = [
	OT_policeUnitLight, 0.33,
	OT_policeUnitRegular, 0.34,
	OT_policeUnitHeavy, 0,
	OT_policeUnitMedic, 0.33,
	OT_policeUnitAT, 0,
	OT_policeUnitHeavyAT, 0
];		

if (_isNationCapital || _isRegionalCapital) then {
	_policeGroupLeader = OT_policeUnitCommander;
};

//Get spawn probabilites for police units
switch (true) do {
	case(_isNationCapital) : {
		_spawnTable = [
			OT_policeUnitLight, 0.00,
			OT_policeUnitRegular, 0.35,
			OT_policeUnitHeavy, 0.25,
			OT_policeUnitMedic, 0.05,
			OT_policeUnitAT, 0.20,
			OT_policeUnitHeavyAT, 0.20
		];
	};
	case(_isRegionalCapital) : {
		_spawnTable = [
			OT_policeUnitLight, 0.10,
			OT_policeUnitRegular, 0.45,
			OT_policeUnitHeavy, 0.10,
			OT_policeUnitMedic, 0.10,
			OT_policeUnitAT, 0.20,
			OT_policeUnitHeavyAT, 0.05
		];
	};
	case (_population > 300) : {
		_spawnTable = [
			OT_policeUnitLight, 0.15,
			OT_policeUnitRegular, 0.5,
			OT_policeUnitHeavy, 0.00,
			OT_policeUnitMedic, 0.20,
			OT_policeUnitAT, 0.15,
			OT_policeUnitHeavyAT, 0.00
		];
	};
};


//record the spawn ID for job tasks
spawner setVariable [format["spawnid%1",_town],_spawnid];

private _groupsize = 1;
switch (true) do {
	case (_isNationCapital || _isRegionalCapital) : {
		if (_numNato > 30) then {_numNato = 30};
		_groupSize = 5;
	};
	case (_numNato > 20) : {
		_numNato = 20;
		_groupSize = 3;
	};
	case (_numNato > 10) : {
		_groupSize = 2;
	};
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

		private _civ = _group createUnit [_policeGroupLeader, _home, [],0, "NONE"];

		_civ setVariable ["garrison",_town,false];
		[_civ] joinSilent _group;
		_civ setRank "CORPORAL";
		_civ setBehaviour "SAFE";
		[_civ,_town] call OT_fnc_initGendarm;
		if (OT_setting_HCEnabled) then {
			[_civ,HC1] spawn OT_fnc_MoveToHC;
		};
		_count = _count + 1;
		
		private _groupcount = 0;
		while{_groupcount < _groupsize && _count < _numNato} do {
			private _unitType = selectRandomWeighted _spawnTable;
			if (isNil "_unitType") then {_unitType = OT_policeUnitRegular};
			
			_civ = _group createUnit [_unitType, _pos, [], 0, "NONE"];
			_civ setVariable ["garrison",_town,false];
			[_civ] joinSilent _group;
			_civ setRank "PRIVATE";
			[_civ,_town] call OT_fnc_initGendarm;
			_civ setBehaviour "SAFE";
			if (OT_setting_HCEnabled) then {
				[_civ,HC1] spawn OT_fnc_MoveToHC;
			};
			_groupcount = _groupcount + 1;
			_count = _count + 1;
			
			sleep 0.5;
		};
		sleep 5;
		//_range = _range + 50;
		{
			_x addCuratorEditableObjects[units _group,false];
		}foreach(allcurators);
		
		_group call OT_fnc_initGendarmPatrol;
		[_group] spawn OT_fnc_GendarmPatrolChange;
	};
};

spawner setvariable [_spawnid,(spawner getvariable [_spawnid,[]]) + _groups,false];
