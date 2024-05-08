params ["_frombase",["_delay",0]];
if (_delay > 0) then {sleep _delay};
private _NatoApcForce = [];

private _frompos = server getVariable _frombase;



([_frompos] call OT_fnc_NATOGetAttackVectors) params ["_ground","_air"];

_obpos = (_ground select 0) select 0;
_name = (_ground select 0) select 1;

private _group = creategroup [blufor,false];

private _p = _obpos findEmptyPosition [15,100,OT_NATO_APCBrigade_Lead];
_leader = _group createUnit [OT_NATO_APCBrigade_Lead, _p ,[], 0, "FORM"];
_leader setVariable ["garrison","HQ",false];
_leader setVariable ["VCOM_NOPATHING_Unit",true,false];

{
_x addCuratorEditableObjects [[_leader],true];
} forEach allCurators;

private _i = 0;

{
	_SafePos = [_obpos, 50, 100, 5, 0, 1, 0] call BIS_fnc_findSafePos;
	private _result = [_SafePos, 0, _x, _group] call BIS_fnc_spawnVehicle;
	private _veh = _result select 0;
	_veh setVariable ["garrison","HQ",false];
	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	{
		[_x] joinSilent _group;
		_x setVariable ["garrison","HQ",false];
		_x setVariable ["NOAI",true,false];
	}foreach(crew _veh);
	
	{
	_x addCuratorEditableObjects [[_veh],true];
	} forEach allCurators;
	
	if (_i == 0) then {
		_leader moveInCargo _veh;
	};
	
	{
		_unit = _group createUnit [_x, _p ,[], 0, "FORM"];
		_unit setVariable ["garrison","HQ",false];
		_unit setVariable ["VCOM_NOPATHING_Unit",true,false];
		{
			_x addCuratorEditableObjects [[_unit],true];
		} forEach allCurators;
		_unit moveInCargo _veh;
	}foreach(OT_NATO_APCBrigade_Infantry);
	
	_i = _i + 1;
}foreach(OT_NATO_APCBrigade_Vehicles);

_group setBehaviour "SAFE";
_group setSpeedMode "FULL";

_topos = [_frompos,[0,50]] call SHK_pos_fnc_pos;
	
_wp = _group addWaypoint [_topos,250];
_wp setWaypointType "SAD";
_wp setWaypointBehaviour "UNCHANGED";
_wp setWaypointSpeed "UNCHANGED";
_wp setWaypointTimeout [30,30,30];

_topos = [_frompos,[0,50]] call SHK_pos_fnc_pos;

_wp = _group addWaypoint [_topos,250];
_wp setWaypointType "SAD";
_wp setWaypointBehaviour "AWARE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointTimeout [30,30,30];

_topos = [_frompos,[0,50]] call SHK_pos_fnc_pos;

_wp = _group addWaypoint [_topos,250];
_wp setWaypointType "SAD";
_wp setWaypointBehaviour "AWARE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointTimeout [30,30,30];

_topos = [_frompos,[0,50]] call SHK_pos_fnc_pos;

_wp = _group addWaypoint [_topos,250];
_wp setWaypointType "SAD";
_wp setWaypointBehaviour "AWARE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointTimeout [30,30,30];

_topos = [_frompos,[0,50]] call SHK_pos_fnc_pos;

_wp = _group addWaypoint [_topos,250];
_wp setWaypointType "SAD";
_wp setWaypointBehaviour "NORMAL";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointTimeout [30,30,30];

_topos = [_frompos,[0,50]] call SHK_pos_fnc_pos;

_wp = _group addWaypoint [_topos,0];
_wp setWaypointType "CYCLE";

sleep 1;

private _timeout = time + 1800;

waitUntil { sleep 10; ({alive _x} count units _group) == 0 || time > _timeout};

while {(count (waypoints _group)) > 0} do {
	deleteWaypoint ((waypoints _group) select 0);
};
//After time elaspes or no units remain send them home
_wp = _group addWaypoint [_obpos,20];
_wp setWaypointType "SCRIPTED";
_wp setWaypointCompletionRadius 50;
_wp setWaypointStatements ["true","[_group] call OT_fnc_cleanup"];

private _timeout = time + 600;
//Just incase they fail to get home
waitUntil { sleep 10; ({alive _x} count units _group) == 0 || time > _timeout};

_group deleteGroupWhenEmpty true;
OT_NATO_SentAPC = false;
[_group] call OT_fnc_cleanup;