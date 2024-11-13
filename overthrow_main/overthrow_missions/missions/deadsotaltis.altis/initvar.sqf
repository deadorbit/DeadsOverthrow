OT_nation = "Altis";
OT_saveName = "Overthrow.altisDOT.001";

OT_tutorial_backstoryText = "Altis, the main island of the Republic of Altis and Stratis, is located in the Mediterranean Sea to the east of Malta. As of 2040, Altis is currently under occupation by NATO forces following a brutal civil war a half decade prior, and the nation is still recovering. NATO originally occupied the country under the promise of a complete withdrawal of forces and return to local democratic rule; despite this, NATO soldiers still occupy the island's military installations. The economy continues to stagnate and citizens are becoming increasingly angry at the lack of local autonomy.";
OT_startDate = [2040,7,14,8,00];

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

//Building templates
//To generate these templates:
//1. Open Arma editor, choose VR map
//2. Add the building you want to make a template for, set its location and rotation to 0,0,0
//3. Add furniture objects
//4. Add a player (any unit), Play the Scenario
//5. Run this in console: [getPos player, 50, true] call BIS_fnc_ObjectsGrabber
//6. Copy the results, paste them here and remove any extraneous items (ie the building, Logic, babe_helper, Signs)
//Note: objectgrabber seems to offset objects slightly (maybe due to the center of the building not being its visual center?) So you may have to slightly adjust the X/Y coords till they fit


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

