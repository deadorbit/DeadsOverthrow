//Variables required by mission initVar + can be overriden by mission initVar
//AKA: shared between all missions (but dont need to be preloaded)
//Ran on both server and client

OT_has_TFAR = isClass(configFile >> "CfgPatches" >> "task_force_radio");
OT_has_WS 	= isClass(configfile >> "CfgPatches" >> "data_f_lxWS");//Check if Western Sahara DLC is downloaded
OT_has_NI 	= isClass(configfile >> "CfgPatches" >> "hlcweapons_core"); //Nation Indepedent Arsenal
OT_has_FW 	= isClass(configFile >> "CfgFunctions" >> "FreeWorldArmoury"); //The Free World Armoury
OT_has_3F 	= isClass(configFile >> "CfgPatches" >> "UK3CB_Factions_Vehicles_Common"); //3cb factions
OT_has_CupW = isClass(configFile >> "CfgPatches" >> "CUP_Weapons_Items"); //CUP-Weapons
OT_has_IC 	= isclass(configFile >> "CfgIvoryTextures"); //Ivory Cars
OT_has_GM 	= isclass(configFile >> "CfgPatches" >> "gm_core"); //Global Mobalization
OT_has_BW	= isClass(configfile >> "CfgPatches" >> "bwa3_weapons"); //BWMOD
OT_has_AG	= isClass(configfile >> "CfgPatches" >> "A3_Weapons_F_Aegis_LongRangeRifles_DMR_01"); //Aegis
OT_has_RF	= isClass(configfile >> "CfgPatches" >> "RF_Data"); //Reaction forces
OT_has_AT	= isClass(configfile >> "CfgPatches" >> "A3_Atlas_Data_F_Atlas"); //ArmA3 Atlas

//lobby parameters
OT_setting_HCEnabled = ((["ot_headlessclient", 0] call BIS_fnc_getParamValue) == 1);
OT_setting_allowAirDrop = ((["ot_civairdrops", 1] call BIS_fnc_getParamValue) == 1);
OT_setting_playerSurviabilty = ((["ot_playersurvivability", 1] call BIS_fnc_getParamValue) == 1);
OT_setting_timeScale = ["ot_daytimescale", 2] call BIS_fnc_getParamValue;
OT_settings_NBECache = ["ot_zbecaching", 1] call BIS_fnc_getParamValue;
OT_settings_AceMedicalPlayers = ["ot_acemedical_players", 1] call BIS_fnc_getParamValue;
OT_settings_ACEMedicalAI = ["ot_acemedical_ai", 0] call BIS_fnc_getParamValue;

OT_setting_difficulty = server getVariable ["OT_difficulty",1];
OT_setting_fastTravelType = server getVariable ["OT_tutorial",1];
OT_setting_popMod = server getVariable ["OT_popModifier",0];
OT_setting_deadBodyCleanup = server getVariable ["OT_Despawn",1];
OT_setting_doTutorial = server getVariable ["OT_tutorial",0];

//Global overthrow variables related to any map
OT_currentMissionFaction = "";
OT_rankXP = [100,250,500,1000,4000,10000,100000];

OT_deepDebug = false;
OT_allIntel = [];
OT_notifies = [];

OT_Looters = 0;
OT_LootersLastOrder = time;

OT_NATO_HQPos = [0,0,0];

OT_fastTime = true; //When true, 1 day will last 6 hrs real time
OT_spawnDistance = 1200;
OT_spawnCivPercentage = 0.02;
OT_spawnCivCap = 20;

if(OT_setting_popMod == 1) then {OT_spawnCivPercentage = 0.05; OT_spawnCivCap = 40};
if(OT_setting_popMod == 2) then {OT_spawnCivPercentage = 0.10; OT_spawnCivCap = 60};

OT_spawnVehiclePercentage = 0.04;
OT_standardMarkup = 1.5; //Markup in shops is calculated from this

OT_dealerMagFee = 2.5; //How much dealer rips off players * normal value for magazines
OT_dealerOpticFee = 1.25; //How much dealer rips off players * normal value for optics
OT_dealerUpcharge = 1.25; //How much dealer ADDITIONALLY charges the player for 'Convience'
OT_loseMoneyOnDeath = 0.1; // % of cash on player lost on death
OT_loseInfluenceOnDeath = 0.01;
OT_searchChance = 3;// x/100 chance of being searched with illegal items in inventory and near cop
OT_FTPrice = 250; // price per km to fast travel on foot
OT_maxLootDrops = 2;

OT_minRandomLoadouts = 2; //Minimum number of randomized loadouts that will be generated per nato unit
OT_maxRandomLoadouts = 5; //Max of above

