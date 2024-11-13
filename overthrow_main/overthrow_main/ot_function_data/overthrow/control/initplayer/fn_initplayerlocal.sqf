params[["_loadingPhase",0], ["_startTime", diag_tickTime]];

switch (_loadingPhase) do {
	case(0): {//Camera setup stage
		
		//Setup camera
		OT_centerPos = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
		private _start = ((missionConfigFile >> "OT_missionCustomization" >> "startCameraPos") call BIS_fnc_getCfgData);
		private _target = ((missionConfigFile >> "OT_missionCustomization" >> "startCameraTarget") call BIS_fnc_getCfgData);

		OT_introCam = "camera" camCreate _start;
		OT_introCam camSetTarget _target;
		OT_introCam cameraEffect ["internal", "BACK"];
		OT_introCam camSetFocus [15, 1];
		OT_introCam camsetfov 1.1;
		OT_introCam camCommit 0;
		showCinemaBorder false;
		
		/*
			TODO: camera idle rotation
			[_introcam,_initalTarget] spawn {
				params ["_introcam","_initalTarget"];
				while {} do {
				
				};
			};
		*/
		
		["OT_LoadingBlackOut", true, 2] call BIS_fnc_blackIn;
		
		[
			{//Condition
				params["_introcam", "_startTime"]; 
				camCommitted OT_introCam
			},
			{//Code
				params ["_introcam", "_startTime"];
				
				[format["%1's camera has been commited.", player], "STARTUP_LOCAL"] call OT_fnc_debugLog;
				[//The legendary nested CBA waituntil
					{//Condition
						!(isnull (findDisplay 46))
					},
					{//Code
						params["_startTime"];
						[1, _startTime] call OT_fnc_initPlayerLocal;
					},
					[_startTime]//Params
				] call CBA_fnc_waitUntilAndExecute;
			},
			[OT_introCam, _startTime]//Params
		] call CBA_fnc_waitUntilAndExecute;
	};
	case(1): {//Decide if player needs to view main menu or not
		//If a player is the server, or there is only one player, and the server hasnt already been started
		private _handle = -1;
		private _autoInit = ((["ot_start_autoload", 0] call BIS_fnc_getParamValue) == 1);
		private _startupType = server getVariable ["StartupType",""];
		if((isServer || count ([] call CBA_fnc_players) == 1) && (_startupType isEqualTo "" && !(_autoInit))) then {
			if (isServer || (count ([] call CBA_fnc_players) == 1)) then {
				[format["%1 has the startup menu.", player], "STARTUP_LOCAL"] call OT_fnc_debugLog;
				
				createDialog "OT_dialog_start";
				//Prevents user from accidently closing display
				_handle = [
					{
						if (OT_local_PFEH getOrDefault ["OT_dialog_start_pfeh",-1] isNotEqualTo -1) then {
							if (((findDisplay 101010) isEqualTo DisplayNull) && ((findDisplay 8099) isEqualTo DisplayNull)) then {
								createDialog "OT_dialog_start";
							};
						}else{
							closeDialog 0;
						};
					},
					3,
					[]
				] call CBA_fnc_addPerFrameHandler;
				OT_local_PFEH set ["OT_dialog_start_pfeh", _handle];
			};
		}else{
			"Loading" call OT_fnc_notifyStart;
		};
		
		[format["%1 has started waiting on NATO init.", player], "STARTUP_LOCAL"] call OT_fnc_debugLog;
		
		[
			{//Condition
				!(isNil "OT_NATOInitDone")
			},
			{//Code
				params["_startTime"];
				
				[format["%1 has finished waiting on NATO init.", player], "STARTUP_LOCAL"] call OT_fnc_debugLog;
				//Play black out loading effect
				titleText ["<t font='OxaniumRegular' size='2'>Loading Player Data...</t>", "BLACK OUT", 1, true, true];				
				[
					{
						params ["_startTime"];
						[2, _startTime] call OT_fnc_initPlayerLocal
					},
					[_startTime],
					1
				] call CBA_fnc_waitAndExecute;
			},
			[_startTime]//Params
		] call CBA_fnc_waitUntilAndExecute;//Wait for screen to have blackout before continuing
	};
	case(2): {//Load player save data from server
		[format["Started Loading %1's data from server.", player], "STARTUP_LOCAL"] call OT_fnc_debugLog;
		player remoteExec ["OT_fnc_loadPlayerData", 2, false];
		//Play black out loading effect
		[
			{//Condition
				(player getVariable ["OT_loaded",false])
			},
			{//Code
				params["_startTime"];
				
				[format["%1's data has been loaded from the server.", player], "STARTUP_LOCAL"] call OT_fnc_debugLog;
				[3, _startTime] call OT_fnc_initPlayerLocal;
			},
			[_startTime]//Params
		] call CBA_fnc_waitUntilAndExecute;
	};
	case(3): {//Now actaully set up the game for the player
	
		//Base vars
		private _newplayer = true;
		private _furniture = [];
		private _town = "";
		private _pos = [];
		private _housepos = [];
		
		//Load mission dependant vars, if not already loaded
		if !(isServer) then {
			//Load game vars
			[] call OT_fnc_initBaseVar;
			[] call compile preprocessFileLineNumbers "initVar.sqf";
		};
		[format["%1 has succesfully loaded game vars.", player], "STARTUP_LOCAL"] call OT_fnc_debugLog;
		
		//Add custom map locations
		{
			private _locationInfo = _x;
			_locationInfo params ["_locName", "_locType", "_locPos", "_locSizeX", "_locSizeY"];
			
			private _location = createLocation [_locType, _locPos, _locSizeX, _locSizeY];
			_location setText _locName;
		}foreach(OT_customLocations);
		
		//Check if player is homeless
		if (player getVariable["home",false] isEqualType []) then {
		  _newplayer = false;
		}else{
		  _newplayer = true;
		};

		OT_showPlayerMarkers = (["ot_showplayermarkers", 1] call BIS_fnc_getParamValue) isEqualTo 1;
		OT_showTownChange = (["ot_showtownchange", 1] call BIS_fnc_getParamValue) isEqualTo 1;
		OT_showEnemyGroups = (["ot_showenemygroups", 1] call BIS_fnc_getParamValue) isEqualTo 1;

		private _aplayers = players_NS getVariable ["OT_allplayers",[]];
		if ((_aplayers find (getplayeruid player)) isEqualTo -1) then {
			_aplayers pushback (getplayeruid player);
			players_NS setVariable ["OT_allplayers",_aplayers,true];
		};
		
		//Set player namespace variables globally
		players_NS setVariable [format["name%1",getplayeruid player],name player,true];
		players_NS setVariable [format["uid%1",name player],getplayeruid player,true];
		spawner setVariable [format["%1",getplayeruid player],player,true];
		
		//ensure player is in own group, not one someone else left
		private  _group = creategroup resistance;
		[player] joinSilent _group;
		//Make sure the players personal group isnt subjected to VCM
		(group player) setVariable ["VCM_Disable",true];
		
		//If the player is not homeless, load there house
		if(!_newplayer) then {
			_housepos = player getVariable "home";
			if(isNil "_housepos" || (count _housepos) isEqualTo 0) exitWith {
				_newplayer = true;
				[format["%1 failed to load %1 house data, falling back to no housing data", player], "ERROR"] call OT_fnc_debugLog;
			};
			_town = _housepos call OT_fnc_nearestTown;
			_pos = server getVariable _town;
			{
				if(_x call OT_fnc_hasOwner) then {
					if ((_x call OT_fnc_playerIsOwner) && !(_x isKindOf "LandVehicle") && !(_x isKindOf "Building")) then {
						_furniture pushback _x
					};
				};
			}foreach(_housepos nearObjects 50);
		};
		
		[] call OT_fnc_initPlayerLocalObjects;
		
		if (_newplayer) then {
			[] call OT_fnc_initNewPlayer;
		}else{
			[] call OT_fnc_loadPlayerTroops;
			//Disable tutorial
			player setVariable ["OT_tute_trigger",false,true];
		};
		
		[
			{//Condition
				!(isNil "OT_SystemInitDone")
			},
			{//Code
				params["_startTime"];
				
				[format["%1 has finished waiting on server to initalize! They can now play~", player], "STARTUP_LOCAL"] call OT_fnc_debugLog;
				
				[4, _startTime] call OT_fnc_initPlayerLocal;
			},
			[_startTime]//Params
		] call CBA_fnc_waitUntilAndExecute;
	};
	case(4): {//Prepare player to be able to play the game now that all data has been loaded
		private _housePos = player getVariable ["home",getpos player];
		
		player setCaptive true;
		player setPos (_housepos findEmptyPosition [1,20,typeof player]);
		if !("ItemMap" in (assignedItems player)) then {
			player linkItem "ItemMap";
		};
		
		//Begin preloading camera around player
		private _handle = [player] spawn OT_fnc_preloadAroundObject;
		
		//"Automatic" saving
		[
			{//Condition
				!(isNull (findDisplay 46))
			},
			{//Code
				(findDisplay 46) displayAddEventHandler ["KeyDown", "if ((_this#1) isEqualTo 1) then { [player] call OT_fnc_savePlayerData;	};"];
			},
			[]//Params
		] call CBA_fnc_waitUntilAndExecute;
		
		[] call OT_fnc_initPlayerEventHandlers;
		
		//Find player owned houses
		{
			_pos = buildingpositions getVariable [_x,[]];
			if(count _pos isEqualTo 0) then {
				_bdg = OT_centerPos nearestObject parseNumber _x;
				_pos = position _bdg;
				buildingpositions setVariable [_x,_pos,true];
			};
		}foreach(player getvariable ["owned",[]]);
		
		//Init mapSystem
		player call OT_fnc_mapSystem;
		
		//Set player damage threshold from parameters
		player setVariable ["ace_medical_damageThreshold", server getvariable ["PDT",1], true];
		
		//Set up which is called now + everytime a player respawns
		[] call OT_fnc_setupPlayer;
		
		//Destroy Camera from intro/ Reset cam to unit view
		OT_introCam cameraEffect ["Terminate", "BACK" ];
		camDestroy OT_introCam;
		OT_introCam = nil;

		[
			{//Condition
				params ["_handle"];
				(scriptDone _handle)
			},
			{//Code
				[] spawn {
					[format["%1's player camera has finished preloading.", player], "STARTUP_LOCAL"] call OT_fnc_debugLog;
					
					titleText ["", "BLACK IN", 2];
					uiSleep 2;
					private _text = [
						[format["%1, %2",(getpos player) call OT_fnc_nearestTown,OT_nation],"align = 'center' size = '0.7' font='PuristaBold'"],
						["","<br/>"],
						[format["%1/%2/%3",date#2,date#1,date#0]],
						["","<br/>"],
						[format["%1",[daytime,"HH:MM"] call BIS_fnc_timeToString],"align = 'center' size = '0.7'"],
						["s","<br/>"]
					];
					[_text] spawn BIS_fnc_typeText2;
				};
			},
			[_handle]//Params
		] call CBA_fnc_waitUntilAndExecute;
		
		//initalize jukebox songs, very important
		[] call OT_fnc_initJukeBox;
		
		//Output debug info
		private _endTime = diag_tickTime;
		[format["%1's loading finished, it took %2 seconds.", player, (_endTime - _startTime)], "STARTUP_LOCAL"] call OT_fnc_debugLog;
		
		//Give warning if neccessary
		if (isServer) then {
			systemchat "WARNING: The mod may not run well on a player host (It is still fully functional, however). Please consider running the mod on a dedicated lan server if you are experiancing an unplayable framerate (I recommend using FASTER to quickly set up one up)."
		};
	};
};

/*
	TODO: move to config event handler

	{
		_x params ["_pos"];
		private _base = _pos nearObjects [OT_flag_IND,5];
		if((count _base) > 0) then {
			_base = _base#0;
			_base addAction ["Set As Home", {player setVariable ["home",getpos (_this select 0),true];"This FOB is now your home" call OT_fnc_notifyMinor},nil,0,false,true];
		};
	}foreach(server getVariable ["bases",[]]);
*/