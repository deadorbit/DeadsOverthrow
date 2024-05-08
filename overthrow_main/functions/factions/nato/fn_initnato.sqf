if (!isServer) exitwith {};
OT_NATO_Group_Recon = "";
OT_NATO_Group_Engineers = "";


for "_i" from 1 to 3 do { 
	private _armyidx = floor(random(count OT_NATO_Army));
	private _armylead = OT_NATO_ArmyLead select _armyidx;
	private _army = OT_NATO_Army select _armyidx;
	private _basegroup = OT_NATO_ArmyBaseGroup select _armyidx;
	private _NewSquad = [_armylead] + _basegroup + [_army call BIS_fnc_selectRandom] + [_army call BIS_fnc_selectRandom] + [_army call BIS_fnc_selectRandom];
	OT_NATO_GroundForces pushback _NewSquad;
};

{
	private _name = configName _x;
	if((_name find "ENG") > -1) then {
		OT_NATO_Group_Engineers = _name;
	};
}foreach("true" configClasses (configFile >> "CfgGroups" >> "West" >> OT_faction_NATO >> "Support"));

OT_NATO_Units_LevelOne = [];
OT_NATO_Units_LevelTwo = [];
OT_NATO_Units_CTRGSupport = [];
OT_NATO_SentAPC = false;

(OT_loadingMessages call BIS_fnc_selectRandom) remoteExec['OT_fnc_notifyStart',0,false];

private _c = 0;

/*{
	private _name = configName _x;
	private _unitCfg = _x;
	if(!(_name isEqualTo OT_NATO_Unit_Police) && !(_name isEqualTo OT_NATO_Unit_PoliceCommander)) then {
		[_name] call {
			params ["_name"];
			if((_name find "_TL_") > -1) exitWith {
				OT_NATO_Unit_TeamLeader = _name;
			};
			if((_name find "_SL_") > -1) exitWith {
				OT_NATO_Unit_SquadLeader = _name;
			};
			if((_name find "_Officer_") > -1 || (_name find "_officer_") > -1) exitWith {
				OT_NATO_Unit_HVT = _name
			};
			if((_name find "_CTRG_") > -1) exitWith {
				OT_NATO_Units_CTRGSupport pushback _name
			};
			if(
				(_name find "_Recon_") > -1
				|| (_name find "_recon_") > -1
				|| (_name find "_story_") > -1
				|| (_name find "_Story_") > -1
				|| (_name find "_lite_") > -1
				|| (_name find "_HeavyGunner_") > -1
			) exitWith {};

			private _role = getText (_x >> "role");
			if(_role in ["MachineGunner","Rifleman","CombatLifeSaver"]) then {OT_NATO_Units_LevelOne pushback _name};
			if(_role in ["Grenadier","MissileSpecialist","Marksman"]) then {OT_NATO_Units_LevelTwo pushback _name};
			if(_role == "Marksman" && (_name find "Sniper") > -1) then {OT_NATO_Unit_Sniper = _name};
			if(_role == "Marksman" && (_name find "Spotter") > -1) then {OT_NATO_Unit_Spotter = _name};
			if(_role == "MissileSpecialist" && (_name find "_AA_") > -1) then {OT_NATO_Unit_AA_spec = _name};

			//Generate and cache alternative loadouts for this unit
			private _loadout = getUnitLoadout _unitCfg;
			private _loadouts = [];
			for "_i" from 1 to 5 do {
				_loadouts pushback ([_loadout] call OT_fnc_randomizeLoadout);
			};
			spawner setVariable [format["loadouts_%1",_name],_loadouts,false];
			_c = _c + 1;
			if(_c isEqualTo 10) then {
				sleep 0.1;
				_c = 0;
			};
		};
	};
}foreach(format["(getNumber(_x >> 'scope') isEqualTo 2) && (getText(_x >> 'faction') isEqualTo '%1') && (configName _x) isKindOf 'SoldierWB'",OT_faction_NATO] configClasses (configFile >> "CfgVehicles"));*/

(OT_loadingMessages call BIS_fnc_selectRandom) remoteExec['OT_fnc_notifyStart',0,false];

