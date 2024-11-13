onLoadMissionTime = 1;
allowSubordinatesTakeWeapons = 1;

joinUnassigned = 1;
briefing = 0;

class Header {
	gameType = OT;
	minPlayers = 1;
	maxPlayers = 12;
};

allowFunctionsLog 		= 1;
enableDebugConsole 		= 1;

respawn 				= "BASE";
respawnDelay			= 5;
respawnVehicleDelay 	= 120;
respawnDialog 			= 0;
aiKills 				= 0;
disabledAI 				= 1;
saving 					= 0;
showCompass 			= 1;
showRadio 				= 1;
showGPS 				= 1;
showMap 				= 1;
showBinocular 			= 1;
showNotepad 			= 1;
showWatch 				= 1;
debriefing 				= 0;
		
overviewPicture 		= 	"\overthrow_missions\shared\data\ui\ot_missionlogo_co.paa";
loadScreen 				= 	"\overthrow_missions\shared\data\ui\ot_missionlogo_co.paa";
author					=	"deadorbit + gearheart + ARMAZAC";


class Params {
	class ot_param_info {
		title 		= "---Note: You can find a more detailed description of what each settings does on the mod's GitHub---";
		values[] 	= {0};
		texts[] 	= {"OK"};
		default 	= 0;
	};
	class ot_start_autoload {
		title 		= "Autoload a save or start a new game";
		values[] 	= {0, 1};
		texts[] 	= {"No", "Yes"};
		default 	= 0;
	};
	class ot_start_difficulty {
		title 		= "Game difficulty (Only with autoload)";
		values[] 	= {0, 1, 2};
		texts[] 	= {"Easy", "Normal", "Hard"};
		default 	= 1;
	};
	class ot_start_fasttravel {
		title 		= "Fast Travel (Only with autoload)";
		values[] 	= {0, 1, 2};
		texts[] 	= {"Open", "Restricted", "Disabled"};
		default 	= 1;
	};
	class ot_start_popModifier {
		title 		= "Population Modifer (Only with autoload)";
		values[] 	= {0, 1, 2};
		texts[] 	= {"Low", "Medium", "High"};
		default 	= 0;
	};
	class ot_start_tutorial {
		title 		= "Tutorial Rules (Only with autoload)";
		values[] 	= {0, 1, 2};
		texts[] 	= {"Skip", "Skip, Items", "Allow"};
		default 	= 2;
	};
	class ot_showplayermarkers {
		title 		= "Show Player Markers on HUD";
		values[] 	= {1,0};
		texts[] 	= {"Yes", "No"};
		default 	= 1;
	};
	class ot_showenemygroup {
		title 		= "Show known enemy groups on map";
		values[] 	= {1,0};
		texts[] 	= {"Yes", "No"};
		default 	= 1;
	};
    class ot_acemedical_players {
        title 		= "Ace Medical Lethality for Players";
        values[] 	= {0, 1, 2};
        texts[] 	= {"Realistic (Hard)", "Semi-Realistic (Recommended)", "Forgiving (Easiest)"};
        default 	= 1;
    };
	class ot_acemedical_ai {
        title 		= "Ace Medical Lethality for AI";
        values[] 	= {0, 1, 2, 3};
        texts[] 	= {"Arcade(Easiest)", "Realistic (Recommended)", "Semi-Realistic(Harder)", "Forgiving (Hardest)"};
        default 	= 1;
    };
	class ot_acemedical_realism {
        title 		= "Ace Medical Realism Presets (For AI & Players. Affects blood loss rate, treatment time, ect.)";
        values[] 	= {0, 1, 2, 3};
        texts[] 	= {"Realistic (Most Fatal)", "Semi-Realistic (Recommended)", "Casual", "Arcade(Least Fatal)"};
        default 	= 1;
    };
	class ace_medical_blood_enabledFor {
        title 		= "ACE Blood";
        ACE_setting = 1;
        values[] 	= {0, 1, 2};
        texts[] 	= {"None", "Players Only", "Everyone"};
        default 	= 1;
    };
	class ot_armedres {
        title 		= "Count Unarmed Resistance Members Towards QRF Missions.(Strongly suggest against.)";
        values[] 	= {0, 1};
        texts[] 	= {"Yes", "No"};
        default 	= 1;
    };
	class ot_headlessclient {
		title 		= "Headless Client";
		texts[] 	= {"Disabled","Enabled"};
		values[] 	= {0, 1};
		default 	= 0;
		isGlobal	= 1;
	};
	class ot_civairdrops {
		title 		= "Random IDAP Airdrops";
		texts[] 	= {"Disabled","Enabled"};
		values[] 	= {0, 1};
		default 	= 1;
		isGlobal	= 1;
	};
	class ot_playersurvivability {
		title 		= "Increased Damage Threshold (Survivability) for Players";
		texts[] 	= {"1x","2x","4x"};
		values[] 	= {1,2,4};
		default		= 1;
		isGlobal 	= 1;
	};
	class ot_autodespawnbodies {
		title 		= "Garbage collect corpse timer (Minutes, only with autoload)";
		texts[] 	= {"Never","15","60"};
		values[] 	= {0,1,2};
		default 	= 2;
		isGlobal 	= 1;
	};
	class ot_daytimescale {
		title 		= "Controls how long one in-game day lasts. (Does NOT effect in-game timers.)";
		values[] 	= {0.5,		1, 		2, 		4, 		8, 		24};
		texts[] 	= {"30m", 	"1h", 	"2h", 	"4h", 	"8h", 	"Real Time"};
		default 	= 2;
		isGlobal 	= 1;
	};
	class ot_zbecaching {
		title 		= "zbe_cache optimization (can improve preformance.)";
		values[] 	= {0, 			1, 						2};
		texts[] 	= {"Disabled",	"Enabled (Recommended)","Enabled: Aggressive (Experimental)"};
		default 	= 1;
		isGlobal 	= 1;
	};
};

class CfgRemoteExec {
	class Functions {
		mode = 2;
		jip = 1;
		
		class vcm_serverask { allowedTargets = 0;jip = 1; };
		class VCM_PublicScript { allowedTargets = 0;jip = 1; };
		class BIS_fnc_debugConsoleExec { allowedTargets = 0;jip = 1; };
		class SpawnScript { allowedTargets = 0;jip = 1; };
		class enableSimulationGlobal { allowedTargets = 0;jip = 1; };
		class VCM_fnc_KnowAbout { allowedTargets = 0;jip = 1; };	
	};
};

/*
class Extended_PreInit_EventHandlers {
	VCM_CBASettings = call compile preprocessFileLineNumbers "\overthrow_main\ot_function_data\vcom\functions\vcm_functions\fn_CBASettings.sqf";
};
*/

cba_settings_hasSettingsFile = 1;
