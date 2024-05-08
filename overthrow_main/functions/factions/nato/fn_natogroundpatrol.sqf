//Send a patrol vehicle to a town
params ["_frombase","_topos",["_delay",0]];

private _abandoned = server getVariable ["NATOabandoned",[]];
if !(_frombase in _abandoned) then {
    if(_delay > 0) then {sleep _delay};
    diag_log format["Overthrow: NATO Sending patrol from %1",_frombase];
	
	_vehtype = call {
		private _diff = server getVariable ["OT_difficulty",1];
		private _pop = call OT_fnc_getControlledPopulation;
		private _r = random 100;
		private _return = OT_NATO_Vehicles_GroundPatrol call BIS_fnc_selectRandom;
		if(_pop > 1000) then {
			if(_r < (25 * (_diff+1))) then {
				_return = OT_NATO_Vehicles_TankSupport call BIS_fnc_selectRandom;
			}else{
				_return = OT_NATO_Vehicles_APC call BIS_fnc_selectRandom;
			};
		}else{
			if(_pop > 500 && (_r < (25 * (_diff+1)))) then {
				_return = OT_NATO_Vehicles_APC call BIS_fnc_selectRandom;
			};
		};
		_return
	};
	
    private _frompos = server getVariable _frombase;
    private _pos = _frompos findEmptyPosition [2,100,_vehtype];

    private _group = creategroup blufor;
    private _veh = _vehtype createVehicle _pos;
    _veh setVariable ["garrison","HQ",false];
	[_veh,"","",""] call OT_fnc_initMilitaryVeh;

	_group addVehicle _veh;
    createVehicleCrew _veh;
	_veh allowCrewInImmobile true;
	(_veh) setUnloadInCombat [false,false];
	
    {
    	[_x] joinSilent _group;
    	_x setVariable ["garrison","HQ",false];
    	_x setVariable ["NOAI",true,false];
    }foreach(crew _veh);
	
	_group deleteGroupWhenEmpty true;
	(_group) setVariable ["Vcm_Disable",true];
	
	private _crewspace = 0;
	_crewspace = ([_vehtype, true] call BIS_fnc_crewCount) - (count (crew _veh));
	if (_crewspace > 0) then {
		_unit = _group createUnit [OT_NATO_GarrisonLead, _pos ,[], 0, "FORM"];
		_unit moveInCargo _veh;
		_unit setVariable ["garrison","HQ",false];
		_unit setVariable ["VCOM_NOPATHING_Unit",true,false];
		[_unit] call OT_fnc_initMilitary;
		_group selectleader _unit;
		_crewspace = _crewspace - 1;
		if (_crewspace > 0) then {
			_unit = _group createUnit [OT_NATO_Engineer, _pos ,[], 0, "FORM"];
			_unit moveInCargo _veh;
			_unit setVariable ["garrison","HQ",false];
			_unit setVariable ["VCOM_NOPATHING_Unit",true,false];
			[_unit] call OT_fnc_initMilitary;
			_crewspace = _crewspace - 1;
			
			while{_crewspace > 0} do {
				_unit = _group createUnit [selectrandom OT_NATO_Garrison, _pos ,[], 0, "FORM"];
				_unit moveInCargo _veh;
				_unit setVariable ["garrison","HQ",false];
				_unit setVariable ["VCOM_NOPATHING_Unit",true,false];
				[_unit] call OT_fnc_initMilitary;
				_crewspace = _crewspace - 1;
			};
		};
	};
	
	{
		_x addCuratorEditableObjects [units _group,true];
	}forEach allCurators;

    clearWeaponCargoGlobal _veh;
    clearMagazineCargoGlobal _veh;
    clearItemCargoGlobal _veh;
    clearBackpackCargoGlobal _veh;
	
	{
        _x addCuratorEditableObjects [[_veh]];
    }foreach(allCurators);

    sleep 1;
    private _attackpos = [_topos,[25,100]] call SHK_pos_fnc_pos;

	_wp = _group addWaypoint [_attackpos,0];
	_wp setWaypointType "MOVE";
	_wp setWaypointBehaviour "SAFE";
	_wp setWaypointCombatMode "GREEN";
	_wp setwaypointspeed "FULL";
	_wp setWaypointStatements ["true","(group this) setVariable ['Vcm_Disable',false]; (objectparent (leader this)) setUnloadInCombat [true,true]"];
	_wp setWaypointCompletionRadius 150;

	_wp = _group addWaypoint [_topos,0];
	_wp setWaypointType "SAD";
	_wp setWaypointBehaviour "COMBAT";
	_wp setWaypointCombatMode "RED";
	_wp setwaypointspeed "FULL";
	_wp setWaypointTimeout [800,1200,1600];
	_wp setWaypointStatements ["true","(group this) setVariable ['Vcm_Disable',true]; (group this) setCombatMode 'RED'"];

	_wp = _group addWaypoint [_frompos,100];
	_wp setWaypointType "SCRIPTED";
	_wp setWaypointCombatMode "GREEN";
	_wp setwaypointspeed "FULL";
	_wp setWaypointStatements ["true","[vehicle this] call OT_fnc_cleanup"];
};
