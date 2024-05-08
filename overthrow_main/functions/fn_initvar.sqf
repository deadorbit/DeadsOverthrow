//VCOM AI, huge credits to Genesis, without VCOM this campaign would be so much less

OT_ACEremoveAction = [
	"OT_Remove",
	"Remove",
	"",
	{},
	{params ["_target"]; (call OT_fnc_playerIsGeneral) || (_target call OT_fnc_playerIsOwner)},
	{},
	[],
	[0,0,0],
	10
] call ace_interact_menu_fnc_createAction;
OT_ACEremoveActionConfirm = [
	"OT_Remove_Confirm",
	"Confirm",
	"",
	{params ["_target"]; deleteVehicle _target;},
	{true},
	{},
	[],
	[0,0,0],
	10
] call ace_interact_menu_fnc_createAction;

//Find markers
OT_ferryDestinations = [];
OT_NATO_control = [];
OT_regions = [];
{
	if((_x select [0,12]) isEqualTo "destination_") then {OT_ferryDestinations pushback _x};
	if((_x select [0,8]) isEqualTo "control_") then {OT_NATO_control pushback _x};
	if((_x select [0,7]) isEqualTo "island_") then {OT_regions pushback _x};
	if((_x select [0,7]) isEqualTo "region_") then {OT_regions pushback _x};
}foreach(allMapMarkers);

OT_missions = [];
OT_localMissions = [];
{
	_name = configName _x;
	_script = getText (_x >> "script");
	_code = compileFinal preprocessFileLineNumbers _script;
	OT_missions pushback _code;
}foreach("true" configClasses ( configFile >> "CfgOverthrowMissions" ));

OT_tutorialMissions = [];
OT_tutorialMissions pushback (compileFinal preprocessFileLineNumbers "\overthrow_main\missions\tutorial\tut_NATO.sqf");
//OT_tutorialMissions pushback (compileFinal preprocessFileLineNumbers "\overthrow_main\missions\tutorial\tut_CRIM.sqf");
OT_tutorialMissions pushback (compileFinal preprocessFileLineNumbers "\overthrow_main\missions\tutorial\tut_Drugs.sqf");
OT_tutorialMissions pushback (compileFinal preprocessFileLineNumbers "\overthrow_main\missions\tutorial\tut_Economy.sqf");

OT_NATO_HQ_garrisonPos = [];
OT_NATO_HQ_garrisonDir = 0;

OT_QRFstart = nil;

// Load mission data
call compile preprocessFileLineNumbers "data\names.sqf";
call compile preprocessFileLineNumbers "data\towns.sqf";
call compile preprocessFileLineNumbers "data\airports.sqf";
call compile preprocessFileLineNumbers "data\objectives.sqf";
call compile preprocessFileLineNumbers "data\economy.sqf";
call compile preprocessFileLineNumbers "data\comms.sqf";

//Identity
OT_faces_local = [];
OT_faces_western = [];
OT_faces_eastern = [];
{
    private _types = getArray(_x >> "identityTypes");
	if(OT_identity_local in _types) then {OT_faces_local pushback configName _x};
	if(OT_identity_western in _types) then {OT_faces_western pushback configName _x};
	if(OT_identity_eastern in _types) then {OT_faces_eastern pushback configName _x};
}foreach("getNumber(_x >> 'disabled') isEqualTo 0" configClasses (configfile >> "CfgFaces" >> "Man_A3"));

OT_voices_local = [];
OT_voices_western = [];
OT_voices_eastern = [];
{
    private _types = getArray(_x >> "identityTypes");
	if(OT_language_local in _types) then {OT_voices_local pushback configName _x};
	if(OT_language_western in _types) then {OT_voices_western pushback configName _x};
	if(OT_language_eastern in _types) then {OT_voices_eastern pushback configName _x};
}foreach("getNumber(_x >> 'scope') isEqualTo 2" configClasses (configfile >> "CfgVoice"));

//For a certain definition of 'house'
OT_hugePopHouses = ["Land_WIP_F","Land_MultistoryBuilding_01_F","Land_MultistoryBuilding_03_F","Land_MultistoryBuilding_04_F","Land_House_2W04_F","Land_House_2W03_F","Land_Offices_01_V1_F"]; //buildings with potentially lots of people living in them

OT_mansions = ["Land_House_Big_02_F","Land_House_Big_03_F","Land_Hotel_01_F","Land_Hotel_02_F","Land_Hospital_main_F","Land_GH_MainBuilding_middle_F"]; //buildings that rich guys like to live in

OT_lowPopHouses = [ 
	"Land_i_Stone_HouseSmall_V1_F","Land_i_Stone_HouseSmall_V3_F","Land_u_Shop_01_V1_F","Land_Shed_09_F","Land_Shed_10_F","Land_Shed_12_F","Land_Shed_13_F","Land_Shed_14_F","Land_GarageShelter_01_F","Land_Slum_01_F","Land_Slum_02_F","Land_Slum_03_F", "Land_Shed_02_F","Land_Shed_05_F","Land_House_Native_02_F","Land_u_House_Small_01_V1_F","Land_u_House_Small_02_V1_F",
	"Land_i_House_Small_02_V3_F","Land_i_House_Small_02_V1_F","Land_i_House_Small_02_V2_F","Land_i_Addon_02_V1_F","Land_u_Addon_02_V1_F","Land_i_Stone_Shed_V2_F","Land_i_Stone_Shed_V1_F","Land_i_Stone_Shed_V3_F","Land_Shed_08_brown_F","Land_Shed_08_grey_F","Land_i_Stone_Shed_01_b_clay_F","Land_i_Stone_Shed_01_b_raw_F","Land_i_Stone_Shed_01_b_white_F","Land_i_Stone_Shed_01_c_clay_F",
	"Land_i_Stone_Shed_01_c_raw_F","Land_i_Stone_Shed_01_c_white_F","Land_i_House_Small_02_b_blue_F","Land_i_House_Small_02_b_pink_F","Land_i_House_Small_02_b_whiteblue_F","Land_i_House_Small_02_b_white_F","Land_i_House_Small_02_b_brown_F","Land_i_House_Small_02_b_yellow_F","Land_i_House_Small_02_c_blue_F","Land_i_House_Small_02_c_pink_F","Land_i_House_Small_02_c_whiteblue_F",
	"Land_i_House_Small_02_c_white_F","Land_i_House_Small_02_c_brown_F","Land_i_House_Small_02_c_yellow_F","Land_i_Addon_02_b_white_F","Land_Slum_House02_F","Land_House_K_1_EP1_lxWS","Land_House_L_3_EP1_lxWS","Land_House_L_1_EP1_lxWS"
];
OT_medPopHouses = [
	"Land_i_House_Small_01_V2_F","Land_i_House_Small_01_V3_F","Land_Unfinished_Building_01_F","Land_i_Shop_01_V1_F","Land_i_Shop_01_V3_F","Land_i_Shop_01_V2_F","Land_i_House_Small_01_b_blue_F","Land_i_House_Small_01_b_pink_F","Land_i_House_Small_01_b_whiteblue_F","Land_i_House_Small_01_b_white_F","Land_i_House_Small_01_b_brown_F","Land_i_House_Small_01_b_yellow_F",
	"Land_i_Stone_House_Big_01_b_clay_F","Land_i_Stone_HouseBig_V3_F","Land_i_Stone_HouseBig_V1_F","Land_i_Stone_HouseBig_V2_F","Land_i_Stone_HouseSmall_V2_F","Land_i_House_Small_03_V1_F","Land_u_House_Big_02_V1_F","Land_u_House_Big_01_V1_F","Land_House_Small_01_F","Land_House_Small_06_F","Land_House_Small_03_F","Land_House_Small_02_F","Land_School_01_F","Land_Barn_03_large_F",
	"Land_Barn_03_small_F","Land_House_2W01_F","Land_House_2W02_F","Land_House_2W03_F","Land_House_2W04_F","Land_House_2W05_F","Land_House_1B01_F","Land_House_1W01_F","Land_House_1W02_F","Land_House_1W03_F","Land_House_1W04_F","Land_House_1W05_F","Land_House_1W06_F","Land_House_1W07_F","Land_House_1W08_F","Land_House_1W09_F","Land_House_1W10_F","Land_House_1W11_F","Land_House_1W12_F","Land_House_1W13_F",
	"Land_i_House_Small_01_V1_F","Land_u_Shop_02_V1_F","Land_House_C_5_EP1_off_lxWS","Land_House_K_3_EP1_lxWS","Land_House_L_8_EP1_lxWS"
];

OT_highPopHouses = [
	"Land_Unfinished_Building_02_F","Land_i_House_Big_02_b_blue_F","Land_i_House_Big_02_b_pink_F","Land_i_House_Big_02_b_whiteblue_F","Land_i_House_Big_02_b_white_F","Land_i_House_Big_02_b_brown_F","Land_i_House_Big_02_b_yellow_F","Land_i_House_Big_01_b_blue_F",
	"Land_i_House_Big_01_b_pink_F","Land_i_House_Big_01_b_whiteblue_F","Land_i_House_Big_01_b_white_F","Land_i_House_Big_01_b_brown_F","Land_i_House_Big_01_b_yellow_F","Land_i_House_Big_02_V3_F","Land_i_House_Big_02_V1_F","Land_i_House_Big_02_V2_F","Land_i_House_Big_01_V3_F","Land_i_House_Big_01_V1_F",
	"Land_i_House_Big_01_V2_F","Land_House_Big_01_F","Land_House_Native_01_F","Land_House_2B01_F","Land_House_2B02_F","Land_House_2B03_F","Land_House_2B04_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_b_brown_F","Land_i_Shop_02_b_yellow_F","Land_i_Shop_02_b_white_F","Land_i_Shop_02_b_whiteblue_F","Land_i_Shop_02_b_pink_F",
	"Land_i_Shop_02_b_blue_F","Land_Supermarket_01_malden_F","Land_House_C_5_V3_EP1_off_lxWS","Land_House_C_5_V2_EP1_off_lxWS","Land_House_C_5_V1_EP1_off_lxWS","Land_House_C_11_EP1_off_lxWS","Land_House_L_7_EP1_lxWS"
];

/*{
    private _cost = getNumber(_x >> "cost");
    [_cost,configName _x] call {
		params ["_cost","_name"];
        if(_cost > 70000) then {OT_hugePopHouses pushbackunique _name;};
        if(_cost > 55000) then {OT_highPopHouses pushbackunique _name;};
        if(_cost > 25000) then {OT_medPopHouses pushbackunique _name;};
        OT_lowPopHouses pushbackunique _name;
    };
}foreach("(getNumber (_x >> 'scope') isEqualTo 2) && (configName _x isKindOf 'House') && (configName _x find '_House' > -1)" configClasses (configfile >> "CfgVehicles"));*/

OT_allBuyableBuildings = OT_lowPopHouses + OT_medPopHouses + OT_highPopHouses + OT_hugePopHouses + OT_mansions + [OT_item_Tent,OT_flag_IND];

OT_allHouses = OT_lowPopHouses + OT_medPopHouses + OT_highPopHouses + OT_hugePopHouses;
OT_allRealEstate = OT_lowPopHouses + OT_medPopHouses + OT_highPopHouses + OT_hugePopHouses + OT_mansions + [OT_warehouse,OT_policeStation,OT_barracks,OT_barracks,OT_workshopBuilding,OT_refugeeCamp,OT_trainingCamp];

OT_allTowns = [];
OT_allTownPositions = [];

{
	_x params ["_pos","_name"];
	OT_allTowns pushBack _name;
	OT_allTownPositions pushBack _pos;
	if(isServer) then {
		server setVariable [_name,_pos,true];
	};
}foreach(OT_townData);

OT_allAirports = OT_airportData apply { _x select 1 };

//Global overthrow variables related to any map

OT_currentMissionFaction = "";
OT_rankXP = [100,250,500,1000,4000,10000,100000];

OT_adminMode = false;
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

private _pm = server getVariable ["OT_popModifier",0];
if(_pm == 1) then {OT_spawnCivPercentage = 0.05; OT_spawnCivCap = 40};
if(_pm == 2) then {OT_spawnCivPercentage = 0.10; OT_spawnCivCap = 60};

OT_spawnVehiclePercentage = 0.04;
OT_standardMarkup = 1.5; //Markup in shops is calculated from this

private _diff = server getVariable ["OT_difficulty",1];

OT_dealerMagFee = 2.5; //How much dealer rips off players * normal value for magazines
OT_dealerOpticFee = 1.25; //How much dealer rips off players * normal value for optics
OT_dealerUpcharge = 1.25; //How much dealer ADDITIONALLY charges the player for 'Convience'
OT_loseMoneyOnDeath = 0.1; // % of cash on player lost on death
OT_loseInfluenceOnDeath = 0.01;
OT_searchChance = 3;// x/100 chance of being searched with illegal items in inventory and near cop
OT_FTPrice = 250; // price per km to fast travel on foot

switch _diff do {
	case 0: {
		OT_dealerMagFee = 1.5;
		OT_dealerOpticFee = 1;
		OT_dealerUpcharge = 1.1;
		OT_standardMarkup = 1.25;
		OT_loseMoneyOnDeath = 0.05;
		OT_loseInfluenceOnDeath = 0.025;
		OT_searchChance = 1;
		OT_FTPrice = 100;
	};
	case 2: {
		OT_dealerMagFee = 4;
		OT_dealerOpticFee = 2;
		OT_dealerUpcharge = 1.5;
		OT_standardMarkup = 1.85;
		OT_loseMoneyOnDeath = 0.25;
		OT_loseInfluenceOnDeath = 0.05;
		OT_searchChance = 6;
		OT_FTPrice = 500;
	};
};

OT_randomSpawnTown = false; //if true, every player will start in a different town, if false, all players start in the same town (Multiplayer only)
OT_distroThreshold = 500; //Size a towns order must be before a truck is sent (in dollars)
OT_saving = false;
OT_activeShops = [];
OT_selling = false;
OT_taking = false;
OT_interactingWith = objNull;

// Weapon mags to delete or not copy on transfers.
OT_noCopyMags = ["ACE_PreloadedMissileDummy","rhs_mag_30Rnd_556x45_M200_Stanag","rhs_rpg18_mag","rhs_rpg26_mag","rhs_rshg2_mag","rhs_rpg75_mag","rhs_panzerfaust60_mag","rhs_m80_mag","NLAW_F","sp_fwa_1nd_m72a1_law_rocket","rhs_m136_mag","rhs_m136_hedp_mag","rhs_m136_hp_mag","rhs_m72a7_mag","rhs_mag_fold_stock","sp_fwa_1nd_m72a1_law_rocket","gm_1Rnd_70mm_he_m585_fim43","gm_1Rnd_66mm_heat_m72a3","gm_1Rnd_2650mm_potato_dm11","gm_1Rnd_64mm_heat_pg18","gm_1Rnd_72mm_he_9m32m","gm_2rnd_72mm_he_9m32m_gad_mi2_right","gm_2rnd_72mm_he_9m32m_gad_mi2_left","gm_2rnd_72mm_he_9m32m_gad"];


OT_garrisonBuildings = ["Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F","Land_Cargo_Patrol_V4_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F","Land_Cargo_HQ_V4_F","Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V3_F","Land_Cargo_Tower_V4_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F", "Land_Cargo_Tower_V3_F"]; //Put HMGs in these buildings

OT_ammo_50cal = "OT_ammo50cal";

OT_item_wrecks = ["Land_Wreck_HMMWV_F","Land_Wreck_Skodovka_F","Land_Wreck_Truck_F","Land_Wreck_Car2_F","Land_Wreck_Car_F","Land_Wreck_Hunter_F","Land_Wreck_Offroad_F","Land_Wreck_Offroad2_F","Land_Wreck_UAZ_F","Land_Wreck_Truck_dropside_F"]; //rekt

OT_NATOwait = 500; //Half the Average time between NATO orders -- normally 500
OT_CRIMwait = 500; //Half the Average time between crim changes
OT_jobWait = 60;

