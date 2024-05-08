
HCEnabled = false;
AllowAirD = false;

OT_nation = "Altis";
OT_saveName = "Overthrow.altisDOT.001";

OT_tutorial_backstoryText = "Altis, the main island of the Republic of Altis and Stratis, is located in the Mediterranean Sea to the east of Malta. As of 2040, Altis is currently under occupation by NATO forces following a brutal civil war a half decade prior, and the nation is still recovering. NATO originally occupied the country under the promise of a complete withdrawal of forces and return to local democratic rule; despite this, NATO soldiers still occupy the island's military installations. The economy continues to stagnate and citizens are becoming increasingly angry at the lack of local autonomy.";
OT_startDate = [2040,7,14,8,00];

OT_startCameraPos = [11646.6,6406.52,2];
OT_startCameraTarget = [13808.2,6387.16,0];

//Used to control updates and persistent save compatability. When these numbers go up, that section will be reinitialized on load if required. (ie leave them alone)
OT_economyVersion = 5;
OT_NATOversion = 5;
OT_CRIMversion = 2;

OT_faction_NATO = "BLU_F";
OT_spawnFaction = "rhsgref_faction_nationalist"; //This faction will have a rep in spawn town

OT_flag_NATO = "Flag_NATO_F";
OT_flag_NATO_txt = "a3\data_f\flags\flag_nato_co.paa";
OT_flag_CRIM = "Flag_Syndikat_F";
OT_flag_Crim_txt = "\A3\Data_F_Enoch\Flags\flag_looters_co.paa";
OT_flag_IND = "Flag_Altis_F";
OT_flag_IND_txt = "\A3\Data_F\Flags\flag_Altis_CO.paa";
OT_flagImage = "\A3\ui_f\data\map\markers\flags\Altis_ca.paa";
OT_flagMarker = "flag_Altis";

OT_populationMultiplier = 1.2; //Used to tweak populations per map

OTForcedCarShops = [];//Mainly for Livonia, to fix broken carshop spawns

OT_hasWS = isClass(configfile >> "CfgPatches" >> "data_f_lxWS");//Check if Western Sahara DLC is downloaded
OT_hasNI = isClass(configfile >> "CfgPatches" >> "hlcweapons_core"); //Nation Indepedent Arsenal
OT_hasFW = isClass(configFile >> "CfgFunctions" >> "FreeWorldArmoury"); //The Free World Armoury
OT_has3F = isClass(configFile >> "CfgPatches" >> "UK3CB_Factions_Vehicles_Common"); //3cb factions
OT_hasCW = isClass(configFile >> "CfgPatches" >> "CUP_Weapons_Items"); //CUP-Weapons
OT_hasGM = isclass(configFile >> "CfgPatches" >> "gm_core");

//Building templates
//To generate these templates:
//1. Open Arma editor, choose VR map
//2. Add the building you want to make a template for, set its location and rotation to 0,0,0
//3. Add furniture objects
//4. Add a player (any unit), Play the Scenario
//5. Run this in console: [getPos player, 50, true] call BIS_fnc_ObjectsGrabber
//6. Copy the results, paste them here and remove any extraneous items (ie the building, Logic, babe_helper, Signs)


/*
private _b = getpos player nearObjects["house",50] select 0; 
[getpos _b,20,true] call BIS_fnc_Objectsgrabber;
*/

/*
if (isnil{a}) then {
	a = [];
};

{
	deletevehicle _x;
}foreach(a);


_p = nearestObjects [player, ["house"], 200] select 0;


_o = [["Land_CampingChair_V2_F",[-1.31217,0.833368,1.000994682],1.96952e-005,1,0,[0.000697244,0.000643217],"","",true,false], 
["B_CargoNet_01_ammo_F",[1.13286,0.557494,1.0010004],1.46614e-007,1,0,[0.000208238,-6.34361e-005],"","",true,false], 
["OfficeTable_01_new_F",[-1.46406,-0.05653,1.000999451],179.844,1,0,[-6.84557e-005,-7.02947e-005],"","",true,false], 
["Land_PlasticCase_01_small_olive_F",[0.90468,3.88174,1.0010004],271.907,1,0,[-8.30356e-005,0.000116651],"","",true,false], 
["Land_Workbench_01_F",[-1.50018,3.89477,1.00100088],360,1,0,[0.000224787,3.48339e-005],"","",true,false], 
["MapBoard_Malden_F",[2.55526,3.54899,0.50323486],41.7074,1,0,[-0.327625,-0.000496464],"","",true,false]];

a = [getPOSATL _P, getdir _p, _o, 0] call BIS_fnc_objectsMapper;
*/

OT_shopBuildings = [//Building classname, template, which buildingpos shopkeeper should spawn at, rotation offset
	["Land_FuelStation_01_shop_F",[],4,180],
	["Land_i_Shop_01_V1_F",[],4,180],
	["Land_u_Shop_01_V1_F",[],4,180],
	["Land_i_Shop_01_V2_F",[],4,180],
	["Land_i_Shop_01_V3_F",[],4,180],
	["Land_i_Shop_02_V1_F",[],0,90],
	["Land_i_Shop_02_V2_F",[],0,90],
	["Land_i_Shop_02_V3_F",[],0,90],
	["Land_u_Shop_02_V1_F",[],0,90]
];
OT_carShopBuildings = [
	["Land_CarService_F",[]],
	["Land_FuelStation_01_workshop_F",[]]
];

