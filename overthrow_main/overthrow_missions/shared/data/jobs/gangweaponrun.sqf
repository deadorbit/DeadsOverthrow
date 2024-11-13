params ["_jobid","_jobparams"];
_jobparams params ["_gangid"];
private _gang = OT_civilians getVariable [format["gang%1",_gangid],[]];

private _startpos = getpos player;
private _destination = [];
private _destinationName = "";
private _gangname = _gang select 8;
private _gangtown = _gang select 2;
private _guncls = selectRandom OT_allHandguns;
private _gunname = _guncls call OT_fnc_weaponGetName;

{
    private _town = _x;
    private _posTown = server getVariable _town;
    if([_posTown,_startpos] call OT_fnc_regionIsConnected) exitWith {
        _destinationName = _town;
        _building = [_posTown,OT_allHouses] call OT_fnc_getRandomBuilding;
        _destination = selectRandom (_building call BIS_fnc_buildingPositions);
        if(isNil "_destination") then {
            _destination = _posTown findEmptyPosition [5,100,OT_civType_local];
        };
    };
}foreach([OT_allTowns,[],{random 100},"ASCEND",{!(_x isEqualTo _gangtown)}] call BIS_fnc_SortBy);


_distance = floor(_startpos distance2D _destination);
_reward = floor(_distance * 0.35) + 250;
_distance = [(_distance/1000),2] call BIS_fnc_cutDecimals;
if(_startpos distance2D _destination > 9999) then {_reward = floor(_reward * 1.25)}; //Long distance bonus

_markerPos = _destination;
_params = [_jobid,_destination,_gangid,_guncls,_reward];

//Build a mission description and title
private _description = format[
	"We need someone to deliver a %1 to a customer in %2. You have 12 hours.</t><br/><br/>
	<t size='0.7' align='center'>Estimated Distance: ~%5Km</t><br/>
	<t size='0.9' align='center'>Reward: +15 rep (%3), $%4, -2 stabilty in %2",
	_gunname,_destinationName,_gangname,_reward,_distance
];
private _title = format["Deliver %2 for %1",_gangname,_gunname];

//The data below is what is returned to the gun dealer/faction rep, _markerPos is where to put the mission marker, the code in {} brackets is the actual mission code, only run if the player accepts
[
    [_title,_description],
    _markerPos,
    {
        params ["_jobid","_destination","_gangid","_guncls","_reward"];
        if !(player canAdd _guncls) exitWith {
            "You don't have enough room in your inventory for the gun, the mission has been cancelled" call OT_fnc_notifyMinor;
			call OT_fnc_clearplayerwaypoint;
            false;
        };
		private _gang = OT_civilians getVariable [format["gang%1",_gangid],[]];
		private _loadout = _gang select 5;
		private _uniform = (_loadout select 3) select 0;
        _group = createGroup civilian;
        _group setBehaviour "CARELESS";
        _civ = _group createUnit [OT_civType_local, _destination, [],0, "NONE"];
        _civ disableAI "MOVE";
        _civ setVariable ["OT_delivery",[_guncls,1],true];
		_civ allowdammage false;
		spawner setVariable [format["gundelivery%1",_jobid],_civ,false];

        //Set face,voice and uniform
        [_civ, selectRandom OT_faces_local] remoteExecCall ["setFace", 0, _civ];
        [_civ, selectRandom OT_voices_local] remoteExecCall ["setSpeaker", 0, _civ];
        _civ forceAddUniform _uniform;

        //Make sure hes in the group
        [_civ] joinSilent nil;
        [_civ] joinSilent _group;
        _civ setVariable ["NOAI",true,false];
        _group setVariable ["Vcm_Disable",true,true];
        _this pushback _civ;

        //give the items to the player
        player addItem _guncls;
        format["%1 added to inventory",_guncls call OT_fnc_weaponGetName] call OT_fnc_notifyMinor;
        true;
    },
    {
        //Fail check... is customer ded?
        params ["_jobid","_destination","_gangid","_guncls","_reward","_civ"];
        !alive (spawner getVariable [format["gundelivery%1",_jobid],objnull]);
    },
    {
        //Success Check.. items were delivered
        params ["_jobid","_destination","_gangid","_guncls","_reward","_civ"];
        _civ getVariable ["OT_deliveryDone",false];
    },
    {
        params ["_jobid","_destination","_gangid","_guncls","_reward","_civ","_wassuccess"];
        _civ call OT_fnc_cleanup;

        //If mission was a success
        if(_wassuccess) then {
            _player = _civ getVariable ["OT_deliveredBy",objNull];
            private _gang = OT_civilians getVariable [format["gang%1",_gangid],[]];
            //apply standing and pay money
            [
                _reward,
                format[
                    "Delivered %1 to %2",
                    _guncls call OT_fnc_weaponGetName,
                    _gang select 8
                ]
            ] remoteExec ["OT_fnc_money",_player,false];
            [_player,_gangid,15] call OT_fnc_gangRep;//changed from 5
			[_destination,-2] call OT_fnc_stability;
            //Give resources to the gang
            private _gang = OT_civilians getVariable [format["gang%1",_gangid],[]];
            _gang params ["","","","","","","_resources"];
            _gang set [6,_resources + 100];
            OT_civilians setVariable [format["gang%1",_gangid],_gang,true];
        }else{
            [_player,_gangid,-25,format["Failed delivery of %1",_guncls call OT_fnc_weaponGetName]] call OT_fnc_gangRep;
        };
    },
    _params
];