OT_Resources = ["OT_Wood","OT_BE","OT_Steel","OT_Plastic","OT_Sugarcane","OT_Sugar","OT_Fertilizer","OT_Lumber","OT_Wine","OT_Grapes","OT_Olives","OT_MP","OT_CE","OT_NVC","OT_Ore","OT_Furniture","OT_natoparts","OT_AGM","OT_aircraftpart"];

OT_item_CargoContainer = "B_Slingload_01_Cargo_F";

//Shop items
OT_item_ShopRegister = "Land_CashDesk_F";//Cash registers
OT_item_BasicGun = "hgun_Pistol_01_F";//Dealers always sell this cheap pistol
OT_item_BasicAmmo = "10Rnd_9x21_Mag";

OT_allDrugs = ["OT_Ganja","OT_Blow"];
OT_illegalItems = OT_allDrugs;

OT_illegalVests = [
	"rhs_6b13_Flora","rhs_6b13_Flora_6sh92","rhs_6b13_Flora_6sh92_headset_mapcase","rhs_6b13_Flora_6sh92_radio","rhs_6b13_Flora_6sh92_vog","rhs_6b13_Flora_crewofficer","rhs_6b13_EMR_6sh92","rhs_6b13_EMR_6sh92_radio","rhs_6b13_EMR_6sh92_vog","rhs_6b13_EMR_6sh92_headset_mapcase",
	"rhs_6b13_EMR","rhs_6b13","rhs_6b13_6sh92","rhs_6b13_6sh92_headset_mapcase","rhs_6b13_6sh92_radio","rhs_6b13_6sh92_vog","rhs_6b13_crewofficer","rhs_6b23","rhs_6b23_6sh116_od","rhs_6b23_6sh116_vog_od","rhs_6b23_6sh92","rhs_6b23_6sh92_headset","rhs_6b23_6sh92_headset_mapcase","rhs_6b23_6sh92_radio",
	"rhs_6b23_6sh92_vog","rhs_6b23_6sh92_vog_headset","rhs_6b23_crewofficer","rhs_6b23_crew","rhs_6b23_engineer","rhs_6b23_medic","rhs_6b23_rifleman","rhs_6b23_sniper","rhs_6b23_vydra_3m","rhs_6b23_digi","rhs_6b23_6sh116","rhs_6b23_6sh116_vog","rhs_6b23_digi_6sh92","rhs_6b23_digi_6sh92_spetsnaz2",
	"rhs_6b23_digi_6sh92_headset","rhs_6b23_digi_6sh92_headset_spetsnaz","rhs_6b23_digi_6sh92_headset_mapcase","rhs_6b23_digi_6sh92_radio","rhs_6b23_digi_6sh92_Spetsnaz","rhs_6b23_digi_6sh92_vog","rhs_6b23_digi_6sh92_Vog_Spetsnaz","rhs_6b23_digi_6sh92_vog_headset","rhs_6b23_digi_6sh92_Vog_Radio_Spetsnaz",
	"rhs_6b23_digi_crewofficer","rhs_6b23_digi_crew","rhs_6b23_digi_engineer","rhs_6b23_digi_medic","rhs_6b23_digi_rifleman","rhs_6b23_digi_sniper","rhs_6b23_digi_vydra_3m","rhs_6b23_6sh116_flora","rhs_6b23_6sh116_vog_flora","rhsgref_6b23_khaki_medic","rhsgref_6b23_khaki_nco","rhsgref_6b23_khaki_officer",
	"rhsgref_6b23_khaki_rifleman","rhsgref_6b23_khaki_sniper","rhsgref_6b23_khaki","rhs_6b23_ML","rhs_6b23_ML_6sh92","rhs_6b23_ML_6sh92_headset","rhs_6b23_ML_6sh92_headset_mapcase","rhs_6b23_ML_6sh92_radio","rhs_6b23_ML_6sh92_vog","rhs_6b23_ML_6sh92_vog_headset","rhs_6b23_ML_crewofficer","rhs_6b23_ML_crew",
	"rhs_6b23_ML_engineer","rhs_6b23_ML_medic","rhs_6b23_ML_rifleman","rhs_6b23_ML_sniper","rhs_6b23_ML_vydra_3m","rhsgref_6b23_ttsko_digi_medic","rhsgref_6b23_ttsko_digi_nco","rhsgref_6b23_ttsko_digi_officer","rhsgref_6b23_ttsko_digi_rifleman","rhsgref_6b23_ttsko_digi_sniper","rhsgref_6b23_ttsko_digi",
	"rhsgref_6b23_ttsko_forest_rifleman","rhsgref_6b23_ttsko_forest","rhsgref_6b23_ttsko_mountain_medic","rhsgref_6b23_ttsko_mountain_nco","rhsgref_6b23_ttsko_mountain_officer","rhsgref_6b23_ttsko_mountain_rifleman","rhsgref_6b23_ttsko_mountain_sniper","rhsgref_6b23_ttsko_mountain","rhs_6b43","rhs_6b5_khaki",
	"rhs_6b5_rifleman_khaki","rhs_6b5_medic_khaki","rhs_6b5_officer_khaki","rhs_6b5_sniper_khaki","rhs_6b5","rhs_6b5_rifleman","rhs_6b5_medic","rhs_6b5_officer","rhs_6b5_sniper","rhs_6b5_ttsko","rhs_6b5_rifleman_ttsko","rhs_6b5_medic_ttsko","rhs_6b5_officer_ttsko","rhs_6b5_sniper_ttsko","rhs_6b5_vsr",
	"rhs_6b5_rifleman_vsr","rhs_6b5_medic_vsr","rhs_6b5_officer_vsr","rhs_6b5_sniper_vsr","rhs_6sh46","rhs_6sh92","rhs_6sh92_headset","rhs_6sh92_radio","rhs_6sh92_vog","rhs_6sh92_vog_headset","rhs_6sh92_digi","rhs_6sh92_digi_headset","rhs_6sh92_digi_radio","rhs_6sh92_digi_vog","rhs_6sh92_digi_vog_headset",
	"rhs_6sh92_vsr","rhs_6sh92_vsr_headset","rhs_6sh92_vsr_radio","rhs_6sh92_vsr_vog","rhs_6sh92_vsr_vog_headset","V_PlateCarrierGL_blk","V_PlateCarrierGL_rgr","V_PlateCarrierGL_mtp","V_PlateCarrierGL_tna_F","V_PlateCarrierGL_wdl","V_PlateCarrier1_blk","V_PlateCarrier1_rgr","V_PlateCarrier1_rgr_noflag_F",
	"V_PlateCarrier1_tna_F","V_PlateCarrier1_wdl","V_PlateCarrier2_blk","V_PlateCarrier2_rgr","V_PlateCarrier2_rgr_noflag_F","V_PlateCarrier2_tna_F","V_PlateCarrier2_wdl","V_PlateCarrierSpec_blk","V_PlateCarrierSpec_rgr","V_PlateCarrierSpec_mtp","V_PlateCarrierSpec_tna_F","V_PlateCarrierSpec_wdl",
	"V_PlateCarrierL_CTRG","V_PlateCarrierH_CTRG","V_DeckCrew_blue_F","V_DeckCrew_brown_F","V_DeckCrew_green_F","V_DeckCrew_red_F","V_DeckCrew_violet_F","V_DeckCrew_white_F","V_DeckCrew_yellow_F","eo_deckvest_1","eo_deckvest_2","eo_eodvest_3","eo_eodvest_2","eo_eodvest_1","eo_platecarrier_1",
	"eo_platecarrier_4","eo_platecarrier_2","eo_platecarrier_5","eo_platecarrier_3","eo_ravenvest_1","eo_tacvest_4","eo_tacvest_2","eo_tacvest_1","eo_tacvest_3","V_EOD_blue_F","V_EOD_IDAP_blue_F","V_EOD_coyote_F","V_EOD_olive_F","V_PlateCarrierIAGL_dgtl","V_PlateCarrierIAGL_oli","V_PlateCarrierIA1_dgtl",
	"V_PlateCarrierIA2_dgtl","V_TacVest_gen_F","rhsusf_iotv_ocp_Grenadier","rhsusf_iotv_ucp_Grenadier","rhsusf_iotv_ocp_Medic","rhsusf_iotv_ucp_Medic","rhsusf_iotv_ocp","rhsusf_iotv_ocp_Repair","rhsusf_iotv_ucp_Repair","rhsusf_iotv_ocp_Rifleman","rhsusf_iotv_ucp_Rifleman","rhsusf_iotv_ocp_SAW",
	"rhsusf_iotv_ucp_SAW","rhsusf_iotv_ocp_Squadleader","rhsusf_iotv_ucp_Squadleader","rhsusf_iotv_ocp_Teamleader","rhsusf_iotv_ucp_Teamleader","rhsusf_iotv_ucp","rhsusf_mbav","rhsusf_mbav_grenadier","rhsusf_mbav_light","rhsusf_mbav_mg","rhsusf_mbav_medic","rhsusf_mbav_rifleman",
	"V_CarrierRigKBT_01_heavy_EAF_F","V_CarrierRigKBT_01_heavy_Olive_F","V_CarrierRigKBT_01_light_EAF_F","V_CarrierRigKBT_01_light_Olive_F","V_CarrierRigKBT_01_EAF_F","V_CarrierRigKBT_01_Olive_F","rhsgref_otv_digi","rhsgref_otv_khaki","rhsusf_plateframe_sapi","rhsusf_plateframe_grenadier",
	"rhsusf_plateframe_light","rhsusf_plateframe_machinegunner","rhsusf_plateframe_marksman","rhsusf_plateframe_medic","rhsusf_plateframe_rifleman","rhsusf_plateframe_teamleader","rhsusf_spc","rhsusf_spc_corpsman","rhsusf_spc_crewman","rhsusf_spc_iar","rhsusf_spc_light","rhsusf_spc_mg","rhsusf_spc_marksman",
	"rhsusf_spc_patchless","rhsusf_spc_patchless_radio","rhsusf_spc_rifleman","rhsusf_spc_sniper","rhsusf_spc_squadleader","rhsusf_spc_teamleader","rhsusf_spcs_ocp_crewman","rhsusf_spcs_ucp_crewman","rhsusf_spcs_ocp_grenadier","rhsusf_spcs_ucp_grenadier","rhsusf_spcs_ocp_machinegunner",
	"rhsusf_spcs_ucp_machinegunner","rhsusf_spcs_ocp_medic","rhsusf_spcs_ucp_medic","rhsusf_spcs_ocp","rhsusf_spcs_ocp_rifleman_alt","rhsusf_spcs_ucp_rifleman_alt","rhsusf_spcs_ocp_rifleman","rhsusf_spcs_ucp_rifleman","rhsusf_spcs_ocp_saw","rhsusf_spcs_ucp_saw","rhsusf_spcs_ocp_sniper",
	"rhsusf_spcs_ucp_sniper","rhsusf_spcs_ocp_squadleader","rhsusf_spcs_ucp_squadleader","rhsusf_spcs_ocp_teamleader_alt","rhsusf_spcs_ucp_teamleader_alt","rhsusf_spcs_ocp_teamleader","rhsusf_spcs_ucp_teamleader","rhsusf_spcs_ucp","V_TacVest_blk","V_TacVest_brn","V_TacVest_camo",
	"rhsgref_TacVest_ERDL","V_TacVest_khk","V_TacVest_oli","V_TacVest_blk_POLICE","V_I_G_resistanceLeader_F","V_PlateCarrier_Kerry","rhs_vydra_3m","FRITH_ruin_vestia_lite_ghm","FRITH_ruin_vestia_lite_grn","FRITH_ruin_vestia_lite_ltr","FRITH_ruin_vestia_lite_nja","FRITH_ruin_vestia_lite_tar",
	"FRITH_ruin_vestia_ghm","FRITH_ruin_vestia_grn","FRITH_ruin_vestia_ltr","FRITH_ruin_vestia_nja","FRITH_ruin_vestia_tar","FRITH_ruin_vestiaGL_ghmchk","FRITH_ruin_vestiaGL_ghm","FRITH_ruin_vestiaGL_grnmtp","FRITH_ruin_vestiaGL_grn","FRITH_ruin_vestiaGL_ltrmtp","FRITH_ruin_vestiaGL_ltr",
	"FRITH_ruin_vestiaGL_njadpm","FRITH_ruin_vestiaGL_nja","FRITH_ruin_vestiaGL_tartar","FRITH_ruin_vestiaGL_tar","V_lxWS_TacVestIR_oli","rhs_suspender_AK8_chestrig","V_lxWS_UN_Vest_Lite_F","V_lxWS_UN_Vest_F","rhssaf_vest_md98_woodland","rhssaf_vest_md98_md2camo","rhssaf_vest_md98_digital","rhssaf_vest_md98_officer","rhssaf_vest_md98_rifleman",
	"rhssaf_vest_otv_md2camo","rhssaf_vest_md99_md2camo_rifleman","rhssaf_vest_md99_md2camo_rifleman_radio","rhssaf_vest_md99_digital_rifleman","rhssaf_vest_md99_digital_rifleman_radio","rhssaf_vest_md99_woodland_rifleman","rhssaf_vest_md99_woodland_rifleman_radio","rhssaf_vest_md99_md2camo","rhssaf_vest_md99_md2camo_radio",
	"rhssaf_vest_md99_digital","rhssaf_vest_md99_digital_radio","rhssaf_vest_md99_woodland","rhssaf_vest_md99_woodland_radio","rhssaf_vest_md12_digital","rhssaf_vest_md12_m70_rifleman","rhssaf_vest_md12_digital_desert","rhssaf_vest_md99a5_md2camo_rifleman","V_HarnessOGL_brn","V_HarnessOGL_ghex_F","V_HarnessOGL_gry",
	//3cbfactions vests
	"UK3CB_TKA_O_V_6b23_vydra_3m_ADD","UK3CB_TKA_O_V_6b23_vydra_3m_ADD_02","UK3CB_TKA_O_V_6b23_vydra_3m_TAN","UK3CB_TKA_O_V_6b23_vydra_3m_TAN_02","UK3CB_UN_B_V_6b23_vydra_3m","UK3CB_TKA_O_V_6b23_ml_BLU_02","UK3CB_TKA_O_V_6b23_ml_BLU","UK3CB_TKA_O_V_6b23_ml_NDPM_02","UK3CB_TKA_O_V_6b23_ml_NDPM","UK3CB_TKA_O_V_6b23_ml_Oli_02","UK3CB_TKA_O_V_6b23_ML_6sh92_radio_Oli","UK3CB_TKA_O_V_6b23_ml_6sh92_vog_Oli","UK3CB_TKA_O_V_6b23_ml_crewofficer_Oli","UK3CB_TKA_O_V_6b23_ml_crew_Oli","UK3CB_TKA_O_V_6b23_ml_engineer_Oli","UK3CB_TKA_O_V_6b23_medic_Oli","UK3CB_TKA_O_V_6b23_ml_Oli","UK3CB_TKA_O_V_6b23_ml_sniper_Oli","UK3CB_TKP_O_V_6b23_ml_BLK","UK3CB_TKP_O_V_6b23_ML_6sh92_radio_BLK","UK3CB_TKP_O_V_6b23_medic_BLK","UK3CB_CPD_B_V_6b23_ml_BLU","UK3CB_CPD_B_V_6b23_ml_BLU_02","UK3CB_ADP_B_V_6b23_ml_TAN","UK3CB_ADP_B_V_6b23_ML_6sh92_radio_TAN","UK3CB_ADP_B_V_6b23_medic_TAN","UK3CB_TKA_O_V_6b23_ml_Surpat_02","UK3CB_TKA_O_V_6b23_ML_6sh92_radio_Surpat","UK3CB_TKA_O_V_6b23_ml_6sh92_vog_Surpat", "UK3CB_TKA_O_V_6b23_ml_engineer_Surpat","UK3CB_TKA_O_V_6b23_medic_Surpat","UK3CB_TKA_O_V_6b23_ml_Surpat","UK3CB_TKA_O_V_6b23_ml_sniper_Surpat"
];