{
	private _name = _x;
	[_name] spawn {
		private _name = _this select 0;
		private _loadout = getUnitLoadout _name;
		private _loadouts = [];
		for "_i" from 1 to 5 do {
			_loadouts pushback ([_loadout,OT_NATO_GarrisonWep,OT_NATO_GarrisonWepGL,OT_NATO_GarrisonWepMG,OT_NATO_GarrisonWepSR,OT_allBLULaunchers,OT_allBLUPistols,false] call OT_fnc_randomizeLoadout);
		};
		spawner setVariable [format["loadouts_%1",_name],_loadouts,false];
	};
}foreach(OT_NATO_Garrison);

{
	private _name = _x;
	[_name] spawn {
		private _name = _this select 0;
		private _loadout = getUnitLoadout _name;
		private _loadouts = [];
		for "_i" from 1 to 5 do {
			_loadouts pushback ([_loadout,OT_NATO_ReinforcementsWep,OT_NATO_ReinforcementsWepGL,OT_NATO_ReinforcementsWepMG,OT_NATO_ReinforcementsWepSR,OT_allBLULaunchers,OT_allBLUPistols,true] call OT_fnc_randomizeLoadout);
		};
		spawner setVariable [format["loadouts_%1",_name],_loadouts,false];
	};
}foreach(OT_NATO_Reinforcements);

{
	{
		private _name = _x;
		[_name] spawn {
			private _name = _this select 0;
			private _loadout = getUnitLoadout _name;
			private _loadouts = [];
			for "_i" from 1 to 5 do {
				_loadouts pushback ([_loadout,OT_NATO_ArmyWep,OT_NATO_ArmyWepGL,OT_NATO_ArmyWepMG,OT_NATO_ArmyWepSR,OT_allBLULaunchers,OT_allBLUPistols,false] call OT_fnc_randomizeLoadout);
			};
			spawner setVariable [format["loadouts_%1",_name],_loadouts,false];
		};
	}foreach(_x)
}foreach(OT_NATO_Army);

//Generate and cache gendarm loadouts
private _loadout = getUnitLoadout OT_NATO_Unit_Police;
private _loadouts = [];
for "_i" from 1 to 5 do {
	_loadouts pushback ([_loadout,OT_allBLUSMG] call OT_fnc_randomizeLoadout);
};
spawner setVariable [format["loadouts_%1",OT_NATO_Unit_Police],_loadouts,false];

private _loadout = getUnitLoadout OT_NATO_Unit_PoliceCommander;
private _loadouts = [];
for "_i" from 1 to 5 do {
	_loadouts pushback ([_loadout,OT_allBLUSMG] call OT_fnc_randomizeLoadout);
};

spawner setVariable [format["loadouts_%1",OT_NATO_Unit_PoliceCommander],_loadouts,false];

private _loadout = getUnitLoadout OT_NATO_GarrisonLead;
private _loadouts = [];
for "_i" from 1 to 5 do {
	_loadouts pushback ([_loadout,OT_NATO_GarrisonWep,OT_NATO_GarrisonWepGL,OT_NATO_GarrisonWepMG,OT_NATO_GarrisonWepSR,OT_allBLULaunchers,OT_allBLUPistols,false] call OT_fnc_randomizeLoadout);
};
spawner setVariable [format["loadouts_%1",OT_NATO_GarrisonLead],_loadouts,false];

private _loadout = getUnitLoadout OT_NATO_ReinforcementsLead;
private _loadouts = [];
for "_i" from 1 to 5 do {
	_loadouts pushback ([_loadout,OT_NATO_ReinforcementsWep,OT_NATO_ReinforcementsWepGL,OT_NATO_ReinforcementsWepMG,OT_NATO_ReinforcementsWepSR,OT_allBLULaunchers,OT_allBLUPistols,true] call OT_fnc_randomizeLoadout);
};
spawner setVariable [format["loadouts_%1",OT_NATO_ReinforcementsLead],_loadouts,false];

{
	private _loadout = getUnitLoadout _x;
	private _loadouts = [];
	for "_i" from 1 to 5 do {
		_loadouts pushback ([_loadout,OT_NATO_ArmyWep,OT_NATO_ArmyWepGL,OT_NATO_ArmyWepMG,OT_NATO_ArmyWepSR,OT_allBLULaunchers,OT_allBLUPistols,false] call OT_fnc_randomizeLoadout);
	};
	spawner setVariable [format["loadouts_%1",OT_NATO_ArmyLead],_loadouts,false];
}foreach(OT_NATO_ArmyLead);


