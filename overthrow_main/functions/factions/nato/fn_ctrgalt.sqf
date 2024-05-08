params ["_frompos","_ao","_attackpos",["_delay",0]];

//CTRG Support for non-HQ

if (_delay > 0) then {sleep _delay};
private _vehtype = "B_CTRG_LSV_01_light_F";
private _squadtype = ["B_CTRG_Soldier_TL_tna_F","B_CTRG_Soldier_LAT2_tna_F","B_CTRG_Soldier_M_tna_F","B_CTRG_Soldier_AR_tna_F","B_CTRG_Soldier_Medic_tna_F","B_CTRG_Soldier_JTAC_tna_F"];
private _spawnpos = _frompos;
private _group1 = [_spawnpos, WEST,_squadtype] call BIS_fnc_spawnGroup;
_group1 deleteGroupWhenEmpty true;
private _tgroup = false;
sleep 0.5;
private _allunits = [];
private _veh = false;
private _pos = false;

private _radius = 1000; 
private _exp = "(randomGen 1 + forest + trees) * (1 - sea) * (1 - houses)"; 
private _prec = 50;
private _bestplace = selectBestPlaces [_attackpos,_radius,_exp,_prec,1];
private _bestplace1 = (_bestplace select 0);
private _dropos = (_bestplace1 select 0);

//Transport
private _tgroup = creategroup blufor;
private _dir = 0;

if !(_pos isEqualType []) then {
	_pos = _frompos findEmptyPosition [15,100,_vehtype];
	if(count _pos == 0) then {
		_pos = [_frompos,0,75,false,[0,0],[120,_vehtype]] call SHK_pos_fnc_pos;
	};
	_dir = [_frompos,_ao] call BIS_fnc_dirTo;
};
_pos set [2,1];
_veh = createVehicle [_vehtype, [0,0,1000+random 1000], [], 0, "CAN_COLLIDE"];
_veh setDir (_dir);
_veh setPosATL _pos;
_veh setVariable ["garrison","HQ",false];
clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearItemCargoGlobal _veh;
clearBackpackCargoGlobal _veh;


_tgroup addVehicle _veh;
createVehicleCrew _veh;
{
	[_x] joinSilent _tgroup;
	_x setVariable ["garrison","HQ",false];
	_x setVariable ["NOAI",true,false];
}foreach(crew _veh);
_allunits = (units _tgroup);
{
	_x addCuratorEditableObjects [(units _tgroup) + [_veh],true];
} forEach allCurators;
sleep 1;

_tgroup deleteGroupWhenEmpty true;

{
	if(typename _tgroup isEqualTo "GROUP") then {
		_x moveInCargo _veh;
	};
	[_x] joinSilent _group1;
	_allunits pushback _x;
	_x setVariable ["garrison","HQ",false];
	_x setVariable ["VCOM_NOPATHING_Unit",true,false];

}foreach(units _group1);

{
	_x addCuratorEditableObjects [units _group1,true];
} forEach allCurators;

sleep 5;
	if(typename _tgroup isEqualTo "GROUP") then {
		_veh setdamage 0;
		_dir = [_attackpos,_frompos] call BIS_fnc_dirTo;

		//Try to make sure drop position is on a bigger road

		_move = _tgroup addWaypoint [_dropos,0];
		_move setWaypointBehaviour "CARELESS";
		_move setWaypointTimeout [30,30,30];
		_move setWaypointType "TR UNLOAD";
		_move setWaypointCompletionRadius 50;

		_wp = _tgroup addWaypoint [_frompos,0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "CARELESS";
		_wp setWaypointCompletionRadius 25;

		_wp = _tgroup addWaypoint [_frompos,0];
		_wp setWaypointType "SCRIPTED";
		_wp setWaypointCompletionRadius 25;
		_wp setWaypointStatements ["true","[vehicle this] call OT_fnc_cleanup"];
	};
sleep 10;

_wp = _group1 addWaypoint [_attackpos,100];
_wp setWaypointType "SAD";
_wp setWaypointBehaviour "Stealth";
_wp setWaypointSpeed "FULL";

if(typename _tgroup isEqualTo "GROUP") then {

	[_veh,_tgroup,_frompos] spawn {
		//Ejects crew from vehicles when they take damage or stay relatively still for too long (you know, like when they ram a tree for 4 hours)
		params ["_veh","_tgroup","_frompos"];
		private _done = false;
		private _stillfor = 0;
		private _lastpos = getpos _veh;
		while{sleep 10;!_done} do {
			if(isNull _veh) exitWith {};
			if(isNull _tgroup) exitWith {};
			if(!alive _veh) exitWith {};
			private _eject = false;
			if((damage _veh) > 0.5 && ((getpos _veh) select 2) < 2) then {
				//Vehicle damaged (and on the ground)
				_eject = true;
			};
			if((getpos _veh) distance _lastpos < 0.5) then {
				_stillfor = _stillfor + 10;
				if(_stillfor > 60) then {
					//what are you doing? gtfo
					_eject = true;
				};
			}else{
				_stillfor = 0;
			};
			if(_eject) exitWith {
				while {(count (waypoints _tgroup)) > 0} do {
				 	deleteWaypoint ((waypoints _tgroup) select 0);
				};
				commandStop (driver _veh);
				{
					unassignVehicle _x;
					commandGetOut _x;
				}foreach(crew _veh);
				_done = true;
				waitUntil {sleep 2;(count crew _veh) isEqualTo 0};
				[_veh] call OT_fnc_cleanup;
			};
		};
	};
};