OT_spawnHouseBuildings = [
	["Land_i_House_Small_02_V3_F",[
		["Land_PlasticCase_01_small_olive_F",[1.636964,-0.451388,1.000999451],178.086,1,0,[0.00256907,0.073803],"","",true,false], 
		["B_CargoNet_01_ammo_F",[2.47907,-1.99943,2.000998974],360,1,0,[0.000225474,-0.0738917],"","",true,false], 
		["Land_Workbench_01_F",[0.00974,-1.46182,1.500618458],91.1788,1,0,[0.0737156,-0.0151065],"","",true,false], 
		["Land_CampingChair_V2_F",[4.49046,1.5378,1.000520706],180.611,1,0,[-0.0298803,0.000318687],"","",true,false], 
		["OfficeTable_01_new_F",[4.49046,2.54257,1.000827312],360,1,0,[0.1668,-0.00197629],"","",true,false], 
		["MapBoard_Malden_F",[6.59176,-1.98647,1.00322962],133.257,1,0,[-0.273352,0.0502036],"","",true,false]
	]],
	["Land_i_House_Small_02_V1_F",[
		["Land_PlasticCase_01_small_olive_F",[1.636964,-0.451388,1.000999451],178.086,1,0,[0.00256907,0.073803],"","",true,false], 
		["B_CargoNet_01_ammo_F",[2.47907,-1.99943,2.000998974],360,1,0,[0.000225474,-0.0738917],"","",true,false], 
		["Land_Workbench_01_F",[0.00974,-1.46182,1.500618458],91.1788,1,0,[0.0737156,-0.0151065],"","",true,false], 
		["Land_CampingChair_V2_F",[4.49046,1.5378,1.000520706],180.611,1,0,[-0.0298803,0.000318687],"","",true,false], 
		["OfficeTable_01_new_F",[4.49046,2.54257,1.000827312],360,1,0,[0.1668,-0.00197629],"","",true,false], 
		["MapBoard_Malden_F",[6.59176,-1.98647,1.00322962],133.257,1,0,[-0.273352,0.0502036],"","",true,false]
	]],
	["Land_i_House_Small_02_V2_F",[
		["Land_PlasticCase_01_small_olive_F",[1.636964,-0.451388,1.000999451],178.086,1,0,[0.00256907,0.073803],"","",true,false], 
		["B_CargoNet_01_ammo_F",[2.47907,-1.99943,2.000998974],360,1,0,[0.000225474,-0.0738917],"","",true,false], 
		["Land_Workbench_01_F",[0.00974,-1.46182,1.500618458],91.1788,1,0,[0.0737156,-0.0151065],"","",true,false], 
		["Land_CampingChair_V2_F",[4.49046,1.5378,1.000520706],180.611,1,0,[-0.0298803,0.000318687],"","",true,false], 
		["OfficeTable_01_new_F",[4.49046,2.54257,1.000827312],360,1,0,[0.1668,-0.00197629],"","",true,false], 
		["MapBoard_Malden_F",[6.59176,-1.98647,1.00322962],133.257,1,0,[-0.273352,0.0502036],"","",true,false]
	]],
	["Land_u_House_Small_02_V1_F",[
		["Land_PlasticCase_01_small_olive_F",[1.636964,-0.451388,1.000999451],178.086,1,0,[0.00256907,0.073803],"","",true,false], 
		["B_CargoNet_01_ammo_F",[2.47907,-1.99943,2.000998974],360,1,0,[0.000225474,-0.0738917],"","",true,false], 
		["Land_Workbench_01_F",[0.00974,-1.46182,1.500618458],91.1788,1,0,[0.0737156,-0.0151065],"","",true,false], 
		["Land_CampingChair_V2_F",[4.49046,1.5378,1.000520706],180.611,1,0,[-0.0298803,0.000318687],"","",true,false], 
		["OfficeTable_01_new_F",[4.49046,2.54257,1.000827312],360,1,0,[0.1668,-0.00197629],"","",true,false], 
		["MapBoard_Malden_F",[6.59176,-1.98647,1.00322962],133.257,1,0,[-0.273352,0.0502036],"","",true,false]
	]],
	["Land_u_House_Small_01_V1_F",[
		["Land_PlasticCase_01_small_olive_F",[0.704101,-0.964135,1.0010004],1.54196,1,0	,[-0.0174516,-0.000338142],"","",true,false], 
		["B_CargoNet_01_ammo_F",[0.198655,-2.94147,1.500999928],360,1,0,[-0.0047489,-0.0236249],"","",true,false], 
		["Land_CampingChair_V2_F",[-3.19495,-0.372842,1.00100136],90.4709,1,0,[0.0247292,-0.00533726],"","",true,false], 
		["OfficeTable_01_new_F",[-4.02174,-0.3720705,1.000989437],271.117,1,0,[-0.000715417,0.0004691],"","",true,false], 
		["Land_Workbench_01_F",[-3.28517,2.52973,2.000741005],179.612,1,0,[0.00315396,0.0118643],"","",true,false], 
		["MapBoard_Malden_F",[-3.74123,-3.35271,1.50323343],235.835,1,0,[-0.341778,0.0171315],"","",true,false]
	]],
	["Land_u_Addon_02_V1_F",[
		["B_CargoNet_01_ammo_F",[0.310476,0.6778,1.50100088],360,1,0,[0.000175234,-8.32562e-005],"","",true,false], 
		["Land_CampingChair_V2_F",[-1.64096,2.911244,1.50100183],180.699,1,0,[0.000680172,-0.00112802],"","",true,false], 
		["Land_Workbench_01_F",[1.65354,3.6813,1.50094986],0.000395445,1,0,[-0.00142682,0.00125708],"","",true,false], 
		["OfficeTable_01_new_F",[-1.38532,3.80994,1.500999928],359.789,1,0,[-9.18517e-005,-0.000110077],"","",true,false], 
		["MapBoard_Malden_F",[-2.41843,0.35586,1.50323153],229.13,1,0,[-0.327111,-0.000499346],"","",true,false], 
		["Land_PlasticCase_01_small_olive_F",[-2.82672,3.85068,2.00999928],269.564,1,0,[-6.15297e-005,0.000122023],"","",true,false]
	]],
	["Land_i_Addon_02_V1_F",[
		["B_CargoNet_01_ammo_F",[0.310476,0.6778,1.50100088],360,1,0,[0.000175234,-8.32562e-005],"","",true,false], 
		["Land_CampingChair_V2_F",[-1.64096,2.911244,1.50100183],180.699,1,0,[0.000680172,-0.00112802],"","",true,false], 
		["Land_Workbench_01_F",[1.65354,3.6813,1.50094986],0.000395445,1,0,[-0.00142682,0.00125708],"","",true,false], 
		["OfficeTable_01_new_F",[-1.38532,3.80994,1.500999928],359.789,1,0,[-9.18517e-005,-0.000110077],"","",true,false], 
		["MapBoard_Malden_F",[-2.41843,0.35586,1.50323153],229.13,1,0,[-0.327111,-0.000499346],"","",true,false], 
		["Land_PlasticCase_01_small_olive_F",[-2.82672,3.85068,2.00999928],269.564,1,0,[-6.15297e-005,0.000122023],"","",true,false]
	]],
	["Land_i_Stone_Shed_V2_F",[
		["Land_CampingChair_V2_F",[-1.31217,0.833368,1.000994682],1.96952e-005,1,0,[0.000697244,0.000643217],"","",true,false], 
		["B_CargoNet_01_ammo_F",[1.13286,0.557494,1.0010004],1.46614e-007,1,0,[0.000208238,-6.34361e-005],"","",true,false], 
		["OfficeTable_01_new_F",[-1.46406,-0.05653,1.000999451],179.844,1,0,[-6.84557e-005,-7.02947e-005],"","",true,false], 
		["Land_PlasticCase_01_small_olive_F",[0.90468,3.88174,1.0010004],271.907,1,0,[-8.30356e-005,0.000116651],"","",true,false], 
		["Land_Workbench_01_F",[-1.50018,3.89477,1.00100088],360,1,0,[0.000224787,3.48339e-005],"","",true,false], 
		["MapBoard_Malden_F",[2.55526,3.54899,0.50323486],41.7074,1,0,[-0.327625,-0.000496464],"","",true,false]
	]],
	["Land_i_Stone_Shed_V1_F",[
		["Land_CampingChair_V2_F",[-1.31217,0.833368,1.000994682],1.96952e-005,1,0,[0.000697244,0.000643217],"","",true,false], 
		["B_CargoNet_01_ammo_F",[1.13286,0.557494,1.0010004],1.46614e-007,1,0,[0.000208238,-6.34361e-005],"","",true,false], 
		["OfficeTable_01_new_F",[-1.46406,-0.05653,1.000999451],179.844,1,0,[-6.84557e-005,-7.02947e-005],"","",true,false], 
		["Land_PlasticCase_01_small_olive_F",[0.90468,3.88174,1.0010004],271.907,1,0,[-8.30356e-005,0.000116651],"","",true,false], 
		["Land_Workbench_01_F",[-1.50018,3.89477,1.00100088],360,1,0,[0.000224787,3.48339e-005],"","",true,false], 
		["MapBoard_Malden_F",[2.55526,3.54899,0.50323486],41.7074,1,0,[-0.327625,-0.000496464],"","",true,false]
	]],
	["Land_i_Stone_Shed_V3_F",[
		["Land_CampingChair_V2_F",[-1.31217,0.833368,1.000994682],1.96952e-005,1,0,[0.000697244,0.000643217],"","",true,false], 
		["B_CargoNet_01_ammo_F",[1.13286,0.557494,1.0010004],1.46614e-007,1,0,[0.000208238,-6.34361e-005],"","",true,false], 
		["OfficeTable_01_new_F",[-1.46406,-0.05653,1.000999451],179.844,1,0,[-6.84557e-005,-7.02947e-005],"","",true,false], 
		["Land_PlasticCase_01_small_olive_F",[0.90468,3.88174,1.0010004],271.907,1,0,[-8.30356e-005,0.000116651],"","",true,false], 
		["Land_Workbench_01_F",[-1.50018,3.89477,1.00100088],360,1,0,[0.000224787,3.48339e-005],"","",true,false], 
		["MapBoard_Malden_F",[2.55526,3.54899,0.50323486],41.7074,1,0,[-0.327625,-0.000496464],"","",true,false]
	]],
	["Land_Slum_House02_F",[
		["Land_PlasticCase_01_small_olive_F",[2.7811,1.223902,1.000999928],360,1,0,[-0.000114103,0.000112431],"","",true,false], 
		["Land_CampingChair_V2_F",[2.178856,-0.32353,1.50100183],360,1,0,[0.000685578,-0.00112664],"","",true,false], 
		["B_CargoNet_01_ammo_F",[2.280389,2.51246,1.000999928],359.822,1,0,[2.21451e-005,5.86859e-005],"","",true,false], 
		["OfficeTable_01_new_F",[2.004035,-1.27857,1.500999451],180,1,0,[4.91533e-005,0.000156193],"","",true,false], 
		["Land_Workbench_01_F",[1.2397362,4.60534,2.06837e-007],180,1,0,[-6.49749e-005,-1.93642e-005],"","",true,false], 
		["MapBoard_altis_F",[-1.67901,-1.13424,1.00222683],80.5359,1,0,[-0.324591,0.000520187],"","",true,false]
	]]
];

//Interactable items that spawn in your house
OT_item_Storage = "B_CargoNet_01_ammo_F"; //Your spawn ammobox
OT_item_Map = "Mapboard_altis_F";
OT_item_Tent = "Land_TentDome_F";
OT_item_Safe = "Land_PlasticCase_01_small_olive_F";
OT_item_Workbench = "Land_Workbench_01_F"; //Crafting Table
OT_item_Desk = "OfficeTable_01_new_F";
//OT_item_Radio = "Land_PortableLongRangeRadio_F";


//Animals to spawn (@todo: spawn animals)
OT_allLowAnimals = [""];
OT_allHighAnimals = [""];
OT_allFarmAnimals = [""];
OT_allVillageAnimals = [""];
OT_allTownAnimals = [""];

OT_fuelPumps = ["Land_FuelStation_02_pump_F","Land_FuelStation_01_pump_F","Land_fs_feed_F","Land_FuelStation_Feed_F","Land_FuelStation_01_pump_malevil_F"];

OT_churches = ["Land_Church_03_F","Land_Church_01_F","Land_Church_02_F","Land_Temple_Native_01_F"];

OT_language_local = "LanguageGRE_F";
OT_identity_local = "Head_Greek";

OT_language_western = "LanguageENG_F";
OT_identity_western = "Head_Euro";

OT_language_eastern = "LanguageCHI_F";
OT_identity_eastern = "Head_Asian";

OT_face_localBoss = "TanoanBossHead";


OT_civType_gunDealer = "C_man_p_fugitive_F";
OT_civType_local = "C_man_1";
OT_civType_carDealer = "C_man_w_worker_F";
OT_civType_shopkeeper = "C_man_w_worker_F";
OT_civType_worker = "C_man_UtilityWorker_01_F";
OT_civType_priest = "C_man_w_worker_F";
OT_vehTypes_civ = ["C_Offroad_02_unarmed_F","C_Offroad_01_F","C_Quadbike_01_F","C_Hatchback_01_F","C_Van_01_transport_F","C_SUV_01_F","C_Van_02_transport_F","C_Offroad_01_covered_F","C_Offroad_01_comms_F"]; //populated automatically, but you can add more here and they will appear in streets
OT_vehType_distro = "C_Van_01_box_F";
OT_vehType_ferry = "C_Boat_Transport_02_F";
OT_vehType_service = "C_Offroad_01_repair_F";
OT_vehTypes_civignore = ["C_Hatchback_01_sport_F",OT_vehType_service,"OT_C_T_LSV","OT_C_T_LSV2","C_SUV_01_F","C_Offroad_01_comms_F"]; //Civs cannot drive these vehicles for whatever reason

OT_clothes_locals = [
	"U_I_C_Soldier_Bandit_1_F","U_I_C_Soldier_Bandit_2_F","U_I_C_Soldier_Bandit_3_F","U_C_Poor_1","U_C_Poor_2","eo_hoodie_red","eo_hoodie_grey","eo_hoodie_blue","eo_hoodie_bandit","eo_hoodie_kabeiroi","eo_retro_red","eo_retro_grey","eo_retro_blue",
	"eo_retro_bandit","eo_retro_kabeiroi","eo_shirt_bandit","eo_shirt_kabeiroi","eo_shirt_stripe","eo_shirt_check","eo_shirt_plainblu","eo_shirt_plainblk","eo_shirt_checkbrn","eo_shirt_checkblk"
];

