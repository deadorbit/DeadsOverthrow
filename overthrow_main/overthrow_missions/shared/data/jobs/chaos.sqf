params ["_jobid","_jobparams"];
_jobparams params ["_town"];

private _markerPos = server getVariable [_town,[]];

private _currentpos = (getpos player);
private _roadfound = false;
private _position = nil;
private _rotation = -1	;
private _reward = 0;
private _player = player;
private _outofspawndistance = [];
private _posTown = [0,0,0];
private _currentTown = _currentpos call OT_fnc_nearestTown;
private _abandoned = server getVariable ["NATOabandoned",[]];

{
	_posTown = server getVariable [_x,[]];
    if (_posTown distance2d (getpos player) > 750 && _posTown distance2d (getpos player) < 3500) then {
        if !(_x in _abandoned || _x == _currentTown) then {
            _outofspawndistance pushback _x;
        };
    };
}foreach(OT_allTowns);
if(count _outofspawndistance == 0) exitwith {[]};

private _destinationName = selectRandom _outofspawndistance;
 _posTown = server getVariable [_destinationName,[]];
 
private _position = [[[_posTown, 2000]], [], {isOnRoad _this}] call BIS_fnc_randomPos;
private _nearest = _position call OT_fnc_nearestlocation;
while {(_nearest isequalto "AIRPORT" || _nearest isEqualTo "OBJECTIVE") && (((_nearest select 2) select 0) distance2D _position) <= 200} do {
	_destinationName = selectRandom _outofspawndistance;
	_posTown = server getVariable [_destinationName,[]];
	_position = [[[_posTown, 2000]], [], {isOnRoad _this}] call BIS_fnc_randomPos;
};

if ((count _position) == 0 || ((_position select 0) == 0 && (_position select 1) == 0)) exitwith{[]};

_reward = floor((_currentpos distance2D _position) * 0.65) + 500;


private _title = format["Destroy NATO officer's car",_town];
private _effect = format["Stability in the town will drop by 10, Reward: $%1",_reward];
private _description = format["The police have been getting a little bit too close to my operations here. I think I need to show them a lesson. I've located A local NATO officer's car, destroy it and I'll make it worth your while. Don't care how you do it, explode it, drive it off a cliff, submerge it, anything works.<br/><br/>%1",_effect];
_markerPos = _position;

private _params = [_Town,_position,_reward,_player,_jobid];
//_markerPos = _position;

//The data below is what is returned to the gun dealer/faction rep, _markerPos is where to put the mission marker, the code in {} brackets is the actual mission code, only run if the player accepts
[
    [_title,_description],
    _markerPos,
    {
        //No setup required for this mission
		params ["_town","_position","_reward","_player","_jobid"];
		private _roads = _position nearRoads 75;
		private _road = _roads select 0;
		private _roadscon = roadsConnectedto _road;
		private _rotation = random 359;
		if (count _roadscon isEqualTo 2) then {
			_rotation = [_road, _roadscon select 0] call BIS_fnc_DirTo;
		};
		_vehcls = OT_luxCars call BIS_fnc_selectrandom;
		_veh = _vehcls createVehicle _position;
		clearItemCargoGlobal _veh;
		_veh setFuel (0.2 + (random 0.5));
		_veh setDir _rotation;
		[_veh] joinsilent createGroup west;
		_veh setVariable ["CanDelete",true,true];
		
		_veh addEventHandler ["GetIn", {
			params ["_vehicle", "_role", "_unit", "_turret"];
			if(side _unit == resistance || isplayer _unit) then {
				["play", _vehicle] call BIS_fnc_carAlarm;
				_nummil = {side _x isEqualTo west} count (_vehicle nearObjects ["CAManBase",200]);
				if(_nummil > 0) then {
					_unit setCaptive false;
					[_unit] call OT_fnc_revealToNATO;
				};
			};
		}];
		
		_this pushback _veh;
        true
    },
    {
        //Fail check...
        false
    },
    {
        //Success Check
		params ["_town","_position","_reward","_player","_jobid","_veh"];

        ((!alive _veh) || ((getposASL _veh) select 2 < -1));//utterly destroyed or underwater
    },
    {
		params ["_town","_position","_reward","_player","_jobid","_veh","_wassuccess"];
        //If mission was a successY
        if(_wassuccess) then {
			private _loc = getpos _veh;
            private _players = call BIS_fnc_listplayers;
			private _id = 0;
			private _idx = 0;
			if((count _players) > 0) then {
				{
					_players set [_idx,[_x,((getpos _x) distance2d _loc)]];
					_idx = _idx + 1;
				}foreach(_players);
				_players = [_players,[],{_x select 1}] call BIS_fnc_sortby;
				_id = ((_players select 0) select 0) call OT_fnc_playerMID;
                [_reward] remoteExec ["OT_fnc_money",_id,false];//Reward player closest to vehicle when its destroyed
            };
			[_Town,-10] call OT_fnc_stability;
			private _completed = server getVariable "OT_completedJobIds";
			_completed pushback _jobid;
			server setVariable ["OT_completedJobIds",_completed,true];
        };
    },
    _params
];
