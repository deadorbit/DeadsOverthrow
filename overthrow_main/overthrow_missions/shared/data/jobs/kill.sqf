//This code is called by the gun dealer or faction rep to retrieve the description and parameters of the mission
private _numtokill = round(random 3)+2;
private _title = "Kill NATO";
private _found = false;

private _groups = [allGroups,[],{(leader _x) distance2D player},"ASCEND",{(side leader _x) isEqualTo west && (count units _x) > 0 && ((leader _x) distance2D player) < 300 && (vehicle (leader _x) isequalTo (leader _x))}] call BIS_fnc_SortBy;
if(count _groups isEqualTo 0) exitWith {[]};

private _group = _groups select 0;
private _numtokill = count units _group;
private _markerPos = getpos (leader _group);

private _reward = _numtokill * 500;
private _id = player call OT_fnc_playerMID;

//Build a mission description
private _description = format["Nothing spurs on the resistance more than just killing the blue helmets. There is a group of %1 NATO within 300m of here, go find them and take care of them.<br/><br/>Reward: $%2",_numtokill,_reward];
private _params = [_group,_reward,_numtokill,player,_id];

//The data below is what is returned to the gun dealer/faction rep, _markerPos is where to put the mission marker, the code in {} brackets is the actual mission code, only run if the player accepts
[
    [_title,_description],
    _markerPos,
    {
        params ["_group","","_numtokill","_player","_id"];
		_group setGroupOwner _id;
		_player reveal (leader _group);
		_player dotarget (leader _group);
		_group setvariable ["remains",_numtokill,true];
		{
			_x  addEventHandler ["Killed", { 
				params ["_unit", "_killer", "_instigator", "_useEffects"];
				private _group = group _unit;
				private _n = _group getvariable ["remains",1];
				_group setvariable ["remains",_n-1,true];
			}];
		}foreach(units _group);
        true
    },
    {
		params ["_group","","_numtokill","_player","_id"];
		private _ret = false;
		if (isnil{_group}) exitWith {
			_player commandTarget objnull;
			_ret = true;
		};
		_ret
    },
    {
        //Success Check
        params ["_group","","_numtokill","_player","_id"];
        private _numleft = _group getvariable ["remains",0];
        hint format["Kills %1/%2",(_numtokill - _numleft),_numtokill];
        if(_numleft isEqualTo 0) exitwith {true};
		false
    },
    {
        params ["_group","_reward","_numtokill","_player","_id","_wassuccess"];
        if(_wassuccess) then {
            [_reward] call OT_fnc_money;
        };
    },
    _params
];