/*
	TODO: hash data
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
//OT_item_Radio = "Land_PortableLongRangeRadio_F"; //Perchance to control HC squads
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
//Unused
OT_vehType_distro = "C_Van_01_box_F";
//Used by pier operator
OT_vehType_ferry = "C_Boat_Transport_02_F";
OT_vehType_service = "C_Offroad_01_repair_F";

OT_vehType_starterCar = "C_Quadbike_01_F"; //Vehicle every new player recives

private _trucks = [
	"RHS_Ural_Civ_01",
	"RHS_Ural_Civ_02",
	"RHS_Ural_Civ_03",
	"OT_C_Truck_recovery",
	"OT_C_rhsgref_nat_uaz",
	"OT_C_Ural"
];
//Vehicles that are sold in the dealership or can spawn on streets
OT_vehTypes_civ = [
	OT_vehType_starterCar,
	"C_Offroad_02_unarmed_F",
	"C_Offroad_01_F",
	"C_Hatchback_01_F",
	"C_Hatchback_01_sport_F",
	"C_Van_01_transport_F",
	"OT_C_T_LSV",
	"OT_C_T_LSV2",
	"C_SUV_01_F",
	"C_Van_02_transport_F",
	"C_Offroad_01_covered_F",
	"C_Offroad_01_comms_F",
	OT_vehType_service
] + _trucks;
//These vehicles will not spawn naturally, but can still be sold at dealership
OT_vehTypes_civignore = [
	"C_Hatchback_01_sport_F",
	"OT_C_T_LSV",
	"OT_C_T_LSV2",
	"C_Offroad_01_comms_F",
	OT_vehType_service
] + _trucks;

//Spawned civilians will have their outfits replaced with one of these
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

//---Unused---//
OT_clothes_police = ["U_I_G_resistanceLeader_F","U_BG_Guerilla2_1","U_BG_Guerilla2_3","U_I_C_Soldier_Para_4_F"];
OT_vest_police = "V_TacVest_blk_POLICE";
OT_hat_police = "H_Cap_police";
OT_clothes_mob = "U_I_C_Soldier_Camo_F";

//Police Units
OT_policeUnitAT 		= "OT_AltisPoliceATNoMods";
OT_policeUnitCaptain	= "OT_AltisPoliceCaptainNoMods";
OT_policeUnitCommander 	= "OT_AltisPoliceCommanderNoMods"; 
OT_policeUnitHeavy 		= "OT_AltisPoliceManHeavyNoMods";
OT_policeUnitHeavyAT	= "OT_AltisPoliceATHeavyNoMods";
OT_policeUnitLight 		= "OT_AltisPoliceManLightNoMods";
OT_policeUnitMedic 		= "OT_AltisPoliceMedicNoMods";
OT_policeUnitRegular 	= "OT_AltisPoliceManNoMods";

//---New Player Spawn items---//
OT_Player_SpawnBackpack = [
	"B_CivilianBackpack_01_Everyday_Astra_F","B_CivilianBackpack_01_Everyday_Black_F",
	"B_CivilianBackpack_01_Everyday_Vrana_F","B_CivilianBackpack_01_Everyday_IDAP_F",
	"B_CivilianBackpack_01_Sport_Blue_F","B_CivilianBackpack_01_Sport_Green_F",
	"B_CivilianBackpack_01_Sport_Red_F"
];

//Dealers will always sell one of these at a discount rate
//OT_CheapRifles = ["arifle_AKM_F","arifle_AKS_F","rhs_weap_akm","rhs_weap_ak74","rhs_weap_akms","rhs_weap_aks74","rhs_weap_aks74u","rhs_weap_l1a1_wood","arifle_TRG20_F","rhs_weap_m70b1","rhs_weap_m76"];

//------NATO Vars------//
OT_NATO_HMG = "RHS_M2StaticMG_D"; // Spawns in Nato towers
OT_NATO_Vehicles_AirGarrison = [ //Only used for spawning ambient vehicles at airports
	["B_Heli_Light_01_armed_F",1],
	["B_Heli_Transport_03_F",2],
	["RHS_UH60M_MEV2_d",1],
	["RHS_AH1Z",1],
	["RHS_UH1Y_d",2]
];
OT_NATO_Vehicles_StaticAAGarrison = ["B_SAM_System_02_F","B_SAM_System_02_F","B_Radar_System_01_F","B_SAM_System_03_F"]; //Added to every airfield

OT_NATO_Vehicles_JetGarrison = [
	["B_Plane_CAS_01_dynamicLoadout_F", 2],
	["B_UAV_05_F", 1]
];
//---NATO Bases garrison vehicles---//
OT_NATO_StaticGarrison_LevelOne = [
	"RHS_M2StaticMG_D", "RHS_M2StaticMG_D",
	"rhsusf_m1045_d_s", "rhsusf_m1240a1_m240_usarmy_d",
	"rhsusf_m1151_m2crows_usarmy_d"
];
OT_NATO_StaticGarrison_LevelTwo = [
	"RHS_M2StaticMG_D", "RHS_TOW_TriPod_D",
	"RHS_MK19_TriPod_D", "rhsusf_m1240a1_mk19_uik_usarmy_d",
	"rhsusf_m1045_d_s", "rhsusf_stryker_m1126_mk19_d",
	"B_AFV_Wheeled_01_cannon_F", "RHS_M252_D","RHS_M2A2"
];
OT_NATO_StaticGarrison_LevelThree = [
	"RHS_TOW_TriPod_D", "RHS_TOW_TriPod_D",
	"RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D",
	"RHS_M2StaticMG_D", "RHS_MK19_TriPod_D",
	"rhsusf_m1240a1_mk19_uik_usarmy_d", "rhsusf_m1240a1_mk19_uik_usarmy_d",
	"rhsusf_M1084A1R_SOV_M2_D_fmtv_socom", "RHS_M252_D",
	"rhsusf_m1a1fep_d", "B_AFV_Wheeled_01_up_cannon_F",
	"RHS_M2A3_BUSKI"
];
OT_NATO_StaticGarrison_HQ = [
	"RHS_TOW_TriPod_D", "RHS_TOW_TriPod_D",
	"RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D",
	"RHS_M2StaticMG_D", "RHS_M2StaticMG_D",
	"RHS_MK19_TriPod_D", "rhsusf_m1240a1_mk19_uik_usarmy_d",
	"rhsusf_m1240a1_mk19crows_usmc_d", "B_APC_Tracked_01_rcws_F",
	"RHS_M252_D", "B_MBT_01_TUSK_F",
	"rhsusf_m1a2sep1tuskiid_usarmy", "rhsusf_m1a2sep1tuskiid_usarmy",
	"B_APC_Tracked_01_AA_F", "B_APC_Tracked_01_AA_F",
	"RHS_M2A3_BUSKIII", "RHS_M2A3_BUSKIII"
];


OT_NATO_CommTowers = ["Land_TTowerBig_1_F","Land_TTowerBig_2_F"];//Not used


//Troops spawned to defend comms towers
OT_NATO_Unit_Sniper = "B_ghillie_ard_F";
OT_NATO_Unit_Spotter = "B_spotter_F";
OT_NATO_Unit_AA_spec = "B_soldier_AA_F";
OT_NATO_Unit_AA_ass = "B_soldier_AAA_F";
OT_NATO_Unit_AT_spec = "B_soldier_LAT2_F";
OT_NATO_Unit_TeamLeader = "B_Soldier_TL_F";

OT_NATO_Engineer = "rhsusf_army_ocp_engineer";//Added to crew space of infantry support vehicles
OT_NATO_Vehicle_Support_Troop = "rhsusf_army_ocp_riflemanl";//Added to fill space of infantry support vehicles

OT_NATO_Unit_SquadLeader = "rhsusf_usmc_marpat_d_squadleader";//This isnt currently used anywhere

OT_NATO_Unit_HVT = "B_officer_F";

//------VEHICLE SETTINGS------//
//---POLICE VEHICLES---//
OT_NATO_Vehicle_PoliceHeli = ["RHS_UH1Y_d"]; //Currently unused
OT_NATO_Vehicle_Police = ["B_GEN_Offroad_01_covered_F", "B_GEN_Van_02_transport_F"]; //Vehicle that police will sometimes drive to towns in

//---NATO VEHICLES---//
OT_NATO_Vehicle_Transport = ["B_Truck_01_transport_F","B_Truck_01_covered_F","rhsusf_M1083A1P2_B_M2_D_fmtv_usarmy"];
OT_NATO_Vehicle_Transport_Light = "B_LSV_01_unarmed_F";
OT_NATO_Vehicles_PoliceSupport = ["rhsusf_m1025_d_s_m2","rhsusf_m1025_d_s_Mk19","rhsusf_CGRCAT1A2_M2_usmc_d","rhsusf_CGRCAT1A2_Mk19_usmc_d"]; // Unused
OT_NATO_Vehicles_ReconDrone = "B_UAV_01_F";
OT_NATO_Vehicles_ReconDroneLarge = [ //[vehcls, [[pylonIDX, wpn]]];
	"B_UAV_02_dynamicLoadout_F",
	[
		[1, ""],
		[2, ""]
	]
];
OT_NATO_Vehicles_CASDrone = "B_UAV_02_CAS_F";
OT_NATO_Vehicles_AirSupport = ["B_Heli_Attack_01_F","RHS_AH64DGrey","RHS_AH1Z"];
OT_NATO_Vehicles_AirSupport_Small = ["B_Heli_Light_01_armed_F","RHS_MELB_AH6M","RHS_UH1Y"];
OT_NATO_Vehicles_GroundSupport = ["B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","B_LSV_01_armed_F","rhsusf_m1240a1_mk19crows_usmc_d","rhsusf_m1240a1_m2crows_usmc_d"];
OT_NATO_Vehicles_GroundPatrol = ["rhsusf_M1232_M2_usarmy_d","rhsusf_M1237_MK19_usarmy_d","rhsusf_stryker_m1126_m2_d","rhsusf_stryker_m1126_mk19_d"];//should have higher seating capacity
OT_NATO_Vehicles_TankSupport = ["B_MBT_01_TUSK_F","B_MBT_01_cannon_F","rhsusf_m1a2sep1tuskiid_usarmy","rhsusf_m1a1aim_tuski_d","B_AFV_Wheeled_01_up_cannon_F"];
OT_NATO_Vehicles_Convoy = ["B_UGV_01_rcws_F","B_MRAP_01_hmg_F","B_Truck_01_box_F","B_UGV_01_rcws_F"];//third unit gets extra cargo
OT_NATO_Vehicles_AirWingedSupport = ["B_Plane_Fighter_01_F","B_Plane_CAS_01_F"];
OT_NATO_Vehicle_AirTransport_Small = ["RHS_UH1Y_d"];
OT_NATO_Vehicle_AirTransport = ["B_Heli_Transport_03_F","B_Heli_Transport_01_F","rhsusf_CH53E_USMC_GAU21_D"];
//OT_NATO_Vehicle_AirTransport_Large = ["RHS_CH_47F_light"]; //Unused
OT_NATO_Vehicle_PlaneTransport = ["RHS_C130J", "B_T_VTOL_01_infantry_blue_F"]; //Unused
OT_NATO_Vehicle_Boat_Small = "B_Boat_Armed_01_minigun_F";
OT_NATO_Vehicles_APC = ["B_APC_Wheeled_01_cannon_F","B_APC_Tracked_01_rcws_F","B_APC_Tracked_01_CRV_F","RHS_M2A3_BUSKIII","RHS_M6","B_AFV_Wheeled_01_cannon_F"];
OT_NATO_Vehicle_HVT = "B_MRAP_01_F";
OT_NATO_Vehicle_CTRGTransport = "B_CTRG_Heli_Transport_01_tropic_F";
//Statics that can additionally be assigned to bases
OT_NATO_Random_Statics = ["RHS_M2StaticMG_USMC_D","RHS_TOW_TriPod_USMC_D"];
//Currently Unused
OT_NATO_Vehicle_Ammotruck = ["B_Truck_01_ammo_F", "rhsusf_M977A4_AMMO_BKIT_usarmy_d"];
OT_NATO_Vehicle_SlingLoadHeli = [];

//---NATO Magic Artillary---//
OT_NATO_Vehicles_VirArty = ["6Rnd_155mm_Mo_smoke","6Rnd_155mm_Mo_AT_mine"]; //Smoke and ATmines

//------NATO INFANTRY SETTINGS------//
//New special force that comes midgame when base has been attacked
OT_NATO_APCBrigade_Lead = "rhsusf_socom_marsoc_teamleader";
OT_NATO_APCBrigade_Vehicles = ["RHS_M2A3_BUSKIII","RHS_M2A3_BUSKIII"];
OT_NATO_APCBrigade_Infantry = ["rhsusf_socom_marsoc_cso_grenadier","rhsusf_socom_marsoc_marksman","rhsusf_socom_marsoc_sarc","rhsusf_socom_marsoc_sniper_m107","rhsusf_socom_marsoc_cso_mk17"];//Squad Per Vehicle


//---GUN CREW---//
//Format [["backpack1", "backpack2"...], "leader", ["man1", "man2"...]]
OT_NATO_ArmyHMGTeam = [ 
	[
		"B_HMG_01_weapon_F",
		"B_HMG_01_support_F"
	],
	"B_Soldier_TL_F",
	[
		"B_support_AMG_F",
		"B_support_AMG_F"
	]
];
OT_NATO_ArmyGMGTeam = [
	[
		"B_GMG_01_weapon_F",
		"B_HMG_01_support_F"
	],
	"B_Soldier_TL_F",
	[
		"B_support_AMG_F",
		"B_support_AMG_F"
	]
];
OT_NATO_ArmyATTeam = [
	[
		"B_AT_01_weapon_F",
		"B_HMG_01_support_F"
	],
	"B_Soldier_TL_F",
	[
		"B_support_AMG_F",
		"B_support_AMG_F"
	]
];
OT_NATO_ArmyMortarTeam = [
	[
		"B_Mortar_01_weapon_F",
		"B_Mortar_01_support_F"
	],
	"B_Soldier_TL_F",
	[
		"B_support_AMG_F",
		"B_support_AMG_F"
	]
];

//Troops that come to assist police/ run checkpoints
OT_NATO_ReinforcementsLead = "B_recon_TL_F";
OT_NATO_Reinforcements = [
	"B_recon_exp_F","B_recon_JTAC_F",
	"B_recon_M_F","B_recon_medic_F",
	"B_recon_F","B_recon_LAT_F",
	"B_Recon_Sharpshooter_F", "B_Patrol_Soldier_M_F",
	"B_ghillie_sard_F", "B_Patrol_Soldier_AR_F",
	"B_Patrol_Soldier_MG_F"
];
//Troops that gaurd objectives/bases
OT_NATO_GarrisonLead = "rhsusf_army_ocp_teamleader";
OT_NATO_Garrison = [
	"rhsusf_army_ocp_javelin", "rhsusf_army_ocp_maaws",
	"rhsusf_army_ocp_aa", "rhsusf_army_ocp_autorifleman",
	"rhsusf_army_ocp_marksman", "rhsusf_army_ocp_grenadier",
	"rhsusf_army_ocp_sniper", "rhsusf_army_ocp_machinegunner",
	"rhsusf_army_ocp_riflemanl", "rhsusf_army_ocp_riflemanat",
	"rhsusf_army_ocp_rifleman_m4", "rhsusf_army_ocp_medic",
	"rhsusf_army_ocp_engineer"
];
//Troops that are sent to battle for towns/bases. Divided into sets to allow for modded squads that dont mix soldier factions
OT_NATO_ArmyLead = ["B_Soldier_TL_F"];
OT_NATO_Army = [
	[
		"B_soldier_AR_F", "B_medic_F",
		"B_soldier_exp_F", "B_Soldier_GL_F",
		"B_soldier_M_F", "B_soldier_AAA_F",
		"B_Soldier_F", "B_soldier_LAT_F",
		"B_soldier_LAT2_F", "B_Soldier_lite_F",
		"B_Sharpshooter_F", "B_ghillie_ard_F",
		"B_soldier_AA_F", "B_spotter_F",
		"B_soldier_AAA_F", "B_soldier_AAR_F",
		"B_Soldier_A_F"
	]
];

//Attacking squads always have these troops gaurenteed in them (+ squadleader)
OT_NATO_ArmyBaseGroup = [
	[
		"B_soldier_AA_F", "B_soldier_AT_F",
		"B_soldier_AR_F", "B_medic_F"
	]
];
//---Weapons/attachements for NATO---///
//scope is chosen by (compatibleItems [_wpn, "CowsSlot"] arrayintersect OT_NATO_WepLowOptics)
OT_NATO_WepLowOptics = [
	"optic_ACO", "optic_Hamr",
	"optic_Holosight", "optic_ERCO_snd_F",
	"optic_ERCO_blk_F", "rhsusf_acc_ACOG3",
	"rhsusf_acc_ACOG3_USMC", "rhsusf_acc_ACOG_USMC",
	"rhsusf_acc_ACOG", "rhsusf_acc_g33_xps3_tan",
	"rhsusf_acc_g33_T1", "rhsusf_acc_anpvs27",
	"rhsusf_acc_EOTECH", "rhsusf_acc_M2A1",
	"rhsusf_acc_eotech_552_d", "rhsusf_acc_compm4",
	"rhsusf_acc_mrds_c", "rhsusf_acc_RX01_tan",
	"rhsusf_acc_su230", "rhsusf_acc_su230a_c",
	"rhsusf_acc_T1_high", "rhsusf_acc_ACOG_d",
	"rhsusf_acc_ACOG_RMR", "rhsusf_acc_eotech_xps3",
	"rhsgref_acc_RX01_NoFilter_camo"
];
OT_NATO_WepHighOptics = [
	"optic_SOS", "optic_LRPS",
	"optic_AMS", "optic_AMS_snd",
	"rhsusf_acc_M8541", "rhsusf_acc_M8541_d",
	"rhsusf_acc_premier_mrds", "rhsusf_acc_LEUPOLDMK4_2",
	"rhsusf_acc_LEUPOLDMK4_2_d", "rhsusf_acc_nxs_3515x50f1_h58_sun",
	"rhsusf_acc_ACOG_MDO"
];
OT_NATO_WepMuzzles = [//TODO
	"muzzle_snds_m_snd_F", "muzzle_snds_M",
	"ACE_muzzle_mzls_L", "rhsusf_acc_nt4_tan",
	"rhsusf_acc_rotex5_tan", "ACE_muzzle_mzls_B",
	"muzzle_snds_B", "muzzle_snds_B_arid_F",
	"rhsusf_acc_m24_silencer_d", "rhsusf_acc_M2010S_d",
	"rhsusf_acc_aac_762sd_silencer", "rhsusf_acc_aac_m14dcqd_silencer_d",
	"rhsusf_acc_m14_flashsuppresor", "muzzle_snds_338_sand",
	"ACE_muzzle_mzls_338", "muzzle_snds_H_snd_F",
	"ACE_muzzle_mzls_H", "muzzle_snds_L",
	"muzzle_snds_acp", "muzzle_snds_570"
	
];
OT_NATO_WepPointers = [
	"acc_pointer_IR", "rhsusf_acc_anpeq15side",
	"acc_flashlight", "ACE_DBAL_A3_Red",
	"rhsusf_acc_anpeq15A", "rhsusf_acc_anpeq16a",
	"rhsusf_acc_M952V", "rhsusf_acc_wmx"
];
OT_NATO_WepBipods = [
	"bipod_01_F_snd", "bipod_02_F_tan",
	"rhsusf_acc_harris_bipod", "bipod_03_F_blk",
	"rhsusf_acc_grip2", "rhsusf_acc_grip1",
	"rhsusf_acc_grip3", "rhsusf_acc_m14_bipod",
	"rhsusf_acc_tacsac_blk", "rhsusf_acc_grip_m203_blk",
	"rhsusf_acc_saw_bipod"
];
OT_NATOWepPistolOptics = [//TODO
	"optic_MRD", "optic_Yorris"
];
//---NATO Millitary Weapons By role---//
//Pistols for millitary
OT_NATO_WepPistol = [
	"hgun_P07_F", "hgun_ACPC2_F",
	"rhsusf_weap_m9", "hgun_Pistol_heavy_01_F"
];
//---Reinforcement Weapons---//
OT_NATO_ReinforcementsWep = [
	"arifle_MXC_F","SMG_03C_camo",
	"SMG_01_F","rhs_weap_m4_carryhandle",
	"rhs_weap_m4","rhsusf_weap_MP7A2_desert",
	"rhs_weap_g36c","rhs_weap_vhsk2",
	"arifle_SPAR_01_snd_F", "srifle_DMR_06_hunter_F"
];
OT_NATO_ReinforcementsWepGL = [
	"rhs_weap_m4_carryhandle_m203S", "rhs_weap_hk416d10_m320",
	"rhs_weap_m16a4_carryhandle_M203", "arifle_SPAR_01_GL_snd_F"
];
OT_NATO_ReinforcementsWepMG = [
	"arifle_MX_SW_F", "LMG_03_F",
	"rhs_weap_m249"
];
OT_NATO_ReinforcementsWepSR = [
	"rhs_weap_m24sws_d", "rhs_weap_m40a5_d",
	"srifle_DMR_02_sniper_F", "rhs_weap_sr25_d",
	"rhs_weap_m14ebrri"
];
OT_NATO_ReinforcementsWepAT = [
	"rhs_weap_m72a7", "rhs_weap_M136",
	"rhs_weap_M136_hedp"
];
//---QRF Army Weapons---//
OT_NATO_ArmyWep = [
	"arifle_MX_F", "arifle_MXC_F",
	"srifle_EBR_F", "arifle_MXM_F",
	"rhs_weap_m4a1_carryhandle", "rhs_weap_m4a1_blockII_d",
	"rhs_weap_g36kv", "rhs_weap_m27iar",
	"rhs_weap_m4a1_d_mstock", "rhs_weap_vhsd2_ct15x",
	"arifle_MSBS65_sand_F", "rhs_weap_mk18",
	"rhs_weap_SCARH_FDE_CQC", "rhs_weap_SCARH_FDE_STD",
	"rhs_weap_m14_socom"
];
OT_NATO_ArmyWepGL = [
	"arifle_MX_GL_F", "rhs_weap_m4a1_carryhandle_m203",
	"rhs_weap_m4a1_blockII_M203_d", "arifle_MSBS65_UBS_sand_F",
	"rhs_weap_g36kv_ag36", "rhs_weap_vhsd2_bg_ct15x", "rhs_weap_mk18_m320"
];
OT_NATO_ArmyWepMG = [
	"LMG_Mk200_F", "arifle_MX_SW_F",
	"rhs_weap_m249_pip_S_para", "rhs_weap_m249_light_S",
	"arifle_SPAR_02_snd_F", "rhs_weap_minimi_para_railed"
];
OT_NATO_ArmyWepSR = [
	"srifle_DMR_03_tan_F", "rhs_weap_m40a5_d",
	"rhs_weap_XM2010_d", "arifle_SPAR_03_snd_F",
	"arifle_MSBS65_Mark_sand_F", "rhs_weap_m14_ris_d",
	"rhs_weap_SCARH_FDE_LB", "srifle_DMR_06_camo_F"
];
OT_NATO_ArmyWepAT = [
	"launch_B_Titan_short_F", "launch_MRAWS_sand_rail_F",
	"rhs_weap_maaws", "rhs_weap_smaw_green"
];
//---Base Garrison Weapons---//
OT_NATO_GarrisonWep = [
	"srifle_EBR_F", "arifle_MX_F",
	"arifle_MX_SW_F", "arifle_MXM_F",
	"srifle_DMR_06_camo_F", "srifle_DMR_02_sniper_F",
	"srifle_DMR_03_tan_F", "rhs_weap_m14ebrri",
	"rhs_weap_m14_ris_d", "rhs_weap_m27iar_grip",
	"rhs_weap_m4a1_carryhandle", "rhs_weap_m4a1_blockII_d",
	"rhs_weap_m4a1_d", "rhs_weap_sr25_d",
	"rhs_weap_mk17_STD", "rhs_weap_mk17_LB",
	"rhs_weap_mk18_d", "arifle_SPAR_02_snd_F"
];
OT_NATO_GarrisonWepGL = [
	"arifle_MX_GL_F", "rhs_weap_m4a1_blockII_M203_d",
	"rhs_weap_m4_m320", "rhs_weap_m32",
	"rhs_weap_m4_carryhandle_m203", "rhs_weap_m16a4_carryhandle_M203"
];
OT_NATO_GarrisonWepMG = [
	"MMG_01_tan_F" ,"MMG_02_sand_F",
	"rhs_weap_m240G", "rhs_weap_m249_pip_L",
	"rhs_weap_m240B"
];
OT_NATO_GarrisonWepSR = [
	"srifle_LRR_camo_F", "rhs_weap_XM2010_d",
	"rhs_weap_M107_d"
];
OT_NATO_GarrisonAT = [
	"rhs_weap_fgm148", "launch_NLAW_F",
	"launch_B_Titan_F", "launch_MRAWS_sand_F"
];
//---Police Weapons---//
OT_NATO_PoliceWep = [
	"SMG_03_camo", "rhs_weap_savz61",
	"SMG_02_F", "SMG_05_F",
	"hgun_PDW2000_F", "rhs_weap_pp2000",
	"rhs_weap_M590_8RD", "rhs_weap_kar98k",
	"sgun_HunterShotgun_01_F", "ot_rhs_weap_m4_le6920",
	"ot_rhs_weap_m4_le6920T", "ot_weap_mr556"
];
OT_NATO_PoliceWepGL = [
	"rhs_weap_m79"
];
OT_NATO_PoliceWepGLAmmo = [//Probably should be something 'less than leathal'
	"rhs_mag_m4009"
];
OT_NATO_PoliceWepPistol = [
	"hgun_P07_blk_F", "rhsusf_weap_m9",
	"hgun_Pistol_heavy_02_F", "rhs_weap_cz99",
	"rhsusf_weap_glock17g4", "rhsusf_weap_m1911a1"
];
OT_NATO_Goggles_Police = ["G_Aviator","G_Bandanna_aviator","G_Bandanna_sport","G_Bandanna_shades","G_Shades_Blue","G_Shades_Black","G_Squares_Tinted","G_Squares","G_Bandanna_blk"];

OT_NATOBluprints = ["B_Truck_01_fuel_F","B_Truck_01_box_F","B_Truck_01_ammo_F","B_Truck_01_transport_F","B_Truck_01_covered_F","B_LSV_01_unarmed_F","B_LSV_01_AT_F","B_LSV_01_armed_F","B_Quadbike_01_F","B_MRAP_01_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","B_Heli_Light_01_dynamicLoadout_F","B_Heli_Transport_03_unarmed_F","B_APC_Wheeled_01_cannon_F","B_Boat_Armed_01_minigun_F","B_CTRG_LSV_01_light_F","rhsusf_m1025_d_m2","rhsusf_m1025_d_Mk19","rhsusf_m1025_d","rhsusf_m1045_d","RHS_CH_47F_light","rhsusf_M1117_D","rhsusf_M1220_usarmy_d","rhsusf_M1220_M2_usarmy_d","rhsusf_M1078A1P2_D_fmtv_usarmy","rhsusf_M977A4_AMMO_BKIT_usarmy_d","rhsusf_M977A4_REPAIR_usarmy_d","rhsusf_M978A4_usarmy_d","rhsusf_m998_d_s_2dr_fulltop","RHS_UH1Y_UNARMED_d","RHS_UH1Y_d"]; //List of blueprints player can get from laptop

OT_CRIM_Weapons = ["rhs_weap_ak74","rhs_weap_ak74_3","rhs_weap_ak74_2","rhs_weap_ak74n","rhs_weap_akm","rhs_weap_akmn","rhs_weap_akms","rhs_weap_aks74","rhs_weap_aks74u","srifle_DMR_06_hunter_F","arifle_AKM_F","arifle_AKS_F","rhs_weap_m1garand_sa43","rhs_weap_savz58v","rhs_weap_savz58p","rhs_weap_m70b3n","rhs_weap_m21a","rhs_weap_ak104","rhs_weap_ak105","rhs_weap_ak74m_desert"];
OT_CRIM_Pistols = ["rhs_weap_6p53","rhs_weap_pb_6p9","hgun_Pistol_heavy_02_F","hgun_Pistol_01_F","rhs_weap_makarov_pm","rhs_weap_tt33","rhs_weap_cz99_etched","hgun_Rook40_F","rhs_weap_type94_new","hgun_P07_blk_F"];
OT_CRIM_Launchers = ["rhs_weap_panzerfaust60","rhs_weap_rpg18","rhs_weap_rshg2","rhs_weap_rpg26","rhs_weap_rpg75","rhs_weap_m80"];

OT_Forced_Weapons = []; // Forces the game to detect these classes,mainly for weapons with 'MissileLauncher' as a parent

OT_NATO_Sandbag_Curved = "Land_BagFence_Round_F";
OT_NATO_Barrier_Small = "Land_HBarrier_5_F";
OT_NATO_Barrier_Large = "Land_HBarrierWall6_F";

OT_NATO_Mortar = "B_Mortar_01_F";

//------Criminal Vars------//
OT_CRIM_Unit = "C_man_p_fugitive_F";
OT_CRIM_Clothes = ["U_I_C_Soldier_Bandit_3_F","U_BG_Guerilla3_1","U_C_HunterBody_grn","U_I_G_Story_Protagonist_F","rhs_uniform_6sh122_gloves_v2","rhs_uniform_6sh122_gloves_v1","rhs_uniform_emr_des_patchless",
"rhs_uniform_emr_patchless","rhs_uniform_flora_patchless","rhs_uniform_gorka_r_g_gloves","rhs_uniform_gorka_1_b","rhs_uniform_mvd_izlom","rhs_uniform_afghanka_boots_moldovan_ttsko_hot","rhs_uniform_mflora_patchless","rhs_uniform_vkpo_gloves",
"U_I_L_Uniform_01_camo_F","U_I_L_Uniform_01_deserter_F"
];
OT_CRIM_Goggles = ["G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","G_Balaclava_oli","G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_oli","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_tan"];
OT_CRIM_Backpacks = [];

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

//---Import mission Templates---//
OT_Recruitables = call compile preprocessFileLineNumbers "data\templates\guerloadouts.sqf";
/*
	TODO: rename to crimCampLVL2
*/
OT_guerCampLVL2 = call compile preprocessFileLineNumbers "data\templates\crimcamplvl2.sqf";