OT_clothes_expats = ["U_I_C_Soldier_Bandit_5_F","U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_redwhite","U_C_Poloshirt_salmon","U_C_Poloshirt_stripped","U_C_Man_casual_6_F","U_C_Man_casual_4_F","U_C_Man_casual_5_F"];
OT_clothes_tourists = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_redwhite","U_C_Poloshirt_stripped","U_C_E_LooterJacket_01_F","U_I_G_Story_Protagonist_F"];
OT_clothes_priest = "U_C_Man_casual_2_F";
OT_clothes_port = "U_Marshal";
OT_clothes_shops = ["U_C_Man_casual_2_F","U_C_Man_casual_3_F","U_C_Man_casual_1_F","U_C_IDAP_Man_shorts_F","U_C_FormalSuit_01_black_F","U_C_FormalSuit_01_tshirt_gray_F","U_C_Uniform_Scientist_02_formal_F"];
OT_clothes_carDealers = ["U_Marshal","U_C_Mechanic_01_F"];
OT_clothes_harbor = ["U_C_man_sport_1_F","U_C_man_sport_2_F","U_C_man_sport_3_F"];
OT_clothes_guerilla = ["U_I_C_Soldier_Para_1_F","U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_3_F","U_I_C_Soldier_Para_4_F","U_BG_Guerilla2_1","U_I_L_Uniform_01_tshirt_olive_F","rhsgref_uniform_altis_lizard","rhsgref_uniform_dpm","rhsgref_uniform_flecktarn_full","rhsgref_uniform_og107","rhsgref_uniform_woodland_olive","rhsgref_uniform_TLA_1",
	"rhsgref_uniform_para_ttsko_mountain","rhsgref_uniform_3color_desert","rhsgref_uniform_alpenflage","rhsgref_uniform_reed","rhsgref_uniform_para_ttsko_urban","rhsgref_uniform_gorka_1_f","rhssaf_uniform_m93_oakleaf","rhssaf_uniform_m93_oakleaf_summer"
];

OT_clothes_police = ["U_I_G_resistanceLeader_F","U_BG_Guerilla2_1","U_BG_Guerilla2_3","U_I_C_Soldier_Para_4_F"];
OT_vest_police = "V_TacVest_blk_POLICE";
OT_hat_police = "H_Cap_police";
OT_clothes_mob = "U_I_C_Soldier_Camo_F";

//New, random choice of bags for player to start with
OT_starterBackpacks = ["B_CivilianBackpack_01_Everyday_Astra_F","B_CivilianBackpack_01_Everyday_Black_F","B_CivilianBackpack_01_Everyday_Vrana_F","B_CivilianBackpack_01_Everyday_IDAP_F","B_CivilianBackpack_01_Sport_Blue_F","B_CivilianBackpack_01_Sport_Green_F","B_CivilianBackpack_01_Sport_Red_F"];

//Dealers will always sell one of these at a discount rate
//OT_CheapRifles = ["arifle_AKM_F","arifle_AKS_F","rhs_weap_akm","rhs_weap_ak74","rhs_weap_akms","rhs_weap_aks74","rhs_weap_aks74u","rhs_weap_l1a1_wood","arifle_TRG20_F","rhs_weap_m70b1","rhs_weap_m76"];

//NATO stuff
OT_NATO_HMG = "RHS_M2StaticMG_D";
OT_NATO_Vehicles_AirGarrison = [
	["B_Heli_Light_01_armed_F",1],
	["B_Heli_Transport_03_F",2],
	["RHS_UH60M_MEV2_d",1],
	["RHS_AH1Z",1],
	["RHS_UH1Y_d",2]
];
OT_NATO_Vehicles_StaticAAGarrison = ["B_SAM_System_02_F","B_SAM_System_02_F","B_Radar_System_01_F","B_SAM_System_03_F"]; //Added to every airfield

OT_NATO_Vehicles_JetGarrison = [
	["B_Plane_CAS_01_dynamicLoadout_F",2]
];

OT_NATO_StaticGarrison_LevelOne = ["RHS_M2StaticMG_D","RHS_M2StaticMG_D","rhsusf_m1045_d_s","rhsusf_m1240a1_m240_usarmy_d","rhsusf_m1151_m2crows_usarmy_d"];
OT_NATO_StaticGarrison_LevelTwo = ["RHS_M2StaticMG_D","RHS_TOW_TriPod_D","RHS_MK19_TriPod_D","rhsusf_m1240a1_mk19_uik_usarmy_d","rhsusf_m1045_d_s","rhsusf_stryker_m1126_mk19_d","B_AFV_Wheeled_01_cannon_F","RHS_M252_D","RHS_M2A2"];
OT_NATO_StaticGarrison_LevelThree = ["RHS_TOW_TriPod_D","RHS_TOW_TriPod_D","RHS_Stinger_AA_pod_D","RHS_M2StaticMG_D","RHS_M2StaticMG_D","RHS_MK19_TriPod_D","rhsusf_m1240a1_mk19_uik_usarmy_d","rhsusf_m1240a1_mk19_uik_usarmy_d","rhsusf_M1084A1R_SOV_M2_D_fmtv_socom","RHS_M252_D","rhsusf_m1a1fep_d","B_AFV_Wheeled_01_up_cannon_F","RHS_M2A3_BUSKI"];
OT_NATO_StaticGarrison_HQ = ["RHS_TOW_TriPod_D","RHS_TOW_TriPod_D","RHS_Stinger_AA_pod_D","RHS_M2StaticMG_D","RHS_M2StaticMG_D","RHS_M2StaticMG_D","RHS_MK19_TriPod_D","rhsusf_m1240a1_mk19_uik_usarmy_d","rhsusf_m1240a1_mk19crows_usmc_d","B_APC_Tracked_01_rcws_F","RHS_M252_D","B_MBT_01_TUSK_F","rhsusf_m1a2sep1tuskiid_usarmy","rhsusf_m1a2sep1tuskiid_usarmy","B_APC_Tracked_01_AA_F","B_APC_Tracked_01_AA_F","RHS_M2A3_BUSKIII","RHS_M2A3_BUSKIII"];


OT_NATO_CommTowers = ["Land_TTowerBig_1_F","Land_TTowerBig_2_F"];//Not used


//Troops spawned to defend comms towers
OT_NATO_Unit_Sniper = "B_ghillie_ard_F";
OT_NATO_Unit_Spotter = "B_spotter_F";
OT_NATO_Unit_AA_spec = "B_soldier_AA_F";
OT_NATO_Unit_AA_ass = "B_soldier_AAA_F";
OT_NATO_Unit_AT_spec = "B_soldier_LAT2_F";
OT_NATO_Unit_TeamLeader = "B_Soldier_TL_F";

OT_NATO_Unit_SquadLeader = "rhsusf_usmc_marpat_d_squadleader";//This isnt currently used anywhere

OT_NATO_Unit_HVT = "B_officer_F";

OT_NATO_Unit_PoliceCommander = "Com_Police_N";
OT_NATO_Unit_Police = "Com_Police_N2";
OT_NATO_Vehicle_PoliceHeli = "RHS_UH1Y_d";
OT_NATO_Vehicle_Quad = "B_Quadbike_01_F";
OT_NATO_Vehicle_Police = "rhsusf_m1151_m240_v1_usarmy_d";

OT_NATO_Vehicle_Transport = ["B_Truck_01_transport_F","B_Truck_01_covered_F","rhsusf_M1083A1P2_B_M2_D_fmtv_usarmy"];
OT_NATO_Vehicle_Transport_Light = "B_LSV_01_unarmed_F";
OT_NATO_Vehicles_PoliceSupport = ["rhsusf_m1025_d_s_m2","rhsusf_m1025_d_s_Mk19","rhsusf_CGRCAT1A2_M2_usmc_d","rhsusf_CGRCAT1A2_Mk19_usmc_d"];OT_NATO_Vehicles_PoliceSupport = selectRandom OT_NATO_Vehicles_PoliceSupport;
OT_NATO_Vehicles_ReconDrone = "B_UAV_01_F";
OT_NATO_Vehicles_CASDrone = "B_UAV_02_CAS_F";
OT_NATO_Vehicles_AirSupport = ["B_Heli_Attack_01_F","RHS_AH64DGrey","RHS_AH1Z"];
OT_NATO_Vehicles_AirSupport_Small = ["B_Heli_Light_01_armed_F","RHS_MELB_AH6M","RHS_UH1Y"];
OT_NATO_Vehicles_GroundSupport = ["B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","B_LSV_01_armed_F","rhsusf_m1240a1_mk19crows_usmc_d","rhsusf_m1240a1_m2crows_usmc_d"];
OT_NATO_Vehicles_GroundPatrol = ["rhsusf_M1232_M2_usarmy_d","rhsusf_M1237_MK19_usarmy_d","rhsusf_stryker_m1126_m2_d","rhsusf_stryker_m1126_mk19_d"];//should have higher seating capacity
OT_NATO_Vehicles_TankSupport = ["B_MBT_01_TUSK_F","B_MBT_01_cannon_F","rhsusf_m1a2sep1tuskiid_usarmy","rhsusf_m1a1aim_tuski_d","B_AFV_Wheeled_01_up_cannon_F"];
OT_NATO_Vehicles_Convoy = ["B_UGV_01_rcws_F","B_MRAP_01_hmg_F","B_Truck_01_box_F","B_UGV_01_rcws_F"];//third unit gets extra cargo
OT_NATO_Vehicles_AirWingedSupport = ["B_Plane_Fighter_01_F","B_Plane_CAS_01_F"];
OT_NATO_Vehicle_AirTransport_Small = "RHS_UH1Y_d";
OT_NATO_Vehicle_AirTransport = ["B_Heli_Transport_03_F","B_Heli_Transport_01_F","rhsusf_CH53E_USMC_GAU21_D"];
OT_NATO_Vehicle_AirTransport_Large = "RHS_CH_47F_light";
OT_NATO_Vehicle_Boat_Small = "B_Boat_Armed_01_minigun_F";
OT_NATO_Vehicles_APC = ["B_APC_Wheeled_01_cannon_F","B_APC_Tracked_01_rcws_F","B_APC_Tracked_01_CRV_F","RHS_M2A3_BUSKIII","RHS_M6","B_AFV_Wheeled_01_cannon_F"];
OT_NATO_Vehicle_HVT = "B_MRAP_01_F";
OT_NATO_Vehicle_CTRGTransport = "B_CTRG_Heli_Transport_01_tropic_F";