switch (OT_setting_difficulty) do {
	case 0: { //Easy
		OT_dealerMagFee = 1.5;
		OT_dealerOpticFee = 1;
		OT_dealerUpcharge = 1.1;
		OT_standardMarkup = 1.25;
		OT_loseMoneyOnDeath = 0.05;
		OT_loseInfluenceOnDeath = 0.025;
		OT_searchChance = 1;
		OT_FTPrice = 100;
		OT_maxLootDrops = 3;
	};
	case 2: { //Hard
		OT_dealerMagFee = 4;
		OT_dealerOpticFee = 2;
		OT_dealerUpcharge = 1.5;
		OT_standardMarkup = 1.85;
		OT_loseMoneyOnDeath = 0.25;
		OT_loseInfluenceOnDeath = 0.05;
		OT_searchChance = 6;
		OT_FTPrice = 500;
		OT_maxLootDrops = 1;
	};
};

switch (OT_settings_ACEMedicalAI) do {
	case (0): {//Arcade
		ace_medical_statemachine_fatalInjuriesAI = 0; //Always
		ace_medical_statemachine_AIUnconsciousness = false;
		ace_medical_AIDamageThreshold = 0.8;
	};
	case (1): {//Realistic
		ace_medical_statemachine_fatalInjuriesAI = 0; //Always
		ace_medical_statemachine_AIUnconsciousness = true;
		ace_medical_AIDamageThreshold = 1.0;
	};
	case (2): {//Semi-Realistic
		ace_medical_statemachine_fatalInjuriesAI = 1; //Cardiac Arrest
		ace_medical_statemachine_AIUnconsciousness = true;
		ace_medical_AIDamageThreshold = 3.0;
	};
	case (3): {//Forgiving
		ace_medical_statemachine_fatalInjuriesAI = 2; //Never
		ace_medical_statemachine_AIUnconsciousness = true;
		ace_medical_AIDamageThreshold = 5.0;
	};
};

switch (OT_settings_AceMedicalPlayers) do {
	case (0): {//Realistic
		ace_medical_statemachine_fatalInjuriesPlayer = 0; //Always
		ace_medical_playerDamageThreshold = 1.0;
	};
	case (1): {//Semi-Realistic
		ace_medical_statemachine_fatalInjuriesPlayer = 1; //Cardiac Arrest
		ace_medical_playerDamageThreshold = 1.25;
	};
	case (2): {//Forgiving
		ace_medical_statemachine_fatalInjuriesPlayer = 2; //Never
		ace_medical_playerDamageThreshold = 3.0;
	};
};

OT_randomSpawnTown = false; //if true, every player will start in a different town, if false, all players start in the same town (Multiplayer only)
OT_distroThreshold = 500; //Size a towns order must be before a truck is sent (in dollars)
OT_saving = false;
OT_activeShops = [];
OT_selling = false;
OT_taking = false;
OT_interactingWith = objNull;

OT_tutorialMissions = [];
OT_tutorialMissions pushback (compileFinal preprocessFileLineNumbers "\overthrow_missions\shared\data\jobs\tutorial\tut_NATO.sqf");
//OT_tutorialMissions pushback (compileFinal preprocessFileLineNumbers "\overthrow_main\missions\tutorial\tut_CRIM.sqf");
OT_tutorialMissions pushback (compileFinal preprocessFileLineNumbers "\overthrow_missions\shared\data\jobs\tutorial\tut_Drugs.sqf");
OT_tutorialMissions pushback (compileFinal preprocessFileLineNumbers "\overthrow_missions\shared\data\jobs\tutorial\tut_Economy.sqf");

//Buildings (mission override)
OT_shopBuildings = [];
OT_spawnHouseBuildings = [];
OT_carShopBuildings = [];

OT_loadingMessages = ["Adding Hidden Agendas","Adjusting Bell Curves","Aesthesizing Industrial Areas","Aligning Covariance Matrices","Applying Feng Shui Shaders","Applying Theatre Soda Layer","Asserting Packed Exemplars","Attempting to Lock Back-Buffer","Binding Sapling Root System","Breeding Fauna","Building Data Trees","Bureacritizing Bureaucracies","Calculating Inverse Probability Matrices","Calculating Llama Expectoration Trajectory","Calibrating Blue Skies","Charging Ozone Layer","Coalescing Cloud Formations","Cohorting Exemplars","Collecting Meteor Particles","Compounding Inert Tessellations","Compressing Fish Files","Computing Optimal Bin Packing","Concatenating Sub-Contractors","Containing Existential Buffer","Debarking Ark Ramp","Debunching Unionized Commercial Services","Deciding What Message to Display Next","Decomposing Singular Values","Decrementing Tectonic Plates","Deleting Ferry Routes","Depixelating Inner Mountain Surface Back Faces","Depositing Slush Funds","Destabilizing Economic Indicators","Determining Width of Blast Fronts","Deunionizing Bulldozers","Dicing Models","Diluting Livestock Nutrition Variables","Downloading Satellite Terrain Data","Exposing Flash Variables to Streak System","Extracting Resources","Factoring Pay Scale","Fixing Election Outcome Matrix","Flood-Filling Ground Water","Flushing Pipe Network","Gathering Particle Sources","Generating Jobs","Gesticulating Mimes","Graphing Whale Migration","Hiding Willio Webnet Mask","Implementing Impeachment Routine","Increasing Accuracy of RCI Simulators","Increasing Magmafacation","Initializing Rhinoceros Breeding Timetable","Initializing Robotic Click-Path AI","Inserting Sublimated Messages","Integrating Curves","Integrating Illumination Form Factors","Integrating Population Graphs","Iterating Cellular Automata","Lecturing Errant Subsystems","Mixing Genetic Pool","Modeling Object Components","Mopping Occupant Leaks","Normalizing Power","Obfuscating Quigley Matrix","Overconstraining Dirty Industry Calculations","Partitioning City Grid Singularities","Perturbing Matrices","Pixellating Nude Patch","Polishing Water Highlights","Populating Lot Templates","Preparing Sprites for Random Walks","Prioritizing Landmarks","Projecting Law Enforcement Pastry Intake","Realigning Alternate Time Frames","Reconfiguring User Mental Processes","Relaxing Splines","Removing Road Network Speed Bumps","Removing Texture Gradients","Removing Vehicle Avoidance Behavior","Resolving GUID Conflict","Reticulating Splines","Retracting Phong Shader","Retrieving from Back Store","Reverse Engineering Image Consultant","Routing Neural Network Infanstructure","Scattering Rhino Food Sources","Scrubbing Terrain","Searching for Llamas","Seeding Architecture Simulation Parameters","Sequencing Particles","Setting Advisor ","Setting Inner Deity ","Setting Universal Physical Constants","Sonically Enhancing Occupant-Free Timber","Federalizing Flag Packages","Speculating Stock Market Indices","Splatting Transforms","Stratifying Ground Layers","Sub-Sampling Water Data","Synthesizing Gravity","Synthesizing Wavelets","Time-Compressing Simulator Clock","Unable to Reveal Current Activity","Weathering Buildings","Zeroing Crime Network"];

