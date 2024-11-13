params ["_jobid","_jobparams"];
_jobparams params ["_town"];

private _markerPos = server getVariable [_town,[]];

private _effect = "SReward: $500, +5 Resistance Support, -5% Stability";

//Build a mission description and title
private _description = format["It's time to tell NATO what we think of them and get the public behind the resistance in %1. Do 15 tags in the town. Spraypaint can be purchased from General stores marked with a ($) icon and used on walls with the ACE self-interact key (Ctrl + Windows key by default)<br/><br/>%2",_town,_effect];
private _title = format["Graffiti in %1",_town];
private _startValue = count(server getVariable [format["tagsin%1",_town],[]]);
private _params = [_town,_startValue];

//The data below is what is returned to the gun dealer/faction rep, _markerPos is where to put the mission marker, the code in {} brackets is the actual mission code, only run if the player accepts
[
    [_title,_description],
    _markerPos,
    {
        //No setup required for this mission
        true
    },
    {
        //Fail check...
        false
    },
    {
        //Success Check
        params ["_town","_startValue","_jobid"];
        ((count(server getVariable [format["tagsin%1",_town],[]])) >= _startValue + 15);
    },
    {
        params ["_town","_startValue","_wassuccess","_jobid"];

        //If mission was a success
        if(_wassuccess) then {
            private _player = spawner getVariable [format["lasttagin%1",_town],player];
            [500] remoteExec ["OT_fnc_money",_player,false];
            [_town,15] call OT_fnc_support;
			[_town,-5] call OT_fnc_stability;
        };
    },
    _params
];