OT_illegalHeadgear = ["rhs_6b26_green","rhs_6b26_bala_green","rhs_6b26_ess_green","rhs_6b26_ess_bala_green","rhs_6b26","rhs_6b26_bala","rhs_6b26_ess","rhs_6b26_ess_bala","rhs_6b27m_green","rhs_6b27m_green_bala","rhs_6b27m_green_ess","rhs_6b27m_green_ess_bala",
	"rhs_6b27m_digi","rhs_6b27m_digi_bala","rhs_6b27m_digi_ess","rhs_6b27m_digi_ess_bala","rhs_6b27m","rhs_6b27m_bala","rhs_6b27m_ess","rhs_6b27m_ess_bala","rhs_6b27m_ml","rhs_6b27m_ml_bala","rhs_6b27m_ml_ess","rhs_6b27m_ML_ess_bala","rhs_6b28_green","rhs_6b28_green_bala","rhs_6b28_green_ess",
	"rhs_6b28_green_ess_bala","rhs_6b28","rhs_6b28_bala","rhs_6b28_ess","rhs_6b28_ess_bala","rhs_6b28_flora","rhs_6b28_flora_bala","rhs_6b28_flora_ess","rhs_6b28_flora_ess_bala","rhs_6b47","rhs_6b47_bala","rhs_6b47_ess","rhs_6b47_ess_bala","rhs_6b7_1m","rhs_6b7_1m_bala2","rhs_6b7_1m_bala1",
	"rhs_6b7_1m_emr","rhs_6b7_1m_bala2_emr","rhs_6b7_1m_bala1_emr","rhs_6b7_1m_emr_ess","rhs_6b7_1m_emr_ess_bala","rhs_6b7_1m_ess","rhs_6b7_1m_ess_bala","rhs_6b7_1m_flora","rhs_6b7_1m_bala1_flora","rhs_6b7_1m_bala2_flora","rhs_6b7_1m_flora_ns3","rhs_6b7_1m_olive","rhs_6b7_1m_bala1_olive",
	"rhs_6b7_1m_bala2_olive","rhsusf_ach_bare","rhsusf_ach_bare_des","rhsusf_ach_bare_des_ess","rhsusf_ach_bare_des_headset","rhsusf_ach_bare_des_headset_ess","rhsusf_ach_bare_ess","rhsusf_ach_bare_headset","rhsusf_ach_bare_headset_ess","rhsusf_ach_bare_semi","rhsusf_ach_bare_semi_ess",
	"rhsusf_ach_bare_semi_headset","rhsusf_ach_bare_semi_headset_ess","rhsusf_ach_bare_tan","rhsusf_ach_bare_tan_ess","rhsusf_ach_bare_tan_headset","rhsusf_ach_bare_tan_headset_ess","rhsusf_ach_bare_wood","rhsusf_ach_bare_wood_ess","rhsusf_ach_bare_wood_headset","rhsusf_ach_bare_wood_headset_ess",
	"rhsusf_ach_helmet_DCU","rhsusf_ach_helmet_DCU_early","rhsusf_ach_helmet_DCU_early_rhino","rhsusf_ach_helmet_M81","rhsusf_ach_helmet_ocp","rhsusf_ach_helmet_ocp_alt","rhsusf_ach_helmet_ESS_ocp","rhsusf_ach_helmet_ESS_ocp_alt","rhsusf_ach_helmet_headset_ocp","rhsusf_ach_helmet_headset_ocp_alt",
	"rhsusf_ach_helmet_headset_ess_ocp","rhsusf_ach_helmet_headset_ess_ocp_alt","rhsusf_ach_helmet_camo_ocp","rhsusf_ach_helmet_ocp_norotos","rhsusf_ach_helmet_ucp","rhsusf_ach_helmet_ucp_alt","rhsusf_ach_helmet_ESS_ucp","rhsusf_ach_helmet_ESS_ucp_alt","rhsusf_ach_helmet_headset_ucp",
	"rhsusf_ach_helmet_headset_ucp_alt","rhsusf_ach_helmet_headset_ess_ucp","rhsusf_ach_helmet_headset_ess_ucp_alt","rhsusf_ach_helmet_ucp_norotos","rhsusf_cvc_green_helmet","rhsusf_cvc_green_alt_helmet","rhsusf_cvc_green_ess","rhsusf_cvc_helmet","rhsusf_cvc_alt_helmet","rhsusf_cvc_ess",
	"H_HelmetHBK_headset_F","H_HelmetHBK_chops_F","H_HelmetHBK_ear_F","H_HelmetHBK_F","rhs_altyn_novisor","rhs_altyn_novisor_bala","rhs_altyn_novisor_ess_bala","rhs_altyn_novisor_ess","rhs_altyn_visordown","rhs_altyn","rhs_altyn_bala","H_HelmetSpecO_blk","H_HelmetSpecO_ghex_F","H_HelmetSpecO_ocamo",
	"H_HelmetAggressor_F","H_HelmetAggressor_cover_F","H_HelmetAggressor_cover_taiga_F","H_Beret_gen_F","rhs_beret_mp2","rhs_beret_mp1","rhsgref_un_beret","rhs_beret_vdv3","rhs_beret_vdv2","rhs_beret_vdv1","rhs_beret_milp","H_Beret_EAF_01_F","H_Beret_02","H_Beret_Colonel","H_HelmetB","H_HelmetB_black",
	"H_HelmetB_camo","H_HelmetB_desert","H_HelmetB_grass","H_HelmetB_sand","H_HelmetB_snakeskin","H_HelmetB_tna_F","H_HelmetB_plain_wdl","H_HelmetCrew_O_ghex_F","H_Tank_black_F","H_Tank_eaf_F","H_HelmetCrew_I","H_HelmetCrew_O","H_HelmetCrew_I_E","H_HelmetCrew_B","H_HelmetLeaderO_ghex_F",
	"H_HelmetLeaderO_ocamo","H_HelmetLeaderO_oucamo","H_HelmetSpecB","H_HelmetSpecB_blk","H_HelmetSpecB_paint2","H_HelmetSpecB_paint1","H_HelmetSpecB_sand","H_HelmetSpecB_snakeskin","H_HelmetB_Enh_tna_F","H_HelmetSpecB_wdl","rhsusf_opscore_aor1","rhsusf_opscore_aor1_pelt","rhsusf_opscore_aor1_pelt_nsw",
	"rhsusf_opscore_aor2","rhsusf_opscore_aor2_pelt","rhsusf_opscore_aor2_pelt_nsw","rhsusf_opscore_bk","rhsusf_opscore_bk_pelt","rhsusf_opscore_coy_cover","rhsusf_opscore_coy_cover_pelt","rhsusf_opscore_fg","rhsusf_opscore_fg_pelt","rhsusf_opscore_fg_pelt_cam","rhsusf_opscore_fg_pelt_nsw",
	"rhsusf_opscore_mc_cover","rhsusf_opscore_mc_cover_pelt","rhsusf_opscore_mc_cover_pelt_nsw","rhsusf_opscore_mc_cover_pelt_cam","rhsusf_opscore_mc","rhsusf_opscore_mc_pelt","rhsusf_opscore_mc_pelt_nsw","rhsusf_opscore_paint","rhsusf_opscore_paint_pelt","rhsusf_opscore_paint_pelt_nsw",
	"rhsusf_opscore_paint_pelt_nsw_cam","rhsusf_opscore_rg_cover","rhsusf_opscore_rg_cover_pelt","rhsusf_opscore_ut","rhsusf_opscore_ut_pelt","rhsusf_opscore_ut_pelt_cam","rhsusf_opscore_ut_pelt_nsw","rhsusf_opscore_ut_pelt_nsw_cam","rhsusf_opscore_mar_fg","rhsusf_opscore_mar_fg_pelt",
	"rhsusf_opscore_mar_ut","rhsusf_opscore_mar_ut_pelt","H_CrewHelmetHeli_I","H_CrewHelmetHeli_O","H_CrewHelmetHeli_I_E","H_CrewHelmetHeli_B","H_PilotHelmetHeli_I","H_PilotHelmetHeli_O","H_PilotHelmetHeli_I_E","H_PilotHelmetHeli_B","rhsusf_hgu56p_black","rhsusf_hgu56p_mask_black",
	"rhsusf_hgu56p_mask_black_skull","rhsusf_hgu56p_visor_black","rhsusf_hgu56p_visor_mask_black","rhsusf_hgu56p_visor_mask_Empire_black","rhsusf_hgu56p_visor_mask_black_skull","rhsusf_hgu56p_green","rhsusf_hgu56p_mask_green","rhsusf_hgu56p_mask_green_mo","rhsusf_hgu56p_visor_green",
	"rhsusf_hgu56p_visor_mask_green","rhsusf_hgu56p_visor_mask_green_mo","rhsusf_hgu56p","rhsusf_hgu56p_mask","rhsusf_hgu56p_mask_mo","rhsusf_hgu56p_mask_skull","rhsusf_hgu56p_visor","rhsusf_hgu56p_visor_mask","rhsusf_hgu56p_visor_mask_mo","rhsusf_hgu56p_visor_mask_skull","rhsusf_hgu56p_pink",
	"rhsusf_hgu56p_mask_pink","rhsusf_hgu56p_visor_pink","rhsusf_hgu56p_visor_mask_pink","rhsusf_hgu56p_saf","rhsusf_hgu56p_mask_saf","rhsusf_hgu56p_visor_saf","rhsusf_hgu56p_visor_mask_saf","rhsusf_hgu56p_mask_smiley","rhsusf_hgu56p_visor_mask_smiley","rhsusf_hgu56p_tan","rhsusf_hgu56p_mask_tan",
	"rhsusf_hgu56p_visor_tan","rhsusf_hgu56p_visor_mask_tan","rhsusf_hgu56p_usa","rhsusf_hgu56p_visor_usa","rhsusf_hgu56p_white","rhsusf_hgu56p_visor_white","rhsusf_ihadss","RHS_jetpilot_usaf","rhsgref_6b27m_ttsko_digi","rhsgref_6b27m_ttsko_forest","rhsgref_6b27m_ttsko_mountain",
	"rhsgref_6b27m_ttsko_urban","H_HelmetB_light","H_HelmetB_light_black","H_HelmetB_light_desert","H_HelmetB_light_grass","H_HelmetB_light_sand","H_HelmetB_light_snakeskin","H_HelmetB_Light_tna_F","H_HelmetB_light_wdl","rhsusf_lwh_helmet_M1942","rhsusf_lwh_helmet_marpatd",
	"rhsusf_lwh_helmet_marpatd_ess","rhsusf_lwh_helmet_marpatd_headset","rhsusf_lwh_helmet_marpatwd","rhsusf_lwh_helmet_marpatwd_blk_ess","rhsusf_lwh_helmet_marpatwd_headset_blk2","rhsusf_lwh_helmet_marpatwd_headset_blk","rhsusf_lwh_helmet_marpatwd_headset","rhsusf_lwh_helmet_marpatwd_ess",
	"rhsgref_helmet_M1_liner","rhsgref_helmet_M1_bare","rhsgref_helmet_M1_bare_alt01","rhsgref_helmet_M1_painted","rhsgref_helmet_M1_painted_alt01","rhsgref_helmet_m1940","rhsgref_helmet_m1940_camo01","rhsgref_helmet_m1940_alt1","rhsgref_helmet_m1940_camo01_alt1","rhsgref_helmet_m1940_winter_alt1",
	"rhsgref_helmet_m1940_winter","rhsgref_helmet_m1942","rhsgref_helmet_m1942_camo01","rhsgref_helmet_m1942_alt1","rhsgref_helmet_m1942_camo01_alt1","rhsgref_helmet_m1942_winter_alt1","rhsgref_helmet_m1942_winter","rhsgref_helmet_m1942_heergreycover","rhsgref_helmet_m1942_heersplintercover",
	"rhsgref_helmet_m1942_heermarshcover","rhsgref_helmet_m1942_heerwintercover","rhsgref_M56","rhsusf_mich_bare","rhsusf_mich_bare_alt","rhsusf_mich_bare_headset","rhsusf_mich_bare_norotos","rhsusf_mich_bare_norotos_alt","rhsusf_mich_bare_norotos_alt_headset","rhsusf_mich_bare_norotos_arc",
	"rhsusf_mich_bare_norotos_arc_alt","rhsusf_mich_bare_norotos_arc_alt_headset","rhsusf_mich_bare_norotos_arc_headset","rhsusf_mich_bare_norotos_headset","rhsusf_mich_bare_semi","rhsusf_mich_bare_alt_semi","rhsusf_mich_bare_semi_headset","rhsusf_mich_bare_norotos_semi",
	"rhsusf_mich_bare_norotos_alt_semi","rhsusf_mich_bare_norotos_alt_semi_headset","rhsusf_mich_bare_norotos_arc_semi","rhsusf_mich_bare_norotos_arc_alt_semi","rhsusf_mich_bare_norotos_arc_alt_semi_headset","rhsusf_mich_bare_norotos_arc_semi_headset","rhsusf_mich_bare_norotos_semi_headset",
	"rhsusf_mich_bare_tan","rhsusf_mich_bare_alt_tan","rhsusf_mich_bare_tan_headset","rhsusf_mich_bare_norotos_tan","rhsusf_mich_bare_norotos_alt_tan","rhsusf_mich_bare_norotos_alt_tan_headset","rhsusf_mich_bare_norotos_arc_tan","rhsusf_mich_bare_norotos_arc_alt_tan",
	"rhsusf_mich_bare_norotos_arc_alt_tan_headset","rhsusf_mich_bare_norotos_tan_headset","rhsusf_mich_helmet_marpatd","rhsusf_mich_helmet_marpatd_alt","rhsusf_mich_helmet_marpatd_alt_headset","rhsusf_mich_helmet_marpatd_headset","rhsusf_mich_helmet_marpatd_norotos",
	"rhsusf_mich_helmet_marpatd_norotos_arc","rhsusf_mich_helmet_marpatd_norotos_arc_headset","rhsusf_mich_helmet_marpatd_norotos_headset","rhsusf_mich_helmet_marpatwd","rhsusf_mich_helmet_marpatwd_alt","rhsusf_mich_helmet_marpatwd_alt_headset","rhsusf_mich_helmet_marpatwd_headset",
	"rhsusf_mich_helmet_marpatwd_norotos","rhsusf_mich_helmet_marpatwd_norotos_arc","rhsusf_mich_helmet_marpatwd_norotos_arc_headset","rhsusf_mich_helmet_marpatwd_norotos_headset","H_MilCap_gen_F","H_HelmetIA","rhsgref_helmet_pasgt_3color_desert","rhsgref_helmet_pasgt_3color_desert_rhino",
	"rhsgref_helmet_pasgt_altis_lizard","rhsgref_helmet_pasgt_erdl","rhsgref_helmet_pasgt_erdl_rhino","rhsgref_helmet_pasgt_flecktarn","rhsgref_helmet_pasgt_olive","rhsgref_helmet_pasgt_woodland","rhsgref_helmet_pasgt_un","rhsgref_helmet_pasgt_woodland_rhino","H_PilotHelmetFighter_I","
	H_PilotHelmetFighter_O","H_PilotHelmetFighter_I_E","H_PilotHelmetFighter_B","rhsusf_protech_helmet","rhsusf_protech_helmet_ess","rhsusf_protech_helmet_rhino","rhsusf_protech_helmet_rhino_ess","H_HelmetO_ghex_F","H_HelmetO_ocamo","H_HelmetO_oucamo","H_HelmetO_ViperSP_ghex_F",
	"H_HelmetO_ViperSP_hex_F","rhs_ssh68","rhsgref_ssh68_emr","rhsgref_ssh68_ttsko_digi","rhsgref_ssh68_ttsko_forest","rhsgref_ssh68_ttsko_mountain","rhsgref_ssh68_ttsko_dark","rhsgref_ssh68_un","rhsgref_ssh68_vsr","H_HelmetB_TI_tna_F","rhs_zsh7a_mike","rhs_zsh7a_mike_green",
	"rhs_zsh7a_mike_alt","rhs_zsh7a_mike_green_alt","rhs_zsh7a","rhs_zsh7a_alt","lxWS_H_PASGT_basic_UN_F","lxWS_H_Beret_Colonel","rhssaf_helmet_m59_85_nocamo","rhssaf_helmet_m59_85_oakleaf","rhssaf_helmet_m97_olive_nocamo","rhssaf_helmet_m97_olive_nocamo_black_ess","rhssaf_helmet_m97_olive_nocamo_black_ess_bare","rhssaf_helmet_m97_black_nocamo",
	"rhssaf_helmet_m97_black_nocamo_black_ess","rhssaf_helmet_m97_black_nocamo_black_ess_bare","rhssaf_helmet_m97_woodland","rhssaf_helmet_m97_digital","rhssaf_helmet_m97_md2camo","rhssaf_helmet_m97_oakleaf","rhssaf_helmet_m97_nostrap_blue","rhssaf_helmet_m97_nostrap_blue_tan_ess","rhssaf_helmet_m97_nostrap_blue_tan_ess_bare","rhssaf_helmet_m97_woodland_black_ess",
	"rhssaf_helmet_m97_digital_black_ess","rhssaf_helmet_m97_md2camo_black_ess","rhssaf_helmet_m97_oakleaf_black_ess","rhssaf_helmet_m97_woodland_black_ess_bare","rhssaf_helmet_m97_digital_black_ess_bare","rhssaf_helmet_m97_md2camo_black_ess_bare","rhssaf_helmet_m97_oakleaf_black_ess_bare","rhssaf_helmet_m97_veil_Base","rhssaf_helmet_m97_veil_woodland",
	"rhssaf_helmet_m97_veil_digital","rhssaf_helmet_m97_veil_md2camo","rhssaf_helmet_m97_veil_oakleaf","rhssaf_beret_green","rhssaf_beret_red","rhssaf_beret_para","rhssaf_beret_black","rhssaf_beret_blue_un"
];