OT_NATO_Units_LevelTwo = OT_NATO_Units_LevelOne + OT_NATO_Units_LevelTwo;

OT_NATOobjectives = [];
OT_NATOcomms = [];

OT_NATOobjectives = server getVariable ["NATOobjectives",[]];
OT_NATOcomms = server getVariable ["NATOcomms",[]];
OT_NATOhvts = server getVariable ["NATOhvts",[]];
OT_allObjectives = [];
OT_allComms = [];
OT_NATOHelipads = [];

private _diff = server getVariable ["OT_difficulty",1];

if((server getVariable "StartupType") == "NEW" || (server getVariable ["NATOversion",0]) < OT_NATOversion) then {
	diag_log "Overthrow: Generating NATO";
	server setVariable ["NATOversion",OT_NATOversion,false];
	private _abandoned = server getVariable ["NATOabandoned",[]];

	(OT_loadingMessages call BIS_fnc_selectRandom) remoteExec['OT_fnc_notifyStart',0,false];
	sleep 0.3;
	{
		private _stability = server getVariable format ["stability%1",_x];
		if(_stability < 11 && !(_x in _abandoned)) then {
			_abandoned pushback _x;
		};
	}foreach (OT_allTowns);
	server setVariable ["NATOabandoned",_abandoned,true];
	private _startingResources = 2500;//changed from 500
	if(_diff isEqualTo 1) then {_startingResources = 3500};//changed from 1500
	if(_diff isEqualTo 2) then {_startingResources = 4500};//changed from 2500
    server setVariable ["NATOresources",_startingResources,true];
	server setVariable ["garrisonHQ",1000,false];
	OT_NATOobjectives = [];
	OT_NATOcomms = [];
	OT_NATOhvts = [];
	server setVariable ["NATOobjectives",OT_NATOobjectives,false];
	server setVariable ["NATOcomms",OT_NATOcomms,false];
	server setVariable ["NATOhvts",OT_NATOhvts,false];

	//Find military objectives
	_groundvehs = OT_allBLUOffensiveVehicles select {!((_x isKindOf "Air") || (_x isKindOf "Tank") || (_x isKindOf "Ship"))};
	{
		private _found = "";
		private _Airport = false;
		private _NewArray = [];
		_x params ["_pos","_name","_worth"];
			if (_diff == 0) then {_worth = round(_worth * 0.5)};
			if (_diff == 2) then {_worth = round(_worth * 1.25)};
			if !(_name in _abandoned) then {
				if (_x in OT_objectiveData) then {
					_found = OT_objectiveData find _x;
				}else{
					_found = OT_airportData find _x;
					_Airport = true;
				};
				diag_log format["Overthrow: Initializing %1",_name];
				OT_NATOobjectives pushBack _x;
				server setVariable [format ["GarrKilled%1",_name],0,true];
				private _resource = _worth; //How much can be spent on the base
				private _base = 12;
				private _statics = OT_NATO_StaticGarrison_LevelOne;
				if(_worth >= 1000) then {
					_base = 36;
					_statics = OT_NATO_StaticGarrison_LevelThree;
					_resource = _resource - 1000;
				}else{
					if(_worth >= 500) then {
						_base = 24;
						_statics = OT_NATO_StaticGarrison_LevelTwo;
						_resource = _resource - 500;
					}else{
						_resource = _resource - 200;
					};
				};
				while{_resource >= 50} do {//Spend reamining value of base
					if(((random 100) >= 75) && (_resource >= 200)) then {//'buy' Tank
						_resource = _resource - 200;
						_veh = (selectRandom (OT_NATO_Vehicles_TankSupport + OT_NATO_Vehicles_APC));
						_statics pushback _veh;
					}else{
						if(((random 100) >= 50) && (_resource >= 100)) then {//Buy Light Vehicle
							_resource = _resource - 100;
							_veh = (selectRandom OT_NATO_Vehicles_GroundSupport);
							_statics pushback _veh;
						}else{//Buy static turret
							_resource = _resource - 50;
							_veh = (selectRandom OT_NATO_Random_Statics);
						};
					};
				};

				private _garrison = floor(_base + random(8));
				
				if(_name isEqualTo OT_NATO_HQ) then {
					_garrison = 48;
					_statics = OT_NATO_StaticGarrison_HQ;
					_garr = [];
					{
						_x params ["_class","_num"];
						_count = 0;
						while {_count < _num} do {
							_count = _count + 1;
							_garr pushback _class;
						};
					}foreach(OT_NATO_Vehicles_JetGarrison);
					server setVariable [format ["airgarrison%1",_name],_garr,true];
					OT_NATO_HQPos = _pos;
					if((count OT_NATO_HQ_garrisonPos) isEqualTo 0) then {
						OT_NATO_HQ_garrisonPos = _pos;
					};
				}else{
					server setVariable [format ["airgarrison%1",_name],[],true];
				};
				server setVariable [format ["garrison%1",_name],_garrison,true];
				private _fill = _x select 3;
				{
					_fill pushBack _x;
				}foreach(_statics);
			}else{
				OT_NATOobjectives pushBack _x;
			};
			//Check for helipads
			if !(_name in OT_allAirports) then {
				private _helipads = (_pos nearObjects ["Land_HelipadCircle_F", 400]) + (_pos nearObjects ["Land_HelipadSquare_F", 400]);
				if((count _helipads) > 0) then {
					OT_NATOHelipads pushbackUnique _x;
				};
			};
	}foreach (OT_objectiveData + OT_airportData);

	private _numHVTs = 6;
	if(_diff == 0) then {_numHVTs = 4};
	if(_diff == 2) then {_numHVTs = 8};
	if(_numHVTs > count (OT_NATOobjectives - [[OT_NATO_HQ,OT_NATO_HQPos]])) then {
		_numHVTs = count (OT_NATOobjectives - [[OT_NATO_HQ,OT_NATO_HQPos]]);
	};

	private _count = 0;
	private _done = [];
	while {_count < _numHVTs} do {
		private _ob = selectRandom (OT_NATOobjectives - ([[OT_NATO_HQ,OT_NATO_HQPos]] + _done));
		private _name = _ob select 1;
		_done pushback _ob;
		private _id = format["%1%2",_name,round(random 99999)];
		OT_NATOhvts pushback [_id,_name,""];
		_count = _count + 1;
	};

	(OT_loadingMessages call BIS_fnc_selectRandom) remoteExec['OT_fnc_notifyStart',0];
	sleep 0.3;
	//Add comms towers
	{
		_x params ["_pos","_name"];
		OT_NATOcomms pushBack [_pos,_name];
		private _garrison = floor(5 + random(4));
		server setVariable [format ["garrison%1",_name],_garrison,true];
	}foreach (OT_commsData);

	server setVariable ["NATOobjectives",OT_NATOobjectives,true];
	server setVariable ["NATOcomms",OT_NATOcomms,true];
	server setVariable ["NATOhvts",OT_NATOhvts,true];
	diag_log "Overthrow: Distributing NATO vehicles";

    //Weighted airport list to distribute air vehicles
    private _prilist = [];
    {
        _x params ["_pos","_name","_worth"];
		if(_name != OT_NATO_HQ) then {
	        _prilist pushback _name;
			if(_worth > 900) then {
	            _prilist pushback _name;
	        };
	        if(_worth > 1200) then {
	            _prilist pushback _name;
	        };
	        if(_worth > 2500) then {
	            _prilist pushback _name;
	        };
		};
    }foreach(OT_airportData);

	if((count _prilist) > 0) then {
		{
			_x params ["_type","_num"];
			private _count = 0;
			while {_count < _num} do {
				private _name = _prilist call BIS_fnc_selectRandom;
				private _garrison = server getVariable [format["airgarrison%1",_name],[]];
				_garrison pushback _type;
				_count = _count + 1;
				server setVariable [format ["airgarrison%1",_name],_garrison,true];
			};
		}foreach(OT_NATO_Vehicles_AirGarrison);

		//Distribute some random Air vehicles
		_airvehs = OT_allBLUOffensiveVehicles select {_x isKindOf "Air"};
		{
			_name = _x;
			if((random 200) < (count _airvehs)) then {
				_type = selectRandom _airvehs;
				private _garrison = server getVariable [format["airgarrison%1",_name],[]];
				_garrison pushback _type;
				server setVariable [format ["airgarrison%1",_name],_garrison,true];
			};
		}foreach(_prilist);
	};

	//Distribute static AA to airfields
	{
		_x params ["","_name"];
		_statics = OT_NATO_Vehicles_StaticAAGarrison;
		private _fill = _x select 3;
		{
			_fill pushBack _x;
		}foreach(_statics);
		
	}foreach(OT_airportData);

	diag_log "Overthrow: Setting up NATO checkpoints";
	{
		if((server getVariable [format ["garrison%1",_x],-1]) isEqualTo -1) then {
			private _garrison = floor(8 + random(6));
			if(_x in OT_NATO_priority) then {
				_garrison = floor(12 + random(6));
			};

			//_x setMarkerText format ["%1",_garrison];
			_x setMarkerAlpha 0;
			server setVariable [format ["garrison%1",_x],_garrison,true];
		};
	}foreach (OT_NATO_control);

	diag_log "Overthrow: Garrisoning towns";
	{
		private _town = _x;
		private _garrison = 0;
		private _stability = server getVariable format ["stability%1",_town];
		private _population = server getVariable format ["population%1",_town];
		if(_stability > 10) then {
			private _max = round(_population / 120);
			private _min = 2;
			if (_town in OT_NATO_priority) then {_min = 4};
			_max = _max max 8;
			_garrison = round((_stability / 100)*_max);// More stable places have more police
			_garrison = _garrison max _min;
			if(_town in OT_NATO_priority) then {
				_garrison = round(_garrison * 2);
			};
		};
		server setVariable [format ["garrison%1",_x],_garrison,true];
	}foreach (OT_allTowns);
	sleep 0.3;
};
diag_log "Overthrow: NATO Init Done";

