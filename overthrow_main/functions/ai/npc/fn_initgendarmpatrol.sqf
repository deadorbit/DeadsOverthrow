private _group = _this;

private _town = (leader _group) getVariable "garrison";
private _start = position(leader _group);
if(isNil "_town") then {_town = _start};

_group setVariable ["VCM_NORESCUE",true];
_group setVariable ["VCM_TOUGHSQUAD",true];

private _dest = _town call OT_fnc_getRandomRoadPosition;

_wp = _group addWaypoint [_dest,20];
_wp setWaypointFormation selectRandom ["WEDGE", "ECH LEFT", "ECH RIGHT", "VEE", "DIAMOND"];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointTimeout [2,5,10];

_dest = _town call OT_fnc_getRandomRoadPosition;

_wp = _group addWaypoint [_dest,30];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointTimeout [2,5,10];

_dest = _town call OT_fnc_getRandomRoadPosition;

_wp = _group addWaypoint [_dest,40];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointTimeout [2,5,10];

_dest = _town call OT_fnc_getRandomRoadPosition;

_wp = _group addWaypoint [_dest,50];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointTimeout [2,5,10];

_dest = _town call OT_fnc_getRandomRoadPosition;

_wp = _group addWaypoint [_dest,50];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "SAFE";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointTimeout [2,5,10];

_wp = _group addWaypoint [_start,5];
_wp setWaypointType "CYCLE";
