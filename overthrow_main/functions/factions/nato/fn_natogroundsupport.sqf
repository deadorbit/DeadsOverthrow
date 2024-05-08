params ["_frompos","_attackpos","_strength",["_delay",0]];
if (_delay > 0) then {sleep _delay};

private _num = 1+floor(_strength / 200);

private _count = 0;

while {_count < _num} do {
	private _group = creategroup blufor;
	private _vehtype = OT_NATO_Vehicles_GroundSupport call BIS_fnc_SelectRandom;

	private _dir = _frompos getdir _attackpos;
	private _pos = _frompos findEmptyPosition [15,100,_vehtype];
	if(count _pos == 0) then {
		_pos = [_frompos,0,120,false,[0,0],[250,_vehtype]] call SHK_pos_fnc_pos;
	};

	_veh = createVehicle [_vehtype, _pos, [], 0,""];
	_veh setVariable ["garrison","HQ",false];
	[_veh,"","",""] call OT_fnc_initMilitaryVeh;

	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;

	_veh setDir (_dir);
	_group addVehicle _veh;
	createVehicleCrew _veh;
	_veh allowCrewInImmobile true;
	(_veh) setUnloadInCombat [false,false];
	//_veh remoteExec ["AIDC_fnc_init"];
	{
		[_x] joinSilent _group;
		_x setVariable ["garrison","HQ",false];
		_x setVariable ["NOAI",true,false];
	}foreach(crew _veh);
	_count = _count + 1;
	sleep 0.3;

	_group deleteGroupWhenEmpty true;
	(_group) setVariable ["Vcm_Disable",true];// Prevent its waypoint from getting deleted by VCOM before it even reaches the AO

	{
        _x addCuratorEditableObjects [[_veh]];
    }foreach(allCurators);
	
	private _crewspace = 0;
	_crewspace = ([_vehtype, true] call BIS_fnc_crewCount) - (count (crew _veh));
	if (_crewspace > 0) then {
		_unit = _group createUnit [OT_NATO_Engineer, _pos ,[], 0, "FORM"];
		_unit moveInCargo _veh;
		_unit setVariable ["garrison","HQ",false];
		_unit setVariable ["VCOM_NOPATHING_Unit",true,false];
		[_unit] call OT_fnc_initMilitary;
		_crewspace = _crewspace - 1;
		
		while{_crewspace > 0} do {
			_unit = _group createUnit [OT_NATO_Vehicle_Support_Troop, _pos ,[], 0, "FORM"];
			_unit moveInCargo _veh;
			_unit setVariable ["garrison","HQ",false];
			_unit setVariable ["VCOM_NOPATHING_Unit",true,false];
			[_unit] call OT_fnc_initMilitary;
			_crewspace = _crewspace - 1;
		};
	};
	
	{
		_x addCuratorEditableObjects [units _group,true];
	}forEach allCurators;
	
	_attackpos = _attackpos findEmptyPosition [50,200,_vehtype];
	_roads = _attackpos nearRoads 150;
	if(count _roads > 0) then {
		_attackpos = getpos(selectRandom _roads);
	};
	_wp = _group addWaypoint [_attackpos,0];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "CARELESS";
	_wp setWaypointSpeed "FULL";
	_wp setWaypointStatements ["true","(group this) setVariable ['Vcm_Disable',false]; (vehicle this) setUnloadInCombat [true,true]"];
	_wp setWaypointCompletionRadius 200;
			
	_wp = _group addWaypoint [_attackpos,0];
	_wp setWaypointType "SAD";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointTimeout [600,600,600];
	_wp setWaypointStatements ["true","(group this) setVariable ['Vcm_Disable',true]"];

	_wp = _group addWaypoint [_frompos,100];
	_wp setWaypointType "SCRIPTED";
	_wp setWaypointStatements ["true","[vehicle this] call OT_fnc_cleanup"];
};
