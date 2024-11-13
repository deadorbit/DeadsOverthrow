/*params ["_gangid"];
//Do gangs
	private _gang = OT_civilians getVariable [format["gang%1",_gangid],[]];
	_gang params ["_members"];

	if (!isNil "_members" && {_members isEqualType []}) then {
		private _vest = "";
		_vest = _gang select 3;
		private _level = _gang select 7;
		private _group = creategroup [opfor,true];
		private _loadout = _gang select 5;
		private _uniform = (_loadout select 3) select 0;
		_group setVariable ["VCM_TOUGHSQUAD",true,true];
		_group setVariable ["VCM_NORESCUE",true,true];
		_groups pushback _group;
		private _statics = [];
		spawner setVariable [format["gangspawn%1",_gangid],_group,true];
		if(count _gang > 4) then { //Filter out old gangs
			private _home = _gang select 4; //camp position
			
			if(_level == 1) then {
			//Spawn the camp
			{ _x hideObjectGlobal true } foreach (nearestTerrainObjects [_home,["TREE", "SMALL TREE", "BUSH","ROCK","ROCKS","HIDE"],20]);
			_veh = createVehicle ["Land_ClutterCutter_large_F",_home, [], 0, "CAN_COLLIDE"];
			_groups pushback _veh;
			_veh = createVehicle ["Campfire_burning_F",_home,[],0,"CAN_COLLIDE"];
			_groups pushback _veh;

			_numtents = 2 + round(random 3);
			_count = 0;

				while {_count < _numtents} do {
					//this code is in tents
					_d = random 360;
					_p = [_home,[2,9],_d] call SHK_pos_fnc_pos;
					_p = _p findEmptyPosition [1,40,"Land_TentDome_F"];
					_veh = createVehicle ["Land_TentDome_F",_p,[],0,"CAN_COLLIDE"];
					_veh setDir _d;
					_veh setVectorUp surfaceNormal position _veh;
					_veh setposATL (getpos _veh);
					_groups pushback _veh;
					_count = _count + 1;
				};
			};
			
			if(_level == 2) then {
				{ _x hideObjectGlobal true } foreach (nearestTerrainObjects [_home,["TREE", "SMALL TREE", "BUSH","ROCK","ROCKS","HIDE"],10]);
				_veh = createVehicle ["Land_ClutterCutter_large_F",_home, [], 0, "CAN_COLLIDE"];
				_groups pushback _veh;

				_v = [_home,random 359,OT_guerCampLVL2] call bis_fnc_objectsmapper;

				{
					_x setVectorUp surfaceNormal position _x;
					_x setposATL (getpos _x);
					if(_x isKindOf "StaticWeapon") then { //Added to keep statics from falling over -Ded
						private _lock = "Land_Antibiotic_F" createVehicle (getpos _x);
						_lock setdir (getdir _x);
						_lock hideObjectGlobal true;
						_lock setVectorUp surfaceNormal position _lock;
						_groups pushback _lock;
						_x attachTo [_lock];
						_statics pushback _x;
					};
				}foreach(_v);
			};
			//And the gang leader in his own group
			private _leaderGroup = creategroup [opfor,true];
			_leaderGroup setVariable ["VCM_TOUGHSQUAD",true,true];
			_leaderGroup setVariable ["VCM_NORESCUE",true,true];
			private _pos = [_home,5] call SHK_pos_fnc_pos;
			_civ = _leaderGroup createUnit [OT_CRIM_Unit, _pos, [],0, "NONE"];
			_civ setRank "COLONEL";
			_civ setBehaviour "SAFE";
			[_civ] joinSilent nil;
			[_civ] joinSilent _leaderGroup;
			_civ setVariable ["OT_gangid",_gangid,true];
			[_civ,_town,_gangid,_home] call OT_fnc_initCrimLeader;
			_civ setVariable ["hometown",_town,true];

			_wp = _leaderGroup addWaypoint [_home,0];
				_wp setWaypointType "GUARD";
				_wp setWaypointBehaviour "SAFE";
			_wp = _leaderGroup addWaypoint [_home,0];
				_wp setWaypointType "CYCLE";

			_groups pushback _leaderGroup;
			{
				private _civ = _leaderGroup createUnit [OT_CRIM_Unit, _pos, [],0, "NONE"];
				_civ moveingunner _x;
				[_civ,_town,_vest,_gangid] call OT_fnc_initCriminal; 
			}foreach(_statics);

			{
				_x addCuratorEditableObjects [[_civ]];
			}foreach(allCurators);
			_count = 0;
			{
				private _civid = _x;
				private _ident = (OT_civilians getVariable [format["%1",_civid],[]]);
				_ident params ["_identity"];
				private _pos = [_pos,10] call SHK_pos_fnc_pos;
				private _civ = _group createUnit [OT_CRIM_Unit, _pos, [],0, "NONE"];
				if(_count < 2) then {
				//add first two to the leaders group as body gaurds
					[_civ] joinSilent nil;
					[_civ] joinSilent _leaderGroup;
				}else{
					[_civ] joinSilent nil;
					[_civ] joinSilent _group;
				};
				if(isNil "_identity" || { _identity isEqualTo [] }) then {
					_identity = call OT_fnc_randomLocalIdentity;					
				};

				[_civ,_town,_vest,_gangid] call OT_fnc_initCriminal;
				[_civ,_identity] call OT_fnc_applyIdentity;
				[_civ, (OT_voices_local call BIS_fnc_selectRandom)] remoteExecCall ["setSpeaker", 0, _civ];
				_civ forceadduniform _uniform;
				uniformcontainer _civ addItemcargo ["FirstAidKit",1];

				_civ setVariable ["OT_gangid",_gangid,true];
				_civ setVariable ["OT_civid",_civid,true];
				_civ setBehaviour "SAFE";
				_civ setVariable ["hometown",_town,true];

				{
					_x addCuratorEditableObjects [[_civ]];
				}foreach(allCurators);

				sleep 0.3;
				_count = _count + 1;
			}foreach(_members);
			[_group,_posTown] call OT_fnc_initCriminalGroup;
		};
};
_groups
*/