//NATO army presets
OT_NATO_GroundForces = [];

//Default Loadouts
OT_CRIMBaseLoadout = [
	["arifle_MX_khk_F","","","optic_Aco",["30Rnd_65x39_caseless_khaki_mag",30],[],""],
	[],
	["hgun_P07_khk_F","","","",["16Rnd_9x21_Mag",17],[],""],
	["U_I_C_Soldier_Para_4_F",[["ACE_morphine",1],["ACE_epinephrine",1],["ACE_fieldDressing",2]]],
	["V_PlateCarrier1_tna_F",[]],
	[],
	"",
	"",
	[],
	["ItemMap","","","","",""]
];

OT_Unit_Police = "I_soldier_F";
OT_Loadout_Police = [
	[],
	[],
	["hgun_P07_khk_F","","","",["16Rnd_9x21_Mag",17],[],""],
	["U_BG_Guerilla2_3",[]],
	["V_TacVest_blk_POLICE",[["16Rnd_9x21_Mag",4,17]]],
	[],
	"H_Cap_police",
	"",
	[],
	["","","","","",""]
];

//Default recruit types and squads
OT_Recruitables = [
    //Rifleman
	["I_soldier_F",[
        ["arifle_MX_khk_F","","","optic_Aco",["30Rnd_65x39_caseless_khaki_mag",30],[],""],
        [],
        ["hgun_P07_khk_F","","","",["16Rnd_9x21_Mag",17],[],""],
        ["U_I_C_Soldier_Para_4_F",[["ACE_morphine",1],["ACE_epinephrine",1],["ACE_fieldDressing",2]]],
        ["V_PlateCarrier1_tna_F",[["16Rnd_9x21_Mag",2,17],["MiniGrenade",2,1],["30Rnd_65x39_caseless_khaki_mag",6,30]]],
        [],
        "H_HelmetB_tna_F",
        "",
        [],
        ["ItemMap","","","","","NVGoggles_tna_F"]]
    ],
    //Autorifleman
	["I_Soldier_AR_F",[
        ["arifle_MX_SW_khk_F","","","optic_Aco",["100Rnd_65x39_caseless_khaki_mag",100],[],"bipod_01_F_khk"],
        [],
        ["hgun_P07_khk_F","","","",["16Rnd_9x21_Mag",17],[],""],
        ["U_I_C_Soldier_Para_4_F",[["ACE_morphine",1],["ACE_epinephrine",1],["ACE_fieldDressing",2],["ACE_EarPlugs",1]]],
        ["V_PlateCarrier2_tna_F",[["16Rnd_9x21_Mag",2,17],["MiniGrenade",2,1],["100Rnd_65x39_caseless_khaki_mag",5,100]]],
        [],
        "H_HelmetB_Light_tna_F",
        "",
        [],
        ["ItemMap","","","","","NVGoggles_tna_F"]]
    ],
    //Rifleman (AT)
	["I_Soldier_LAT_F",[
        ["arifle_MX_khk_F","","","optic_Aco",["30Rnd_65x39_caseless_khaki_mag",30],[],""],
        ["launch_RPG7_F","","","",["RPG7_F",1],[],""],
        ["hgun_P07_khk_F","","","",["16Rnd_9x21_Mag",17],[],""],
        ["U_I_C_Soldier_Para_4_F",[["ACE_morphine",1],["ACE_epinephrine",1],["ACE_fieldDressing",2],["ACE_EarPlugs",1]]],
        ["V_PlateCarrier1_tna_F",[["16Rnd_9x21_Mag",2,17],["MiniGrenade",2,1],["30Rnd_65x39_caseless_khaki_mag",6,30]]],
        ["B_FieldPack_oli",[["RPG7_F",4,1]]],
        "H_HelmetB_Light_tna_F","",
        [],
        ["ItemMap","","","","","NVGoggles_tna_F"]]
    ],
    //Marksman
	["I_Soldier_M_F",[
        ["arifle_MXM_khk_F","","","optic_sos_khk_f",["30Rnd_65x39_caseless_khaki_mag",30],[],"bipod_01_F_khk"],
        [],
        ["hgun_P07_khk_F","","","",["16Rnd_9x21_Mag",17],[],""],
        ["U_I_C_Soldier_Para_4_F",[["ACE_morphine",1],["ACE_epinephrine",1],["ACE_fieldDressing",2]]],
        ["V_PlateCarrier1_tna_F",[["16Rnd_9x21_Mag",2,17],["MiniGrenade",2,1],["30Rnd_65x39_caseless_khaki_mag",6,30]]],
        [],
        "H_HelmetB_tna_F","",
        [],
        ["ItemMap","","","","","NVGoggles_tna_F"]]
    ],
    //Sniper
	["I_Sniper_F",[
        ["srifle_LRR_tna_F","","","optic_LRPS_tna_f",["7Rnd_408_Mag",7],[],""],
        [],
        ["hgun_P07_khk_F","","","",["16Rnd_9x21_Mag",17],[],""],
        ["U_I_C_Soldier_Para_4_F",[["ACE_morphine",1],["ACE_epinephrine",1],["ACE_fieldDressing",2]]],
        ["V_PlateCarrier1_tna_F",[["16Rnd_9x21_Mag",2,17],["7Rnd_408_Mag",8,7]]],
        [],
        "H_HelmetB_tna_F","",
        [],
        ["ItemMap","","","","","NVGoggles_tna_F"]]
    ],
    //Spotter
	["I_Spotter_F",[
        ["arifle_MX_khk_F","","","optic_Aco",["30Rnd_65x39_caseless_khaki_mag",30],[],""],
        [],
        ["hgun_P07_khk_F","","","",["16Rnd_9x21_Mag",17],[],""],
        ["U_I_C_Soldier_Para_4_F",[["ACE_morphine",1],["ACE_epinephrine",1],["ACE_fieldDressing",2]]],
        ["V_PlateCarrier1_tna_F",[["16Rnd_9x21_Mag",2,17],["MiniGrenade",2,1],["30Rnd_65x39_caseless_khaki_mag",6,30]]],
        [],
        "H_HelmetB_tna_F",
        "",
        ["Binocular","","","",[],[],""],
        ["ItemMap","","","","","NVGoggles_tna_F"]]
    ],
    //Squad Leader
	["I_Soldier_SL_F",[
        ["arifle_MX_khk_F","","","optic_Aco",["30Rnd_65x39_caseless_khaki_mag",30],[],""],
        [],
        ["hgun_P07_khk_F","","","",["16Rnd_9x21_Mag",17],[],""],
        ["U_I_C_Soldier_Para_4_F",[["ACE_morphine",1],["ACE_epinephrine",1],["ACE_fieldDressing",2]]],
        ["V_PlateCarrier1_tna_F",[["16Rnd_9x21_Mag",2,17],["MiniGrenade",2,1],["30Rnd_65x39_caseless_khaki_mag",6,30]]],
        [],
        "H_HelmetB_tna_F",
        "",
        ["Binocular","","","",[],[],""],
        ["ItemMap","","","","","NVGoggles_tna_F"]]
    ],
    //Medic
	["I_Medic_F",[
        ["arifle_MX_khk_F","","","optic_Aco",["30Rnd_65x39_caseless_khaki_mag",30],[],""],
        [],
        ["hgun_P07_khk_F","","","",["16Rnd_9x21_Mag",17],[],""],
        ["U_I_C_Soldier_Para_4_F",[]],
        ["V_PlateCarrier1_tna_F",[["16Rnd_9x21_Mag",2,17],["MiniGrenade",2,1],["30Rnd_65x39_caseless_khaki_mag",6,30]]],
        ["B_FieldPack_oli",[["ACE_morphine",10],["ACE_epinephrine",10],["ACE_fieldDressing",20]]],
        "H_HelmetB_tna_F",
        "",
        [],
        ["ItemMap","","","","","NVGoggles_tna_F"]]
    ],
    //AT
	["I_Soldier_AT_F",[
        ["arifle_MX_khk_F","","","optic_Aco",["30Rnd_65x39_caseless_khaki_mag",30],[],""],
        ["launch_B_Titan_short_tna_F","","","",["Titan_AT",1],[],""],
        ["hgun_P07_khk_F","","","",["16Rnd_9x21_Mag",17],[],""],
        ["U_I_C_Soldier_Para_4_F",[["ACE_morphine",1],["ACE_epinephrine",1],["ACE_fieldDressing",2],["ACE_EarPlugs",1]]],
        ["V_PlateCarrier1_tna_F",[["16Rnd_9x21_Mag",2,17],["MiniGrenade",2,1],["30Rnd_65x39_caseless_khaki_mag",6,30]]],
        ["B_FieldPack_oli",[["Titan_AT",2,1]]],
        "H_HelmetB_Light_tna_F","",
        [],
        ["ItemMap","","","","","NVGoggles_tnaF"]]
    ],
    //AA
	["I_Soldier_AA_F",[
        ["arifle_MX_khk_F","","","optic_Aco",["30Rnd_65x39_caseless_khaki_mag",30],[],""],
        ["launch_B_Titan_tna_F","","","",["Titan_AA",1],[],""],
        ["hgun_P07_khk_F","","","",["16Rnd_9x21_Mag",17],[],""],
        ["U_I_C_Soldier_Para_4_F",[["ACE_morphine",1],["ACE_epinephrine",1],["ACE_fieldDressing",2],["ACE_EarPlugs",1]]],
        ["V_PlateCarrier1_tna_F",[["16Rnd_9x21_Mag",2,17],["MiniGrenade",2,1],["30Rnd_65x39_caseless_khaki_mag",6,30]]],
        ["B_FieldPack_oli",[["Titan_AA",2,1]]],
        "H_HelmetB_Light_tna_F","",
        [],
        ["ItemMap","","","","","NVGoggles_tnaF"]]
    ],
    //Assistant AT
	["I_Soldier_AAT_F",[
        ["arifle_MX_khk_F","","","optic_Aco",["30Rnd_65x39_caseless_khaki_mag",30],[],""],
        [],
        ["hgun_P07_khk_F","","","",["16Rnd_9x21_Mag",17],[],""],
        ["U_I_C_Soldier_Para_4_F",[["ACE_morphine",1],["ACE_epinephrine",1],["ACE_fieldDressing",2],["ACE_EarPlugs",1]]],
        ["V_PlateCarrier1_tna_F",[["16Rnd_9x21_Mag",2,17],["MiniGrenade",2,1],["30Rnd_65x39_caseless_khaki_mag",6,30]]],
        ["B_Carryall_oli",[["Titan_AT",3,1]]],
        "H_HelmetB_Light_tna_F",
        "",
        [],
        ["ItemMap","","","","","NVGoggles_tna_F"]]
    ],
    //Assistant AA
	["I_Soldier_AAA_F",[
        ["arifle_MX_khk_F","","","optic_Aco",["30Rnd_65x39_caseless_khaki_mag",30],[],""],
        [],
        ["hgun_P07_khk_F","","","",["16Rnd_9x21_Mag",17],[],""],
        ["U_I_C_Soldier_Para_4_F",[["ACE_morphine",1],["ACE_epinephrine",1],["ACE_fieldDressing",2],["ACE_EarPlugs",1]]],
        ["V_PlateCarrier1_tna_F",[["16Rnd_9x21_Mag",2,17],["MiniGrenade",2,1],["30Rnd_65x39_caseless_khaki_mag",6,30]]],
        ["B_Carryall_oli",[["Titan_AA",3,1]]],
        "H_HelmetB_Light_tna_F",
        "",
        [],
        ["ItemMap","","","","","NVGoggles_tna_F"]]
    ],
    //Grenadier
	["I_Soldier_GL_F",[
        ["arifle_MX_GL_khk_F","","","optic_Aco",["30Rnd_65x39_caseless_khaki_mag",30],["1Rnd_HE_Grenade_shell",1],""],
        [],
        ["hgun_P07_khk_F","","","",["16Rnd_9x21_Mag",17],[],""],
        ["U_I_C_Soldier_Para_4_F",[["ACE_morphine",1],["ACE_epinephrine",1],["ACE_fieldDressing",2],["ACE_EarPlugs",1]]],
        ["V_PlateCarrier1_tna_F",[["HandGrenade",4,1],["MiniGrenade",4,1],["16Rnd_9x21_Mag",2,17],["30Rnd_65x39_caseless_khaki_mag",6,30]]],
        ["B_Kitbag_sgg",[["1Rnd_HE_Grenade_shell",20,1],["1Rnd_SmokeBlue_Grenade_shell",3,1],["1Rnd_SmokeGreen_Grenade_shell",3,1],["1Rnd_SmokeOrange_Grenade_shell",3,1],["1Rnd_Smoke_Grenade_shell",3,1]]],
        "H_HelmetB_Light_tna_F","",
        [],
        ["ItemMap","","","","","NVGoggles_tna_F"]]
    ]
];

