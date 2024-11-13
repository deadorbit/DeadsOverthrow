if !(isServer) exitWith {};

[] call OT_fnc_initPrices;

//Add items to ACE foritfy choices
[
	independent, 100, 
	[["Land_BagFence_Short_F",5],
	["Land_BagFence_Round_F",5],
	["Land_Plank_01_4m_F",5],
	["Land_SlumWall_01_s_2m_F",5],
	["Land_BagFence_Long_F",10],
	["Land_SandbagBarricade_01_hole_F",15],
	["Land_Mil_ConcreteWall_F",15],
	["Land_Barricade_01_4m_F",20],
	["Land_BagBunker_Small_F",25]]
] call acex_fortify_fnc_registerObjects;

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
call compile preprocessFileLineNumbers "data\customlocations.sqf";

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

if(OT_has_GM) then {
	OT_ForcedItemsGeneral append ["gm_watch_kosei_80","gm_ge_army_conat2","gm_gc_compass_f73"];
	OT_ForcedItemsElectronics append ["gm_photocamera_01_blk"];
	OT_ForcedItemsSurplus append ["gm_df7x40_blk","gm_fero51_oli","gm_ferod16_des","gm_ferod16_oli","gm_ferod16_win","gm_lp7_oli","gm_lpr1_oli"];
};

OT_items = [];
OT_allItems = [];
OT_craftableItems = [];

//OT_buyableVeh = [];

//call OT_fnc_detectItems;

OT_notifyHistory = [];

/*
OT_staticBackpacks = [
	["I_HMG_01_high_weapon_F",26000,1,0,1],
	["I_GMG_01_high_weapon_F",35000,1,0,1],
	["I_HMG_01_support_high_F",150,1,0,0],
	["I_Mortar_01_weapon_F",75000,1,0,1],
	["I_Mortar_01_support_F",100,1,0,0],
	["I_AT_01_weapon_F",75000,1,0,1],
	["I_AA_01_weapon_F",75000,1,0,1],
	["I_HMG_01_support_F",150,1,0,0]
];
*/


//Detecting vehicles && weapons

OT_boats = [
	["C_Scooter_Transport_01_F",500,1,0,1],
	["C_Boat_Civil_01_rescue_F",1000,1,1,1],
	["C_Boat_Transport_02_F",3000,1,0,1]
];
OT_helis = [
	["rhs_uh1h_idap",150000,0,45,10],
	["C_IDAP_Heli_Transport_02_F",250000,0,45,10]
];

OT_gunDealerHouses = OT_spawnHouses;

/*
	private _allShops = "getNumber ( _x >> ""ot_isShop"" ) isEqualTo 1" configClasses ( configFile >> "CfgVehicles" );
	OT_shops = _allShops apply {configName _x};
*/
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

private _allVehs = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
	{ (getArray ( _x >> ""threat"" ) select 0) > 0}
	&&
    { (getText ( _x >> ""vehicleClass"" ) isEqualTo ""Car"") || (getText ( _x >> ""vehicleClass"" ) isEqualTo ""Support"") || (getText ( _x >> ""vehicleClass"" ) isEqualTo ""Armored"")})
" configClasses ( configFile >> "cfgVehicles" );

{
	private _cls = configName _x;
	private _price = (cost getVariable _cls);
	if (isNil{_price}) then {
		[format["Missing price data for %1, skipping.", _cls], "STARTUP_SERVER"] call OT_fnc_debugLog;
	}else{
		if ([_cls] call DEDF_fnc_isCivilianVeh) then {
			OT_vehicles pushback _cls;
			_allCivVehs pushBack _cls;
		}else{
			OT_allVehicleThreats pushBackUnique _cls;
		};
	};
	OT_allVehicles pushback _cls;
}foreach(_allVehs);

/*
if(OT_has_GM) then {
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
*/

//Determine aircraft threats
_allAir = "
    ( getNumber ( _x >> ""scope"" ) > 0
    &&
	{ (getArray ( _x >> ""threat"" ) select 0) >= 0.5}
	&&
    { getText ( _x >> ""vehicleClass"" ) isEqualTo ""Air""})
" configClasses ( configFile >> "cfgVehicles" );
{
	private _cls = configName _x;
	private _price = (cost getVariable _cls);
	private _isCivilian = (getText ( _x >> "faction" ) isEqualTo "CIV_F");

	if(isNil{_price}) then {
		[format["Missing price data for %1, skipping.", _cls], "STARTUP_SERVER"] call OT_fnc_debugLog;
	}else{
		OT_helis pushback [_cls, _price, true];
		_allCivVehs pushBack _cls;
		OT_allVehicles pushback _cls;
	};
	
	if !(_isCivilian) then {
		if(_cls isKindOf "Plane") then {
			OT_allPlaneThreats pushback _cls;
		}else{
			OT_allHeliThreats pushback _cls;
		};
	};
}foreach(_allAir);
/*
//Chinook (unarmed) special case for production logistics
OT_allVehicles pushBackUnique "B_Heli_Transport_03_unarmed_F";
*/

/*
	_allCfgWeapons = "(
		getNumber ( _x >> ""scope"" ) isEqualTo 2 
		&& 
		{ getText ( _x >> ""simulation"" ) isEqualTo ""Weapon""} 
		&& 
		{NOT ((configname _x) iskindof ['CannonCore',( configFile >> 'cfgWeapons' )])}
		&&
		{NOT ((configname _x) iskindof ['MissileLauncher',( configFile >> 'cfgWeapons' )])}	
	)" configClasses ( configFile >> "cfgWeapons" );
*/

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
OT_allHelmets = [];
OT_allHats = [];
OT_allAttachments = [];
private _allExplosives = [];
OT_explosives = [];
OT_detonators = [];
OT_allDetonators = [];
OT_allGlasses = [];
OT_allFacewear = [];
OT_allGoggles = [];