OT_NATO_Engineer = "rhsusf_army_ocp_engineer";//Added to crew space of infantry support vehicles
OT_NATO_Vehicle_Support_Troop = "rhsusf_army_ocp_riflemanl";//Added to fill space of infantry support vehicles

OT_NATO_Vehicles_VirArty = ["6Rnd_155mm_Mo_smoke","6Rnd_155mm_Mo_AT_mine"]; //Smoke and ATmines
OT_NATO_Random_Statics = ["RHS_M2StaticMG_USMC_D","RHS_TOW_TriPod_USMC_D"];

//New special force that comes midgame when base has been attacked
OT_NATO_APCBrigade_Lead = "rhsusf_socom_marsoc_teamleader";
OT_NATO_APCBrigade_Vehicles = ["RHS_M2A3_BUSKIII","RHS_M2A3_BUSKIII"];
OT_NATO_APCBrigade_Infantry = ["rhsusf_socom_marsoc_cso_grenadier","rhsusf_socom_marsoc_marksman","rhsusf_socom_marsoc_sarc","rhsusf_socom_marsoc_sniper_m107","rhsusf_socom_marsoc_cso_mk17"];//Squad Per Vehicle

//New to allow for specialized weaponery
OT_NATO_ReinforcementsLead = "B_recon_TL_F";
OT_NATO_Reinforcements = ["B_recon_exp_F","B_recon_JTAC_F","B_recon_M_F","B_recon_medic_F","B_recon_F","B_recon_LAT_F","B_Recon_Sharpshooter_F","B_ghillie_sard_F","B_Patrol_Soldier_AR_F","B_Patrol_Soldier_MG_F"]; //Troops that come to assist police/ run checkpoints

OT_NATO_GarrisonLead = "rhsusf_army_ocp_teamleader";
OT_NATO_Garrison = ["rhsusf_army_ocp_javelin","rhsusf_army_ocp_maaws","rhsusf_army_ocp_aa","rhsusf_army_ocp_autorifleman","rhsusf_army_ocp_marksman","rhsusf_army_ocp_grenadier","rhsusf_army_ocp_sniper","rhsusf_army_ocp_machinegunner","rhsusf_army_ocp_riflemanl","rhsusf_army_ocp_riflemanat","rhsusf_army_ocp_rifleman_m4","rhsusf_army_ocp_medic","rhsusf_army_ocp_engineer"]; //Troops that gaurd objectives/bases

OT_NATO_ArmyLead = ["B_Soldier_TL_F"];
OT_NATO_Army = [
	["B_soldier_AR_F","B_medic_F","B_soldier_exp_F","B_Soldier_GL_F","B_Patrol_Soldier_MG_F","B_soldier_M_F","B_Soldier_F","B_soldier_LAT_F","B_soldier_LAT2_F","B_Soldier_lite_F","B_Sharpshooter_F","B_ghillie_ard_F","B_soldier_AA_F","B_spotter_F","B_soldier_AAA_F"]
]; //Troops that are sent to battle for towns/bases. Divided into sets to allow for modded squads that dont mix soldier factions
OT_NATO_ArmyBaseGroup = [//Attacking squads always have these troops gaurenteed in them (+ squadleader)
	["B_soldier_AA_F","B_soldier_AT_F","B_soldier_AR_F","B_medic_F"]
];


OT_NATO_ReinforcementsWep = ["arifle_MXC_F","SMG_03C_camo","SMG_01_F","rhs_weap_m4_carryhandle","rhs_weap_m4","rhsusf_weap_MP7A2_desert","rhs_weap_g36c","rhs_weap_vhsk2"];
OT_NATO_ReinforcementsWepGL = ["rhs_weap_m4_carryhandle_m203S"];
OT_NATO_ReinforcementsWepMG = ["arifle_MX_SW_F","LMG_Mk200_F"];
OT_NATO_ReinforcementsWepSR = ["rhs_weap_m24sws_d","rhs_weap_m40a5_d","rhs_weap_m76","arifle_MXM_F","srifle_DMR_02_sniper_F"];

OT_NATO_GarrisonWep = ["rifle_EBR_F","arifle_MX_F","arifle_MX_SW_F","arifle_MXM_F","srifle_DMR_06_camo_F","srifle_DMR_02_sniper_F","srifle_DMR_03_tan_F","arifle_SPAR_02_snd_F","rhs_weap_m14_ris_d","rhs_weap_m27iar_grip","rhs_weap_m4a1_carryhandle","rhs_weap_m4a1_blockII_d","rhs_weap_m4a1_d","rhs_weap_sr25_d","rhs_weap_mk17_STD","rhs_weap_mk17_LB","rhs_weap_mk18_d","rhs_weap_m14ebrri"];
OT_NATO_GarrisonWepGL = ["arifle_MX_GL_F","rhs_weap_m4a1_blockII_M203_d","rhs_weap_m4_m320","rhs_weap_m32","rhs_weap_m4_carryhandle_m203","rhs_weap_m16a4_carryhandle_M203"];
OT_NATO_GarrisonWepMG = ["MMG_01_tan_F","MMG_02_sand_F","rhs_weap_m240G","rhs_weap_m249_pip_L","rhs_weap_m240B","LMG_Zafir_F"];
OT_NATO_GarrisonWepSR = ["srifle_LRR_camo_F","rhs_weap_XM2010_d","rhs_weap_M107_d"];

OT_NATO_ArmyWep = ["arifle_MX_F","arifle_MXC_F","srifle_EBR_F","arifle_MXM_F","rhs_weap_m4a1_carryhandle","rhs_weap_m4a1_blockII_d","rhs_weap_m16a4_carryhandle","rhs_weap_g36kv","rhs_weap_m4a1_d_mstock","rhs_weap_vhsd2_ct15x"];
OT_NATO_ArmyWepGL = ["arifle_MX_GL_F","rhs_weap_m4a1_carryhandle_m203","rhs_weap_m4a1_blockII_M203_d","rhs_weap_m16a4_carryhandle_M203","rhs_weap_g36kv_ag36","rhs_weap_vhsd2_bg_ct15x"];
OT_NATO_ArmyWepMG = ["LMG_Mk200_F","arifle_MX_SW_F","rhs_weap_m249","rhs_weap_m249_light_S"];
OT_NATO_ArmyWepSR = ["srifle_DMR_03_tan_F","rhs_weap_m40a5_d","rhs_weap_XM2010_d","arifle_SPAR_03_snd_F"];

OT_ALL_NATOAR = OT_NATO_ReinforcementsWep + OT_NATO_GarrisonWep +  OT_NATO_ArmyWep;
OT_ALL_NATOGL = OT_NATO_ArmyWepGL + OT_NATO_GarrisonWepGL + OT_NATO_ReinforcementsWepGL;
OT_ALL_NATOMG = OT_NATO_ReinforcementsWepMG + OT_NATO_GarrisonWepMG + OT_NATO_ArmyWepMG;
OT_ALL_NATOSR = OT_NATO_ReinforcementsWepSR + OT_NATO_GarrisonWepSR + OT_NATO_ArmyWepSR + ["rhs_weap_M107_leu"];

OT_NATO_weapons_Police = ["SMG_03_camo","rhs_weap_savz61","SMG_02_F","SMG_05_F","hgun_PDW2000_F","rhs_weap_pp2000","rhs_weap_M590_8RD"];
OT_NATO_Goggles_Police = ["G_Aviator","G_Bandanna_aviator","G_Bandanna_sport","G_Bandanna_shades","G_Shades_Blue","G_Shades_Black","G_Squares_Tinted","G_Squares","G_Bandanna_blk"];

OT_NATO_weapons_Pistols = ["hgun_Pistol_heavy_01_F","hgun_ACPC2_F","hgun_P07_F","rhsusf_weap_m9","rhs_weap_cz99","rhsusf_weap_m1911a1"];

OT_NATO_GroundForces = []; // Don't touch

OT_NATOBluprints = ["B_Truck_01_fuel_F","B_Truck_01_box_F","B_Truck_01_ammo_F","B_Truck_01_transport_F","B_Truck_01_covered_F","B_LSV_01_unarmed_F","B_LSV_01_AT_F","B_LSV_01_armed_F","B_Quadbike_01_F","B_MRAP_01_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","B_Heli_Light_01_dynamicLoadout_F","B_Heli_Transport_03_unarmed_F","B_APC_Wheeled_01_cannon_F","B_Boat_Armed_01_minigun_F","B_CTRG_LSV_01_light_F","rhsusf_m1025_d_m2","rhsusf_m1025_d_Mk19","rhsusf_m1025_d","rhsusf_m1045_d","RHS_CH_47F_light","rhsusf_M1117_D","rhsusf_M1220_usarmy_d","rhsusf_M1220_M2_usarmy_d","rhsusf_M1078A1P2_D_fmtv_usarmy","rhsusf_M977A4_AMMO_BKIT_usarmy_d","rhsusf_M977A4_REPAIR_usarmy_d","rhsusf_M978A4_usarmy_d","rhsusf_m998_d_s_2dr_fulltop","RHS_UH1Y_UNARMED_d","RHS_UH1Y_d"]; //List of blueprints player can get from laptop

