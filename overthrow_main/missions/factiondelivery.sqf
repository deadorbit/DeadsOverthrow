params ["_jobid","_jobparams"];
_jobparams params ["_faction"];

private _factionName = server getvariable format["factionname%1",_faction];

//Here is where we might randomize the parameters a bit
private _reppos = server getVariable [format["factionrep%1",_faction],getpos player];
private _currentTown = _reppos call OT_fnc_nearestTown;
private _abandoned = server getVariable ["NATOabandoned",[]];
private _outofspawndistance = [];
{
    if !((server getVariable _x) call OT_fnc_inSpawnDistance) then {
        private _stability = server getVariable [format["stability%1"],100];
        if !(_x in _abandoned || _x == _currentTown || _stability < 50) then {
            _outofspawndistance pushback _x;
        };
    };
}foreach(OT_allTowns);
private _destinationName = selectRandom _outofspawndistance;
private _posTown = server getVariable [_destinationName,[]];

private _building = [_posTown,OT_allHouses] call OT_fnc_getRandomBuilding;
private _destination = selectRandom (_building buildingPos -1);
if(isNil "_destination") exitWith {};
if(_destination isEqualTo [0,0,0]) then {_destination = [_posTown,[random 100,600]] call SHK_pos_fnc_pos};
private _params = [_faction,_destination,_destinationName,_jobid];
private _markerPos = _destination; //randomize the marker position a bit

//Build a mission description and title
private _description = format["A traitor of %1 has fled here and is hiding in %2 under NATO protection. %1 will pay handsomely and be very grateful if you could just.. make them disappear. <br/><br/>Reward: +20 (%1), $3500",_factionName,_destinationName];
private _title = format["%1 Traitor in %2",_factionName,_destinationName];

//This next number multiplies the reward (changed from 1.8)
private _difficulty = 3.8;

//The data below is what is returned to the gun dealer/faction rep, _markerPos is where to put the mission marker, the code in {} brackets is the actual mission code, only run if the player accepts
[
    [_title,_description],
    _markerPos,
    {
        params ["_destination","_itemcls","_numitems"];
        if !(player canAdd [_itemcls,_numitems]) exitWith {
            "You don't have enough room in your inventory for the items, the mission has been cancelled" call OT_fnc_notifyMinor;
			call OT_fnc_clearplayerwaypoint;
            false;
        };
        _group = createGroup civilian;
        _group setBehaviour "CARELESS";
        _civ = _group createUnit [OT_civType_local, _destination, [],0, "NONE"];
        _civ disableAI "MOVE";
        _civ setVariable ["OT_delivery",[_itemcls,_numitems],true];
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
            player addItem _itemcls;
            _count = _count + 1;
        };
        format["%1 x %2 added to inventory",_numitems,_itemcls call OT_fnc_weaponGetName] call OT_fnc_notifyMinor;
        true;
    },
    {
        //Fail check... is customer ded?
        params ["","","","","","_civ"];
        !alive _civ
    },
    {
        //Success Check.. items were delivered
        params ["","","","","","_civ"];
        _civ getVariable ["OT_deliveryDone",false];
    },
    {
        params ["_destination","_itemcls","_numitems","_reward","_starttown","_civ","_wassuccess"];
        _civ call OT_fnc_cleanup;

        //If mission was a success
        if(_wassuccess) then {
            _player = _civ getVariable ["OT_deliveredBy",objNull];

            //apply support and pay money
            [_reward,format["Delivered %1 x %2",_numitems,_itemcls call OT_fnc_weaponGetName]] remoteExec ["OT_fnc_money",_player,false];
            [_starttown,10] call OT_fnc_support;
			[_starttown,2] call OT_fnc_stability;
        }else{
            [_starttown,-50,format["Failed Delivery of %1 x %2",_numitems,_itemcls call OT_fnc_weaponGetName]] call OT_fnc_support;
        };
    },
    _params
];