//Mission independent vars
OT_AllMapFac = [];
OT_allVehicles = [];
OT_vehWeights_civ = [];
OT_mostExpensiveVehicle = "";
OT_allHeliThreats = [];
OT_allPlaneThreats = [];
OT_allVehicleThreats = [];
OT_luxCars = ["C_SUV_01_F","C_Hatchback_01_sport_F"];

OT_spawnHouses = [];
{
	private _cls = configName _x;
	OT_spawnHouses pushBack _cls;
	OT_allBuyableBuildings pushBackUnique _cls;
	OT_allRealEstate pushBackUnique _cls;
}foreach( "getNumber ( _x >> ""ot_isPlayerHouse"" ) isEqualTo 1" configClasses ( configFile >> "CfgVehicles" ) );

//Mission house overrides
{
	_x params ["_cls","_template"];
	OT_spawnHouses pushBack _cls;
	OT_allBuyableBuildings pushBackUnique _cls;
	OT_allRealEstate pushBackUnique _cls;
	templates setVariable [_cls,_template,true];
}foreach(OT_spawnHouseBuildings);

OT_Squadables = [
	["Sentry",["I_Soldier_SL_F","I_soldier_F"],"SEN"],
	["Sniper Squad",["I_Sniper_F","I_Spotter_F"],"SNI"],
	["Light AT Squad",["I_Soldier_SL_F","I_Soldier_LAT_F","I_Soldier_GL_F","I_Medic_F"],"LAT"],
	["AT Squad",["I_Soldier_SL_F","I_Soldier_AT_F","I_Soldier_AAT_F","I_Medic_F"],"AT"],
	["AA Squad",["I_Soldier_SL_F","I_Soldier_AA_F","I_Soldier_AAA_F","I_Medic_F"],"AA"],
	["Fire Team",["I_Soldier_SL_F","I_soldier_F","I_Soldier_AR_F","I_Soldier_LAT_F","I_Soldier_M_F","I_Medic_F"],"FIR"],
	["Infantry Team",["I_Soldier_SL_F","I_soldier_F","I_Soldier_AR_F","I_Soldier_LAT_F","I_Soldier_M_F","I_Medic_F","I_Soldier_AT_F","I_Soldier_AA_F"],"INF"]
];