OT_CRIM_Weapons = ["rhs_weap_ak74","rhs_weap_ak74_3","rhs_weap_ak74_2","rhs_weap_ak74n","rhs_weap_akm","rhs_weap_akmn","rhs_weap_akms","rhs_weap_aks74","rhs_weap_aks74u","srifle_DMR_06_hunter_F","arifle_AKM_F","arifle_AKS_F","rhs_weap_m1garand_sa43","rhs_weap_savz58v","rhs_weap_savz58p","rhs_weap_m70b3n","rhs_weap_m21a","rhs_weap_ak104","rhs_weap_ak105","rhs_weap_ak74m_desert"];
OT_CRIM_Pistols = ["rhs_weap_6p53","rhs_weap_pb_6p9","hgun_Pistol_heavy_02_F","hgun_Pistol_01_F","rhs_weap_makarov_pm","rhs_weap_tt33","rhs_weap_cz99_etched","hgun_Rook40_F","rhs_weap_type94_new","hgun_P07_blk_F"];
OT_CRIM_Launchers = ["rhs_weap_panzerfaust60","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_rpg26","rhs_weap_rpg75","rhs_weap_m80"];

OT_Forced_Weapons = []; // Forces the game to detect these classes,mainly for weapons with 'MissileLauncher' as a parent

//Check for mods, if yes then update
private _append = [];
if (OT_hasNI) then {

		_append = ["hlc_rifle_ak47","hlc_rifle_ak12","hlc_rifle_aku12","hlc_rifle_ak74_dirty","hlc_rifle_akm","hlc_rifle_aks74","hlc_rifle_aks74u","hlc_rifle_aek971worn","hlc_rifle_RK62","hlc_rifle_rpk","hlc_rifle_rpk74n","hlc_rifle_STGW57","hlc_rifle_RPK12","hlc_rifle_M1941LMG","hlc_wp_MK17IUR_762R"];
	OT_CRIM_Weapons append _append;
	
		_append = ["hlc_pistol_C96_Wartime_Worn","hlc_Pistol_P228","hlc_pistol_P226WestGerman","hlc_pistol_M712_worn_stock"];
	OT_CRIM_Pistols append _append;
	
		_append = ["hlc_pistol_P226R_357Elite","hlc_pistol_P229R_Combat","hlc_pistol_P239_40","hlc_pistol_Mk25D"];
	OT_NATO_weapons_Pistols append _append;
	
		_append = ["hlc_smg_mp5a4","hlc_smg_mp5sd5","hlc_rifle_augpara_t","hlc_rifle_auga2para_t","hlc_rifle_saiga12k","hlc_rifle_vendimus","hlc_rifle_augsrcarb_t","hlc_rifle_SG550Sniper"];
	OT_NATO_weapons_Police append _append;

		_append = ["hlc_wp_m16A1","hlc_wp_m16a2","hlc_rifle_hk33ka3","hlc_rifle_hk33a2RIS","hlc_rifle_416D10C","hlc_mp510_tac","hlc_wp_xm4","hlc_rifle_auga1carb_t","hlc_wp_XM177E2","hlc_rifle_G36C","hlc_rifle_SG553SB","hlc_wp_mod733","hlc_wp_SCARL_STD_300AAC_SRX_muddy"];
	OT_NATO_ReinforcementsWep append _append;
	
		_append = ["hlc_rifle_FN3011Modern_camo","hlc_rifle_M1903A1_unertl","hlc_WP_SSR"];
	OT_NATO_ReinforcementsWepSR append _append;
	
		_append = ["hlc_lmg_m60","hlc_rifle_MG36","hlc_rifle_L4A3"];
	OT_NATO_ReinforcementsWepMG append _append;

		_append = ["hlc_rifle_Bushmaster300","hlc_rifle_g3sg1ris","hlc_rifle_G36A1","hlc_rifle_416D20_tan","hlc_rifle_M14dmr_Rail","hlc_rifle_M21_Rail","hlc_wp_m16a2","hlc_rifle_SG551LB_TAC","hlc_rifle_SLR","hlc_rifle_G36V","hlc_rifle_ACR68_full_tan","hlc_wp_xm4","hlc_rifle_g3a3vris","hlc_rifle_C2A1","hlc_wp_SCARH_STD","hlc_rifle_FAL5000Rail","hlc_rifle_falosw"];
	OT_NATO_GarrisonWep append _append;
	
		_append = ["hlc_rifle_awmagnum_FDE","hlc_rifle_psg1","hlc_rifle_m14sopmod"];
	OT_NATO_GarrisonWepSR append _append;
	
		_append = ["HLC_Rifle_g3ka4_GL","hlc_rifle_osw_GL"];
	OT_NATO_GarrisonWepGL append _append;
	
		_append = ["hlc_lmg_M249E2","hlc_lmg_mk48mod1","hlc_lmg_MG3KWS","hlc_lmg_M60E4","hlc_lmg_MG42KWS_t"];
	OT_NATO_GarrisonWepMG append _append;
	
	_append = ["hlc_rifle_FAL5061Rail","hlc_rifle_RU556","hlc_WP_SCARH_CQC","hlc_rifle_M4a1carryhandle","hlc_rifle_G36MLIC","hlc_rifle_G36KMLIC","hlc_rifle_416D165_tan","hlc_wp_SCARL_STD","hlc_rifle_mk18mod0","hlc_rifle_ACR_MID_tan","hlc_rifle_CQBR","hlc_rifle_416D145_CAG","hlc_wp_SCARH_CQC_SRX_tranoflage","hlc_rifle_M27IAR","hlc_rifle_auga3_bl","hlc_rifle_bcmjack"];
	{
		OT_NATO_ArmyWep pushback _x;
	}foreach(_append);
	
	_append = ["hlc_lmg_minimipara","hlc_lmg_mk46mod1","hlc_m249_SQuantoon"];
	
	{
		OT_NATO_ArmyWepMG pushback _x;
	}foreach(_append);
	
	_append = ["hlc_rifle_FN3011Tactical_green","hlc_WP_SCARH_DMR"];
	
	{
		OT_NATO_ArmyWepSR pushback _x;
	}foreach(_append);
	
	_append = ["hlc_rifle_A1m203","hlc_rifle_m203","hlc_rifle_G36MLIAG36","hlc_rifle_auga3_GL_BL"];
	
	{
		OT_NATO_ArmyWepGL pushback _x;
	}foreach(_append);
};

if (isClass(configfile >> "CfgPatches" >> "bwa3_weapons")) then { //BWMOD
	private _append = ["BWA3_Tiger_RMK_Universal"];
	
	{
		OT_NATO_Vehicles_AirSupport pushback _x;
	}foreach(_append);
	
	_append = ["BWA3_Eagle_FLW100_Tropen"];
	
	{
		OT_NATO_Vehicles_GroundSupport pushback _x;
	}foreach(_append);
	
	_append = ["BWA3_Puma_Tropen"];
	
	{
		OT_NATO_Vehicles_APC pushback _x;
	}foreach(_append);
	
	_append = ["BWA3_Leopard2_Tropen"];
	
	{
		OT_NATO_Vehicles_TankSupport pushback _x;
	}foreach(_append);
	
	_append = [["BWA3_TL_Tropen","BWA3_MachineGunner_MG5_Tropen","BWA3_Marksman_Tropen","BWA3_Grenadier_G27_Tropen","BWA3_Grenadier_Tropen","BWA3_RiflemanAT_PzF3_Tropen","BWA3_RiflemanAT_RGW90_Tropen","BWA3_Rifleman_Tropen"]];
	
	{
		OT_NATO_GroundForces pushback _x;
	}foreach(_append);
	
	_append = ["BWA3_G27_tan","BWA3_G28","BWA3_G29","BWA3_G36A3_tan","BWA3_G36A2_tan","BWA3_G36A3_tan","BWA3_G38_tan"];
	
	{
		OT_NATO_GarrisonWep pushback _x;
	}foreach(_append);
	
	_append = ["BWA3_G82","BWA3_G29"];
	
	{
		OT_NATO_GarrisonWepSR pushback _x;
	}foreach(_append);
	
	_append = ["BWA3_MG5_tan","BWA3_MG3"];
	
	{
		OT_NATO_GarrisonWepMG pushback _x;
	}foreach(_append);
	
	_append = ["BWA3_G27_tan","BWA3_G28","BWA3_G29","BWA3_G36A3_tan","BWA3_G36A2_tan","BWA3_G36A3_tan","BWA3_G38_tan"];
	
	{
		OT_NATO_ArmyWep pushback _x;
	}foreach(_append);
	
	_append = ["BWA3_G29"];
	
	{
		OT_NATO_ArmyWepSR pushback _x;
	}foreach(_append);
	
	_append = ["BWA3_MG4"];
	
	{
		OT_NATO_ArmyWepMG pushback _x;
	}foreach(_append);
	
};

if(OT_hasFW) then {
		_append = ["sp_fwa_smg_mp40","sp_fwa_mas_49_56","sp_fwa_fn_modelDA1","sp_fwa_fn49_arg","sp_fwa_m1918a2_bar","sp_fwa_ar18_shorty","sp_fwa_ar10_porto_alu","sp_fwa_ar15_603_m16a1_captured","sp_fwa_fal_factory_50_63","sp_fwa_sig510_3","sp_fwa_smg_mp40_black","sp_fwa_stg44","sp_fwa_bren_mk2","sp_fwa_fm2429","sp_fwa_ruger_mini14_ac556","sp_fwa_bm59_mk3_alpine"];
	OT_CRIM_Weapons append _append;
	
		_append = ["sp_fwa_l9a1_hipower_wood"];
	OT_CRIM_Pistols append _append;
	
		_append = ["sp_fwa_l9a1_hipower"];
	OT_NATO_weapons_Pistols append _append;
	
		_append = ["sp_fwa_enfield_l42_walnut","sp_fwa_enfield_l8_walnut","sp_fwa_smg_carlg_m45","sp_fwa_smg_portsaid_m45","sp_fwa_smg_mk5sterling","sp_fwa_smg_mk6sterling","sp_fwa_smg_mk7a8sterling_stock_beech","sp_fwa_m2a1_carbine","sp_fwa_smg_thompson_m1a1","sp_fwa_smg_mat49","sp_fwa_ruger_mini14"];
	OT_NATO_weapons_Police append _append;
	
		_append = ["sp_fwa_smg_thompson_m1928a1"];
	OT_NATO_ReinforcementsWep append _append;

		_append = ["sp_fwa_ar10","sp_fwa_ar15_606_hbar","sp_fwa_ar15_646_a3","sp_fwa_fal_stg58_fn"];
	OT_NATO_ArmyWep append _append;
	
		_append = ["sp_fwa_mag58","sp_fwa_aa52","sp_fwa_mg4259"];
	OT_NATO_ArmyWepMG append _append;
	
		_append = ["sp_fwa_m14"];
	OT_NATO_ArmyWepSR append _append;
	
		_append = ["sp_fwa_ar15_646_m16a3_m203"];
	OT_NATO_ArmyWepGL append _append;
	
		_append = ["sp_fwa_m1919a6_browning"];
	OT_NATO_GarrisonWepMG append _append;
	
		_append = ["sp_fwa_m72a1_law_loaded","sp_fwa_m67","sp_fwa_m2_carlGustav_no78"];
	OT_Forced_Weapons append _append;
};