OT_muzzlebreaks = [//muzzle attachments that shouldnt give the suppresor effect bonus
	"hlc_muzzle_snds_ArsenalComp","rhs_acc_ak5","rhs_acc_dtk","rhs_acc_dtk1","rhs_acc_dtk2","rhs_acc_dtk3","hlc_muzzle_SF3P_762","rhs_acc_dtk1983","rhs_acc_pgs64","rhs_acc_uuk","ACE_muzzle_mzls_B","rhs_acc_dtk1l","rhs_acc_dtkrpk","rhs_acc_pgs64_74un","rhs_acc_pgs64_74u","rhsusf_acc_ARDEC_M240","hlc_muzzle_MAG58_Brake","hlc_muzzle_snds_ROTEX3P",
	"hlc_muzzle_Gunfighter_comp", "hlc_muzzle_17SBrake","hlc_muzzle_OEMDevice","rhsgref_acc_falMuzzle_l1a1","hlc_muzzle_KX3_comp","hlc_muzzle_FSC30","hlc_muzzle_Cherrybomb","hlc_muzzle_Miter18T","rhsgref_acc_zendl","rhsusf_acc_SF3P556","rhsusf_acc_SFMB556","rhssaf_acc_G36_Rotex","rhsusf_acc_m24_muzzlehider_black","rhsusf_acc_m24_muzzlehider_d",
	"rhsusf_acc_m24_muzzlehider_wd","ACE_muzzle_mzls_smg_02","ACE_muzzle_mzls_H","ACE_muzzle_mzls_93mmg","ACE_muzzle_mzls_338","ACE_muzzle_mzls_smg_01","ACE_muzzle_mzls_L","sp_fwa_muzzle_m1_flash_hider","sp_fwa_muzzle_garand_flash_hider"
];

OT_item_UAV = "I_UAV_06_F";
OT_item_UAVterminal = "I_UavTerminal";

OT_item_DefaultBlueprints = [];

OT_itemCategoryDefinitions = [
    ["General",["ACE_fieldDressing","Banana","Map","ToolKit","Compass","ACE_EarPlugs","Watch","Radio","ACE_Spraypaint","Altimiter","MapTools","ACE_Can_Spirit"]],
    ["Pharmacy",["Dressing","Bandage","morphine","adenosine","atropine","ACE_EarPlugs","epinephrine","bodyBag","quikclot","salineIV","bloodIV","plasmaIV","personalAidKit","surgicalKit","tourniquet","splint","ACE_adenosine"]],
    ["Electronics",["Rangefinder","Cellphone","Radio","Watch","GPS","monitor","DAGR","_dagr","Battery","ATragMX","ACE_Flashlight","ACE_Kestrel4500","ACE_Flashlight_KSF1","ACE_Flashlight_XL50","ACE_UAVBattery","ACE_MX2A"]],
    ["Hardware",["CableTie","ACE_Spraypaint","wirecutter","ACE_rope"]],
    ["Surplus",["Rangefinder","Compass","Map","ACE_Vector","ACE_Yardage","ACE_NVG_Gen1","ACE_MX2A"]]
];

OT_ForcedItemsGeneral = ["ACE_WaterBottle"];
OT_ForcedItemsElectronics = ["I_UavTerminal","OT_CE","ACE_Flashlight_Maglite_ML300L"];
OT_ForcedItemsSurplus = ["ACE_SpottingScope","rhsusf_bino_m24","Binocular","rhssaf_zrak_rd7j","rhsusf_bino_m24_ARD"];
OT_ForcedItemsHardware = ["OT_Ore","OT_Wood","OT_Fertilizer","OT_BE","OT_NVC","OT_Steel","ACE_EntrenchingTool","ACE_TacticalLadder_Pack","ACE_Flashlight_Maglite_ML300L"];

OT_hasGM = isclass(configFile >> "CfgPatches" >> "gm_core");
if(OT_hasGM) then {
	OT_ForcedItemsGeneral append ["gm_watch_kosei_80","gm_ge_army_conat2","gm_gc_compass_f73"];
	OT_ForcedItemsElectronics append ["gm_photocamera_01_blk"];
	OT_ForcedItemsSurplus append ["gm_df7x40_blk","gm_fero51_oli","gm_ferod16_des","gm_ferod16_oli","gm_ferod16_win","gm_lp7_oli","gm_lpr1_oli"];
};

OT_items = [];
OT_allItems = [];
OT_craftableItems = [];

//OT_buyableVeh = [];

call OT_fnc_detectItems;

OT_notifyHistory = [];

OT_staticBackpacks = [
	/*["I_HMG_01_high_weapon_F",26000,1,0,1],
	["I_GMG_01_high_weapon_F",35000,1,0,1],
	["I_HMG_01_support_high_F",150,1,0,0],
	["I_Mortar_01_weapon_F",75000,1,0,1],
	["I_Mortar_01_support_F",100,1,0,0],
	["I_AT_01_weapon_F",75000,1,0,1],
	["I_AA_01_weapon_F",75000,1,0,1],
	["I_HMG_01_support_F",150,1,0,0]
	*/
];
OT_backpacks = [//Really should be OT_Surplus, stuff sold at surplus shop
	//Leg Straps
	['V_LegStrapBag_black_F',15,0,1,0],
	['V_LegStrapBag_coyote_F',15,0,1,0],
	['V_LegStrapBag_olive_F',15,0,1,0],
	//sidor
	["rhs_sidor",20,0,0,1],
	//Assualt Packs
	["B_AssaultPack_cbr",20,0,0,1],
	["B_AssaultPack_blk",20,0,0,1],
	["B_AssaultPack_khk",20,0,0,1],
	["B_AssaultPack_sgg",20,0,0,1],
	["B_AssaultPack_dgtl",20,0,0,1],
	["B_AssaultPack_rgr",20,0,0,1],
	["B_AssaultPack_ocamo",20,0,0,1],
	["B_AssaultPack_mcamo",20,0,0,1],
	["B_AssaultPack_tna_F",20,0,0,1],
	["B_AssaultPack_eaf_F",20,0,0,1],
	["B_AssaultPack_wdl_F",20,0,0,1],
	["rhsusf_falconii_coy",20,0,0,1],
	["rhsusf_falconii_mc",20,0,0,1],
	["rhsusf_falconii",20,0,0,1],
	//Messanger Bags
	["B_Messenger_Black_F",25,0,0,1],
	["B_Messenger_Gray_F",25,0,0,1],
	["B_Messenger_Olive_F",25,0,0,1],
	["B_Messenger_Coyote_F",25,0,0,1],
	["B_Messenger_IDAP_F",25,0,0,1],
	//Civ backpacks
	["B_CivilianBackpack_01_Everyday_Astra_F",30,0,0,1],
	["B_CivilianBackpack_01_Everyday_Black_F",30,0,0,1],
	["B_CivilianBackpack_01_Everyday_Vrana_F",30,0,0,1],
	["B_CivilianBackpack_01_Everyday_IDAP_F",30,0,0,1],
	["B_CivilianBackpack_01_Sport_Blue_F",30,0,0,1],
	["B_CivilianBackpack_01_Sport_Green_F",30,0,0,1],
	["B_CivilianBackpack_01_Sport_Red_F",30,0,0,1],
	//Field Packs
	["B_FieldPack_cbr",45,0,0,1],
	["B_FieldPack_blk",45,0,0,1],
	["B_FieldPack_khk",45,0,0,1],
	["B_FieldPack_oli",45,0,0,1],
	["B_FieldPack_ghex_F",45,0,0,1],
	["B_FieldPack_green_F",45,0,0,1],
	["B_FieldPack_ocamo",45,0,0,1],
	["B_FieldPack_taiga_F",45,0,0,1],
	["B_FieldPack_oucamo",45,0,0,1],
	//Soviet pack thingy
	["rhs_rd54",50,0,0,1],
	["rhs_rd54_emr1",50,0,0,1],
	["rhs_rd54_flora1",50,0,0,1],
	["rhs_rd54_flora2",50,0,0,1],
	//Tactical Backpacks
	["B_TacticalPack_blk",55,0,0,1],
	["B_TacticalPack_rgr",55,0,0,1],
	["B_TacticalPack_ocamo",55,0,0,1],
	["B_TacticalPack_mcamo",55,0,0,1],
	["B_TacticalPack_oli",55,0,0,1],
	["rhs_rk_sht_30_emr",55,0,0,1],
	["rhs_rk_sht_30_olive",55,0,0,1],
	["rhs_assault_umbts",55,0,0,1],
	["rhsusf_assault_eagleaiii_coy",55,0,0,1],
	["rhsusf_assault_eagleaiii_ocp",55,0,0,1],
	["rhsusf_assault_eagleaiii_ucp",55,0,0,1],
	//Kit Bags
	["B_Kitbag_cbr",60,0,0,1],
	["B_Kitbag_rgr",60,0,0,1],
	["B_Kitbag_mcamo",60,0,0,1],
	["B_Kitbag_tan",60,0,0,1],
	["B_Kitbag_sgg",60,0,0,1],
	["eo_kitbag",60,0,0,1],
	["rhssaf_kitbag_digital",60,0,0,1],
	["rhssaf_kitbag_md2camo",60,0,0,1],
	["rhssaf_kitbag_smb",60,0,0,1],
	//Carryalls
	["B_Carryall_cbr",70,0,0,1],
	["B_Carryall_khk",70,0,0,1],
	["B_Carryall_oli",70,0,0,1],
	["B_Carryall_blk",70,0,0,1],
	["B_Carryall_ocamo",70,0,0,1],
	["B_Carryall_mcamo",70,0,0,1],
	["B_Carryall_oucamo",70,0,0,1],
	["B_Carryall_ghex_F",70,0,0,1],
	["B_Carryall_eaf_F",70,0,0,1],
	["B_Carryall_green_F",70,0,0,1],
	["B_Carryall_taiga_F",70,0,0,1],
	["B_Carryall_wdl_F",70,0,0,1],
	["eo_carryall_1",70,0,0,1],
	["eo_carryall_2",70,0,0,1],
	["rhs_tortila_black",70,0,0,1],
	["rhs_tortila_emr",70,0,0,1],
	["rhs_tortila_grey",70,0,0,1],
	["rhs_tortila_khaki",70,0,0,1],
	["rhs_tortila_olive",70,0,0,1],
	["rhsgref_tortila_specter",70,0,0,1],
	//Allice packs
	["rhsgref_hidf_alicepack",80,0,0,1],
	["rhsgref_ttsko_alicepack",80,0,0,1],
	["rhsgref_wdl_alicepack",80,0,0,1],
	["rhssaf_alice_md2camo",80,0,0,1],
	["rhssaf_alice_smb",80,0,0,1],
	//Misc Bags
	["B_Parachute",100,0,0,2],
	//Drone bags
	["I_UAV_01_backpack_F",350,0,0,4],
	["I_UAV_06_backpack_F",350,0,0,4],
	["I_UAV_06_medical_backpack_F",350,0,0,4],
	["I_E_UAV_06_backpack_F",350,0,0,5],
	["I_E_UAV_01_backpack_F",350,0,0,5],
	["I_E_UAV_06_medical_backpack_F",350,0,0,5],
	["C_IDAP_UAV_01_backpack_F",350,0,0,4],
	["C_UAV_06_medical_backpack_F",350,0,0,5],
	["C_IDAP_UAV_06_backpack_F",350,0,0,5],
	["C_UAV_06_backpack_F",350,0,0,5],
	//Bergen packs (heafty)
	["B_Bergen_dgtl_F",300,0,0,3],
	["B_Bergen_hex_F",300,0,0,3],
	["B_Bergen_mcamo_F",300,0,0,3],
	["B_Bergen_tna_F",300,0,0,3],
	["eo_bergan",300,0,0,3],
	["eo_hunter_bergan",300,0,0,3],
	//Identifications
	["V_Plain_crystal_F",5,0,0,1],
	["V_Plain_medical_F",5,0,0,1],
	//Safty Vests
	["V_Safety_blue_F",10,0,0,1],
	["V_Safety_orange_F",10,0,0,1],
	["V_Safety_yellow_F",10,0,0,1],
	//Pocketvests
	["V_Pocketed_black_F",30,0,0,1],
	["V_Pocketed_olive_F",30,0,0,1],
	["V_Pocketed_coyote_F",30,0,0,1],
	//Bandoilers
	["V_BandollierB_blk",30,0,0,1],
	["V_BandollierB_cbr",30,0,0,1],
	["V_BandollierB_rgr",30,0,0,1],
	["V_BandollierB_khk",30,0,0,1],
	["V_BandollierB_oli",30,0,0,1],
	["V_BandollierB_ghex_F",30,0,0,1],
	//Harness
	["V_HarnessO_brn",45,0,0,1],
	["V_HarnessO_gry",45,0,0,1],
	["V_HarnessO_ghex_F",45,0,0,1],
	//Chestrig
	["V_Chestrig_blk",50,0,0,1],
	["V_Chestrig_oli",50,0,0,1],
	["V_Chestrig_khk",50,0,0,1],
	["V_Chestrig_rgr",50,0,0,1],
	["rhsgref_chestrig",50,0,0,1],
	["rhs_chicom",75,0,0,1],
	["rhs_chicom_khk",75,0,0,1],
	
	["H_Hat_Tinfoil_F",5,0,0,1],
	['H_EarProtectors_yellow_F',15,0,2,0],
	['H_EarProtectors_white_F',15,0,2,0],
	['H_EarProtectors_orange_F',15,0,2,0],
	['H_EarProtectors_red_F',15,0,2,0],
	['H_EarProtectors_black_F',15,0,2,0],
	["eo_construction_1",50,0,0,1],
	["eo_construction_2",70,0,0,2],
	["H_Construction_basic_yellow_F",50,0,0,1],
	["H_Construction_earprot_yellow_F",70,0,0,2],
	["eo_presshelmet_1",120,0,0,2],
	["eo_presshelmet_2",120,0,0,2],
	["H_RacingHelmet_1_black_F",130,0,0,2],
	["H_RacingHelmet_1_blue_F",130,0,0,2],
	["H_RacingHelmet_2_F",130,0,0,2],
	["H_RacingHelmet_1_F",130,0,0,2],
	["H_RacingHelmet_1_green_F",130,0,0,2],
	["H_RacingHelmet_1_orange_F",130,0,0,2],
	["H_RacingHelmet_1_red_F",130,0,0,2],
	["H_RacingHelmet_3_F",130,0,0,2],
	["H_RacingHelmet_4_F",130,0,0,2],
	["H_RacingHelmet_1_white_F",130,0,0,2],
	["H_RacingHelmet_1_yellow_F",130,0,0,2],
	['H_Helmet_Skate',50,0,2,0],
	["ACE_NVG_Gen1",150,0,0,1],
	//press vest
	["V_Press_F",350,0,2,2],
	//Starter Pistol because why not
	["hgun_Pistol_Signal_F",150,0,1,1],
	['6Rnd_GreenSignal_F',15,0,0.1,0],
	['6Rnd_RedSignal_F',15,0,0.1,0]
];
if(OT_hasTFAR) then {
	OT_backpacks append [
		["tf_anprc155",1000,0,0,0.1],
		["tf_anarc210",1500,0,0,0.1],
		["tf_anarc164",200,0,0,0.5],
		["tf_anprc155_coyote",100,0,0,0.5]
	];
};

