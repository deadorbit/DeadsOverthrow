/*
The neccesary initalize order appears to be:
	fn_initbasevar.sqf
	/mission/fn_initvar.sqf
	load game settings/mission parameters
	fn_initoverthrow.sqf
	initeconomy.sqf/loadeconomy.sqf
	start game
*/
waitUntil {time > 1 && (!((["ot_start_autoload", -1] call BIS_fnc_getParamValue) isEqualTo -1))};

if(!isServer) exitWith {};

if !(isClass (configFile >> "CfgPatches" >> "overthrow_main")) exitWith {
	diag_log "Overthrow addon not detected, you must add @Overthrow to your -mod commandline";
	"Overthrow addon not detected, you must add @Overthrow to your -mod commandline" call OT_fnc_notifyStart;
};

if (isDedicated) then {
	server_dedi = true;
}else{
	server_dedi = false;
};
publicVariable "server_dedi";

missionNamespace setVariable ["OT_varInitDone", false, true];
"SERVER: Server Pre-Init started" call BIS_fnc_log;


//Set parameters (just incase, should also get set when game is started/loaded)
ace_interaction_EnableTeamManagement = false; //Disable group switching
ace_interaction_disableNegativeRating = true; //Disable ACE negative ratings

enableSaving [false,false];
enableEnvironment [false,true];

OT_autoSave_time = 60;
OT_autoSave_last_time = (10*60);
OT_cleanup_civilian_loop = (5*60);
zeusToggle = true;

east setFriend [civilian,1];
west setFriend [civilian,1];
independent setFriend [civilian,1];
civilian setFriend [east,1];
civilian setFriend [west,1];
civilian setFriend [independent,1];

server = true call CBA_fnc_createNamespace;
publicVariable "server";
players_NS = true call CBA_fnc_createNamespace;
publicVariable "players_NS";
cost = true call CBA_fnc_createNamespace;
publicVariable "cost";
warehouse = true call CBA_fnc_createNamespace;
publicVariable "warehouse";
spawner = true call CBA_fnc_createNamespace;
publicVariable "spawner";
templates = true call CBA_fnc_createNamespace;
publicVariable "templates";
owners = true call CBA_fnc_createNamespace;
publicVariable "owners";
buildingpositions = true call CBA_fnc_createNamespace;
publicVariable "buildingpositions";
OT_civilians = true call CBA_fnc_createNamespace;
publicVariable "OT_civilians";

OT_autoInit = ((["ot_start_autoload", 0] call BIS_fnc_getParamValue) == 1);

//Set parameters (just incase, should also get set when game is started/loaded)
server setVariable ["OT_difficulty",(["ot_start_difficulty", 1] call BIS_fnc_getParamValue),true];
server setVariable ["OT_fastTravelType",(["ot_start_fasttravel", 1] call BIS_fnc_getParamValue),true];
server setVariable ["OT_popModifier",(["ot_start_popModifier", 0] call BIS_fnc_getParamValue),true];
server setVariable ["ot_tutorial",(["ot_start_tutorial", 0] call BIS_fnc_getParamValue),true];

OT_centerPos = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");

[enableDynamicSimulationSystem false] remoteExec ["bis_fnc_call", 0];

server setVariable ["StartupType","",true];

["Starting variable initilization and object virtulization.", "STARTUP_SERVER"] call OT_fnc_debugLog;
[] call OT_fnc_initVirtualization;
[] call OT_fnc_initBaseVar;
["Finished initilizing virt + basevars.", "STARTUP_SERVER"] call OT_fnc_debugLog;

//Call mission initVar
[] call compile preprocessFileLineNumbers "initVar.sqf";

OT_tpl_checkpoint = [] call compileFinal preProcessFileLineNumbers "data\templates\NATOcheckpoint.sqf";
OT_varInitDone = true;
publicVariable "OT_varInitDone";
["Startup initilization finished, waiting to continue.", "STARTUP_SERVER"] call OT_fnc_debugLog;