OT_allSquads = OT_Squadables apply { _x params ["_name"]; _name };

OT_workshop = [
	["Static MG","C_Offroad_01_F",20000,"I_HMG_01_high_weapon_F","I_HMG_01_high_F",[[0.25,-2,1]],0],
	["Static GL","C_Offroad_01_F",30000,"I_GMG_01_high_weapon_F","I_GMG_01_high_F",[[0.25,-2,1]],0],
	["Static AT","C_Offroad_01_F",80000,"I_AT_01_weapon_F","I_static_AT_F",[[0,-1.5,0.25],180]],
	["Static AA","C_Offroad_01_F",80000,"I_AA_01_weapon_F","I_static_AA_F",[[0,-1.5,0.25],180]],
	["Mounted HMG","RHS_Ural_Open_Civ_01",20000,"I_HMG_01_high_weapon_F","I_HMG_01_high_F",[[0.224,-1.887,1.5]],0],
	["Mounted HMG","RHS_Ural_Open_Civ_02",20000,"I_HMG_01_high_weapon_F","I_HMG_01_high_F",[[0.224,-1.887,1.5]],0],
	["Mounted HMG","RHS_Ural_Open_Civ_03",20000,"I_HMG_01_high_weapon_F","I_HMG_01_high_F",[[0.224,-1.887,1.5]],0],
	["Mounted GMG","RHS_Ural_Open_Civ_01",30000,"I_GMG_01_high_weapon_F","I_GMG_01_high_F",[[0.224,-1.887,1.5]],0],
	["Mounted GMG","RHS_Ural_Open_Civ_02",30000,"I_GMG_01_high_weapon_F","I_GMG_01_high_F",[[0.224,-1.887,1.5]],0],
	["Mounted GMG","RHS_Ural_Open_Civ_03",30000,"I_GMG_01_high_weapon_F","I_GMG_01_high_F",[[0.224,-1.887,1.5]],0],
	["Mounted Mortar","RHS_Ural_Open_Civ_01",150000,"I_Mortar_01_weapon_F","I_Mortar_01_F",[[-0.064,-1.854,0.5]],0],
	["Mounted Mortar","RHS_Ural_Open_Civ_02",150000,"I_Mortar_01_weapon_F","I_Mortar_01_F",[[-0.064,-1.854,0.5]],0],
	["Mounted Mortar","RHS_Ural_Open_Civ_03",150000,"I_Mortar_01_weapon_F","I_Mortar_01_F",[[-0.064,-1.854,0.5]],0]
];