//Mod compatibilty
call compile preprocessFileLineNumbers "initvarmodcompat.sqf";

//Vcomdriving settings
VCM_DRIVERLIMIT = 4;
VCM_DrivingActivated = true;
VCM_DrivingDelay = 0.7;
VCM_DrivingDist = 10;

//Add Together some groups
OT_NATO_AllPolice = [
	OT_policeUnitAT,
	OT_policeUnitCaptain,
	OT_policeUnitCommander,
	OT_policeUnitHeavy,
	OT_policeUnitHeavyAT,
	OT_policeUnitLight,
	OT_policeUnitMedic,
	OT_policeUnitRegular
];

OT_NATO_AllReinforcements =+ OT_NATO_Reinforcements;
OT_NATO_AllReinforcements pushBack OT_NATO_ReinforcementsLead;

OT_NATO_AllGarrison =+ OT_NATO_Garrison;
OT_NATO_AllGarrison pushBack OT_NATO_GarrisonLead;

OT_NATO_AllArmy =+ OT_NATO_Army;
OT_NATO_AllArmy pushBack OT_NATO_ArmyLead;
OT_NATO_AllArmy = flatten OT_NATO_AllArmy;
OT_NATO_AllArmy arrayIntersect OT_NATO_AllArmy;

OT_NATO_AllUnits =+ (OT_NATO_AllReinforcements + OT_NATO_AllGarrison + OT_NATO_AllArmy + OT_NATO_AllPolice);
OT_NATO_AllUnits arrayIntersect OT_NATO_AllUnits;

