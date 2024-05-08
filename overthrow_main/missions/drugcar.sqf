params ["_jobid","_jobparams"];
_jobparams params ["_Town"];

//Here is where we might randomize the parameters a bit
private _reppos = server getVariable [_Town,getpos player];
private _currentTown = _reppos call OT_fnc_nearestTown;
private _abandoned = server getVariable ["NATOabandoned",[]];
private _outofspawndistance = [];
{
	_posTown = server getVariable [_x,[]];
    if (_posTown distance2d (getpos player) > 1500 && _posTown distance2d (getpos player) < 6000) then {
        if !(_x in _abandoned || _x == _currentTown) then {
            _outofspawndistance pushback _x;
        };
    };
}foreach(OT_allTowns);
if(count _outofspawndistance == 0) exitwith {[]};
private _destinationName = selectRandom _outofspawndistance;
private _posTown = server getVariable [_destinationName,[]];
private _destination = (getpos player);
private _pos = (_posTown) findEmptyPosition [5,100,"C_Van_02_medevac_F"];

private _reward = floor(((_reppos distance2D _pos) * 0.75)+2500);

private _params = [_Town,_destination,_destinationName,_jobid,_pos,_reward];
private _markerPos = _pos; //randomize the marker position a bit

//Build a mission description and title
private _description = format["I prepared a drug shipment to here but it got intercepted enroute by the blues. If you could be so kind as to liberate and deliver the van to me, I'd pay happily. I'm sure the townspeople would enjoy some of its cargo as well. NOTE: when deilvered, the vehicle will be removed, so don't get attached to it. <br/><br/><t size='0.9'>Reward: $%2, -20 stability.",_destinationName,_reward];
private _title = format["Deliver Van To Dealer In %1",_currentTown];

[
    [_title,_description],
    _markerPos,
    {
       params ["_Town","_destination","_destinationName","_jobid","_pos","_reward"];
		//Create the car
		private _car = "C_Van_02_medevac_F";
		private _veh = _car createVehicle _pos;
		private _count = 3 + round(random 2);
		private _Ranman = ["B_recon_medic_F","B_recon_F","B_recon_M_F","B_spotter_F"];
		_veh setVariable ["CanDelete", true, true];
		clearWeaponCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;
		clearItemCargoGlobal _veh;
		_veh lockInventory true;
		_veh setHitPointDamage ["hitglass1",0.5];
		_veh setHitPointDamage ["hitengine",0.5];
		_veh setHitPointDamage ["hithull", 0.35];
		_veh setHitPointDamage ["hitlfwheel",1];
		_veh setHitPointDamage ["hitrfwheel",random 1];
		_veh setHitPointDamage ["hitlf2wheel",random 1];
		_veh setHitPointDamage ["hitrf2wheel",random 1];
		_veh setfuel 0.25 + random 0.6;
		
		private _civ = (creategroup [west,true]) createUnit ["C_Man_Paramedic_01_F",_Pos,[],0,"NONE"];
		_civ moveindriver _veh;
		removeAllItems _civ;
		_civ setdamage 1;
		
		// Create Police gaurding it
		_CGaurds = createGroup [west,true];
		_civ = creategroup[west,true] createUnit ["B_recon_TL_F",_Pos,[],15,"NONE"];
		[_civ] call OT_fnc_initMilitary;
		while {_count > 0} do {
			private _Ran = selectRandom _Ranman;
			_civ = _CGaurds createUnit [_Ran,_Pos,[],15,"NONE"];
			[_civ] call OT_fnc_initMilitary;
			_count = _count - 1;
		};
		createGuardedPoint [west, [0,0], -1, _veh];
		private _wp = _CGaurds addWaypoint [getpos _veh, 0];
		_wp setWaypointType "GUARD";
		_wp setWaypointBehaviour "SAFE";
		
		_CGaurds setVariable ["Vcm_Disable",true]; 
		
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
		
		{
			_x addCuratorEditableObjects [units _CGaurds];
		}foreach(allcurators);
		
		private _markerPos = getPos _veh;
		_this pushback _veh;
		true 
    },
    {
		params ["_Town","_destination","_destinationName","_jobid","_pos","_reward","_veh"];
		!alive _veh;
    },
    {
		params ["_Town","_destination","_destinationName","_jobid","_pos","_reward","_veh"];
		
		
        ((getpos _veh distance _destination) < 50) && ({alive _x} count crew _veh == 0)
    },
    {
        params ["_Town","_destination","_destinationName","_jobid","_pos","_reward","_veh","_wassuccess"];
        if (_wassuccess) then {
				params ["","_destination","_destinationName","","","_reward","",""];
				
				private _players = [];
				{
					if(isPlayer _x && alive _x) then {
						_players pushback _x;
					};
				}foreach(_destination nearEntities ["Man",OT_spawnDistance]);
            _players = _players apply {[_x distance _destination, _x]};
            _players sort true;
 
            if((count _players) > 0) then {
                [_reward] remoteExec ["OT_fnc_money",(_players select 0) select 1,false];
				format["Incoming message from Dealer: The drugs have been secured and sold, sending your $%1. (-20 stability)",_reward] remoteExec ["OT_fnc_notifyMinor",(_players select 0) select 1,false];
            };
			[_Town,-20] call OT_fnc_stability;
        }else{
			format["Incoming message from Dealer: How could you mess up such a simple job!?! (-50 Support)"] remoteExec ["OT_fnc_notifyMinor",0,false];
			[_town,-50] call OT_fnc_support;
		};
		deleteVehicle _veh;
		[group _CGaurds] call OT_fnc_cleanup;
    },
    _params
];
