params ["_town","_spawnid"];
sleep random 0.2;

spawner setvariable [format["townspawnid%1",_town],_spawnid,true];

private _hometown = _town;
private _groups = [];

private _pop = server getVariable format["population%1",_town];
private _stability = server getVariable format ["stability%1",_town];
private _posTown = server getVariable _town;

waitUntil {!isNil "OT_economyLoadDone"};

private _mSize = 350;
if(_town in OT_capitals) then {
	_mSize = 900;
};
private _numciv = 0;


_numCiv = round(_pop * OT_spawnCivPercentage);
if(_numCiv < 5) then {
	_numCiv = 5;
};

if(_numCiv > OT_spawnCivCap) then {
	_numCiv = OT_spawnCivCap;
};

private _hour = date select 3;

/*
private _church = server getVariable [format["churchin%1",_town],[]];
if !(_church isEqualTo []) then {
	//spawn the priest
	_group = createGroup civilian;
	_group setBehaviour "SAFE";
	_groups pushback _group;
	_pos = [[[_church,20]]] call BIS_fnc_randomPos;
	_civ = _group createUnit [OT_civType_priest, _pos, [],0, "NONE"];
	[_civ] call OT_fnc_initPriest;
	sleep 0.3;
};*/

private _count = 0;

private _pergroup = 1;
if(_numCiv > 8) then {_pergroup = 2};
if(_numCiv > 16) then {_pergroup = 4};
if(_numCiv == 30) then {_pergroup = 5};

while {_count < _numCiv} do {
	private _groupcount = 0;
	private _group = createGroup [civilian,true];
	_group setBehaviour "SAFE";
	_groups pushback _group;

	private _home = _town call OT_fnc_getRandomRoadPosition;
	while {(_groupcount < _pergroup) && (_count < _numCiv)} do {
		_pos = [_home,random 360,10] call SHK_pos_fnc_pos;
		_civ = _group createUnit [OT_civType_local, _pos, [],0, "NONE"];
		_civ setBehaviour "SAFE";
		_civ setVariable ["hometown",_hometown,true];
		[_civ] call OT_fnc_initCivilian;

		private _identity = call OT_fnc_randomLocalIdentity;
		[_civ,_identity] call OT_fnc_applyIdentity;
		if (HCEnabled) then {
			[_civ,HC2] spawn OT_fnc_MoveToHC;
		};
		
		_count = _count + 1;
		_groupcount = _groupcount + 1;
		sleep 0.5;
	};
	_group call OT_fnc_initCivilianGroup;
};
sleep 0.3;
//Do gangs
private _gangs = OT_civilians getVariable [format["gangs%1",_town],[]];
{
	private _gangid = _x;
	private _gang = OT_civilians getVariable [format["gang%1",_gangid],[]];
	_gang params ["_members"];

	if (!isNil "_members" && {_members isEqualType []}) then {
		private _vest = "";
		_vest = _gang select 3;
		private _level = _gang select 7;
		private _group = creategroup [opfor,false];
		private _loadout = _gang select 5;
		private _uniform = (_loadout select 3) select 0;
		private _launcher = "";
		private _mag = "";
		private _launchernum = -1;
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
				_launcher = _gang select 9;
				_mag = getarray(configFile >> "CfgWeapons" >> _launcher >> "magazines") select 0;
				_launchernum = _gang select 10;
				{ _x hideObjectGlobal true } foreach (nearestTerrainObjects [_home,["TREE", "SMALL TREE", "BUSH","ROCK","ROCKS","HIDE"],10]);
				_veh = createVehicle ["Land_ClutterCutter_large_F",_home, [], 0, "CAN_COLLIDE"];
				_groups pushback _veh;

				_v = [_home,random 359,OT_guerCampLVL2] call bis_fnc_objectsmapper;
				_groups pushback _v;

				{
					_x setVectorUp surfaceNormal position _x;
					_x setposATL (getpos _x);
					if(_x isKindOf "StaticWeapon") then {
						[_x, _x] call ace_common_fnc_claim;
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
				
				{
					_x addCuratorEditableObjects [[_civ]];
				}foreach(allCurators);
				
			}foreach(_statics);

			{
				_x addCuratorEditableObjects [[_civ]];
			}foreach(allCurators);
			
			//_count = 0;
			private _num = 0;
			{
				private _civid = _x;
				private _ident = (OT_civilians getVariable [format["%1",_civid],[]]);
				_ident params ["_identity"];
				private _pos = [_pos,10] call SHK_pos_fnc_pos;
				private _civ = _group createUnit [OT_CRIM_Unit, _pos, [],0, "NONE"];
				//if(_count < 2) then {
				//add first two to the leaders group as body gaurds
					//[_civ] joinSilent nil;
					//[_civ] joinSilent _leaderGroup;
				//}else{
				[_civ] joinSilent nil;
				[_civ] joinSilent _group;
				//};
				if(isNil "_identity" || { _identity isEqualTo [] }) then {
					_identity = call OT_fnc_randomLocalIdentity;					
				};

				[_civ,_town,_vest,_gangid] call OT_fnc_initCriminal;
				[_civ,_identity] call OT_fnc_applyIdentity;
				[_civ, (OT_voices_local call BIS_fnc_selectRandom)] remoteExecCall ["setSpeaker", 0, _civ];
				_civ forceadduniform _uniform;
				uniformcontainer _civ addItemcargo ["FirstAidKit",1];
				
				if(_num < _launchernum) then {
					removebackpack _civ;
					_civ addbackpack "rhs_rpg_6b2";
					(backpackcontainer _civ) addmagazinecargo [_mag,1];
					_civ addweapon _launcher;
					_civ setvariable ["launcher",true,true];
					(backpackcontainer _civ) addWeaponWithAttachmentsCargo [[_launcher,"","","",[_mag,1],[_mag,1],""],ceil(random(2))];
					_num = _num+1;
				};

				_civ setVariable ["OT_gangid",_gangid,true];
				_civ setVariable ["OT_civid",_civid,true];
				_civ setBehaviour "SAFE";
				_civ setVariable ["hometown",_town,true];

				{
					_x addCuratorEditableObjects [[_civ]];
				}foreach(allCurators);

				sleep 0.3;
				//_count = _count + 1;
			}foreach(_members);
			[_group,_posTown] call OT_fnc_initCriminalGroup;
		};
	};
}foreach(_gangs);

spawner setvariable [_spawnid,(spawner getvariable [_spawnid,[]]) + _groups,false];