diag_log format["All Nato Units: %1", OT_NATO_AllUnits];

OT_NATO_AllAR =+ (OT_NATO_ReinforcementsWep + OT_NATO_GarrisonWep +  OT_NATO_ArmyWep + OT_NATO_PoliceWep);
OT_NATO_AllAR arrayIntersect OT_NATO_AllAR;

OT_NATO_AllGL =+ (OT_NATO_ArmyWepGL + OT_NATO_GarrisonWepGL + OT_NATO_ReinforcementsWepGL);
OT_NATO_AllGL arrayIntersect OT_NATO_AllGL;

OT_NATO_AllMG =+ (OT_NATO_ReinforcementsWepMG + OT_NATO_GarrisonWepMG + OT_NATO_ArmyWepMG);
OT_NATO_AllMG arrayIntersect OT_NATO_AllMG;

OT_NATO_AllSR =+ (OT_NATO_ReinforcementsWepSR + OT_NATO_GarrisonWepSR + OT_NATO_ArmyWepSR + ["rhs_weap_M107_leu"]);
OT_NATO_AllSR arrayIntersect OT_NATO_AllSR;

OT_NATO_AllAT =+ (OT_NATO_ReinforcementsWepAT + OT_NATO_ArmyWepAT + OT_NATO_GarrisonAT);
OT_NATO_AllAT arrayIntersect OT_NATO_AllAT;

OT_NATO_AllPistols =+ (OT_NATO_WepPistol + OT_NATO_PoliceWepPistol);
OT_NATO_AllPistols arrayIntersect OT_NATO_AllPistols;

OT_NATO_AllWep =+ (OT_NATO_AllAR + OT_NATO_AllGL + OT_NATO_AllMG + OT_NATO_AllSR + OT_NATO_AllAT + OT_NATO_AllPistols);
OT_NATO_AllWep arrayIntersect OT_NATO_AllWep;

OT_allBLUOffensiveVehicles = [];
OT_allBLUVehicles = [];

{
	OT_allCivVehs set [_x, true];
}foreach(OT_vehTypes_civ);

//Calculate vehicle spawn weights
[] call OT_fnc_getVehicleWeights;