OT_repairableRuins = [
	["Land_Cargo_Tower_V4_ruins_F","Land_Cargo_Tower_V4_F",2000],
	["Land_Cargo_Tower_V1_ruins_F","Land_Cargo_Tower_V1_F",2000],
	["Land_Cargo_Tower_V2_ruins_F","Land_Cargo_Tower_V2_F",2000],
	["Land_Cargo_Tower_V3_ruins_F","Land_Cargo_Tower_V3_F",2000],
	["Land_Cargo_Patrol_V1_ruins_F","Land_Cargo_Patrol_V1_F",500],
	["Land_Cargo_Patrol_V2_ruins_F","Land_Cargo_Patrol_V2_F",500],
	["Land_Cargo_Patrol_V3_ruins_F","Land_Cargo_Patrol_V3_F",500],
	["Land_Cargo_Patrol_V4_ruins_F","Land_Cargo_Patrol_V4_F",500],
	["Land_Cargo_HQ_V1_ruins_F","Land_Cargo_HQ_V1_F",2500],
	["Land_Cargo_HQ_V2_ruins_F","Land_Cargo_HQ_V2_F",2500],
	["Land_Cargo_HQ_V3_ruins_F","Land_Cargo_HQ_V3_F",2500],
	["Land_Cargo_HQ_V4_ruins_F","Land_Cargo_HQ_V4_F",2500]
];