{
	_x params ["_pos","_name","_pri"];
	private _mrk = createMarker [_name,_pos];
	_mrk setMarkerShape "ICON";
	if(_name in (server getVariable "NATOabandoned")) then {
		_mrk setMarkerType OT_flagMarker;
	}else{
		if(_name isEqualTo OT_NATO_HQ) then {
			_mrk setMarkerType "ot_HQ";
		}else{
			_mrk setMarkerType "flag_NATO";
		};
	};

	_mrk = createMarker [_name+"_restrict",_pos];
	_mrk setMarkerShape "ELLIPSE";
	_mrk setMarkerBrush "BDIAGONAL";
	private _dist = 200;
	if(_name in OT_NATO_priority) then {_dist = 500};
	_mrk setMarkerSize [_dist, _dist];
	_mrk setMarkerColor "ColorRed";
	if(_name in (server getVariable "NATOabandoned")) then {
		_mrk setMarkerAlpha 0;
	}else{
		_mrk setMarkerAlpha 0.4;
	};

	server setVariable [_name,_pos,true];

	OT_allObjectives pushback _name;

	//Check for helipads
	if !((server getVariable "StartupType") == "NEW" || (server getVariable ["NATOversion",0]) < OT_NATOversion) then {
		if !(_name in OT_allAirports) then {
			private _helipads = (_pos nearObjects ["Land_HelipadCircle_F", 400]) + (_pos nearObjects ["Land_HelipadSquare_F", 400]);
			if((count _helipads) > 0) then {
				OT_NATOHelipads pushbackUnique _x;
			};
		};
	};

	//Set supply cache locations for this session
	//first try to find a warehouse to put it at
	private _warehouses = (_pos nearObjects [OT_warehouse, 400]);
	private _supplypos = _pos;
	if((count _warehouses) isEqualTo 0) then {
		//just pick a random position
		_supplypos = _pos findEmptyPosition [4,100,OT_item_Storage];
	}else{
		//put it at the warehouse
		_supplypos = (getpos(_warehouses select 0)) findEmptyPosition [4,100,OT_item_Storage];
	};
	spawner setVariable [format["NATOsupply%1",_name],_supplypos,false];

	//Now generate whats in it
	private _items = [];
	private _wpns = [];
	private _mags = [];

	private _done = 0;
	private _supplyamount = (_pri - 100) + (random 200);
	while {_done < _supplyamount} do {
		private _rnd = random 100;
		_rnd call {
			if(_this > 90) exitWith {
				//Add some radios (10% chance)
				_done = _done + 25;
				_items pushback ["ItemRadio",(2-_diff)+(round(random (5-_diff)))];
			};
			if(_this > 89) exitWith {
				//Add a random launcher (1% chance)
				_done = _done + 100;
				_wpn = selectRandom OT_allBLULaunchers;
				_wpns pushback [_wpn,1+(round(random (2-_diff)))];
				_mags pushback [(getArray (configFile >> "CfgWeapons" >> _wpn >> "magazines")) select 0,5];
			};
			if(_this > 85) exitWith {
				//Add a random rifle (4% chance)
				_done = _done + 50;
				_wpn = selectRandom OT_allBLURifles;
				_wpns pushback [_wpn,1+(round(random (2-_diff)))];
				_mags pushback [(getArray (configFile >> "CfgWeapons" >> _wpn >> "magazines")) select 0,5];
			};
			if(_this > 75) exitWith {
				//Add a random pistol (10% chance)
				_done = _done + 25;
				_wpn = selectRandom OT_allBLUPistols;
				_wpns pushback [_wpn,1+(round(random (3-_diff)))];
				_mags pushback [(getArray (configFile >> "CfgWeapons" >> _wpn >> "magazines")) select 0,5];
			};
			if(_this > 50) exitWith {
				//Add random ammunition (25% chance)
				_done = _done + 20;
				_mags pushback [selectRandom OT_allBLURifleMagazines,3+(round(random (4-_diff)) * 2)];
			};
			//Add some meds (50% chance)
			_done = _done + 40;
			_items pushback [selectRandom ["ACE_fieldDressing","ACE_fieldDressing","ACE_morphine"],(2-_diff)+(round(random (5-_diff)))];
		};
	};
	spawner setVariable [format["NATOsupplyitems%1",_name],[_items,_wpns,_mags],false];
}foreach(OT_NATOobjectives);
sleep 0.3;