if (isClass(configfile >> "CfgPatches" >> "A3_Weapons_F_Aegis_LongRangeRifles_DMR_01")) then { //Aegis
	_append = ["B_A_MRAP_03_gmg_F","B_A_MRAP_03_hmg_F"];
	
	{
		OT_NATO_Vehicles_GroundSupport pushback _x;
	}foreach(_append);
	
	_append = ["B_A_APC_tracked_03_cannon_F"];
	
	{
		OT_NATO_Vehicles_APC pushback _x;
	}foreach(_append);
	
	_append = [["B_A_Soldier_TL_F","B_A_Soldier_AR_F","B_A_soldier_M_F","B_A_Soldier_GL_F","B_A_Medic_F","B_A_Soldier_AT_F","B_A_RadioOperator_F","B_A_Soldier_F"]];
	
	{
		OT_NATO_GroundForces pushback _x;
	}foreach(_append);
	
	_append = ["arifle_SA80_snd_F"];
	
	{
		OT_NATO_GarrisonWep pushback _x;
	}foreach(_append);
	
	_append = ["srifle_WF50_F"];
	
	{
		OT_NATO_GarrisonWepSR pushback _x;
	}foreach(_append);
	
	_append = ["arifle_SA80_C_snd_F"];
	
	{
		OT_NATO_ArmyWep pushback _x;
	}foreach(_append);
	
	_append = ["LMG_Mk200_plain_F"];
	
	{
		OT_NATO_ArmyWepMG pushback _x;
	}foreach(_append);
	
	_append = ["SMG_04_snd_F","sgun_M4_F"];
	
	{
		OT_NATO_ReinforcementsWep pushback _x;
	}foreach(_append);
	
	_append = ["SMG_05_snd_F","sgun_Mp153_classic_F"];
	
	{
		OT_NATO_weapons_Police pushback _x;
	}foreach(_append);
	
};

private _GetParam = [0, 1] select (paramsArray select 9);
if (_GetParam IsEqualTo 1) then {HCEnabled = true};
_GetParam = [0, 1] select (paramsArray select 10);
if (_GetParam IsEqualTo 1) then {AllowAirD = true};
_GetParam = [0, 1, 2] select (paramsArray select 11);
server setvariable ["PDT",_GetParam,true];
_GetParam = [0, 1, 2] select (paramsArray select 12);
server setvariable ["OT_Despawn",_GetParam,true];

OT_NATO_Sandbag_Curved = "Land_BagFence_Round_F";
OT_NATO_Barrier_Small = "Land_HBarrier_5_F";
OT_NATO_Barrier_Large = "Land_HBarrierWall6_F";

OT_NATO_Mortar = "B_Mortar_01_F";

//Criminal stuff
OT_CRIM_Unit = "C_man_p_fugitive_F";
OT_CRIM_Clothes = ["U_I_C_Soldier_Bandit_3_F","U_BG_Guerilla3_1","U_C_HunterBody_grn","U_I_G_Story_Protagonist_F","rhs_uniform_6sh122_gloves_v2","rhs_uniform_6sh122_gloves_v1","rhs_uniform_emr_des_patchless",
"rhs_uniform_emr_patchless","rhs_uniform_flora_patchless","rhs_uniform_gorka_r_g_gloves","rhs_uniform_gorka_1_b","rhs_uniform_mvd_izlom","rhs_uniform_afghanka_boots_moldovan_ttsko_hot","rhs_uniform_mflora_patchless","rhs_uniform_vkpo_gloves",
"U_I_L_Uniform_01_camo_F","U_I_L_Uniform_01_deserter_F"
];
OT_CRIM_Goggles = ["G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","G_Balaclava_oli","G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_oli","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_tan"];

OT_piers = ["Land_PierConcrete_01_4m_ladders_F","Land_PierWooden_01_platform_F","Land_PierWooden_01_hut_F","Land_PierWooden_02_hut_F"]; //spawns dudes that sell boats n stuff
OT_offices = ["Land_MultistoryBuilding_01_F","Land_MultistoryBuilding_04_F"];
OT_portBuildings = ["Land_Warehouse_01_F","Land_Warehouse_02_F","Land_ContainerLine_01_F","Land_ContainerLine_02_F","Land_ContainerLine_03_F"];
OT_airportTerminals = ["Land_Airport_01_terminal_F","Land_Airport_02_terminal_F","Land_Hangar_F"];
OT_portBuilding = "Land_WarehouseShelter_01_F";
OT_policeStation = "Land_Cargo_House_V3_F";
OT_warehouse = "Land_Warehouse_03_F";
OT_warehouses = [OT_warehouse,"Land_dp_smallFactory_F","Land_i_Shed_Ind_F"];
OT_barracks = "Land_Barracks_01_grey_F";
OT_workshopBuilding = "Land_GarageRow_01_small_F";
OT_refugeeCamp = "Land_Caravan_01_green_F";//changed by Gerhart aka PapaGee
OT_trainingCamp = "Land_IRMaskingCover_02_F";
OT_hardwareStore = "Land_dp_smallFactory_F";
OT_radarBuilding = "Land_Radar_Small_F";
OT_Jammer = "Land_dp_transformer_F";