[] spawn {
	if (OT_autoInit) then {
		diag_log "== OVERTHROW == Mission autoloaded as per settings. Toggle in the options menu in-game to disable.";
		diag_log "== OVERTHROW == Waiting for a player to connect!";
		waitUntil{sleep 1; [] call CBA_fnc_players > 0};
		//[] call OT_fnc_initOverthrow;
		[] spawn OT_fnc_loadGame;
	};

	//Either game has finished loading or player has started a new game
	waitUntil {sleep 1;server getVariable ["StartupType",""] != ""};

	setTimeMultiplier (24 / OT_setting_timeScale);

	//Init factions
	["Initilizing OT game systems.", "STARTUP_SERVER"] call OT_fnc_debugLog;
	
	[] spawn OT_fnc_initNATO;
	waitUntil {!isNil "OT_NATOInitDone"};

	[] spawn OT_fnc_initEconomyLoad;
	
	[] spawn OT_fnc_factionNATO;
	[] spawn OT_fnc_factionGUER;
	[] spawn OT_fnc_factionCRIM;
	[] spawn OT_fnc_factionCIV;

	//Game systems
	[] spawn OT_fnc_propagandaSystem;
	[] spawn OT_fnc_weatherSystem;
	[] spawn OT_fnc_incomeSystem;
	[] spawn OT_fnc_jobSystem;
	[] spawn OT_fnc_JammingLoop;
	
	["Game systems successfully initilized.", "STARTUP_SERVER"] call OT_fnc_debugLog;

	//Init virtualization
	["Initilizing OT Economy logic.", "STARTUP_SERVER"] call OT_fnc_debugLog;
	waitUntil {!isNil "OT_economyLoadDone"};
	[] spawn OT_fnc_runVirtualization;
	["Successfully initilized economy.", "STARTUP_SERVER"] call OT_fnc_debugLog;
	
	//Unit caching script
	if (OT_settings_NBECache > 0) then {
		[1500,0,false,2000,3000,2000,false,false,false] spawn NR6_fnc_ZBEInit;
		diag_log "OT_DEBUG: ZBE Caching enabled and running.";
	};

	["Finishing pre-initilization", "STARTUP_SERVER"] call OT_fnc_debugLog;
	//ACE3 Arsenal default loadouts
	{
		_x params ["_cls","_loadout"];
		[_cls call OT_fnc_vehicleGetName, _loadout] call ace_arsenal_fnc_addDefaultLoadout;
	}foreach(OT_Recruitables);
	["Police", OT_Loadout_Police] call ace_arsenal_fnc_addDefaultLoadout;

	//Subscribe to events
	if(isMultiplayer) then {
	    addMissionEventHandler ["PlayerConnected",OT_fnc_playerConnectHandler];
	    addMissionEventHandler ["HandleDisconnect",OT_fnc_playerDisconnectHandler];
	};
	["Building", "Dammaged", OT_fnc_buildingDamagedHandler] call CBA_fnc_addClassEventHandler;
	
	//Overthrow events
	["OT_QRFstart", OT_fnc_QRFStartHandler] call CBA_fnc_addEventHandler;
	["OT_QRFend", OT_fnc_QRFEndHandler] call CBA_fnc_addEventHandler;
	OT_QRFstart = spawner getVariable ["QRFstart",nil];//If theres already a QRF going

	if(isServer) then {
		addMissionEventHandler ["EntityKilled",OT_fnc_deathHandler];

		["OT_autosave_loop"] call OT_fnc_addActionLoop;
		["OT_civilian_cleanup_crew", "time > OT_cleanup_civilian_loop","
			OT_cleanup_civilian_loop = time + (5*60);
			private _totalcivs = {(side _x isEqualTo civilian) && !captive _x} count (allUnits);
			{
				if(_x getVariable [""OT_Looted"",false]) then {
					private _stock = _x call OT_fnc_unitStock;
					if((count _stock) isEqualTo 0) then {
						deleteVehicle _x;
					};
				};
			}forEach(alldeadmen);
			if(_totalcivs < 50) exitWith {};
			{
				if (side group _x isEqualTo civilian && {!(isPlayer _x)} && {!(_x getVariable [""shopcheck"",false])} && { ({side _x isEqualTo civilian} count ((getPos _x) nearObjects [""CAManBase"",150])) > round(150*OT_spawnCivPercentage) } ) then {
					private _group = group _x;
					private _unit = _x;
					deleteVehicle _unit;
					if (count units _group < 1) then {
						deleteGroup _group;
					};
				};
			}forEach (allUnits);
		"] call OT_fnc_addActionLoop;
	};
	
	OT_serverInitDone = true;
	publicVariable "OT_serverInitDone";
	["Pre-initilization finished.", "STARTUP_SERVER"] call OT_fnc_debugLog;
};