publicVariable "OT_allObjectives";

{
	_x params ["_pos","_name"];
	private _mrk = createMarker [_name,_pos];
	_mrk setMarkerShape "ICON";
	_mrk setMarkerType "loc_Transmitter";
	if(_name in (server getVariable "NATOabandoned")) then {
		_mrk setMarkerColor "ColorGUER";
	}else{
		_mrk setMarkerColor "ColorBLUFOR";
	};
	server setVariable [_name,_pos,true];
	OT_allComms pushback _name;
	OT_allObjectives pushback _name;

	_mrk = createMarker [_name+"_restrict",_pos];
	_mrk setMarkerShape "ELLIPSE";
	_mrk setMarkerBrush "BDIAGONAL";
	private _dist = 40;
	if(_name in OT_NATO_priority) then {_dist = 500};
	_mrk setMarkerSize [_dist, _dist];
	_mrk setMarkerColor "ColorRed";
	if(_name in (server getVariable "NATOabandoned")) then {
		_mrk setMarkerAlpha 0;
	}else{
		_mrk setMarkerAlpha 0.4;
	};
}foreach(OT_NATOcomms);
sleep 0.3;
private _revealed = server getVariable ["revealedFOBs",[]];
{
	_x params ["_pos","_garrison","_upgrades"];
	OT_flag_NATO createVehicle _pos;

	private _count = 0;
	private _group = creategroup blufor;
	while {_count < _garrison} do {
		private _start = [[[_pos,50]]] call BIS_fnc_randomPos;

		private _civ = _group createUnit [OT_NATO_Reinforcements call BIS_fnc_selectRandom, _start, [],0, "NONE"];
		_civ setVariable ["garrison","HQ",false];
		_civ setRank "LIEUTENANT";
		_civ setVariable ["VCOM_NOPATHING_Unit",true,false];
		_civ setBehaviour "SAFE";

		_count = _count + 1;
	};
	_group call OT_fnc_initMilitaryPatrol;

	[_pos,_upgrades] call OT_fnc_NATOupgradeFOB;

	private _id = str _pos;
	if(_id in _revealed) then {
		//create marker
		_mrkid = createMarker [format["natofob%1",_id],_pos];
			_mrkid setMarkerShape "ICON";
			_mrkid setMarkerType "mil_Flag";
			_mrkid setMarkerColor "ColorBLUFOR";
			_mrkid setMarkerAlpha 1;
		_mrkid = createMarker [format["natofobWarning%1",_id],_pos];
			_mrkid setMarkerShape "ELLIPSE";
			_mrkid setMarkerBrush "FDiagonal";
			_mrkid setMarkerColor "ColorRed";
			_mrkid setMarkerAlpha 1;
			_mrkid setMarkerSize [30, 30];
	};	
}foreach(server getVariable ["NATOfobs",[]]);

publicVariable "OT_allObjectives";
publicVariable "OT_allComms";
OT_NATOInitDone = true;
publicVariable "OT_NATOInitDone";