if (isServer) then {
	//Basic unproducable items used in production
	cost setVariable ["OT_BE",[110,0,0,0],true];
	cost setVariable ["OT_NVC",[180,0,0,0],true];
	//Everything else
	cost setVariable ["OT_Sugarcane",[280,0,0,0],true];
	cost setVariable ["OT_Grapes",[300,0,0,0],true];
	cost setVariable ["OT_Olives",[320,0,0,0],true];
	cost setVariable ["OT_Fertilizer",[50,0,0,0],true];
	cost setVariable ["OT_Wood",[530,0,0,0],true];
	cost setVariable ["OT_Ore",[600,0,0,0],true];
	cost setVariable ["OT_Plastic",[900,0,0,0],true];
	cost setVariable ["OT_Lumber",[1360,0,0,0],true];
	cost setVariable ["OT_Steel",[1750,0,0,0],true];
	cost setVariable ["OT_MP",[2200,0,0,0],true];
	cost setVariable ["OT_CE",[4800,0,0,0],true];
	cost setVariable ["OT_Furniture",[6200,0,0,0],true];
	cost setVariable ["OT_aircraftpart",[8400,0,0,0],true];
	cost setVariable ["OT_Sugar",[600,0,0,0],true];
	cost setVariable ["OT_Wine",[640,0,0,0],true];
	//Special unpurchasable parts needed to make specific vehicles
	cost setVariable ["OT_AGM",[25000,0,0,0],true];
	cost setVariable ["OT_natoparts",[250,0,0,0],true];
};


//Detecting vehicles && weapons

OT_boats = [
	["C_Scooter_Transport_01_F",500,1,0,1],
	["C_Boat_Civil_01_rescue_F",1000,1,1,1],
	["C_Boat_Transport_02_F",3000,1,0,1]
];
OT_vehicles = [
	["RHS_Ural_Civ_01",7000,2,25,2],
	["RHS_Ural_Open_Civ_01",7000,2,25,2],
	["RHS_Ural_Civ_02",7000,2,25,2],
	["RHS_Ural_Open_Civ_02",7000,2,25,2],
	["RHS_Ural_Civ_03",7000,2,25,2],
	["RHS_Ural_Open_Civ_03",7000,2,25,2],
	["OT_C_Truck_recovery",-1,-1,-1,-1],
	['OT_C_rhsgref_nat_uaz',[1250,0,2,2]],
	["OT_C_T_LSV",-1,-1,-1,-1],
	["OT_C_T_LSV2",-1,-1,-1,-1],
	["OT_C_Ural",-1,-1,-1,-1]
];
OT_helis = [
	["rhs_uh1h_idap",150000,0,45,10],
	["C_IDAP_Heli_Transport_02_F",250000,0,45,10]
];

OT_AllMapFac = [];
OT_allVehicles = [];
OT_allBoats = ["B_Boat_Transport_01_F"];
OT_allWeapons = [];
OT_allOptics = [];
OT_allMagazines = [OT_ammo_50cal];
OT_allBackpacks = [];
OT_allStaticBackpacks = [];
OT_vehWeights_civ = [];
OT_mostExpensiveVehicle = "";
OT_allHeliThreats = [];
OT_allPlaneThreats = [];
OT_allVehicleThreats = [];
OT_luxCars = ["C_SUV_01_F","C_Hatchback_01_sport_F"];//Cars used for certain missions

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

OT_gunDealerHouses = OT_spawnHouses;

/*private _allShops = "getNumber ( _x >> ""ot_isShop"" ) isEqualTo 1" configClasses ( configFile >> "CfgVehicles" );
OT_shops = _allShops apply {configName _x};*/
OT_shops = [];

//Mission shop overrides
{
	_x params ["_cls","_template","_pos"];
	OT_shops pushBack _cls;
	templates setVariable [_cls,_template,true];
}foreach(OT_shopBuildings);

private _allCarShops = "getNumber ( _x >> ""ot_isCarDealer"" ) isEqualTo 1" configClasses ( configFile >> "CfgVehicles" );
OT_carShops = _allCarShops apply {configName _x};

//Mission car shop overrides
{
	_x params ["_cls","_template"];
	OT_carShops pushBack _cls;
	templates setVariable [_cls,_template,true];
}foreach(OT_carShopBuildings);

//Calculate prices
//First, load the hardcoded prices from data/prices.sqf
if(isServer) then {
	OT_loadedPrices = [];
	call compile preprocessFileLineNumbers "\overthrow_main\data\prices.sqf";
	{
		OT_loadedPrices pushback (_x select 0);
		cost setVariable[_x select 0,_x select 1, true];
	}forEach(OT_priceData);
	OT_priceData = []; //free memory

	call compile preprocessFileLineNumbers "\overthrow_main\data\gangnames.sqf";
};

private _allVehs = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
	{ (getArray ( _x >> ""threat"" ) select 0) < 0.5}
	&&
    { (getText ( _x >> ""vehicleClass"" ) isEqualTo ""Car"") || (getText ( _x >> ""vehicleClass"" ) isEqualTo ""Support"")}
	&&
    { (getText ( _x >> ""faction"" ) isEqualTo ""CIV_F"") || (getText ( _x >> ""faction"" ) isEqualTo ""CIV_F"")})

" configClasses ( configFile >> "cfgVehicles" );

private _mostExpensive = 0;
{
	private _cls = configName _x;
	private _clsConfig = configFile >> "cfgVehicles" >> _cls;
	private _cost = round(getNumber (_clsConfig >> "armor") + (getNumber (_clsConfig >> "enginePower") * 2));
	_cost = _cost + round(getNumber (_clsConfig >> "maximumLoad") * 0.1);

	if(_cls isKindOf "Truck_F") then {_cost = _cost * 2};
	if(getText (_clsConfig >> "faction") != "CIV_F") then {_cost = _cost * 1.5};

	if (getText(configFile >> "CfgVehicles" >> _cls >> "author") isequalto "Ivory") exitwith {};//Vehicles are manually handled
	
	OT_vehicles pushback [_cls,_cost,0,getNumber (_clsConfig >> "armor"),2];
	OT_allVehicles pushback _cls;
	if(getText (_clsConfig >> "faction") == "CIV_F") then {
		if(getText(_clsConfig >> "textSingular") != "truck" && getText(_clsConfig >> "driverAction") != "Kart_driver") then {
				OT_vehTypes_civ pushback _cls;
				
			if(_cost > _mostExpensive)then {
				_mostExpensive = _cost;
				OT_mostExpensiveVehicle = _cls;
			};
		};
	};
}foreach(_allVehs);

OT_hasIC = isclass(configFile >> "CfgIvoryTextures");
if(OT_hasIC) then {
	OT_vehicles append [
		["ivory_cv",-1,-1,-1,-1],
		["ivory_cv_taxi",-1,-1,-1,-1],
		["ivory_cv_marked",-1,-1,-1,-1],
		["ivory_suburban",-1,-1,-1,-1],
		["ivory_taurus",-1,-1,-1,-1],
		["ivory_evox",-1,-1,-1,-1],
		["ivory_supra",-1,-1,-1,-1],
		["ivory_gti",-1,-1,-1,-1],
		["ivory_prius",-1,-1,-1,-1],
		["ivory_190e",-1,-1,-1,-1],
		["ivory_e36",-1,-1,-1,-1],
		["ivory_challenger",-1,-1,-1,-1],
		["ivory_wrx",-1,-1,-1,-1],
		["ivory_charger",-1,-1,-1,-1],
		["ivory_charger_unmarked",-1,-1,-1,-1],
		["ivory_isf",-1,-1,-1,-1],
		["ivory_m3",-1,-1,-1,-1],
		["ivory_gt500",-1,-1,-1,-1],
		["ivory_elise",-1,-1,-1,-1],
		["ivory_lfa",-1,-1,-1,-1],
		["ivory_mp4",-1,-1,-1,-1],
		["ivory_r8_spyder",-1,-1,-1,-1],
		["ivory_r8",-1,-1,-1,-1],
		["ivory_911",-1,-1,-1,-1],
		["ivory_r34",-1,-1,-1,-1],
		["ivory_lp560",-1,-1,-1,-1],
		["ivory_c",-1,-1,-1,-1],
		["ivory_ccx",-1,-1,-1,-1],
		["ivory_rev",-1,-1,-1,-1],
		["ivory_veyron",-1,-1,-1,-1],
		["ivory_f1",-1,-1,-1,-1]
	];
	OT_vehTypes_civ append ["ivory_cv","ivory_suburban","ivory_taurus","ivory_evox","ivory_supra","ivory_gti","ivory_prius","ivory_190e","ivory_e36","ivory_challenger","ivory_wrx"];
	OT_luxCars append ["ivory_911","ivory_mp4","ivory_elise","ivory_lfa","ivory_r34","ivory_r8_spyder"];
};

if(OT_hasGM) then {
	OT_ForcedItemsGeneral append ["gm_watch_kosei_80","gm_ge_army_conat2","gm_gc_compass_f73"];
	OT_ForcedItemsElectronics append ["gm_photocamera_01_blk"];
	OT_ForcedItemsSurplus append ["gm_df7x40_blk","gm_fero51_oli","gm_ferod16_des","gm_ferod16_oli","gm_ferod16_win","gm_lp7","gm_lpr1_oli"];
	
	OT_vehicles append [
		["gm_ge_civ_u1300l",-1,-1,-1,-1],
		["gm_ge_civ_typ1200",-1,-1,-1,-1],
		["gm_ge_civ_typ253",-1,-1,-1,-1],
		["gm_ge_civ_w123",-1,-1,-1,-1],
		["gm_ge_civ_u1300l",-1,-1,-1,-1],
		["gm_gc_civ_ural375d_cargo",-1,-1,-1,-1]
	];
	OT_helis append [
		["gm_ge_adak_bo105m_vbh",125000,0,45,10],
		["gm_gc_civ_mi2p",100000,0,45,10]
	];
	OT_vehTypes_civ append ["gm_ge_civ_typ1200","gm_ge_civ_u1300l","gm_ge_civ_typ253"];
	OT_luxCars append ["gm_ge_civ_w123"];
};
//Determine vehicle threats
_allVehs = "
	( getNumber ( _x >> ""scope"" ) > 0
	&&
	{ (getArray ( _x >> ""threat"" ) select 0) > 0}
	&&
	{ (getText ( _x >> ""vehicleClass"" ) isEqualTo ""Car"") or
	 (getText ( _x >> ""vehicleClass"" ) isEqualTo ""Armored"")})

" configClasses ( configFile >> "cfgVehicles" );

{
	OT_allVehicleThreats pushback (configName _x);
}foreach(_allVehs);

private _allHelis = "
    ( getNumber ( _x >> ""scope"" ) > 1
    &&
	{ (getArray ( _x >> ""threat"" ) select 0) < 0.5}
	&&
    { getText ( _x >> ""vehicleClass"" ) isEqualTo ""Air""}
	&&
    { (getText ( _x >> ""faction"" ) isEqualTo ""CIV_F"")})
" configClasses ( configFile >> "cfgVehicles" );

{
	private _cls = configName _x;
	private _clsConfig = configFile >> "cfgVehicles" >> _cls;
	private _multiply = 3;
	if(_cls isKindOf "Plane") then {_multiply = 6};
	private _cost = (getNumber (_clsConfig >> "armor") + getNumber (_clsConfig >> "enginePower")) * _multiply;
	_cost = _cost + round(getNumber (_clsConfig >> "maximumLoad") * _multiply);
	private _steel = round(getNumber (_clsConfig >> "armor"));
	private _numturrets = count("true" configClasses(_clsConfig >> "Turrets"));
	private _plastic = 2;
	if(_numturrets > 0) then {
		_cost = _cost + (_numturrets * _cost * _multiply);
		_steel = _steel * 3;
		_plastic = 6;
	};

	if(isServer && isNil {cost getVariable _cls}) then {
		cost setVariable [_cls,[_cost,0,_steel,_plastic],true];
	};

	OT_helis pushback [_cls,[_cost,0,_steel,_plastic],true];
	OT_allVehicles pushback _cls;
}foreach(_allHelis);

//Determine aircraft threats
_allHelis = "
    ( getNumber ( _x >> ""scope"" ) > 0
    &&
	{ (getArray ( _x >> ""threat"" ) select 0) >= 0.5}
	&&
    { getText ( _x >> ""vehicleClass"" ) isEqualTo ""Air""})
" configClasses ( configFile >> "cfgVehicles" );

{
	private _cls = configName _x;
	private _clsConfig = configFile >> "cfgVehicles" >> _cls;
	private _numturrets = count("true" configClasses(_clsConfig >> "Turrets"));

	if(_cls isKindOf "Plane") then {
		OT_allPlaneThreats pushback _cls;
	}else{
		OT_allHeliThreats pushback _cls;
	};
}foreach(_allHelis);

//Chinook (unarmed) special case for production logistics
OT_helis pushback ["B_Heli_Transport_03_unarmed_F",[750000,0,110,5],true];
OT_allVehicles pushBackUnique "B_Heli_Transport_03_unarmed_F";
if(isServer) then {
	cost setVariable ["B_Heli_Transport_03_unarmed_F",[750000,0,110,5],true];
};

{
	private _cls = _x select 0;
	_x set [1,(cost getVariable [_cls,[-1]]) select 0];
}foreach(OT_vehicles);
OT_vehicles = [OT_vehicles,[],{_x select 1},"ASCEND"] call BIS_fnc_sortby;

_mostExpensive = 0;

{
	if(((_x select 0) in OT_vehTypes_civ) && (_x select 1) >= _mostExpensive) then {
		_mostExpensive = (_x select 1);
	}
}foreach(OT_vehicles);

{
	private _cls = _x select 0;
	if(isServer && isNil {cost getVariable _cls}) then {
		cost setVariable [_cls,[_x select 1,_x select 2,_x select 3,_x select 4],true];
	};
	if(_cls in OT_vehTypes_civ) then {
		OT_vehWeights_civ pushback 1 - ((_x select 1) /_mostExpensive)+0.1;//This will make whatever is the most expensive car very rare
	};
	OT_allVehicles pushBack _cls;
}foreach(OT_vehicles);

_allweapons = "(
	getNumber ( _x >> ""scope"" ) isEqualTo 2 
	&& 
	{ getText ( _x >> ""simulation"" ) isEqualTo ""Weapon""} 
	&& 
	{NOT ((configname _x) iskindof ['CannonCore',( configFile >> 'cfgWeapons' )])}
	&&
	{NOT ((configname _x) iskindof ['MissileLauncher',( configFile >> 'cfgWeapons' )])}	
)" configClasses ( configFile >> "cfgWeapons" );

private _allAttachments = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { _t = getNumber ( _x >> ""ItemInfo"" >> ""type"" ); _t isEqualTo 301 || _t isEqualTo 302 || _t isEqualTo 101})
" configClasses ( configFile >> "cfgWeapons" );

private _allOptics = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { getNumber ( _x >> ""ItemInfo"" >> ""optics"" ) isEqualTo 1})
" configClasses ( configFile >> "cfgWeapons" );