//Custom recruitables per mission
OT_Recruitables = [
    //Rifleman
	["I_soldier_F",[
        ["srifle_DMR_06_hunter_F","","","optic_Holosight_lush_F",["10Rnd_Mk14_762x51_Mag",10],[],""],
        [],
        ["hgun_Pistol_heavy_01_F","","","",["11Rnd_45ACP_Mag",11],[],""],
        ["eo_bandit",[["ACE_morphine",1],["ACE_epinephrine",1],["ACE_fieldDressing",2]]],
        ["U_I_C_Soldier_Para_4_F",[["HandGrenade",2,1],["11Rnd_45ACP_Mag",4,11],["MiniGrenade",4,1]]],
        ["eo_legstrappack_2",[["10Rnd_Mk14_762x51_Mag",6,10]]],
        "H_Hat_tan","eo_bandana_2",
        [],
        ["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Autorifleman
	["I_Soldier_AR_F",[
        ["rhs_weap_MP44","","","",["rhsgref_30Rnd_792x33_SmE_StG",30],[],""],
        [],
        ["hgun_Pistol_heavy_01_F","","","",["11Rnd_45ACP_Mag",11],[],""],
        ["eo_diamond_1",[["FirstAidKit",1],["ACE_fieldDressing",5],["ACE_epinephrine",2],["ACE_morphine",2],["SmokeShell",2,1],
        ["rhs_mag_rgn",2,1],["rhsgref_25Rnd_792x33_SmE_StG",3,25],["11Rnd_45ACP_Mag",1,11]]],
		["U_I_C_Soldier_Para_1_F",[["HandGrenade",2,1],["11Rnd_45ACP_Mag",4,11],["MiniGrenade",4,1]]],
		["eo_messengerbag_1",[["rhsgref_25Rnd_792x33_SmE_StG",3,25],["rhs_grenade_nbhgr39_mag",1,1],["rhs_grenade_nbhgr39B_mag",1,1]]],
		"H_Hat_brown","eo_balaclava_1",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Rifleman (AT)
	["I_Soldier_LAT_F",[
        ["rhsusf_weap_MP7A2_desert","","","",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],
		["rhs_weap_rpg18","","","",["rhs_rpg18_mag",1],[],""],
		["hgun_Pistol_heavy_01_F","","","",["11Rnd_45ACP_Mag",11],[],""],
		["eo_paramilitary_1",[["FirstAidKit",1],["ACE_fieldDressing",5],["ACE_epinephrine",2],["ACE_morphine",2],["SmokeShell",2,1],["11Rnd_45ACP_Mag",2,11],["rhsusf_mag_40Rnd_46x30_FMJ",1,40]]],
		["V_BandollierB_khk",[["11Rnd_45ACP_Mag",2,11],["rhsusf_mag_40Rnd_46x30_FMJ",9,40]]],
		["eo_field",[["rhs_grenade_nbhgr39_mag",1,1],["rhs_grenade_nbhgr39B_mag",1,1]]],
		"H_Hat_camo","eo_balaclava_1",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Marksman
	["I_Soldier_M_F",[
        ["srifle_DMR_06_hunter_F","","","optic_Hamr",["10Rnd_Mk14_762x51_Mag",10],[],""],
		[],
		["hgun_Pistol_heavy_01_F","","","",["11Rnd_45ACP_Mag",11],[],""],
		["eo_shirt_tigerblk",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["11Rnd_45ACP_Mag",5,11]]],
		["V_Pocketed_coyote_F",[["20Rnd_762x51_Mag",6,20]]],
		["eo_legstrappack_4",[["20Rnd_762x51_Mag",2,20],["HandGrenade",1,1],["SmokeShell",1,1]]],
		"H_Hat_brown","eo_balaclavaLow_3",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Sniper
	["I_Sniper_F",[
        ["rhs_weap_m38_rail","","","optic_KHS_old",["rhsgref_5Rnd_762x54_m38",5],[],""],
		[],
		["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		["U_I_C_Soldier_Para_4_F",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_17Rnd_9x19_FMJ",2,17]]],
		["V_Pocketed_coyote_F",[["rhsusf_mag_17Rnd_9x19_FMJ",1,17],["rhsgref_5Rnd_762x54_m38",15,5],["SmokeShell",2,1],["HandGrenade",2,1]]],
		["eo_messengerbag_1",[["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["rhsgref_5Rnd_762x54_m38",5,5]]],
		"H_Hat_tan","eo_balaclavaLow_3",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Spotter
	["I_Spotter_F",[
        ["srifle_DMR_06_hunter_F","","","optic_Holosight_blk_F",["10Rnd_Mk14_762x51_Mag",10],[],""],
		[],
		["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		["eo_camo",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_17Rnd_9x19_FMJ",4,17],["10Rnd_Mk14_762x51_Mag",7,10]]],
		["V_Pocketed_coyote_F",[["rhsusf_mag_17Rnd_9x19_FMJ",1,17],["SmokeShell",2,1],["HandGrenade",2,1],["10Rnd_Mk14_762x51_Mag",3,10]]],
		["eo_legstrappack_4",[["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["SmokeShell",4,1]]],
		"H_Hat_tan","eo_bandana_3",
		["Binocular","","","",[],[],""],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Squad Leader
	["I_Soldier_SL_F",[
        ["srifle_DMR_06_hunter_F","","","optic_Holosight_blk_F",["10Rnd_Mk14_762x51_Mag",10],[],""],
		[],
		["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		["eo_independant_1",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_17Rnd_9x19_FMJ",4,17],["10Rnd_Mk14_762x51_Mag",7,10]]],
		["V_Pocketed_coyote_F",[["rhsusf_mag_17Rnd_9x19_FMJ",1,17],["SmokeShell",2,1],["HandGrenade",2,1],["10Rnd_Mk14_762x51_Mag",3,10]]],
		["eo_legstrappack_4",[["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["SmokeShell",4,1]]],
		"H_Hat_tan","eo_bandana_3",
		["Binocular","","","",[],[],""],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Medic
	["I_Medic_F",[
        ["rhsusf_weap_MP7A2_desert","","","optic_Holosight_smg_blk_F",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],
		[],
		["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		["eo_hoodie_blue",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_17Rnd_9x19_FMJ",4,17],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
		["eo_legstrappack_2",[["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["SmokeShell",4,1],["rhsusf_mag_40Rnd_46x30_FMJ",5,40]]],
		["eo_field",[["ACE_bloodIV",4],["ACE_epinephrine",8],["ACE_fieldDressing",10]]],
		"H_Hat_tan","eo_respirator_1",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //AT
	["I_Soldier_AT_F",[
        ["rhsusf_weap_MP7A2_desert","","","optic_Holosight_smg_blk_F",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],
		["rhs_weap_rpg7","","","",["rhs_rpg7_PG7V_mag",1],[],""],
		["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		["eo_survivor_1",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_17Rnd_9x19_FMJ",4,17],["rhsusf_mag_40Rnd_46x30_FMJ",5,40]]],
		["eo_legstrappack_2",[["rhsusf_mag_40Rnd_46x30_FMJ",5,40],["rhs_grenade_anm8_mag",2,1],["rhs_charge_tnt_x2_mag",2,1]]],
		["eo_carryall_2",[["RPG7_F",4,1],["rhs_rpg7_TBG7V_mag",2,1]]],
		"H_Hat_tan","eo_bandana_4",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //AA
	["I_Soldier_AA_F",[
        ["rhsusf_weap_MP7A2_desert","","","optic_Holosight_smg_blk_F",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],
		["rhs_weap_rpg7","","","",["rhs_rpg7_PG7V_mag",1],[],""],
		["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		["eo_shirt_stripe",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_17Rnd_9x19_FMJ",4,17],["rhsusf_mag_40Rnd_46x30_FMJ",2,40]]],
		["eo_legstrappack_2",[["rhsusf_mag_40Rnd_46x30_FMJ",5,40],["rhs_grenade_anm8_mag",2,1],["rhs_charge_tnt_x2_mag",2,1]]],
		["eo_carryall_2",[["RPG7_F",2,1],["rhs_rpg7_PG7VR_mag",2,1],["rhs_rpg7_type69_airburst_mag",3,1]]],
		"H_Hat_tan","eo_bandana_4",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Assistant AT
	["I_Soldier_AAT_F",[
        ["rhsusf_weap_MP7A2_aor1","","","optic_Holosight_smg_blk_F",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],
		[],
		["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		["eo_hoodie_grey",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_17Rnd_9x19_FMJ",4,17]]],
		["eo_legstrappack_2",[["rhs_grenade_anm8_mag",2,1],["rhs_charge_tnt_x2_mag",2,1]]],
		["eo_carryall_2",[["RPG7_F",8,1]]],
		"H_Hat_tan","eo_bandana_4",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Assistant AA
	["I_Soldier_AAA_F",[
        ["rhsusf_weap_MP7A2_aor1","","","optic_Holosight_smg_blk_F",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],
		[],
		["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		["eo_shirt_plainblk",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_17Rnd_9x19_FMJ",4,17]]],
		["eo_legstrappack_2",[["rhs_grenade_anm8_mag",2,1],["rhs_charge_tnt_x2_mag",2,1]]],
		["eo_carryall_2",[["RPG7_F",2,1]]],
		"H_Hat_tan","eo_bandana_4",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Grenadier
	["I_Soldier_GL_F",[
        ["rhsusf_weap_MP7A2_aor1","","","optic_Holosight_smg_blk_F",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],
		[],
		["rhs_weap_M320","","","",["rhs_mag_M441_HE",1],[],""],
		["eo_hoodie_kabeiroi",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_40Rnd_46x30_FMJ",4,40]]],
		["eo_legstrappack_2",[["rhsusf_mag_40Rnd_46x30_FMJ",9,40]]],
		["eo_field",[["rhs_mag_M397_HET",12,1],["rhs_mag_M433_HEDP",10,1],["rhs_mag_m714_White",5,1]]],
		"H_Hat_tan","eo_bandana_4",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ]
];

OT_guerCampLVL2 = [
	["Campfire_burning_F",[-0.0356445,0.0998535,0.0299988],26.909,1,0,[0,0],"","",true,false], 
	["Land_WoodenBox_F",[-1.74756,1.79272,0],135.19,1,0,[3.311e-005,1.35163e-005],"","",true,false], 
	["Land_TentA_F",[5.34082,0.216797,0],87.3948,1,0,[0,0],"","",true,false], 
	["Land_TentA_F",[4.35059,3.80078,0],57.6576,1,0,[0,0],"","",true,false], 
	["Land_TentA_F",[4.87402,-3.62891,0],118.2,1,0,[0,-0],"","",true,false], 
	["rhsgref_ins_DSHKM",[-0.734863,8.04834,-0.0673757],359.98,1,0,[0.985424,0.050495],"","",true,false], 
	["rhsgref_ins_DSHKM",[5.44824,-7.28345,-0.0673761],132.389,1,0,[0.985399,0.0505532],"","",true,false], 
	["Land_Sacks_heap_F",[2.02441,9.66797,0],22.6568,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Round_F",[3.82129,10.2207,-0.00130129],222.772,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Long_F",[1.0752,10.6113,-0.000999928],358.245,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Long_F",[-1.84277,10.5273,-0.000999928],358.245,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Round_F",[-4.65723,10.0762,-0.00130129],136.002,1,0,[0,-0],"","",true,false], 
	["Land_BagFence_Short_F",[8.10645,-7.53125,-0.000999928],259.241,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Short_F",[6.13965,-9.73438,-0.000999928],179.445,1,0,[0,-0],"","",true,false], 
	["Land_BagFence_Short_F",[7.6709,-8.9707,-0.000999928],131.627,1,0,[0,-0],"","",true,false], 
	["rhsgref_ins_DSHKM",[-9.67041,-6.78247,-0.0673771],219.677,1,0,[0.985512,0.0504348],"","",true,false], 
	["Land_BagFence_Round_F",[-10.5361,-9.46289,-0.00130129],4.48306,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Round_F",[-12.1982,-7.44336,-0.00130129],93.854,1,0,[0,-0],"","",true,false]
];

OT_AdditionalUnforms = [];

if(OT_hasWS) then {
	WS_local = [];
	WS_guerilla = ["U_lxWS_Djella_02_Brown","U_lxWS_Djella_02_Sand","U_lxWS_Djella_03_Green","U_lxWS_Djella_02_Grey","U_SFIA_deserter_lxWS","U_lxWS_SFIA_deserter","U_lxWS_ION_Casual2","U_lxWS_ION_Casual3","U_lxWS_ION_Casual4","U_lxWS_ION_Casual5","U_lxWS_ION_Casual6"];
	OT_clothes_guerilla append WS_guerilla;

	OT_AdditionalUnforms append WS_local;
	OT_AdditionalUnforms append OT_clothes_guerilla;
	OT_AdditionalUnforms append [
		"U_lxWS_C_Djella_03","U_lxWS_C_Djella_06","U_lxWS_C_Djella_02","U_lxWS_C_Djella_02a","U_lxWS_C_Djella_07","U_lxWS_C_Djella_05","U_lxWS_C_Djella_04","U_lxWS_C_Djella_01","U_lxWS_Tak_02_A",
		"U_lxWS_Tak_03_B","U_lxWS_Tak_03_A","U_lxWS_Tak_03_C","U_lxWS_Tak_01_B"
	];
	
	OT_NATO_Unit_PoliceCommander = "Com_Police_N3";
	OT_NATO_Unit_Police = "Com_Police_N4";
	
	OT_NATO_Vehicles_GroundSupport append ["APC_Wheeled_01_command_base_lxWS"];
	OT_NATO_Vehicles_APC append ["APC_Wheeled_01_atgm_base_lxWS"];
	
	OT_NATO_ReinforcementsWep append ["arifle_Velko_lxWS"];
	OT_NATO_GarrisonWep append ["srifle_EBR_snake_lxWS","arifle_VelkoR5_lxWS"];
	OT_NATO_GarrisonWepMG append ["LMG_S77_Desert_lxWS"];
	OT_NATO_GarrisonWepGL append ["arifle_VelkoR5_GL_lxWS"];
	OT_NATO_ArmyWep append ["arifle_VelkoR5_snake_lxWS","arifle_VelkoR5_GL_snake_lxWS","arifle_XMS_Base_khk_lxWS"];
	OT_NATO_ArmyWepGL append ["arifle_VelkoR5_GL_snake_lxWS","arifle_XMS_GL_Sand_lxWS"];
	OT_NATO_ArmyWepMG append ["LMG_S77_Compact_Snakeskin_lxWS"];
	OT_NATOBluprints append ["APC_Wheeled_01_atgm_base_lxWS","APC_Wheeled_01_command_base_lxWS","B_UAV_02_lxWS","APC_Wheeled_01_mortar_base_lxWS","B_ION_APC_Wheeled_02_hmg_lxWS","B_ION_Heli_Light_02_dynamicLoadout_lxWS","B_GEN_APC_Wheeled_02_hmg_lxWS","B_UN_Heli_Transport_02_lxWS","B_MBT_03_cannon_lxWS"];
};

if(OT_has3F) then {
	OT_NATO_ArmyLead append ["UK3CB_AAF_B_SL"];
	OT_NATO_Army append [["UK3CB_AAF_B_RIF_1","UK3CB_AAF_B_RIF_2","UK3CB_AAF_B_MD","UK3CB_AAF_B_DEM","UK3CB_AAF_B_GL","UK3CB_AAF_B_AR","UK3CB_AAF_B_MG","UK3CB_AAF_B_MK","UK3CB_AAF_B_LAT","UK3CB_AAF_B_SNI","UK3CB_AAF_B_SPOT","UK3CB_AAF_B_AA","UK3CB_AAF_B_AT","UK3CB_AAF_B_AT_ASST","UK3CB_AAF_B_MG_ASST"]];
	OT_NATO_ArmyBaseGroup append [["UK3CB_AAF_B_AA","UK3CB_AAF_B_AT","UK3CB_AAF_B_AR","UK3CB_AAF_B_MD"]];
	OT_NATO_Vehicle_Transport append ["UK3CB_AAF_B_M939","UK3CB_AAF_B_M977_Transport_Covered","UK3CB_AAF_B_M939_Guntruck"];
	OT_NATO_Vehicles_TankSupport append ["UK3CB_AAF_B_M1A1","UK3CB_AAF_B_FV4201"];
	OT_NATO_Vehicles_GroundSupport append ["UK3CB_AAF_B_M1117"];
	OT_NATO_Vehicles_GroundPatrol append ["UK3CB_AAF_B_AAV"];
	OT_NATO_Vehicles_APC append ["UK3CB_AAF_B_LAV25"];
	OT_NATO_ArmyWep append ["rhs_weap_hk416d145","rhs_weap_hk416d10_LMT"];
	OT_NATO_ArmyWepGL append ["rhs_weap_hk416d145_m320"];
	OT_NATO_ArmyWepSR append ["UK3CB_M14DMR_Railed"];
	OT_spawnFaction = "UK3CB_AAF_I";
};

if(OT_hasCW) then {
	OT_NATO_ArmyWep append ["CUP_arifle_ACR_tan_556","CUP_CZ_BREN2_556_11_Tan","CUP_arifle_L85A2","CUP_arifle_HK_M27","CUP_arifle_mk18_black","CUP_arifle_CZ805_A1_coyote"];
	OT_NATO_ArmyWepGL append ["CUP_arifle_ACR_EGLM_tan_556","CUP_CZ_BREN2_556_11_GL_Tan","CUP_arifle_L85A2_GL","CUP_arifle_HK_M27_AG36","CUP_arifle_CZ805_GL_coyote"];
	OT_NATO_ArmyWepSR append ["CUP_srifle_L129A1_d","CUP_srifle_RSASS_Sand","CUP_srifle_CZ750"];
	OT_NATO_ArmyWepMG append ["CUP_lmg_Mk48_tan","CUP_lmg_Mk48_nohg_des"];
	
	_append = ["CUP_arifle_AK47_Early","CUP_arifle_AK107","CUP_arifle_AK74_Early","CUP_arifle_AKM_Early","CUP_arifle_AKMS_Early","CUP_arifle_AK47","CUP_arifle_AKS74_Early","CUP_arifle_AKS74U","CUP_arifle_FNFAL","CUP_arifle_FNFAL_sand","CUP_arifle_Galil_SAR_black","CUP_arifle_FNFAL5061_wooden","CUP_arifle_Sa58_Klec","CUP_arifle_M16A1","CUP_arifle_M16A2","CUP_arifle_Sa58P","CUP_arifle_Sa58s","CUP_SKS","CUP_arifle_TYPE_56_2_Early"];
	OT_CRIM_Weapons append _append;
	
		_append = ["sp_fwa_l9a1_hipower_wood"];
	OT_CRIM_Pistols append _append;
	
		_append = ["sp_fwa_l9a1_hipower"];
	OT_NATO_weapons_Pistols append _append;
	
		_append = ["CUP_arifle_M4_MOE_BW","CUP_srifle_CZ550","CUP_smg_M3A1","CUP_smg_Mac10","CUP_smg_MP5A5","CUP_smg_MP5SD6","CUP_srifle_LeeEnfield","CUP_smg_bizon","CUP_srifle_Remington700","CUP_arifle_Sa58_sporter_compact","CUP_smg_saiga9","CUP_arifle_SAIGA_MK03_Wood","CUP_arifle_SR3M_Vikhr","CUP_smg_UZI"];
	OT_NATO_weapons_Police append _append;
};

if(OT_hasGM) then {
	OT_NATO_Vehicles_GroundSupport append ["gm_ge_army_m113a1g_apc"];
	OT_NATO_Vehicles_APC append ["gm_ge_army_marder1a2","gm_ge_army_bpz2a0","gm_dk_army_m113a2dk"];
	OT_NATO_Vehicles_TankSupport append ["gm_ge_army_Leopard1a5"];
	OT_NATO_Vehicles_GroundPatrol append ["gm_ge_army_fuchsa0_reconnaissance","gm_dk_army_m113a1dk_apc"];
	
	OT_NATO_ReinforcementsWep append ["gm_hk33a3_blk","gm_g11k2_blk","gm_m16a1_blk","gm_mpm85_blk","gm_sg550_blk","gm_mp5n_surefire_blk"];
	OT_NATO_ReinforcementsWepSR append ["gm_psg1_blk"];
	
	OT_NATO_GarrisonWep append ["gm_g3a3_oli","gm_g8a2_blk","gm_m16a2_blk","gm_sg542_oli"];
	OT_NATO_GarrisonWepMG append ["gm_mg3_blk"];
	OT_NATO_GarrisonWepSR append ["gm_msg90a1_blk"];
	
	OT_NATO_ArmyWep append ["gm_c7a1_oli","gm_hk53a2_blk","gm_g36a1_blk","gm_mp5a3_blk","gm_mp5a2_blk","gm_g8a1_blk"];
	OT_NATO_ArmyWepMG append ["gm_mg3_blk","gm_mg8a2_blk"];
	OT_NATO_ArmyWepSR append ["gm_msg90a1_blk","gm_g3a3_blk","gm_g3a3_oli"];
	
	_append = ["gm_mp2a1_blk","gm_hk512_wud","gm_pm63_blk","gm_mp5a5_blk","gm_mp5sd6_blk","gm_mp5nsd1_blk"];
	OT_NATO_weapons_Police append _append;
	
	OT_CRIM_Weapons append ["gm_ak74n_wud","gm_akm_wud","gm_akmsn_wud","gm_mpiak74n_blk","gm_mpiaks74nk_blk","gm_mpikm72_brn","gm_mpikm_brn","gm_mpikms72ksd_brn","gm_rpk_wud","gm_rpk74n_wud"];
	
		_append = ["gm_pim_blk","gm_pimb_blk","gm_pm63_handgun_blk","gm_pm_blk"];
	OT_CRIM_Pistols append _append;
	
		_append = ["gm_m49_blk","gm_p210_blk"];
	OT_NATO_weapons_Pistols append _append;
	
	OT_NATO_ArmyLead append ["gm_ge_army_squadleader_g36a1_p2a1_90_flk"];
	OT_NATO_Army append [
		[
			"gm_ge_army_rifleman_g36a1_90_flk","gm_ge_army_engineer_g36a1_90_flk","gm_ge_army_radioman_g36a1_90_flk","gm_ge_army_medic_g36a1_90_flk","gm_ge_army_demolition_g36a1_90_flk","gm_ge_army_machinegunner_mg3_90_flk","gm_ge_army_marksman_g3a3_90_flk","gm_ge_army_sf_marksman_g3a3_80_wdl","gm_ge_army_sf_rifleman_mp5a3_80_wdl","gm_ge_army_sf_antitank_mp5a2_pzf84_80_wdl","gm_ge_army_sf_antitank_assistant_mp5a2_pzf84_80_wdl","gm_ge_army_machinegunner_assistant_g36a1_mg3_90_flk"
		]
	];
	OT_NATO_ArmyBaseGroup append [["gm_ge_army_antiair_g36a1_fim43_90_flk","gm_ge_army_antitank_g36a1_pzf3_90_flk","gm_ge_army_machinegunner_mg3_90_flk	","gm_ge_army_medic_g36a1_90_flk"]];
	OT_NATO_Vehicle_Transport append ["gm_ge_army_kat1_451_cargo","gm_ge_army_u1300l_cargo"];
	OT_CRIM_Launchers append ["gm_rpg18_oli","gm_m72a3_oli"];
};