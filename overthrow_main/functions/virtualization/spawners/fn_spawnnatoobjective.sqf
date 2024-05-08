params ["_posTown","_name","_spawnid"];

private _numNATO = server getVariable format["garrison%1",_name];
if(_name in (server getVariable ["NATOabandoned",[]])) exitWith {[]};
private _priority = false;
if(_name in OT_NATO_priority) then {
	_priority = true;
};
if(isNil "_numNATO") then {
	//New objective was added
	_numNATO = 2 + round(random 6);
	server setVariable [format["garrison%1",_name],_numNATO,true];
};

//record the spawn ID for job tasks
spawner setVariable [format["spawnid%1",_name],_spawnid];

private _count = 0;
private _groups = [];
private _target = "";
private _Airport = false;
private	_found = "";

{
	if ((_x select 1) == _name) exitWith {_target = _x; _found = OT_objectiveData find _target}; // Find base in list
}forEach (OT_objectiveData);

if (_target isEqualTo "") then { 
	{ 
		if ((_x select 1) == _name) exitWith {_target = _x; _Airport = true; _found = OT_AirportData find _target};
	}forEach (OT_AirportData); 
}; 

//Spawn supply cache
private _supplypos = spawner getVariable [format["NATOsupply%1",_name],false];
private _diff = server getVariable ["OT_difficulty",1];
if(_supplypos isEqualType []) then {
	//Spawn an ammobox
	private _start = _supplypos findEmptyPosition [2,20,OT_item_Storage];
	private _box = OT_item_Storage createVehicle _start;
	clearItemCargoGlobal _box;
	clearWeaponCargoGlobal _box;
	clearMagazineCargoGlobal _box;
	clearBackpackCargoGlobal _box;
	_box setVariable ["NATOsupply",_name,true];
	_groups pushback _box;
	//put stuff in it
	(spawner getVariable [format["NATOsupplyitems%1",_name],[[],[],[]]]) params ["_items","_wpns","_mags"];
	{
		[_box,_x#0,_x#1] call CBA_fnc_addItemCargo;
	}foreach(_items);
	{
		[_box,_x#0,_x#1] call CBA_fnc_addWeaponCargo;
	}foreach(_wpns);
	{
		[_box,_x#0,_x#1] call CBA_fnc_addMagazineCargo;
	}foreach(_mags);
	
	_box addItemCargoGlobal ["OT_NatoData", 1];
	_box addItemCargoGlobal ["OT_Natoparts",round(random[10,25,50])];
	
	if(_Airport) then {
		_box addItemCargoGlobal ["OT_agm", 1];
		_box addItemCargoGlobal ["OT_aircraftpart",round(random[5,10,20])];
	};
	sleep 0.5;
};

//Make sure the first group spawned in at a comms base are a teamleader, sniper, spotter, AA specialist and AA assistant
if(_name in OT_allComms) then {
	private _group = createGroup [blufor,true];
	_groups pushBack _group;
	_group setVariable ["VCM_TOUGHSQUAD",true,true];
	_group setVariable ["VCM_NORESCUE",true,true];

	private _start = _posTown findEmptyPosition [2,50];
	private _civ = _group createUnit [OT_NATO_Unit_TeamLeader, _start, [], 0, "NONE"];
	_civ setVariable ["garrison",_name,false];
	_civ setRank "CAPTAIN";
	[_civ,_name] call OT_fnc_initMilitary;
	_civ setBehaviour "SAFE";
	_count = _count + 1;
	sleep 0.5;

	if(_count < _numNATO) then {
		_start = _posTown findEmptyPosition [2,50];
		_civ = _group createUnit [OT_NATO_Unit_Sniper, _start, [], 0, "NONE"];
		_civ setVariable ["garrison",_name,false];
		_civ setRank "CAPTAIN";
		_civ setVariable ["VCOM_NOPATHING_Unit",true,false];
		[_civ,_name] call OT_fnc_initMilitary;
		if (HCEnabled) then {
			[_civ,HC1] spawn OT_fnc_MoveToHC;
		};
		_civ setBehaviour "SAFE";
		_count = _count + 1;
		sleep 0.5;
	};

	if(_count < _numNATO) then {
		_start = _posTown findEmptyPosition [2,50];
		_civ = _group createUnit [OT_NATO_Unit_Spotter, _start, [], 0, "NONE"];
		_civ setVariable ["garrison",_name,false];
		_civ setRank "CAPTAIN";
		_civ setVariable ["VCOM_NOPATHING_Unit",true,false];
		[_civ,_name] call OT_fnc_initMilitary;
		if (HCEnabled) then {
			[_civ,HC1] spawn OT_fnc_MoveToHC;
		};
		_civ setBehaviour "SAFE";
		_count = _count + 1;
		sleep 0.5;
	};

	[_group,_posTown,75,6] call CBA_fnc_taskPatrol;

	if(_count < _numNATO) then {
		_start = _posTown findEmptyPosition [2,50];
		_civ = _group createUnit [OT_NATO_Unit_AA_spec, _start, [], 0, "NONE"];
		_civ setVariable ["garrison",_name,false];
		_civ setRank "CAPTAIN";
		_civ setVariable ["VCOM_NOPATHING_Unit",true,false];
		[_civ,_name] call OT_fnc_initMilitary;
		if (HCEnabled) then {
			[_civ,HC1] spawn OT_fnc_MoveToHC;
		};
		_civ setBehaviour "SAFE";
		_count = _count + 1;
		sleep 0.5;
	};

	if(_count < _numNATO) then {
		_start = _posTown findEmptyPosition [2,50];
		if((count _start) isEqualTo 0) then {
			_start = _posTown findEmptyPosition [2,150];
		};
		_civ = _group createUnit [OT_NATO_Unit_AA_ass, _start, [], 0, "NONE"];
		_civ setVariable ["garrison",_name,false];
		_civ setRank "CAPTAIN";
		_civ setVariable ["VCOM_NOPATHING_Unit",true,false];
		[_civ,_name] call OT_fnc_initMilitary;
		if (HCEnabled) then {
			[_civ,HC1] spawn OT_fnc_MoveToHC;
		};
		_civ setBehaviour "SAFE";
		_count = _count + 1;
		sleep 0.5;
	};
	
	while{_count < _numNATO} do {
		_count = _count + 1;
	};
	[_group,_posTown,75,6] call CBA_fnc_taskPatrol;

}else{
	//put up a flag
	private _flag =  OT_flag_NATO createVehicle _posTown;
	_groups pushback _flag;
	[_flag,[format["Capture %1",_name], {call OT_fnc_triggerBattle},nil,0,false,true,"","true",5]] remoteExec ["addAction",0,_flag];
};

//Garrison any buildings
if(_numNATO > 0) then {
	private _garrisongroup = creategroup [blufor,true];
	_groups pushback _garrisongroup;
	private _buildings = nearestObjects [_posTown, OT_garrisonBuildings, 350];
	{
		private _addedVehicles = _x call {
			private _building = _this;
			private _type = typeof _this;
			if((damage _building) > 0.95) exitWith {[]};
			if(([
				"Land_Cargo_HQ_V1_F",
				"Land_Cargo_HQ_V2_F",
				"Land_Cargo_HQ_V3_F",
				"Land_Cargo_HQ_V4_F"
			] findIf {_x == _type}) != -1) exitWith {
				private _veh = createVehicle [OT_NATO_HMG, (_building buildingPos 8), [],0, "CAN_COLLIDE"];
				_veh setPosATL [(getPos _building select 0),(getPos _building select 1),(getPosATL _veh select 2)];
				_veh setDir (getDir _building);

				createVehicleCrew _veh;
				_numNATO = _numNATO - 1;

				[_veh]
			};

			if(([
				"Land_Cargo_Patrol_V1_F",
				"Land_Cargo_Patrol_V2_F",
				"Land_Cargo_Patrol_V3_F",
				"Land_Cargo_Patrol_V4_F"
			] findIf {_x == _type}) != -1) exitWith {
				private _ang = (getDir _building) - 190;
				private _p = [_building buildingPos 1, 2.3, _ang] call BIS_Fnc_relPos;
				private _veh = createVehicle [OT_NATO_HMG, _p, [], 0, "CAN_COLLIDE"];
				_veh setPosATL _p;
				_veh setDir (getDir _building) - 180;

				createVehicleCrew _veh;
				_numNATO = _numNATO - 1;
				[_veh]
			};

			private _vehs = [];
			private _veh = createVehicle [OT_NATO_HMG, (_building buildingPos 11), [], 0, "CAN_COLLIDE"];
			createVehicleCrew _veh;
			_numNATO = _numNATO - 1;
			_vehs pushBack _veh;

			sleep 0.5;

			_veh = createVehicle [OT_NATO_HMG, (_building buildingPos 13), [], 0, "CAN_COLLIDE"];
			createVehicleCrew _veh;
			_numNATO = _numNATO - 1;
			_vehs pushBack _veh;

			_vehs
		};

		_groups append _addedVehicles;
		{
			{
				[_x] joinSilent _garrisongroup;
				_x setVariable ["garrison",_name,false];
				_x setSkill ["aimingAccuracy",0.25]; //pew pew
			}foreach(crew _x);
		}foreach(_addedVehicles);

		if(_numNATO <= 0) exitWith {};
	}foreach(_buildings);
};

sleep 0.5;

private _groupcount = 0;
private _radius = 200;
if(_priority) then {
	_radius = 250;
};
while {_count < _numNATO} do {
	private _start = _posTown findEmptyPosition [5,(_radius/2)];
	private _group = createGroup blufor;
	_group setVariable ["VCM_TOUGHSQUAD",true,true];
	_group setVariable ["VCM_NORESCUE",true,true];
	_group setVariable ["Vcm_Disable",true];

	_group deleteGroupWhenEmpty true;
	_groups pushBack _group;
	_groupcount = 1;

	private _civ = _group createUnit [OT_NATO_GarrisonLead, _start, [],0, "NONE"];
	_civ setVariable ["garrison",_name,false];
	_civ setRank "CAPTAIN";
	[_civ] joinSilent _group;
	_civ setVariable ["VCOM_NOPATHING_Unit",true,false];
	[_civ,_name] call OT_fnc_initMilitary;
	_civ setBehaviour "SAFE";
	_civ assignItem "rhsusf_ANPVS_14";
	sleep 1;

	_count = _count + 1;
	while {(_count < _numNATO) && (_groupcount < 8)} do {
		_start = _start findEmptyPosition [5,25];

		_civ = _group createUnit [selectRandom (OT_NATO_GARRISON), _start, [],0, "NONE"];
		_civ setVariable ["garrison",_name,false];
		_civ setRank "LIEUTENANT";
		[_civ] joinSilent _group;
		_civ setVariable ["VCOM_NOPATHING_Unit",true,false];
		[_civ,_name] call OT_fnc_initMilitary;
		if (HCEnabled) then {
			[_civ,HC1] spawn OT_fnc_MoveToHC;
		};
		_civ setBehaviour "SAFE";
		_civ assignItem "rhsusf_ANPVS_14";
		_count = _count + 1;
		_groupcount = _groupcount + 1;
		sleep 1;
	};
	{
		_x addCuratorEditableObjects[units _group,false];
	}foreach(allcurators);

	//[_group,_posTown,_range,6] call CBA_fnc_taskPatrol;
	[_group,_posTown,_radius] call CBA_fnc_taskDefend;
	//_range = _range + 50;
	sleep 1;
};


private _pos = [];
private _dir = 0;
private _terminal = nearestobjects [_posTown,OT_airportTerminals,350];
private _helipad = nearestobjects [_posTown,["Land_HelipadCircle_F"],200];
if(count _terminal > 0) then {
	private _tp = getpos (_terminal select 0);
	_dir = getdir (_terminal select 0);
	private _dist = 35;
	if(typeof (_terminal select 0) == "Land_Hangar_F") then {
		_dir = _dir + 180;
		_dist = 50;
	};
	_pos = [_tp,_dist,_dir] call BIS_fnc_relPos;
	_pos = [_pos,100,_dir-90] call BIS_fnc_relPos;
}else{
	if(_name isEqualTo OT_NATO_HQ) then {
		_pos = OT_NATO_HQ_garrisonPos;
		_dir = OT_NATO_HQ_garrisonDir;
	}else{
		_pos = [_posTown, 10, 100, 10, 0, 0.3, 0] call BIS_Fnc_findSafePos;
		_dir = random 360;
	};
};

private _airgarrison = server getVariable [format["airgarrison%1",_name],[]];
{
	private _vehtype = _x;

	_pos = [_pos,28,_dir+90] call BIS_fnc_relPos;
	if(_x iskindof "Helicopter_Base_F") then {
		if((count _helipad) > 0) then {
			_pos = getpos (_helipad select 0);
			_dir = getdir (_helipad select 0);
			_helipad deleteat 0;
		};
	};

	private _veh =  _vehtype createVehicle _pos;
	_veh setVariable ["airgarrison",_name,false];
	_veh setDir _dir;
	sleep 0.5;
	_groups pushback _veh;
}foreach(_airgarrison);

//HVTs
{
	_x params ["_id","_loc","_status"];
	if(_loc == _name && _status == "") then {
		private _group = createGroup blufor;
		_groups pushBack _group;
		_group setVariable ["Vcm_Disable",true,true]; //stop him from running off
		private _vpos = _posTown findEmptyPosition [10,100,OT_NATO_Vehicle_HVT];
		//His empty APC
		private _veh =  OT_NATO_Vehicle_HVT createVehicle _vpos;
		_veh setpos _vpos;
		_veh setVariable ["vehgarrison","HQ",false];
		_groups pushback _veh;
		sleep 0.5;

		private _pos = _vpos findEmptyPosition [5,20,OT_NATO_Unit_HVT];
		private _civ = _group createUnit [OT_NATO_Unit_HVT, _pos, [],0, "NONE"];
		_civ setVariable ["garrison","HQ",false];
		_civ setVariable ["hvt",true,true];
		_civ setVariable ["hvt_id",_id,true];
		_civ setVariable ["NOAI",true,true];
		_civ setRank "COLONEL";
		_civ setBehaviour "SAFE";
		_civ setVariable ["VCOM_NOPATHING_Unit",true,false];
		_civ disableAI "PATH";
		[_civ,"HQ"] call OT_fnc_initMilitary;
		if (HCEnabled) then {
			[_civ,HC1] spawn OT_fnc_MoveToHC;
		};
		_civ addEventHandler ["FiredNear", {params ["_unit"];_unit enableAI "PATH"}];
		sleep 0.5;

		private _wp = _group addWaypoint [_pos, 0];
		_wp setWaypointType "GUARD";
		_wp = _group addWaypoint [_pos, 0];
		_wp setWaypointType "CYCLE";
		{
			_x addCuratorEditableObjects[units _group,false];
		}foreach(allcurators);
	};
}foreach(OT_NATOhvts);


/*private _FindGoodPos = {
	params[["_cls",""],["_center",[0,0,0]],["_radius",200]];

};*/
private _vgroup = grpnull;

if !(_target isEqualTo "") then {
	private _vehgarrison = (_target select 3);                                                                                     
	private _radius = 200;
	if(_priority) then {
		_radius = 500;
	};
	{
		private _vehtype = _x;
		private _pos = [0,0,0];
		private _loops = 0;
		while{((isonRoad _pos || (_pos distance _posTown) < 500 || _loops < 20) && _loops < 20)} do {
			_loops = _loops + 1;
			if (_vehtype isKindOf "Helicopter_Base_F") then {
				 _pos = [_posTown, 25, _radius + 50, 5, 0, 0.3, 0] call BIS_fnc_findSafePos;
			}else{
				if(_x isKindOf "StaticWeapon") then {
					 _pos = [_posTown, 10, round(_radius/2), 1, 0, 0, 0] call BIS_fnc_findSafePos;
				}else{
					if(_x isKindOf "Tank_F" || _x isKindOf "AFV_Wheeled_01_base_F") then {
					 _pos = [_posTown, 10, _radius + 100, 10, 0, 0.5, 0] call BIS_fnc_findSafePos;//tanks like to roll over for some physx related reason
					}else{
						_pos = [_posTown, 25, _radius + 50, 6, 0, 1, 0] call BIS_fnc_findSafePos;
					};
				};
			};
		};
		private _dir = random 360;
		
		if(_pos distance _posTown < 1000) then { 
			_vgroup = creategroup blufor;
			_groups pushback _vgroup;
			if((random 100) < 90) then {
				(_vgroup) setVariable ["VCM_NORESCUE",true,true];
				(_vgroup) setVariable ["VCM_TOUGHSQUAD",true,true];
			};
			
			private _veh = _vehtype createVehicle _pos;
			_veh allowCrewInImmobile true;
			_veh setDir _dir;
			createVehicleCrew _veh;
			
			_groups pushback _veh;
			
			clearWeaponCargoGlobal _veh;
			clearMagazineCargoGlobal _veh;
			clearItemCargoGlobal _veh;
			clearBackpackCargoGlobal _veh;
			
			[_veh,_target,_found,_Airport] call OT_fnc_initMilitaryVeh;
			
			sleep 0.5;
			
			if(_x isKindOf "StaticWeapon") then { //Added to keep statics from falling over
				private _lock = "Land_Antibiotic_F" createVehicle _pos;
				private _dir = [_posTown,_x] call BIS_fnc_dirto;
				_lock setdir _dir;
				_lock hideObjectGlobal true;
				_lock setVectorUp surfaceNormal position _lock;
				_groups pushback _lock;
				_veh attachTo [_lock];
				[_veh] join (createGroup blufor);
				if(_x iskindof "Radar_System_01_base_F" || _x iskindof "Radar_System_02_base_F" || _x iskindof "rhs_radars_turret_base") then {//Radar
					_veh setVehicleRadar 1;
				};
			};
			
			{
				[_x] joinSilent (_vgroup);
				_x setVariable ["garrison","HQ",false];
				if (_vehtype == OT_NATO_HMG) then {
					_x setSkill ["aimingAccuracy",0.25];
				};
			}foreach(crew _veh);
			
			{
				_x addCuratorEditableObjects [[_veh]];
			}foreach(allcurators);
			
			//[_vgroup, getPosATL (leader _vgroup)] call BIS_fnc_taskDefend;
			private _gpos = getPosATL (leader _vgroup);
			private _wp = _vgroup addWaypoint [_gpos, 0];
				_wp setWaypointType "HOLD";
			_wp = _vgroup addWaypoint [_gpos, 0];
				_wp setWaypointType "CYCLE";
		};
		sleep 1;
	}foreach(_vehgarrison);
};

spawner setvariable [_spawnid,_groups,false];