private _allmuzzles = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { getNumber ( _x >> ""ItemInfo"" >> ""type"" ) isEqualTo 101})
" configClasses ( configFile >> "cfgWeapons" );

private _allDetonators = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { getNumber ( _x >> ""ace_explosives_Detonator"" ) isEqualTo 1})
" configClasses ( configFile >> "cfgWeapons" );

private _allUniforms = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { getNumber ( _x >> ""ItemInfo"" >> ""type"" ) isEqualTo 801})
" configClasses ( configFile >> "cfgWeapons" );

private _allHelmets = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { getNumber ( _x >> ""ItemInfo"" >> ""type"" ) isEqualTo 605})
" configClasses ( configFile >> "cfgWeapons" );

private _allAmmo = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2 )
" configClasses ( configFile >> "cfgMagazines" );

private _allVehicles = "
    ( getNumber ( _x >> ""scope"" ) > 0 )
" configClasses ( configFile >> "cfgVehicles" );

private _allFactions = "
    ( getNumber ( _x >> ""side"" ) < 3 )
" configClasses ( configFile >> "cfgFactionClasses" );

private _allGlasses = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2 )
" configClasses ( configFile >> "CfgGlasses" );

OT_allFactions = [];
OT_allSubMachineGuns = [];
OT_allAssaultRifles = [];
OT_allMachineGuns = [];
OT_allSniperRifles = [];
OT_allHandGuns = [];
OT_allMissileLaunchers = [];
OT_allRocketLaunchers = [];
OT_allExpensiveRifles = [];
OT_allCheapRifles = [];
OT_allVests = [];
OT_allProtectiveVests = [];
OT_allExpensiveVests = [];
OT_allCheapVests = [];
OT_allClothing = [];
OT_allOptics = [];
OT_allHelmets = [];
OT_allHats = [];
OT_allAttachments = [];
OT_allExplosives = [];
OT_explosives = [];
OT_detonators = [];
OT_allDetonators = [];
OT_allGlasses = [];
OT_allFacewear = [];
OT_allGoggles = [];
OT_allBLURifles = [];
OT_allBLUSMG = +OT_NATO_weapons_Police;
OT_allBLUMachineGuns = [];
OT_allBLUSniperRifles = [];
OT_allBLUGLRifles = [];
OT_allBLULaunchers = [];
OT_allBLUPistols = OT_NATO_weapons_Pistols;
OT_allBLUVehicles = [];
OT_allBLUOffensiveVehicles = [];
OT_allBLURifleMagazines = [];
OT_allmuzzles = [];

OT_JammingPos = []; //Keep track of where to jam drones

{
	_name = configname _x;
	OT_allmuzzles pushback _name;
	if(isServer && _name != "None" && isNil {cost getVariable _name}) then {
			cost setVariable [_name,[50,0,0,0,0],true];
	};
}foreach(_allmuzzles);


{
	private _name = configName _x;
	private _title = getText (_x >> "displayname");
	private _m = getNumber(_x >> "mass");
	private _ignore = getNumber(_x >> "ot_shopignore");
	if(_ignore != 1) then {
		if((_name find "Balaclava_TI_") > -1) then {
			_m = _m * 2;
		};

		private _protection = getNumber(_x >> "ACE_Protection");
		if(_protection > 0) then {
			_m = round(_m * 1.5);
		};

		[_name,_title] call {
			params ["_name","_title"];
			if(_name == "None") exitWith {};
			if(_name == "G_Goggles_VR") exitWith {};
			if((_title find "Tactical") > -1 || (_title find "Diving") > -1 || (_title find "Goggles") > -1) exitWith {
				OT_allGoggles pushback _name;
			};
			if((_title find "Balaclava") > -1 || (_title find "Bandana") > -1) exitWith {
				OT_allFacewear pushback _name;
			};
			OT_allGlasses pushback _name;
		};
		if(isServer && _name != "None" && isNil {cost getVariable _name}) then {
			cost setVariable [_name,[_m*3,0,0,ceil(_m*0.5)],true];
		};
	};
}foreach(_allGlasses);

{
	private _name = configName _x;
	private _title = getText (configFile >> "cfgFactionClasses" >> _name >> "displayName");
	private _side = getNumber (configFile >> "cfgFactionClasses" >> _name >> "side");
	private _flag = getText (configFile >> "cfgFactionClasses" >> _name >> "flag");
	private _numblueprints = 0;

	//736

	//Get vehicles && weapons
	private _vehicles = [];
	private _weapons = [];
	private _blacklist = ["Throw","Put","NLAW_F","rhs_weap_aks74u","rhs_weap_m79","rhs_weap_mk18_KAC"];

	private _all = format["(getNumber( _x >> ""scope"" ) isEqualTo 2 ) && (getText( _x >> ""faction"" ) isEqualTo '%1')",_name] configClasses ( configFile >> "cfgVehicles" );
	private _auth = gettext(configFile >> "CfgVehicles" >> (configname (_all select 0)) >> "author");
	if(!isnil{_auth}) then {
		if(_auth isequalto "www.3commandobrigade.com")  then {
			if
			(
				!(
					_name == "UK3CB_AAF_I" ||
					_name == "UK3CB_ADA_I" ||
					_name == "UK3CB_ADM_I" ||
					_name == "UK3CB_ARD_I" ||
					_name == "UK3CB_CHD_I" ||
					_name == "UK3CB_FIA_I" ||
					_name == "UK3CB_GAF_I" ||
					_name == "UK3CB_ION_I_Urban" ||
					_name == "UK3CB_KRG_I" ||
					_name == "UK3CB_KDF_O" ||
					_name == "UK3CB_LDF_I" ||
					_name == "UK3CB_LSM_O" ||
					_name == "UK3CB_NAP_I"
				) ||
				_name == "UK3CB_NFA_I" ||
				_name == "UK3CB_TKA_I" ||
				_name == "UK3CB_ADE_O" ||
				_name == "UK3CB_CW_SOV_O_EARLY" ||
				_name == "UK3CB_MEE_O"
			) exitwith {};
		};
	};
	{
		private _cls = configName _x;
		if(_cls isKindOf "CAManBase") then {
			//Get weapons;
			{
				private _base = [_x] call BIS_fnc_baseWeapon;
				if !(_base in _blacklist) then {
					private _muzzleEffect = getText (configFile >> "CfgWeapons" >> _base >> "muzzleEffect");
					if !(_x in _weapons) then {_weapons pushback _base};
					if(_side isEqualTo 1 && !(_muzzleEffect isEqualTo "BIS_fnc_effectFiredFlares")) then {
						if(_base isKindOf ["Rifle", configFile >> "CfgWeapons"]) then {
							private _mass = getNumber (configFile >> "CfgWeapons" >> _base >> "WeaponSlotsInfo" >> "mass");
							_base call {
								_itemType = ([_cls] call BIS_fnc_itemType) select 1;
								if(_itemType isEqualTo "MachineGun") exitWith {OT_allBLUMachineGuns pushBackUnique _base};
								if((_this select [0,7]) == "srifle_" || (_this isKindOf ["Rifle_Long_Base_F", configFile >> "CfgWeapons"])) exitWith {OT_allBLUSniperRifles pushBackUnique _base};
								if((_this find "_GL_") > -1) exitWith {OT_allBLUGLRifles pushBackUnique _base};
								private _events = "" configClasses (configFile >> "CfgWeapons" >> _base >> "Eventhandlers");
								_add = true;
								{
									private _n = configName _x;
									if(_n isEqualTo "RHS_BoltAction") exitWith {_add = false}; //ignore RHS bolt-action rifles
								}foreach(_events);
								if(_add) then {
									OT_allBLURifles pushBackUnique _base;
									OT_allBLURifleMagazines = OT_allBLURifleMagazines + getArray(configFile >> "CfgWeapons" >> _base >> "WeaponSlotsInfo" >> "magazines");
								};
							};
						};
						if(_base isKindOf ["Launcher", configFile >> "CfgWeapons"]) then {OT_allBLULaunchers pushBackUnique _base};
						//if(_base isKindOf ["Pistol", configFile >> "CfgWeapons"]) then {OT_allBLUPistols pushBackUnique _base};
					};
					//Get ammo
					{
						if (!(_x in _blacklist || _x in OT_allExplosives || _x in OT_noCopyMags)) then {
							_weapons pushbackUnique _x
						};
					}foreach(getArray(configFile >> "CfgWeapons" >> _base >> "magazines"));
				};
			}foreach(getArray(configFile >> "CfgVehicles" >> _cls >> "weapons"));
		}else{
			//It's a vehicle
			if !(_cls isKindOf "Bag_Base" || _cls isKindOf "StaticWeapon") then {
				if(_cls isKindOf "LandVehicle" || _cls isKindOf "Air" || _cls isKindOf "Ship") then {
					_vehicles pushback _cls;
					_numblueprints = _numblueprints + 1;
					if(_side isEqualTo 1) then {
						private _threat = getArray (_x >> "threat");
						if(_threat#0 > 0.5) then {
							OT_allBLUOffensiveVehicles pushBackUnique _cls;
						}else{
							OT_allBLUVehicles pushBackUnique _cls;
						};
					};
				};
			};
		};
	}foreach(_all);
	_weapons = (_weapons arrayIntersect _weapons); //remove duplicates

	if(isServer) then {
		spawner setVariable [format["facweapons%1",_name],_weapons,true];
		spawner setVariable [format["facvehicles%1",_name],_vehicles,true];
	};
	if(_side > -1 && _numblueprints > 0) then {
		OT_allFactions pushback [_name,_title,_side,_flag];
	};
}foreach(_allFactions);

