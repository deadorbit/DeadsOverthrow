params ["_gangid"];

private _count = 0;
private _gang = OT_civilians getVariable [format["gang%1",_gangid],[]];
private _town = _gang select 2;
private _townpos = server getVariable _town;
private _level = _gang select 7;
private _pos = _gang select 4;
private _vest = _gang select 3;

_level = _level + 1;
_gang set [7,_level];
_gang append [OT_CRIM_Launchers call BIS_fnc_selectrandom];
_gang append [0]; //Number of RPG troops
private _launcher = _gang select 9;

if (_townpos call OT_fnc_inSpawnDistance) then {
	private _spawnid = spawner getvariable [format["townspawnid%1",_town],-1];
	private _groups = spawner getvariable [_spawnid,[]];
	private _camp = (_pos nearObjects ["Land_TentDome_F",20]) + (_pos nearobjects ["Campfire_burning_F",20]); 
	private _statics = [];
	private _nearunits = [];
	private _leader = nil;
	_nearunits = nearestObjects[_pos,["CAmanbase"],30];
	
	{
		if(_x getvariable ["crimleader",false]) exitwith {_leader = _x}
	}foreach(_nearunits);
	
	{
		deletevehicle _x;
	}foreach(_camp);
	{ _x hideObjectGlobal true } foreach (nearestTerrainObjects [_pos,["TREE", "SMALL TREE", "BUSH","ROCK","ROCKS","HIDE"],20]);
	_veh = createVehicle ["Land_ClutterCutter_large_F",_pos, [], 0, "CAN_COLLIDE"];
	_groups pushback _veh;
	
	_v = [_pos,random 359,OT_guerCampLVL2] call bis_fnc_objectsmapper;

	{
		_x setVectorUp surfaceNormal position _x;
		_x setposATL (getpos _x);
		_groups pushback _x;
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
	
	private _staticgroup = nil;
	if(!isnil{_leader}) then {
		_staticgroup = group _leader;
	}else{
		_staticgroup = creategroup opfor;
	};
	{
		private _civ = _staticgroup createUnit [OT_CRIM_Unit, _pos, [],0, "NONE"];
		_civ moveingunner _x;
		[_civ,_town,_vest,_gangid] call OT_fnc_initCriminal; 
		{
			_x addCuratorEditableObjects [[_civ]];
		}foreach(allCurators);
	}foreach(_statics);
	
	[_gangid,2] call OT_fnc_addtogang;
	_groups pushback _staticgroup;
	
	
	spawner setvariable [_spawnid,_groups,false];
};