OT_allRepairableRuins = [];
{
	_x params ["_ruin"];
	OT_allRepairableRuins pushback _ruin;
}foreach(OT_repairableRuins);

OT_staticMachineGuns = ["I_HMG_01_F","I_HMG_01_high_F","I_HMG_01_A_F","O_HMG_01_F","O_HMG_01_high_F","O_HMG_01_A_F","B_HMG_01_F","B_HMG_01_high_F","B_HMG_01_A_F"];
OT_staticWeapons = ["I_Mortar_01_F","I_static_AA_F","I_static_AT_F","I_GMG_01_F","I_GMG_01_high_F","I_GMG_01_A_F","I_HMG_01_F","I_HMG_01_high_F","I_HMG_01_A_F","O_static_AA_F","O_static_AT_F","O_Mortar_01_F","O_GMG_01_F","O_GMG_01_high_F","O_GMG_01_A_F","O_HMG_01_F","O_HMG_01_high_F","O_HMG_01_A_F","B_static_AA_F","B_static_AT_F","B_Mortar_01_F","B_GMG_01_F","B_GMG_01_high_F","B_GMG_01_A_F","B_HMG_01_F","B_HMG_01_high_F","B_HMG_01_A_F","RHS_M2StaticMG_USMC_D","RHS_Stinger_AA_pod_USMC_D","RHS_TOW_TriPod_USMC_D","RHS_MK19_TriPod_USMC_D"];

OT_miscables = ["ACE_Wheel","ACE_Track","Land_CanisterFuel_Red_F","Land_Workbench_01_F","Land_PortableLight_double_F","Land_PortableLight_single_F","Land_Camping_Light_F","Land_PortableHelipadLight_01_F","PortableHelipadLight_01_blue_F",
"PortableHelipadLight_01_green_F","PortableHelipadLight_01_red_F","PortableHelipadLight_01_white_F","PortableHelipadLight_01_yellow_F","Land_Campfire_F","Land_PortableLight_02_single_yellow_F","Land_PortableLight_02_double_yellow_F",
"Land_PortableLight_02_quad_yellow_F","Land_PowerPoleWooden_L_F","RoadBarrier_F","RoadBarrier_small_F","RoadCone_F","RoadCone_L_F","Land_Sleeping_bag_F","Land_Sleeping_bag_blue_F"];