{
	private _name = configName _x;
	_name = [_name] call BIS_fnc_baseWeapon;

	private _short = getText (configFile >> "CfgWeapons" >> _name >> "descriptionShort");

	private _s = _short splitString ":";
	private _caliber = " 5.56";
	private _haslauncher = false;
	if(count _s > 1) then{
		_s = (_s select 1) splitString "x";
		_caliber = _s select 0;
	};

	private _weapon = [_name] call BIS_fnc_itemType;
	private _weaponType = _weapon select 1;

	private _muzzles = getArray (configFile >> "CfgWeapons" >> _name >> "muzzles");
	{
		if((_x find "EGLM") > -1) then {
			_haslauncher = true;
		};
	}foreach(_muzzles);

	([_weaponType,_name,_caliber,_haslauncher,_short] call {
		params ["_weaponType","_name","_caliber","_haslauncher","_short"];

		if (_weaponType == "SubmachineGun") exitWith {
			OT_allSubMachineGuns pushBack _name;
			[4000, 0.5];
		};
		if (_weaponType == "AssaultRifle") exitWith {
			private _cost = [_caliber] call {
				params ["_caliber"];
				if(_caliber == " 5.56" || _caliber == "5.56" || _caliber == " 5.45" || _caliber == " 5.8") exitWith {5000};
				if(_caliber == " 12 gauge") exitWith {4000};
				if(_caliber == " .408") exitWith {6000};
				if(_caliber == " .338 Lapua Magnum" || _caliber == " .303") exitWith {6000};
				if(_caliber == " 9") exitWith {4000}; //9x21mm
				if(_caliber == " 6.5") exitWith {6000};
				if(_caliber == " 7.62") exitWith {6000};
				if(_caliber == " 9.3" || _caliber == "9.3") exitWith {7000};
				if(_caliber == " 12.7") exitWith {8000};
				//I dunno what caliber this is
				5000;
			};
			if(_haslauncher) then {_cost = round(_cost * 1.2)};
			OT_allAssaultRifles pushBack _name;
			if(_cost >= 6000) then {
				OT_allExpensiveRifles pushback _name;
			} else {
				OT_allCheapRifles pushback _name;
			};
			[_cost]
		};
		if (_weaponType ==  "MachineGun") exitWith {
			OT_allMachineGuns pushBack _name;
			[8000];
		};
		if (_weaponType ==  "SniperRifle") exitWith {
			OT_allSniperRifles pushBack _name;
			[7000];
		};
		if (_weaponType ==  "Handgun") exitWith {
			private _cost = _caliber call {
				if(_this == " .408") exitWith {2000};
				if(_this == " .338 Lapua Magnum" || _this == " .303") exitWith {700};
				200
			};
			if(_short != "Metal Detector") then {
				OT_allHandGuns pushBack _name
			};
			[_cost, 1]
		};
		/*if (_weaponType ==  "MissileLauncher") exitWith { This does not work as it picks up aircraft and tank cannons
			OT_allMissileLaunchers pushBack _name;
			[15000];
		};
		if (_weaponType ==  "RocketLauncher") exitWith {
			OT_allRocketLaunchers pushBack _name;
			private _cost = 15000;
			if(_name == "launch_NLAW_F") then {
				_cost=5000
			};
			[_cost]
		};*/
		if (_weaponType ==  "Vest") exitWith {
			if !(_name in ["V_RebreatherB","V_RebreatherIA","V_RebreatherIR","V_Rangemaster_belt"]) then {
				private _cost = 40 + (getNumber(configFile >> "CfgWeapons" >> _name >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Chest" >> "armor") * 20);
				if !(_name in ["V_Press_F","V_TacVest_blk_POLICE"]) then {
					OT_allVests pushBack _name;
					if(_cost > 40) then {
						OT_allProtectiveVests pushback _name;
					};
					if(_cost > 300) then {
						OT_allExpensiveVests pushback _name;
					};
					if(_cost < 300 && _cost > 40) then {
						OT_allCheapVests pushback _name;
					};
				};
				[_cost]
			} else {
				[]
			};
		};
		[]
	}) params [["_cost", 500], ["_steel", 2]];
	if(isServer && isNil {cost getVariable _name}) then {
		cost setVariable [_name,[_cost,0,_steel,0],true];
	};
} foreach (_allWeapons);

OT_allLegalClothing = [];

{
	_allUniforms pushBackUnique (configFile >> "CfgWeapons" >> _x);
}foreach(OT_clothes_guerilla);

{
	private _name = configName _x;
	private _short = getText (configFile >> "CfgWeapons" >> _name >> "descriptionShort");
	private _supply = getText(configfile >> "CfgWeapons" >> _name >> "ItemInfo" >> "containerClass");
	private _mass = getNumber(configfile >> "CfgWeapons" >> _name >> "ItemInfo" >> "mass");
	private _carry = getNumber(configfile >> "CfgVehicles" >> _supply >> "maximumLoad");
	private _cost = round(_mass * 4);

	private _c = _name splitString "_";
	if(_c select (count _c - 1) != "VR") then {
		OT_allClothing pushback _name;

		private _side = _c select 1;
		if((_name == "V_RebreatherIA" || _side == "C" || _side == "I") && (_c select (count _c - 1) != "VR")) then {
			OT_allLegalClothing pushback _name;
		};
		if (isServer && isNil {cost getVariable _name}) then {
			cost setVariable [_name,[_cost,0,0,1],true];
		};
	};
} foreach (_allUniforms);

if(OT_hasWS) then {
	{
		private _mass = getNumber(configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "mass");
		private _cost = round(_mass * 4);
		cost setVariable [_x,[_cost,0,0,1],true];
		OT_allClothing pushbackunique _x;
	}foreach (OT_AdditionalUnforms);
	
	OT_backpacks append [
		["B_AssaultPack_desert_lxWS",20,0,0,1],
		["B_Carryall_desert_lxWS",70,0,0,1],
		["B_Kitbag_desert_lxWS",60,0,0,1],
		["V_lxWS_HarnessO_oli",50,0,0,1],
		['lxWS_H_cloth_5_A',15,0,0.1,0],
		['lxWS_H_cloth_5_B',15,0,0.1,0],
		['lxWS_H_cloth_5_C',15,0,0.1,0],
		['lxWS_H_turban_03_black',15,0,0.1,0],
		['lxWS_H_turban_03_blue',15,0,0.1,0],
		['lxWS_H_turban_03_blue_una',15,0,0.1,0],
		['lxWS_H_turban_03_green',15,0,0.1,0],
		['lxWS_H_turban_03_green_pattern',15,0,0.1,0],
		['lxWS_H_turban_03_orange',15,0,0.1,0],
		['lxWS_H_turban_03_red',15,0,0.1,0],
		['lxWS_H_turban_03_gray',15,0,0.1,0],
		['lxWS_H_turban_03_yellow',15,0,0.1,0]
	];
	
	_append = ["G_Balaclava_blk_lxWS","G_Balaclava_oli_lxWS","G_Balaclava_snd_lxWS","G_Headset_lxWS","G_Combat_lxWS"];
	{
		OT_allFacewear pushBackUnique _x;
		if(isServer && _x != "None" && isNil {cost getVariable _x}) then {
			private _mass = getNumber(configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "mass");
			cost setVariable [_x,[_m*3,0,0,ceil(_m*0.5)],true];
		};
	}foreach(_append);
};

if(OT_hasGM) then {

	private _append = [
		"gm_ge_army_vest_pilot_oli","gm_ge_army_vest_pilot_pads_oli","gm_gc_vest_combatvest3_pol","gm_gc_vest_combatvest3_str","gm_ge_vest_armor_90_flk","gm_ge_vest_armor_90_crew_flk","gm_ge_vest_armor_90_demolition_flk","gm_ge_vest_armor_90_leader_flk","gm_ge_vest_armor_90_machinegunner_flk","gm_ge_vest_armor_90_medic_flk","gm_ge_vest_armor_90_officer_flk","gm_ge_vest_armor_90_rifleman_flk","gm_dk_army_vest_m00_m84","gm_dk_army_vest_m00_blu","gm_dk_army_vest_m00_win","gm_dk_army_vest_m00_wdl","gm_dk_army_vest_m00_m84_machinegunner","gm_dk_army_vest_m00_win_machinegunner","gm_dk_army_vest_m00_m84_rifleman","gm_dk_army_vest_m00_win_rifleman","gm_dk_army_vest_m00_wdl_rifleman","gm_ge_bgs_vest_type18_grn","gm_ge_bgs_vest_type3_oli","gm_ge_vest_sov_armor_80_blk","gm_ge_vest_sov_armor_80_oli", "gm_ge_vest_sov_armor_80_wdl","gm_ge_army_vest_type18_dpm","gm_ge_bgs_vest_type18_blk","gm_ge_bgs_vest_type3_blu","gm_ge_bgs_vest_type3_gry","gm_ge_bgs_vest_type3a1_oli","gm_ge_bgs_vest_type3a1_gry"
	];
	OT_illegalVests append _append;
	
	_append = [
		"gm_dk_headgear_m52_oli","gm_dk_headgear_m52_net_oli","gm_dk_headgear_m52_net_win","gm_dk_headgear_m96_oli","gm_dk_headgear_m96_blu","gm_dk_headgear_m96_cover_m84","gm_dk_headgear_m96_cover_wht","gm_dk_headgear_m96_cover_wdl","gm_ge_bgs_headgear_m35_53_blk","gm_ge_bgs_headgear_m35_53_net_blk","gm_ge_ff_headgear_m35_53_tan","gm_ge_bgs_headgear_m38_72_bgr","gm_ge_bgs_headgear_m38_72_goggles_bgr","gm_ge_headgear_m62","gm_ge_headgear_m62_cover_blu","gm_ge_headgear_m62_net","gm_ge_headgear_m62_win_pap_01","gm_ge_headgear_m62_cover_win","gm_ge_headgear_m62_cover_wdl","gm_ge_headgear_m92_flk","gm_ge_headgear_m92_trp","gm_ge_headgear_m92_cover_blk","gm_ge_headgear_m92_glasses_flk","gm_ge_headgear_m92_glasses_trp","gm_ge_headgear_m92_cover_glasses_blk","gm_ge_headgear_m92_cover_glasses_oli","gm_ge_headgear_m92_cover_glasses_win","gm_ge_headgear_m92_cover_oli","gm_ge_headgear_psh77_oli","gm_ge_bgs_headgear_psh77_cover_smp","gm_ge_bgs_headgear_psh77_cover_up_smp","gm_ge_bgs_headgear_psh77_cover_up_str","gm_ge_headgear_psh77_down_oli","gm_ge_bgs_headgear_psh77_cover_down_smp","gm_ge_bgs_headgear_psh77_cover_down_str","gm_ge_bgs_headgear_psh77_cover_str","gm_pl_army_headgear_wz63_oli","gm_pl_army_headgear_wz63_net_oli","gm_pl_army_headgear_wz67_oli","gm_pl_army_headgear_wz67_net_oli","gm_pl_headgear_wz67_cover_win","gm_gc_army_headgear_m56","gm_gc_army_headgear_m56_cover_blu","gm_gc_army_headgear_m56_net","gm_gc_army_headgear_m56_cover_str","gm_gc_army_headgear_m56_cover_win"
	];
	
	OT_illegalHeadgear append _append;

	OT_AdditionalUnforms =  [
		"gm_ge_civ_uniform_blouse_80_gry","gm_gc_civ_uniform_man_02_80_brn","gm_gc_civ_uniform_man_01_80_blu","gm_dk_army_uniform_soldier_84_m84","gm_dk_army_uniform_soldier_84_oli","gm_ge_uniform_soldier_tshirt_90_flk","gm_ge_uniform_soldier_tshirt_90_trp",
		"gm_ge_uniform_soldier_tshirt_90_oli","gm_dk_army_uniform_soldier_84_win","gm_gc_army_uniform_dress_80_gry","gm_ge_army_uniform_soldier_parka_80_win","gm_gc_army_uniform_soldier_80_blk","gm_gc_army_uniform_soldier_80_str",
		"gm_gc_army_uniform_soldier_80_win", "gm_pl_army_uniform_soldier_80_moro","gm_pl_army_uniform_soldier_80_frog","gm_ge_ff_uniform_man_80_orn","gm_ge_uniform_pilot_commando_blk","gm_xx_army_uniform_fighter_04_grn","gm_xx_army_uniform_fighter_03_brn","gm_xx_army_uniform_fighter_03_blk","gm_xx_army_uniform_fighter_02_wdl","gm_xx_army_uniform_fighter_01_m84","gm_xx_army_uniform_fighter_01_alp","gm_gc_civ_uniform_man_03_80_blu","gm_gc_civ_uniform_man_03_80_grn","gm_gc_civ_uniform_man_03_80_gry","gm_ge_dbp_uniform_suit_80_blu","gm_gc_civ_uniform_man_04_80_blu","gm_gc_civ_uniform_man_04_80_gry"
	];
	{
		private _mass = getNumber(configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "mass");
		private _cost = round(_mass * 4);
		cost setVariable [_x,[_cost,0,0,1],true];
		OT_allClothing pushbackunique _x;
	}foreach (OT_AdditionalUnforms);
	
	OT_allRocketLaunchers append ["gm_m72a3_oli","gm_fim43_oli","gm_pzf3_blk","gm_pzf44_2_oli","gm_pzf84_oli","gm_rpg18_oli","gm_rpg7_wud","gm_rpg7_prp","gm_9k32m_oli"];
	
	OT_backpacks append [
		//hats
		['gm_headgear_foliage_summer_forest_01',15,0,0.1,0],
		['gm_headgear_foliage_summer_grass_01',15,0,0.1,0],
		['gm_ge_headgear_hat_boonie_trp',15,0,0.1,0],
		['gm_ge_headgear_hat_boonie_trp',15,0,0.1,0],
		['gm_ge_headgear_hat_boonie_flk',15,0,0.1,0],
		['gm_dk_headgear_hat_boonie_m84',15,0,0.1,0],
		['gm_ge_headgear_hat_boonie_oli',15,0,0.1,0],
		['gm_ge_headgear_hat_boonie_trp',15,0,0.1,0],
		['gm_ge_headgear_hat_boonie_wdl',15,0,0.1,0],
		//vests
		['gm_gc_army_vest_80_belt_str',5,0,1,0],
		['gm_ge_army_vest_80_belt',5,0,1,0],
		["gm_ge_army_vest_80_bag",20,0,0,1],
		["gm_pl_army_vest_80_rig_gry",20,0,0,1],
		["gm_ge_vest_sov_80_blk",90,0,0,1],
		["gm_ge_vest_sov_80_oli",90,0,0,1],
		["gm_ge_vest_sov_80_wdl",90,0,0,1],
		//backpacks
		['gm_ge_army_backpack_medic_80_oli',20,0,1,0],
		['gm_ge_backpack_satchel_80_blk',20,0,1,0],
		['gm_ge_backpack_satchel_80_san',20,0,1,0],
		["gm_pl_army_backpack_80_oli",60,0,0,1],
		["gm_ge_army_backpack_80_oli",60,0,0,1],
		["gm_dk_army_backpack_73_oli",60,0,0,1],
		["gm_gc_army_backpack_80_assaultpack_empty_str",60,0,0,1],
		["gm_gc_army_backpack_80_assaultpack_lmg_str",60,0,0,1],
		["gm_ge_army_backpack_90_flk",75,0,0,1],
		["gm_ge_army_backpack_90_trp",75,0,0,1],
		["gm_ge_army_backpack_90_blk",75,0,0,1],
		["gm_ge_army_backpack_90_oli",75,0,0,1],
		["gm_ge_army_backpack_90_cover_win",75,0,0,1]
	];
	
	_append = [
		"gm_ge_facewear_acidgoggles","gm_ge_facewear_dustglasses","gm_gc_army_facewear_dustglasses","gm_headgear_foliage_summer_forest_01","gm_headgear_foliage_summer_forest_02","gm_headgear_foliage_summer_forest_03","gm_headgear_foliage_summer_forest_04","gm_ge_facewear_m65","gm_gc_army_facewear_schm41m","gm_headgear_foliage_summer_grass_01","gm_headgear_foliage_summer_grass_02","gm_headgear_foliage_summer_grass_03","gm_headgear_foliage_summer_grass_04","gm_xx_facewear_scarf_01_trp","gm_xx_facewear_scarf_01_flk","gm_xx_facewear_scarf_01_blk","gm_xx_facewear_scarf_01_blu","gm_xx_facewear_scarf_01_pt3","gm_xx_facewear_scarf_01_pt2","gm_xx_facewear_scarf_01_pt1","gm_xx_facewear_scarf_01_frog","gm_xx_facewear_scarf_01_grn","gm_xx_facewear_scarf_01_gry","gm_xx_facewear_scarf_01_m84","gm_xx_facewear_scarf_02_blk","gm_xx_facewear_scarf_02_grn","gm_xx_facewear_scarf_02_oli","gm_xx_facewear_scarf_02_wht","gm_xx_facewear_scarf_01_moro","gm_xx_facewear_scarf_01_oli","gm_xx_facewear_scarf_01_red","gm_xx_facewear_scarf_01_str","gm_xx_facewear_scarf_01_wht","gm_ge_facewear_stormhood_blk","gm_ge_facewear_stormhood_dustglasses_blk","gm_ge_facewear_stormhood_brd","gm_ge_facewear_sunglasses"
	];
	
	{
		OT_allFacewear pushBackUnique _x;
		if(isServer && _x != "None" && isNil {cost getVariable _x}) then {
			private _m = getnumber(configFile >> "CfgGlasses" >> _x >> "mass");
			cost setVariable [_x,[_m*3,0,0,ceil(_m*0.5)],true];
		};
	}foreach(_append);
};

if(OT_has3F) then {
	private _illegalvests = [
	"UK3CB_TKA_O_V_6b23_vydra_3m_ADD","UK3CB_TKA_O_V_6b23_vydra_3m_ADD_02","UK3CB_TKA_O_V_6b23_vydra_3m_TAN","UK3CB_TKA_O_V_6b23_vydra_3m_TAN_02","UK3CB_UN_B_V_6b23_vydra_3m","UK3CB_TKA_O_V_6b23_ml_BLU_02","UK3CB_TKA_O_V_6b23_ml_BLU","UK3CB_TKA_O_V_6b23_ml_NDPM_02","UK3CB_TKA_O_V_6b23_ml_NDPM","UK3CB_TKA_O_V_6b23_ml_Oli_02","UK3CB_TKA_O_V_6b23_ML_6sh92_radio_Oli","UK3CB_TKA_O_V_6b23_ml_6sh92_vog_Oli","UK3CB_TKA_O_V_6b23_ml_crewofficer_Oli","UK3CB_TKA_O_V_6b23_ml_crew_Oli","UK3CB_TKA_O_V_6b23_ml_engineer_Oli","UK3CB_TKA_O_V_6b23_medic_Oli","UK3CB_TKA_O_V_6b23_ml_Oli","UK3CB_TKA_O_V_6b23_ml_sniper_Oli","UK3CB_TKP_O_V_6b23_ml_BLK","UK3CB_TKP_O_V_6b23_ML_6sh92_radio_BLK","UK3CB_TKP_O_V_6b23_medic_BLK","UK3CB_CPD_B_V_6b23_ml_BLU","UK3CB_CPD_B_V_6b23_ml_BLU_02","UK3CB_ADP_B_V_6b23_ml_TAN","UK3CB_ADP_B_V_6b23_ML_6sh92_radio_TAN","UK3CB_ADP_B_V_6b23_medic_TAN","UK3CB_TKA_O_V_6b23_ml_Surpat_02","UK3CB_TKA_O_V_6b23_ML_6sh92_radio_Surpat","UK3CB_TKA_O_V_6b23_ml_6sh92_vog_Surpat", "UK3CB_TKA_O_V_6b23_ml_engineer_Surpat","UK3CB_TKA_O_V_6b23_medic_Surpat","UK3CB_TKA_O_V_6b23_ml_Surpat","UK3CB_TKA_O_V_6b23_ml_sniper_Surpat","UK3CB_TKA_O_V_6b23_ML_6sh92_radio_Oli_ADPM","UK3CB_TKA_O_V_6b23_ml_6sh92_vog_Oli_ADPM","UK3CB_TKA_O_V_6b23_ml_Oli_ADPM","UK3CB_TKA_O_V_6b23_ml_Oli_TKA_Brush","UK3CB_TKA_O_V_6b23_ML_6sh92_radio_Oli_TKA_Brush","UK3CB_TKA_O_V_6b23_ml_6sh92_vog_Oli_TKA_Brush","UK3CB_UN_B_V_6b23_ml_02","UK3CB_UN_B_V_6b23_ML_6sh92_radio","UK3CB_UN_B_V_6b23_ml_6sh92_vog","UK3CB_UN_B_V_6b23_ml_crewofficer","UK3CB_UN_B_V_6b23_ml_crew","UK3CB_UN_B_V_6b23_ml_engineer","UK3CB_UN_B_V_6b23_medic","UK3CB_UN_B_V_6b23_ml_01","UK3CB_ARD_B_V_6b5_Desert","UK3CB_ARD_B_V_6b5_Rifleman_Desert","UK3CB_ARD_B_V_6b5_Medic_Desert","UK3CB_ARD_B_V_6b5_Officer_Desert","UK3CB_ARD_B_V_6b5_Sniper_Desert","UK3CB_V_PlateCarrier1_brn","UK3CB_V_PlateCarrier1_des","V_PlateCarrier1_rgr","UK3CB_V_PlateCarrier1_khk","UK3CB_V_PlateCarrier1_oli","UK3CB_V_PlateCarrier1_win","UK3CB_V_PlateCarrier2_brn","UK3CB_V_PlateCarrier2_des","UK3CB_V_PlateCarrier2_khk","UK3CB_V_PlateCarrier2_oli","UK3CB_V_PlateCarrier2_win","UK3CB_TKA_B_V_Carrier_Tan","UK3CB_AAF_O_V_Eagle_CREW_DIGI_BLK","UK3CB_AAF_O_V_Eagle_CREW_DIGI_BRN","UK3CB_AAF_O_V_Eagle_CREW_DIGI_GRN","UK3CB_AAF_O_V_Eagle_EOD_DIGI_BRN","UK3CB_AAF_O_V_Eagle_EOD_DIGI_GRN","UK3CB_AAF_O_V_Eagle_GL_DIGI_BRN","UK3CB_AAF_O_V_Eagle_GL_DIGI_GRN","UK3CB_AAF_O_V_Eagle_MG_DIGI_BRN","UK3CB_AAF_O_V_Eagle_MG_DIGI_GRN","UK3CB_AAF_O_V_Eagle_MED_DIGI_BRN","UK3CB_AAF_O_V_Eagle_MED_DIGI_GRN","UK3CB_AAF_O_V_Eagle_RIF_DIGI_BRN","UK3CB_AAF_O_V_Eagle_RIF_DIGI_GRN","UK3CB_AAF_O_V_Eagle_SL_DIGI_BRN","UK3CB_AAF_O_V_Eagle_SL_DIGI_GRN","UK3CB_AAF_B_V_Vest_DIGI_GRN","UK3CB_AAF_B_V_MD_Vest_DIGI_GRN","UK3CB_AAF_B_V_CREW_Vest_DIGI_GRN","UK3CB_AAF_B_V_MG_Vest_DIGI_GRN","UK3CB_AAF_B_V_MK_Vest_DIGI_GRN","UK3CB_AAF_B_V_RFL_Vest_DIGI_GRN","UK3CB_AAF_B_V_SL_Vest_DIGI_GRN","UK3CB_MDF_B_V_TacVest_LIZ","UK3CB_V_Pilot_Vest","UK3CB_V_Pilot_Vest_Black","UK3CB_MDF_B_V_TacVest_Navy_LIZ","UK3CB_MDF_B_V_Vest_TAN","UK3CB_MDF_B_V_CREW_Vest_TAN","UK3CB_CW_US_B_LATE_V_PASGT_Crew_Vest","UK3CB_CW_US_B_LATE_V_PASGT_Medic_Vest","UK3CB_CW_US_B_LATE_V_PASGT_MG_Vest","UK3CB_CW_US_B_LATE_V_PASGT_Rif_Vest"
	];
	OT_illegalVests append _illegalvests;
	OT_AdditionalUnforms = [];
	//UK3CB_TKP_I_V_6Sh92_Blk, UK3CB_V_Chicom_Brown
	{
		private _mass = getNumber(configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "mass");
		private _cost = round(_mass * 4);
		cost setVariable [_x,[_cost,0,0,1],true];
		OT_allClothing pushbackunique _x;
	}foreach (OT_AdditionalUnforms);
};

{
	private _name = configName _x;
	private _cost = 20 + (getNumber(configFile >> "CfgWeapons" >> _name >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") * 30);
	if(_cost > 20) then {
		OT_allHelmets pushback _name;
	}else{
		OT_allHats pushback _name;
	};
	if(isServer && isNil {cost getVariable _name}) then {
		cost setVariable [_name,[_cost,0,1,0],true];
	};
} foreach (_allHelmets);

{
	private _name = configName _x;
	private _m = getNumber(_x >> "mass");
	if(_name isKindOf ["Default",configFile >> "CfgMagazines"] && (_name != "NLAW_F") && !(_name isKindOf ["VehicleMagazine",configFile >> "CfgMagazines"])) then {
		private _cost = round(_m * 4);
		private _desc = getText(_x >> "descriptionShort");
		if((_desc find ".408") > -1) then {
			_cost = _cost * 4;
		};
		private _exp = false;
		private _steel = 0.1;
		private _plastic = 0;
		if(getNumber(_x >> "ace_explosives_Placeable") == 1) then {
			_exp = true;
		};
		if((_desc find "Smoke") > -1) then {
			_cost = round(_m * 0.5);
		}else{
			if((_desc find "Grenade") > -1) then {
				_cost = round(_m * 2);
				_exp = true;
			};
		};
		if((_desc find "Flare") > -1 || (_desc find "flare") > -1) then {
			_cost = round(_m * 0.6);
			_exp = false;
		};

		if(_name isEqualTo OT_ammo_50cal) then {_cost = 500};

		if(_exp) then {
			_steel = 0;
			_plastic = round(_m * 0.5);
			OT_allExplosives pushback _name;
			OT_explosives pushback [_name,_cost,0,_steel,_plastic];
		}else{
			OT_allMagazines pushback _name;
		};
		if(isServer && isNil {cost getVariable _name}) then {
			cost setVariable [_name,[_cost,0,_steel,_plastic],true];
		};
	};
} foreach (_allAmmo);

{
	private _name = configName _x;
	private _m = getNumber(_x >> "ItemInfo" >> "mass");
	if(getNumber(_x >> "ace_explosives_Range") > 1000) then {
		_m = _m * 10;
	};
	OT_allDetonators pushback _name;
	OT_detonators pushback [_name,_m,0,0.1,0];
	if(isServer && isNil {cost getVariable _name}) then {
		cost setVariable [_name,[_m,0,0.1,0],true];
	};
} foreach (_allDetonators);

if(isServer) then {
	//Remaining vehicle costs
	private _cfgVeh = configFile >> "cfgVehicles";
	{
		private _name = configName _x;
		if((_name isKindOf "AllVehicles") && !(_name in OT_allVehicles)) then {
			private _multiply = 80;
			if(_name isKindOf "Air") then {_multiply = 700}; //Planes/Helis have less armor

			private _clsCfg = _cfgVeh >> _name;
			private _cost = getNumber (_clsCfg >> "armor") * _multiply;
			private _steel = round(getNumber (_clsCfg >> "armor") * 0.5);
			private _numturrets = count("!((configName _x) select [0,5] == ""Cargo"") && !((count getArray (_x >> ""magazines"")) isEqualTo 0)" configClasses(_clsCfg >> "Turrets"));
			private _plastic = 2;
			if(_numturrets > 0) then {
				_cost = _cost + (_numturrets * _cost * 10);
				_steel = _steel + 50;
				_plastic = 5 * _numturrets;

				if(_name isKindOf "Air") then {_cost = _cost * 2};
			};
			if(isNil {cost getVariable _name}) then {
				cost setVariable [_name,[_cost,0,_steel,_plastic],true];
			};
		};
	} foreach (_allVehicles);
};

OT_attachments = [];
{
	private _name = configName _x;
	private _cost = 75;
	private _t = getNumber(configFile >> "CfgWeapons" >> _name >> "ItemInfo" >> "type");
	if(_t isEqualTo 302) then {
		//Bipods
		_cost = 150;
	};
	if(_t isEqualTo 101) then {
		//Suppressors
		_cost = 350;
	};
	if(isServer && isNil {cost getVariable _name}) then {
		cost setVariable [_name,[_cost,0,0,0.25],true];
	};
	OT_allAttachments pushback _name;
	OT_attachments pushback [_name,[_cost,0,0,0.25]];
} foreach (_allAttachments);

{
	private _name = configName _x;
	private _allModes = "true" configClasses ( configFile >> "cfgWeapons" >> _name >> "ItemInfo" >> "OpticsModes" );
	private _cost = 50;
	{
		private _mode = configName _x;
		private _max = getNumber (configFile >> "cfgWeapons" >> _name >> "ItemInfo" >> "OpticsModes" >> _mode >> "distanceZoomMax");
		private _mul = 0.1;
		if(_mode == "NVS") then {_mul = 0.2};
		if(_mode == "TWS") then {_mul = 0.5};
		_cost = _cost + floor(_max * _mul);
	}foreach(_allModes);

	OT_allOptics pushback _name;
	if(isServer && isNil {cost getVariable _name}) then {
		cost setVariable [_name,[_cost,0,0,0.5],true];
	};
} foreach (_allOptics);

OT_allRocketLaunchers append [
	"launch_RPG32_F","launch_I_Titan_F","launch_O_Titan_F","launch_B_Titan_F","launch_O_Titan_short_F","launch_I_Titan_short_F","launch_B_Titan_short_F","launch_NLAW_F","launch_RPG32_ghex_F","launch_RPG7_F","launch_O_Titan_ghex_F",
	"launch_B_Titan_tna_F","launch_O_Titan_short_ghex_F","launch_B_Titan_short_tna_F","launch_RPG32_green_F","launch_I_Titan_eaf_F","launch_B_Titan_olive_F","launch_MRAWS_green_rail_F","launch_MRAWS_olive_rail_F","launch_MRAWS_sand_rail_F",
	"launch_MRAWS_green_F","launch_MRAWS_olive_F","launch_MRAWS_sand_F","launch_O_Vorona_brown_F","launch_O_Vorona_green_F","rhs_weap_igla","rhs_weap_rpg18","rhs_weap_rpg26","rhs_weap_rpg7","rhs_weap_rshg2","rhs_weap_panzerfaust60",
	"rhs_weap_rpg75","rhs_weap_fgm148","rhs_weap_fim92","rhs_weap_M136","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_maaws","rhs_weap_m72a7","rhs_weap_smaw","rhs_weap_smaw_green","rhs_weap_m80"
];

{
	OT_allWeapons pushbackUnique _x;
}foreach(OT_allSubMachineGuns + OT_allAssaultRifles + OT_allMachineGuns + OT_allSniperRifles + OT_allHandGuns + OT_allMissileLaunchers + OT_allRocketLaunchers);

OT_legal = ["hgun_Pistol_Signal_F","ACE_FakePrimaryWeapon","eo_flashlight","rhs_weap_rsp30_white","rhs_weap_rsp30_green","rhs_weap_rsp30_red","rhs_weap_tr8","ACE_VMH3","ACE_VMM3","ACE_Flashlight_Maglite_ML300L","","Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow","Chemlight_blue","ACE_Chemlight_Orange","ACE_Chemlight_White",
"ACE_Chemlight_HiRed","ACE_Chemlight_HiYellow","ACE_Chemlight_HiWhite","ACE_Chemlight_HiBlue","ACE_Chemlight_HiGreen","ACE_Chemlight_UltraHiOrange","ACE_Chemlight_IR"];//Gear made legal

if(isServer) then {
	cost setVariable ["CIV",[100,0,0,0],true];
	cost setVariable ["WAGE",[5,0,0,0],true];
	cost setVariable [OT_item_UAV,[200,0,0,1],true];
	cost setVariable ["FUEL",[5,0,0,0],true];
};
//populate the cost gamelogic with the above data so it can be accessed quickly

OT_crim_Backpacks = [];

{
	if(isServer && isNil {cost getVariable (_x select 0)}) then {
		cost setVariable [_x select 0,_x select [1,4],true];
	};
	OT_allBackpacks pushBack (_x select 0);
	
	if(getnumber(configFile >> "CfgVehicles" >> (_x select 0) >> "maximumLoad") != 0) then {
		OT_crim_backpacks pushback (_x select 0);
	};
}foreach(OT_backpacks);

{
	if(isServer && isNil {cost getVariable (_x select 0)}) then {
		cost setVariable [_x select 0,_x select [1,4],true];
	};
	OT_allStaticBackpacks pushBack (_x select 0);
}foreach(OT_staticBackpacks);

{
	if(isServer && isNil {cost getVariable (_x select 0)}) then {
		cost setVariable [_x select 0,_x select [1,4],true];
	};
	OT_allBoats pushBack (_x select 0);
}foreach(OT_boats);

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
		/*["Land_Cargo_House_V4_F",[0,0,0],0,1,0,[],"","",true,false],
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

OT_Clothingstore = OT_allClothing + ["V_RebreatherIA"] + OT_allGlasses + OT_allGoggles + OT_allFacewear;
OT_Clothingstore = [OT_Clothingstore,[],{tolower((_x) call OT_fnc_anythinggetname)},"ASCEND"] call BIS_fnc_SortBy;

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

OT_loadingMessages = ["Adding Hidden Agendas","Adjusting Bell Curves","Aesthesizing Industrial Areas","Aligning Covariance Matrices","Applying Feng Shui Shaders","Applying Theatre Soda Layer","Asserting Packed Exemplars","Attempting to Lock Back-Buffer","Binding Sapling Root System","Breeding Fauna","Building Data Trees","Bureacritizing Bureaucracies","Calculating Inverse Probability Matrices","Calculating Llama Expectoration Trajectory","Calibrating Blue Skies","Charging Ozone Layer","Coalescing Cloud Formations","Cohorting Exemplars","Collecting Meteor Particles","Compounding Inert Tessellations","Compressing Fish Files","Computing Optimal Bin Packing","Concatenating Sub-Contractors","Containing Existential Buffer","Debarking Ark Ramp","Debunching Unionized Commercial Services","Deciding What Message to Display Next","Decomposing Singular Values","Decrementing Tectonic Plates","Deleting Ferry Routes","Depixelating Inner Mountain Surface Back Faces","Depositing Slush Funds","Destabilizing Economic Indicators","Determining Width of Blast Fronts","Deunionizing Bulldozers","Dicing Models","Diluting Livestock Nutrition Variables","Downloading Satellite Terrain Data","Exposing Flash Variables to Streak System","Extracting Resources","Factoring Pay Scale","Fixing Election Outcome Matrix","Flood-Filling Ground Water","Flushing Pipe Network","Gathering Particle Sources","Generating Jobs","Gesticulating Mimes","Graphing Whale Migration","Hiding Willio Webnet Mask","Implementing Impeachment Routine","Increasing Accuracy of RCI Simulators","Increasing Magmafacation","Initializing Rhinoceros Breeding Timetable","Initializing Robotic Click-Path AI","Inserting Sublimated Messages","Integrating Curves","Integrating Illumination Form Factors","Integrating Population Graphs","Iterating Cellular Automata","Lecturing Errant Subsystems","Mixing Genetic Pool","Modeling Object Components","Mopping Occupant Leaks","Normalizing Power","Obfuscating Quigley Matrix","Overconstraining Dirty Industry Calculations","Partitioning City Grid Singularities","Perturbing Matrices","Pixellating Nude Patch","Polishing Water Highlights","Populating Lot Templates","Preparing Sprites for Random Walks","Prioritizing Landmarks","Projecting Law Enforcement Pastry Intake","Realigning Alternate Time Frames","Reconfiguring User Mental Processes","Relaxing Splines","Removing Road Network Speed Bumps","Removing Texture Gradients","Removing Vehicle Avoidance Behavior","Resolving GUID Conflict","Reticulating Splines","Retracting Phong Shader","Retrieving from Back Store","Reverse Engineering Image Consultant","Routing Neural Network Infanstructure","Scattering Rhino Food Sources","Scrubbing Terrain","Searching for Llamas","Seeding Architecture Simulation Parameters","Sequencing Particles","Setting Advisor ","Setting Inner Deity ","Setting Universal Physical Constants","Sonically Enhancing Occupant-Free Timber","Federalizing Flag Packages","Speculating Stock Market Indices","Splatting Transforms","Stratifying Ground Layers","Sub-Sampling Water Data","Synthesizing Gravity","Synthesizing Wavelets","Time-Compressing Simulator Clock","Unable to Reveal Current Activity","Weathering Buildings","Zeroing Crime Network"];

//Find markers
OT_ferryDestinations = [];
OT_NATO_control = [];
OT_regions = [];
{
	if((_x select [0,12]) isEqualTo "destination_") then {OT_ferryDestinations pushback _x};
	if((_x select [0,8]) isEqualTo "control_") then {OT_NATO_control pushback _x};
	if((_x select [0,7]) isEqualTo "island_") then {OT_regions pushback _x};
	if((_x select [0,7]) isEqualTo "region_") then {OT_regions pushback _x};
}foreach(allMapMarkers);

OT_cigsArray = ["EWK_Cigar1", "EWK_Cigar2", "EWK_Cig1", "EWK_Cig2", "EWK_Cig3", "EWK_Cig4", "EWK_Glasses_Cig1", "EWK_Glasses_Cig2", "EWK_Glasses_Cig3", "EWK_Glasses_Cig4", "EWK_Glasses_Shemag_GRE_Cig6", "EWK_Glasses_Shemag_NB_Cig6", "EWK_Glasses_Shemag_tan_Cig6", "EWK_Cig5", "EWK_Glasses_Cig5", "EWK_Cig6", "EWK_Glasses_Cig6", "EWK_Shemag_GRE_Cig6", "EWK_Shemag_NB_Cig6", "EWK_Shemag_tan_Cig6", "murshun_cigs_cig0", "murshun_cigs_cig1", "murshun_cigs_cig2", "murshun_cigs_cig3", "murshun_cigs_cig4"];

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


if(isServer) then {
	missionNamespace setVariable ["OT_varInitDone",true,true];
};
