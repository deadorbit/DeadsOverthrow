params ["_jobid","_jobparams"];
_jobparams params ["_gangid"];
private _gang = OT_civilians getVariable [format["gang%1",_gangid],[]];

private _startpos = getpos player;
private _destination = [];
private _destinationName = "";
private _gangname = _gang select 8;
private _gangtown = _gang select 2;

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

_numitems = floor(2 + random 4);

_distance = floor(_startpos distance2D _destination);
_reward = floor(_distance * 0.4) + 100;
_distance = [(_distance/1000),2] call BIS_fnc_cutDecimals;

_markerPos = _destination;
_params = [_destination,_gangid,_numitems,_reward];

//Build a mission description and title
private _description = format[
	"We need someone to deliver %1 x Ganja to a customer in %2. You have 8 hours.</t><br/><br/>
	<t size='0.7' align='center'>Estimated Distance: ~%5Km</t><br/>
	<t size='0.9' align='center'>Reward: +15 rep (%3), $%4, -2 stability in %2",
	_numitems,_destinationName,_gangname,_reward,_distance
];
private _title = format["Deliver %2 x Ganja for %1",_gangname,_numitems];

//The data below is what is returned to the gun dealer/faction rep, _markerPos is where to put the mission marker, the code in {} brackets is the actual mission code, only run if the player accepts
[
    [_title,_description],
    _markerPos,
    {
        params ["_destination","","_numitems"];
        if !(player canAdd ["OT_Ganja",_numitems]) exitWith {
            "You don't have enough room in your inventory for the Ganja" call OT_fnc_notifyMinor;
            false;
        };
        _group = createGroup civilian;
        _group setBehaviour "CARELESS";
        _civ = _group createUnit [OT_civType_local, _destination, [],0, "NONE"];
        _civ disableAI "MOVE";
        _civ setVariable ["OT_delivery",["OT_Ganja",_numitems],true];
		_civ allowdammage false;

        //Set face,voice and uniform
        [_civ, selectRandom OT_faces_local] remoteExecCall ["setFace", 0, _civ];
        [_civ, selectRandom OT_voices_local] remoteExecCall ["setSpeaker", 0, _civ];
        _civ forceAddUniform (selectRandom OT_clothes_locals);

        //Make sure hes in the group
        [_civ] joinSilent nil;
        [_civ] joinSilent _group;
        _civ setVariable ["NOAI",true,false];
        _group setVariable ["Vcm_Disable",true,true];
        _this pushback _civ;

        //give the items to the player
        _count = 0;
        while {_count < _numitems} do {
            player addItem "OT_Ganja";
            _count = _count + 1;
        };
        format["%1 x Ganja added to inventory",_numitems] call OT_fnc_notifyMinor;
        true
    },
    {
        //Fail check... is customer ded?
        params ["","","","","_civ"];
        !alive _civ
    },
    {
        //Success Check.. items were delivered
        params ["","","","","_civ"];
        _civ getVariable ["OT_deliveryDone",false];
    },
    {
        params ["_destination","_gangid","_numitems","_reward","_civ","_wassuccess"];
        _civ call OT_fnc_cleanup;

        //If mission was a success
        if(_wassuccess) then {
            _player = _civ getVariable ["OT_deliveredBy",objNull];
            private _gang = OT_civilians getVariable [format["gang%1",_gangid],[]];
            //apply standing and pay money
            [
                _reward,
                format[
                    "Delivered %1 x Ganja",
                    _numitems,
                    _gang select 8
                ]
            ] remoteExec ["OT_fnc_money",_player,false];
            [_player,_gangid,15] call OT_fnc_gangRep;
			[_destination,-2] call OT_fnc_stability;
            //Give resources to the gang
            private _gang = OT_civilians getVariable [format["gang%1",_gangid],[]];
            _gang params ["","","","","","","_resources"];
            _gang set [6,_resources + 100];
            OT_civilians setVariable [format["gang%1",_gangid],_gang,true];
        }else{
            [_player,_gangid,-25,format["Failed delivery of %1 x Ganja",_numitems]] call OT_fnc_gangRep;
        };
    },
    _params
];