//Stuff you can build: [name,price,array of possible classnames or single composition of objects,init function,if using composition,description]
OT_Buildables = [
	["Training Camp",60000,[
		["Land_IRMaskingCover_02_F",[-0.039865,0.14918,0],0,1,0,[],"","",true,false],
		["Box_NATO_Grenades_F",[1.23933,-1.05774,0],93.4866,1,0,[],"","",true,false],
		["Land_CampingTable_F",[-0.0490456,-1.74478,0],0,1,0,[],"","",true,false],
		["Land_CampingChair_V2_F",[-1.44146,-1.7173,0],223.485,1,0,[],"","",true,false],
		["Land_ClutterCutter_large_F",[0,0,0],0,1,0,[],"","",true,false]
	],"OT_fnc_initTrainingCamp",true,"Allows training of recruits && hiring of people with military experience"],
	["Bunkers",25000,["Land_BagBunker_Tower_F","Land_BagBunker_Small_F","Land_HBarrierTower_F","Land_Bunker_01_blocks_3_F","Land_Bunker_01_blocks_1_f","Land_Bunker_01_big_F","Land_Bunker_01_small_F","Land_Bunker_01_tall_F","Land_Bunker_01_HQ_F","Land_BagBunker_01_small_green_F","Land_HBarrier_01_big_tower_green_F","Land_HBarrier_01_tower_green_F"],"",false,"Small Defensive Structures. CONTAINS TEST OBJECTS. Press space to change type."],
	["Walls",500,["Land_ConcreteWall_01_l_8m_F","Land_ConcreteWall_01_l_gate_F","Land_HBarrier_01_wall_6_green_F","Land_HBarrier_01_wall_4_green_F","Land_HBarrier_01_wall_corner_green_F"],"",false,"Stop people (or tanks) from getting in. Press space to change type."],
	["Helipad",1000,["Land_HelipadCircle_F","Land_HelipadCivil_F","Land_HelipadRescue_F","Land_HelipadSquare_F"],"",false,"Informs helicopter pilots of where might be a nice place to land"],
	["Observation Post",10000,["Land_Cargo_Patrol_V4_F","Land_Cargo_Patrol_V3_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V1_F"],"",false,"A small prefab tower, can garrison a static HMG/GMG in it"],
	["Barracks",80000,[OT_barracks],"",false,"Allows recruiting of squads"],
	["Guard Tower",30000,["Land_Cargo_Tower_V4_F","Land_Cargo_Tower_V3_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V1_F"],"",false,"A larger prefab tower."],
	["Hangar",120000,["Land_Airport_01_hangar_F"],"",false,"A big empty building, could probably fit a plane inside it or alot of cars."],
	["Workshop",15000,[OT_workshopBuilding
	/*
		["Land_Cargo_House_V4_F",[0,0,0],0,1,0,[],"","",true,false],
		["Land_ClutterCutter_large_F",[0,0,0],0,1,0,[],"","",true,false],
		["Box_NATO_AmmoVeh_F",[-2.91,-2.008,0],90,1,0,[],"","",true,false],
		["Land_WeldingTrolley_01_F",[-3.53163,1.73366,0],87.0816,1,0,[],"","",true,false],
		["Land_ToolTrolley_02_F",[-3.47775,3.5155,0],331.186,1,0,[],"","",true,false]
		["Land_ToolTrolley_02_F",[-0.943165,0.888457,-1.90735e-006],184.978,1,0,[-0.000586218,0.000940886],"","",true,false],
		["Land_WeldingTrolley_01_F",[-2.5792,-1.39631,-4.76837e-007],292.933,1,0,[-0.000260068,1.87621e-005],"","",true,false],
		["Land_cargo_house_slum_F",[-5.28708,1.71423,0],0,1,0,[0,0],"","",true,false],
		["Box_NATO_AmmoVeh_F",[-6.28864,-2.78878,0.0305414],9.03579e-005,1,0,[1.25353e-005,-6.98109e-006],"","",true,false]
	*/
	],"OT_fnc_initWorkshop",false,"Attach weapons to vehicles"],
	["House",25000,["Land_House_Small_06_F","Land_House_Small_02_F","Land_House_Small_03_F","Land_GarageShelter_01_F","Land_Slum_04_F"],"OT_fnc_initHouse",false,"4 walls, a roof, and if you're lucky a door that opens."],
	["Police Station",25000,[OT_policeStation],"OT_fnc_initPoliceStation",false,"Allows hiring of policeman to raise stability in a town and keep the peace. Comes with 2 units."],
	["Jammer",75000,[OT_Jammer],"OT_fnc_initJammer",false,"Automatically destroys any NATO recon drones that come within 250m of the device."],
	["Warehouse",50000,[OT_warehouse],"OT_fnc_initWarehouse",false,"Infinite trans-dimensional magic space storage."],
	["Refugee Camp",10000,[OT_refugeeCamp],"",false,"Can recruit civilians here, without needing to chase them down, for an added fee."],
	["Radar",75000,[OT_radarBuilding],"OT_fnc_initRadar",false,"Reveals enemy drones, helicopters and planes within 2.5km"]
];

OT_allBuyableBuildings = [];
{
	private _istpl = _x select 4;
	if(_istpl) then {
		private _tpl = _x select 2;
		OT_allBuyableBuildings pushback ((_tpl select 0) select 0);
	}else{
		[OT_allBuyableBuildings,(_x select 2)] call BIS_fnc_arrayPushStack;
	}
}foreach(OT_Buildables);

//Items you can place
OT_Placeables = [
	["Sandbags",50,["Land_SandbagBarricade_01_F","Land_SandbagBarricade_01_hole_F","Land_SandbagBarricade_01_half_F","Land_BagFence_Short_F","Land_BagFence_Round_F","Land_BagFence_Long_F","Land_BagFence_End_F","Land_BagFence_Corner_F","Land_BagFence_01_long_green_F","Land_BagFence_01_short_green_F","Land_BagFence_01_round_green_F","Land_BagFence_01_corner_green_F","Land_BagFence_01_end_green_F"],[0,3,0.8],"Bags filled with lots of sand. Apparently this can stop bullets or something?"],
	["Camo Nets",500,["CamoNet_INDP_open_F","CamoNet_INDP_F","CamoNet_ghex_F","CamoNet_ghex_open_F","CamoNet_ghex_big_F"],[0,7,2],"Large and terribly flimsy structures that may or may not obscure your forces from airborne units."],
	["Barriers",200,["Land_HBarrier_1_F","Land_HBarrier_3_F","Land_HBarrier_5_F","Land_HBarrier_Big_F","Land_HBarrierWall_corner_F","Land_HBarrier_01_line_5_green_F","Land_HBarrier_01_line_3_green_F","Land_HBarrier_01_line_1_green_F"],[0,4,1.2],"Really big sandbags, basically."],
	["Map",100,[OT_item_Map],[0,2,1.2],"Use these to save your game, change options or check town info."],
	["Safe",100,[OT_item_Safe],[0,2,0.5],"Store and retrieve money"],
	["Misc",25,OT_miscables,[0,3,1.2],"Various other items including spare wheels and lights"]
];

//Gangnames
call compile preprocessFileLineNumbers "\overthrow_main\data\gangnames.sqf";

OT_items = [];
OT_allItems = [];
OT_craftableItems = [];

//[] call OT_fnc_detectItems;