/*
OT_allBLURifles = [];
OT_allBLUMachineGuns = [];
OT_allBLUSniperRifles = [];
OT_allBLUGLRifles = [];
OT_allBLULaunchers = [];
OT_allBLUPistols = OT_NATO_WepPistol;
OT_allBLUVehicles = [];
OT_allBLUOffensiveVehicles = [];
OT_allBLURifleMagazines = [];
OT_allmuzzles = [];
*/

OT_JammingPos = []; //Keep track of where to jam drones

/*
{
	_name = configname _x;
	OT_allmuzzles pushback _name;
	if(isServer && _name != "None" && isNil {cost getVariable _name}) then {
			cost setVariable [_name,[50,0,0,0,0],true];
	};
}foreach(_allmuzzles);
*/

private _allCfgGlasses = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2 )
" configClasses ( configFile >> "CfgGlasses" );
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
}foreach(_allCfgGlasses);

[] call OT_fnc_initFactions;
publicVariable "OT_allFactions";

/*
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
		};
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
} foreach (_allCfgWeapons);
*/
OT_allLegalClothing = [];
private _allUniforms = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { getNumber ( _x >> ""ItemInfo"" >> ""type"" ) isEqualTo 801})
" configClasses ( configFile >> "cfgWeapons" );

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
publicVariable "OT_allLegalClothing";
publicVariable "OT_allClothing";



/*
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
				_allExplosives pushback _name;
				OT_explosives pushback [_name,_cost,0,_steel,_plastic];
			}else{
				_allMagazines pushback _name;
			};
			if(isServer && isNil {cost getVariable _name}) then {
				cost setVariable [_name,[_cost,0,_steel,_plastic],true];
			};
		};
	}foreach(_allAmmo);
*/

/*
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
*/

/*
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
*/

/*
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

		_allOptics pushback _name;
		if(isServer && isNil {cost getVariable _name}) then {
			cost setVariable [_name,[_cost,0,0,0.5],true];
		};
	} foreach (_allCfgOptics);

	OT_allRocketLaunchers append [
		"launch_RPG32_F","launch_I_Titan_F","launch_O_Titan_F","launch_B_Titan_F","launch_O_Titan_short_F","launch_I_Titan_short_F","launch_B_Titan_short_F","launch_NLAW_F","launch_RPG32_ghex_F","launch_RPG7_F","launch_O_Titan_ghex_F",
		"launch_B_Titan_tna_F","launch_O_Titan_short_ghex_F","launch_B_Titan_short_tna_F","launch_RPG32_green_F","launch_I_Titan_eaf_F","launch_B_Titan_olive_F","launch_MRAWS_green_rail_F","launch_MRAWS_olive_rail_F","launch_MRAWS_sand_rail_F",
		"launch_MRAWS_green_F","launch_MRAWS_olive_F","launch_MRAWS_sand_F","launch_O_Vorona_brown_F","launch_O_Vorona_green_F","rhs_weap_igla","rhs_weap_rpg18","rhs_weap_rpg26","rhs_weap_rpg7","rhs_weap_rshg2","rhs_weap_panzerfaust60",
		"rhs_weap_rpg75","rhs_weap_fgm148","rhs_weap_fim92","rhs_weap_M136","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_maaws","rhs_weap_m72a7","rhs_weap_smaw","rhs_weap_smaw_green","rhs_weap_m80"
	];
*/

//populate the cost gamelogic with the above data so it can be accessed quickly
/*
{
	if(isServer && isNil {cost getVariable (_x select 0)}) then {
		cost setVariable [_x select 0,_x select [1,4],true];
	};
	_allStaticBackpacks pushBack (_x select 0);
}foreach(OT_staticBackpacks);
*/

OT_Clothingstore = OT_allClothing + ["V_RebreatherIA"] + OT_allGlasses + OT_allGoggles + OT_allFacewear;
OT_Clothingstore = [OT_Clothingstore,[],{tolower((_x) call OT_fnc_anythinggetname)},"ASCEND"] call BIS_fnc_SortBy;
publicVariable "OT_Clothingstore";


OT_cigsArray = ["EWK_Cigar1", "EWK_Cigar2", "EWK_Cig1", "EWK_Cig2", "EWK_Cig3", "EWK_Cig4", "EWK_Glasses_Cig1", "EWK_Glasses_Cig2", "EWK_Glasses_Cig3", "EWK_Glasses_Cig4", "EWK_Glasses_Shemag_GRE_Cig6", "EWK_Glasses_Shemag_NB_Cig6", "EWK_Glasses_Shemag_tan_Cig6", "EWK_Cig5", "EWK_Glasses_Cig5", "EWK_Cig6", "EWK_Glasses_Cig6", "EWK_Shemag_GRE_Cig6", "EWK_Shemag_NB_Cig6", "EWK_Shemag_tan_Cig6", "murshun_cigs_cig0", "murshun_cigs_cig1", "murshun_cigs_cig2", "murshun_cigs_cig3", "murshun_cigs_cig4"];

missionNamespace setVariable ["OT_varInitDone", true, true];

//Hash some data

OT_allCivVehs = createHashMap;
{
	OT_allCivVehs set [_x, true];
}foreach(OT_vehicles + OT_boats + OT_helis);
publicVariable "OT_allCivVehs";

private _allHelmets = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { getNumber ( _x >> ""ItemInfo"" >> ""type"" ) isEqualTo 605})
" configClasses ( configFile >> "cfgWeapons" );
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
}foreach(_allHelmets);
publicVariable "OT_allHelmets";
publicVariable "OT_allHats";