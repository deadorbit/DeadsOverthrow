private _g = _this;

private _start = getPosATL ((units _g) select 0);
if(isNil "_start") exitWith {};
if(typename _start isEqualTo "BOOL") exitWith {};

_g setVariable ["VCM_Disable",true,true];

_g setBehaviour "SAFE";
_g setCombatMode "GREEN";

private _town = (leader _g) getVariable "hometown";
if(isNil "_town") then {_town = getPosATL(leader _g) call OT_fnc_nearestTown};

private _activeshops = server getVariable [format["activeshopsin%1",_town],[]];

private _dest = [];

/*if(count _activeshops > 0 && (random 100) > 50) then {
    _shop = selectRandom _activeshops;
    _dest = (_shop select 0) findEmptyPosition [3,50,OT_civType_local];
}else{
    _dest = _town call OT_fnc_getRandomRoadPosition;
};*/

_dest = _town call OT_fnc_getRandomRoadPosition;

/*private _wp = _g addWaypoint [_dest,0];
_wp setWaypointType "MOVE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointCompletionRadius 40;
_wp setWaypointTimeout [0, 4, 8];
_wp setWaypointFormation selectRandom ["WEDGE", "ECH LEFT", "ECH RIGHT", "VEE", "DIAMOND"];

_wp = _g addWaypoint [_start,0];
_wp setWaypointType "MOVE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointCompletionRadius 10;
_wp setWaypointTimeout [20, 40, 80];

_wp = _g addWaypoint [_start,0];
_wp setWaypointType "CYCLE";*/


_wp = _g addWaypoint [_dest,5];
_wp setWaypointFormation selectRandom ["WEDGE", "ECH LEFT", "ECH RIGHT", "VEE", "DIAMOND"];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointTimeout [10,20,60];

_dest = _town call OT_fnc_getRandomRoadPosition;

_wp = _g addWaypoint [_dest,10];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointTimeout [10,20,60];

_dest = _town call OT_fnc_getRandomRoadPosition;

_wp = _g addWaypoint [_dest,10];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointTimeout [10,20,60];

_dest = _town call OT_fnc_getRandomRoadPosition;

_wp = _g addWaypoint [_dest,10];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointTimeout [10,20,60];

_dest = _town call OT_fnc_getRandomRoadPosition;

_wp = _g addWaypoint [_dest,10];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointTimeout [10,20,60];

_wp = _g addWaypoint [_start,5];
_wp setWaypointType "CYCLE";

[_group] spawn OT_fnc_GendarmPatrolChange;