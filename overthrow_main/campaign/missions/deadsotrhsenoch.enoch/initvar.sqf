
HCEnabled = false;
AllowAirD = false;

OT_nation = "Livonia";
OT_saveName = "Overthrow.LivoniaDOT.001";

OT_tutorial_backstoryText = "Shit Hitting the Fan";
OT_startDate = [2025,7,27,8,00];

OT_startCameraPos = [9530.23,1138.76,5];
OT_startCameraTarget = [9154.2,987.363,50];

//Used to control updates and persistent save compatability. When these numbers go up, that section will be reinitialized on load if required. (ie leave them alone)
OT_economyVersion = 5;
OT_NATOversion = 5;
OT_CRIMversion = 2;

OT_faction_NATO = "BLU_W_F";
OT_spawnFaction = "IND_F"; //This faction will have a rep in spawn town

OT_flag_NATO = "Flag_NATO_F";
OT_flag_CRIM = "Flag_Syndikat_F";
OT_flag_IND = "Flag_Enoch_F";
OT_flagImage = "\overthrow_main\flags\Arma3-flag-ldf.paa";
OT_flagMarker = "flag_Enoch";

OT_populationMultiplier = 1.8; //Used to tweak populations per map

OTForcedCarShops = [[6381.49,10990.7,0],[11238.4,4373.22,0],[3342.65,2040.79,0],[11497.7,429.332,0]];//Mainly for Livonia, to fix broken carshop spawns

//Building templates
//To generate these templates:
//1. Open Arma editor, choose VR map
//2. Add the building you want to make a template for, set its location and rotation to 0,0,0
//3. Add furniture objects
//4. Add a player (any unit), Play the Scenario
//5. Run this in console: [getPos player, 50, true] call BIS_fnc_ObjectsGrabber
//6. Copy the results, paste them here and remove any extraneous items (ie the building, Logic, babe_helper, Signs)

OT_shopBuildings = [
	["Land_VillageStore_01_F",[]],
	["Land_Workshop_03_F",[]],
	["Land_Workshop_02_F",[]],
	["Land_Workshop_01_F",[]],
	["Land_Workshop_01_grey_F",[]],
	["Land_Workshop_02_grey_F",[]],
	["Land_Workshop_03_grey_F",[]],
	["Land_HealthCenter_01_F",[]]
];
OT_carShopBuildings = [
	["Land_FuelStation_03_shop_F",[]]
];
OT_spawnHouseBuildings = [
	["Land_House_1W01_F",[
		["Land_MetalCase_01_small_F",[-0.0391073,-2.38339,-0.00100088],269.766,1,0,[2.80922e-005,-0.000455107],"","",true,false],
		["Land_CampingChair_V2_F",[-0.95352,2.19191,-0.000998974],205.312,1,0,[0.000419523,0.00036544],"","",true,false],
		["OfficeTable_01_new_F",[-0.669114,2.76221,-0.000998974],3.3096e-005,1,0,[-6.48772e-005,0.000181224],"","",true,false],
		["Land_MapBoard_Enoch_F",[2.80548,0.361253,-0.00155544],86.6927,1,0,[-0.294008,-0.0546504],"","",true,false],
		["B_CargoNet_01_ammo_F",[2.65323,-1.62338,-0.00099659],360,1,0,[-0.000187827,0.000360995],"","",true,false],
		["Land_Workbench_01_F",[2.20189,2.67528,-0.000597],359.805,1,0,[0.103474,-0.00103475],"","",true,false]
	]],
	["Land_House_1W10_F",[
		["Land_CampingChair_V2_F",[0.920077,-0.901972,0.034317],24.7907,1,0,[-0.124043,0.271041],"","",true,false],
		["OfficeTable_01_new_F",[0.640592,-1.47487,0.0357647],179.487,1,0,[-0.00276878,-0.297944],"","",true,false],
		["Land_MetalCase_01_small_F",[1.14552,1.94735,0.0331335],92.3128,1,0,[-0.297861,-0.0119579],"","",true,false],
		["Land_Workbench_01_F",[-2.52448,-1.38322,0.0522304],180.992,1,0,[0.0054578,-0.297945],"","",true,false],
		["B_CargoNet_01_ammo_F",[-3.02816,1.29547,0.0548558],179.482,1,0,[-0.00272333,-0.298135],"","",true,false],
		["Land_MapBoard_Enoch_F",[3.00379,-1.43205,0.061625],134.089,1,0,[0.654025,0.845397],"","",true,false]
	]],
	["Land_House_1W02_F",[
		["Land_MetalCase_01_small_F",[-0.538328,0.901626,-0.0010004],174.741,1,0,[-9.37514e-005,9.29899e-005],"","",true,false],
		["Land_CampingChair_V2_F",[2.85857,-0.415011,-0.000994682],292.015,1,0,[-0.00038614,-0.00123639],"","",true,false],
		["OfficeTable_01_new_F",[3.44428,-0.666138,-0.000999928],86.7032,1,0,[0.000145824,6.21702e-005],"","",true,false],
		["Land_MapBoard_Enoch_F",[-1.49216,3.31236,0.0428715],355.179,1,0,[-0.360939,0.0461294],"","",true,false],
		["B_CargoNet_01_ammo_F",[2.64869,3.16984,-0.0010004],179.483,1,0,[-0.000110829,1.88703e-005],"","",true,false],
		["Land_Workbench_01_F",[-4.55341,1.23832,-0.00100088],269.89,1,0,[0.00126416,2.55769e-005],"","",true,false]
	]]
];

//Interactable items that spawn in your house
OT_item_Storage = "B_CargoNet_01_ammo_F"; //Your spawn ammobox
OT_item_Desk = "OfficeTable_01_new_F"; //Your spawn desk
OT_item_Radio = "Land_PortableLongRangeRadio_F";
OT_item_Map = "Land_MapBoard_Enoch_F";
OT_item_Tent = "Land_TentDome_F";
OT_item_Safe = "Land_MetalCase_01_small_F";
OT_item_Workbench = "Land_Workbench_01_F";

//Animals to spawn (@todo: spawn animals)
OT_allLowAnimals = [""];
OT_allHighAnimals = [""];
OT_allFarmAnimals = [""];
OT_allVillageAnimals = [""];
OT_allTownAnimals = [""];

OT_fuelPumps = ["Land_FuelStation_03_pump_F","Land_FuelStation_Feed_F"];

OT_churches = ["Land_Church_03_F","Land_Church_01_F","Land_Church_02_F","Land_Temple_Native_01_F"];

OT_language_local = "LanguageENG_F";
OT_identity_local = "Head_Euro";

OT_language_western = "LanguageENG_F";
OT_identity_western = "Head_Euro";

OT_language_eastern = "LanguageCHI_F";
OT_identity_eastern = "Head_Asian";

OT_face_localBoss = "TanoanBossHead";

OT_civType_gunDealer = "C_man_p_fugitive_F";
OT_civType_local = "C_man_1";
OT_civType_carDealer = "C_man_w_worker_F";
OT_civType_shopkeeper = "C_man_w_worker_F";
OT_civType_worker = "C_man_w_worker_F";
OT_civType_priest = "C_man_w_worker_F";
OT_vehTypes_civ = [""]; //populated automatically, but you can add more here and they will appear in streets
OT_vehType_distro = "C_Van_01_box_F";
OT_vehType_ferry = "C_Boat_Transport_02_F";
OT_vehType_service = "C_Offroad_01_repair_F";
OT_vehTypes_civignore = ["C_Hatchback_01_F","C_Hatchback_01_sport_F",OT_vehType_service]; //Civs cannot drive these vehicles for whatever reason

OT_legal = ["ACE_FakePrimaryWeapon","eo_flashlight","rhs_weap_rsp30_white","rhs_weap_rsp30_green","rhs_weap_rsp30_red","rhs_weap_tr8","ACE_VMH3","ACE_VMM3","ACE_Flashlight_Maglite_ML300L",""];//Gear made legal

OT_illegalHeadgear = ["rhs_6b26_green","rhs_6b26_bala_green","rhs_6b26_ess_green","rhs_6b26_ess_bala_green","rhs_6b26","rhs_6b26_bala","rhs_6b26_ess","rhs_6b26_ess_bala","rhs_6b27m_green","rhs_6b27m_green_bala","rhs_6b27m_green_ess","rhs_6b27m_green_ess_bala","rhs_6b27m_digi","rhs_6b27m_digi_bala","rhs_6b27m_digi_ess","rhs_6b27m_digi_ess_bala","rhs_6b27m","rhs_6b27m_bala","rhs_6b27m_ess","rhs_6b27m_ess_bala","rhs_6b27m_ml","rhs_6b27m_ml_bala","rhs_6b27m_ml_ess","rhs_6b27m_ML_ess_bala","rhs_6b28_green","rhs_6b28_green_bala","rhs_6b28_green_ess","rhs_6b28_green_ess_bala","rhs_6b28","rhs_6b28_bala","rhs_6b28_ess","rhs_6b28_ess_bala","rhs_6b28_flora","rhs_6b28_flora_bala","rhs_6b28_flora_ess","rhs_6b28_flora_ess_bala","rhs_6b47","rhs_6b47_bala","rhs_6b47_ess","rhs_6b47_ess_bala","rhs_6b7_1m","rhs_6b7_1m_bala2","rhs_6b7_1m_bala1","rhs_6b7_1m_emr","rhs_6b7_1m_bala2_emr","rhs_6b7_1m_bala1_emr","rhs_6b7_1m_emr_ess","rhs_6b7_1m_emr_ess_bala","rhs_6b7_1m_ess","rhs_6b7_1m_ess_bala","rhs_6b7_1m_flora","rhs_6b7_1m_bala1_flora","rhs_6b7_1m_bala2_flora","rhs_6b7_1m_flora_ns3","rhs_6b7_1m_olive","rhs_6b7_1m_bala1_olive","rhs_6b7_1m_bala2_olive","rhsusf_ach_bare","rhsusf_ach_bare_des","rhsusf_ach_bare_des_ess","rhsusf_ach_bare_des_headset","rhsusf_ach_bare_des_headset_ess","rhsusf_ach_bare_ess","rhsusf_ach_bare_headset","rhsusf_ach_bare_headset_ess","rhsusf_ach_bare_semi","rhsusf_ach_bare_semi_ess","rhsusf_ach_bare_semi_headset","rhsusf_ach_bare_semi_headset_ess","rhsusf_ach_bare_tan","rhsusf_ach_bare_tan_ess","rhsusf_ach_bare_tan_headset","rhsusf_ach_bare_tan_headset_ess","rhsusf_ach_bare_wood","rhsusf_ach_bare_wood_ess","rhsusf_ach_bare_wood_headset","rhsusf_ach_bare_wood_headset_ess","rhsusf_ach_helmet_DCU","rhsusf_ach_helmet_DCU_early","rhsusf_ach_helmet_DCU_early_rhino","rhsusf_ach_helmet_M81","rhsusf_ach_helmet_ocp","rhsusf_ach_helmet_ocp_alt","rhsusf_ach_helmet_ESS_ocp","rhsusf_ach_helmet_ESS_ocp_alt","rhsusf_ach_helmet_headset_ocp","rhsusf_ach_helmet_headset_ocp_alt","rhsusf_ach_helmet_headset_ess_ocp","rhsusf_ach_helmet_headset_ess_ocp_alt","rhsusf_ach_helmet_camo_ocp","rhsusf_ach_helmet_ocp_norotos","rhsusf_ach_helmet_ucp","rhsusf_ach_helmet_ucp_alt","rhsusf_ach_helmet_ESS_ucp","rhsusf_ach_helmet_ESS_ucp_alt","rhsusf_ach_helmet_headset_ucp","rhsusf_ach_helmet_headset_ucp_alt","rhsusf_ach_helmet_headset_ess_ucp","rhsusf_ach_helmet_headset_ess_ucp_alt","rhsusf_ach_helmet_ucp_norotos","rhsusf_cvc_green_helmet","rhsusf_cvc_green_alt_helmet","rhsusf_cvc_green_ess","rhsusf_cvc_helmet","rhsusf_cvc_alt_helmet","rhsusf_cvc_ess","H_HelmetHBK_headset_F","H_HelmetHBK_chops_F","H_HelmetHBK_ear_F","H_HelmetHBK_F","rhs_altyn_novisor","rhs_altyn_novisor_bala","rhs_altyn_novisor_ess_bala","rhs_altyn_novisor_ess","rhs_altyn_visordown","rhs_altyn","rhs_altyn_bala","H_HelmetSpecO_blk","H_HelmetSpecO_ghex_F","H_HelmetSpecO_ocamo","H_HelmetAggressor_F","H_HelmetAggressor_cover_F","H_HelmetAggressor_cover_taiga_F","H_Beret_gen_F","rhs_beret_mp2","rhs_beret_mp1","rhsgref_un_beret","rhs_beret_vdv3","rhs_beret_vdv2","rhs_beret_vdv1","rhs_beret_milp","H_Beret_EAF_01_F","H_Beret_02","H_Beret_Colonel","H_HelmetB","H_HelmetB_black","H_HelmetB_camo","H_HelmetB_desert","H_HelmetB_grass","H_HelmetB_sand","H_HelmetB_snakeskin","H_HelmetB_tna_F","H_HelmetB_plain_wdl","H_HelmetCrew_O_ghex_F","H_Tank_black_F","H_Tank_eaf_F","H_HelmetCrew_I","H_HelmetCrew_O","H_HelmetCrew_I_E","H_HelmetCrew_B","H_HelmetLeaderO_ghex_F","H_HelmetLeaderO_ocamo","H_HelmetLeaderO_oucamo","H_HelmetSpecB","H_HelmetSpecB_blk","H_HelmetSpecB_paint2","H_HelmetSpecB_paint1","H_HelmetSpecB_sand","H_HelmetSpecB_snakeskin","H_HelmetB_Enh_tna_F","H_HelmetSpecB_wdl","rhsusf_opscore_aor1","rhsusf_opscore_aor1_pelt","rhsusf_opscore_aor1_pelt_nsw","rhsusf_opscore_aor2","rhsusf_opscore_aor2_pelt","rhsusf_opscore_aor2_pelt_nsw","rhsusf_opscore_bk","rhsusf_opscore_bk_pelt","rhsusf_opscore_coy_cover","rhsusf_opscore_coy_cover_pelt","rhsusf_opscore_fg","rhsusf_opscore_fg_pelt","rhsusf_opscore_fg_pelt_cam","rhsusf_opscore_fg_pelt_nsw","rhsusf_opscore_mc_cover","rhsusf_opscore_mc_cover_pelt","rhsusf_opscore_mc_cover_pelt_nsw","rhsusf_opscore_mc_cover_pelt_cam","rhsusf_opscore_mc","rhsusf_opscore_mc_pelt","rhsusf_opscore_mc_pelt_nsw","rhsusf_opscore_paint","rhsusf_opscore_paint_pelt","rhsusf_opscore_paint_pelt_nsw","rhsusf_opscore_paint_pelt_nsw_cam","rhsusf_opscore_rg_cover","rhsusf_opscore_rg_cover_pelt","rhsusf_opscore_ut","rhsusf_opscore_ut_pelt","rhsusf_opscore_ut_pelt_cam","rhsusf_opscore_ut_pelt_nsw","rhsusf_opscore_ut_pelt_nsw_cam","rhsusf_opscore_mar_fg","rhsusf_opscore_mar_fg_pelt","rhsusf_opscore_mar_ut","rhsusf_opscore_mar_ut_pelt","H_CrewHelmetHeli_I","H_CrewHelmetHeli_O","H_CrewHelmetHeli_I_E","H_CrewHelmetHeli_B","H_PilotHelmetHeli_I","H_PilotHelmetHeli_O","H_PilotHelmetHeli_I_E","H_PilotHelmetHeli_B","rhsusf_hgu56p_black","rhsusf_hgu56p_mask_black","rhsusf_hgu56p_mask_black_skull","rhsusf_hgu56p_visor_black","rhsusf_hgu56p_visor_mask_black","rhsusf_hgu56p_visor_mask_Empire_black","rhsusf_hgu56p_visor_mask_black_skull","rhsusf_hgu56p_green","rhsusf_hgu56p_mask_green","rhsusf_hgu56p_mask_green_mo","rhsusf_hgu56p_visor_green","rhsusf_hgu56p_visor_mask_green","rhsusf_hgu56p_visor_mask_green_mo","rhsusf_hgu56p","rhsusf_hgu56p_mask","rhsusf_hgu56p_mask_mo","rhsusf_hgu56p_mask_skull","rhsusf_hgu56p_visor","rhsusf_hgu56p_visor_mask","rhsusf_hgu56p_visor_mask_mo","rhsusf_hgu56p_visor_mask_skull","rhsusf_hgu56p_pink","rhsusf_hgu56p_mask_pink","rhsusf_hgu56p_visor_pink","rhsusf_hgu56p_visor_mask_pink","rhsusf_hgu56p_saf","rhsusf_hgu56p_mask_saf","rhsusf_hgu56p_visor_saf","rhsusf_hgu56p_visor_mask_saf","rhsusf_hgu56p_mask_smiley","rhsusf_hgu56p_visor_mask_smiley","rhsusf_hgu56p_tan","rhsusf_hgu56p_mask_tan","rhsusf_hgu56p_visor_tan","rhsusf_hgu56p_visor_mask_tan","rhsusf_hgu56p_usa","rhsusf_hgu56p_visor_usa","rhsusf_hgu56p_white","rhsusf_hgu56p_visor_white","rhsusf_ihadss","RHS_jetpilot_usaf","rhsgref_6b27m_ttsko_digi","rhsgref_6b27m_ttsko_forest","rhsgref_6b27m_ttsko_mountain","rhsgref_6b27m_ttsko_urban","H_HelmetB_light","H_HelmetB_light_black","H_HelmetB_light_desert","H_HelmetB_light_grass","H_HelmetB_light_sand","H_HelmetB_light_snakeskin","H_HelmetB_Light_tna_F","H_HelmetB_light_wdl","rhsusf_lwh_helmet_M1942","rhsusf_lwh_helmet_marpatd","rhsusf_lwh_helmet_marpatd_ess","rhsusf_lwh_helmet_marpatd_headset","rhsusf_lwh_helmet_marpatwd","rhsusf_lwh_helmet_marpatwd_blk_ess","rhsusf_lwh_helmet_marpatwd_headset_blk2","rhsusf_lwh_helmet_marpatwd_headset_blk","rhsusf_lwh_helmet_marpatwd_headset","rhsusf_lwh_helmet_marpatwd_ess","rhsgref_helmet_M1_liner","rhsgref_helmet_M1_bare","rhsgref_helmet_M1_bare_alt01","rhsgref_helmet_M1_painted","rhsgref_helmet_M1_painted_alt01","rhsgref_helmet_m1940","rhsgref_helmet_m1940_camo01","rhsgref_helmet_m1940_alt1","rhsgref_helmet_m1940_camo01_alt1","rhsgref_helmet_m1940_winter_alt1","rhsgref_helmet_m1940_winter","rhsgref_helmet_m1942","rhsgref_helmet_m1942_camo01","rhsgref_helmet_m1942_alt1","rhsgref_helmet_m1942_camo01_alt1","rhsgref_helmet_m1942_winter_alt1","rhsgref_helmet_m1942_winter","rhsgref_helmet_m1942_heergreycover","rhsgref_helmet_m1942_heersplintercover","rhsgref_helmet_m1942_heermarshcover","rhsgref_helmet_m1942_heerwintercover","rhsgref_M56","rhsusf_mich_bare","rhsusf_mich_bare_alt","rhsusf_mich_bare_headset","rhsusf_mich_bare_norotos","rhsusf_mich_bare_norotos_alt","rhsusf_mich_bare_norotos_alt_headset","rhsusf_mich_bare_norotos_arc","rhsusf_mich_bare_norotos_arc_alt","rhsusf_mich_bare_norotos_arc_alt_headset","rhsusf_mich_bare_norotos_arc_headset","rhsusf_mich_bare_norotos_headset","rhsusf_mich_bare_semi","rhsusf_mich_bare_alt_semi","rhsusf_mich_bare_semi_headset","rhsusf_mich_bare_norotos_semi","rhsusf_mich_bare_norotos_alt_semi","rhsusf_mich_bare_norotos_alt_semi_headset","rhsusf_mich_bare_norotos_arc_semi","rhsusf_mich_bare_norotos_arc_alt_semi","rhsusf_mich_bare_norotos_arc_alt_semi_headset","rhsusf_mich_bare_norotos_arc_semi_headset","rhsusf_mich_bare_norotos_semi_headset","rhsusf_mich_bare_tan","rhsusf_mich_bare_alt_tan","rhsusf_mich_bare_tan_headset","rhsusf_mich_bare_norotos_tan","rhsusf_mich_bare_norotos_alt_tan","rhsusf_mich_bare_norotos_alt_tan_headset","rhsusf_mich_bare_norotos_arc_tan","rhsusf_mich_bare_norotos_arc_alt_tan","rhsusf_mich_bare_norotos_arc_alt_tan_headset","rhsusf_mich_bare_norotos_tan_headset","rhsusf_mich_helmet_marpatd","rhsusf_mich_helmet_marpatd_alt","rhsusf_mich_helmet_marpatd_alt_headset","rhsusf_mich_helmet_marpatd_headset","rhsusf_mich_helmet_marpatd_norotos","rhsusf_mich_helmet_marpatd_norotos_arc","rhsusf_mich_helmet_marpatd_norotos_arc_headset","rhsusf_mich_helmet_marpatd_norotos_headset","rhsusf_mich_helmet_marpatwd","rhsusf_mich_helmet_marpatwd_alt","rhsusf_mich_helmet_marpatwd_alt_headset","rhsusf_mich_helmet_marpatwd_headset","rhsusf_mich_helmet_marpatwd_norotos","rhsusf_mich_helmet_marpatwd_norotos_arc","rhsusf_mich_helmet_marpatwd_norotos_arc_headset","rhsusf_mich_helmet_marpatwd_norotos_headset","H_MilCap_gen_F","H_HelmetIA","rhsgref_helmet_pasgt_3color_desert","rhsgref_helmet_pasgt_3color_desert_rhino","rhsgref_helmet_pasgt_altis_lizard","rhsgref_helmet_pasgt_erdl","rhsgref_helmet_pasgt_erdl_rhino","rhsgref_helmet_pasgt_flecktarn","rhsgref_helmet_pasgt_olive","rhsgref_helmet_pasgt_woodland","rhsgref_helmet_pasgt_un","rhsgref_helmet_pasgt_woodland_rhino","H_PilotHelmetFighter_I","H_PilotHelmetFighter_O","H_PilotHelmetFighter_I_E","H_PilotHelmetFighter_B","rhsusf_protech_helmet","rhsusf_protech_helmet_ess","rhsusf_protech_helmet_rhino","rhsusf_protech_helmet_rhino_ess","H_HelmetO_ghex_F","H_HelmetO_ocamo","H_HelmetO_oucamo","H_HelmetO_ViperSP_ghex_F","H_HelmetO_ViperSP_hex_F","rhs_ssh68","rhsgref_ssh68_emr","rhsgref_ssh68_ttsko_digi","rhsgref_ssh68_ttsko_forest","rhsgref_ssh68_ttsko_mountain","rhsgref_ssh68_ttsko_dark","rhsgref_ssh68_un","rhsgref_ssh68_vsr","H_HelmetB_TI_tna_F","rhs_zsh7a_mike","rhs_zsh7a_mike_green","rhs_zsh7a_mike_alt","rhs_zsh7a_mike_green_alt","rhs_zsh7a","rhs_zsh7a_alt","FRITH_ruin_modhat_fabaaf","FRITH_ruin_modhat_fabdes","FRITH_ruin_modhat_fabdpm","FRITH_ruin_modhat_fabflw","FRITH_ruin_modhat_fabmtp","FRITH_ruin_modhat_fabjap","FRITH_ruin_modhat_fabrus","FRITH_ruin_modhat_fabtar","FRITH_ruin_modhat_ltr","FRITH_ruin_modhat_ltrpntblk","FRITH_ruin_modhat_ltrpntgrn","FRITH_ruin_modhat_ltrpntred","FRITH_ruin_modhat_ltrpntwht","FRITH_ruin_modhat_metgrn","FRITH_ruin_modhat_mettan"];
OT_illegalVests = ["rhs_6b13_Flora","rhs_6b13_Flora_6sh92","rhs_6b13_Flora_6sh92_headset_mapcase","rhs_6b13_Flora_6sh92_radio","rhs_6b13_Flora_6sh92_vog","rhs_6b13_Flora_crewofficer","rhs_6b13_EMR_6sh92","rhs_6b13_EMR_6sh92_radio","rhs_6b13_EMR_6sh92_vog","rhs_6b13_EMR_6sh92_headset_mapcase","rhs_6b13_EMR","rhs_6b13","rhs_6b13_6sh92","rhs_6b13_6sh92_headset_mapcase","rhs_6b13_6sh92_radio","rhs_6b13_6sh92_vog","rhs_6b13_crewofficer","rhs_6b23","rhs_6b23_6sh116_od","rhs_6b23_6sh116_vog_od","rhs_6b23_6sh92","rhs_6b23_6sh92_headset","rhs_6b23_6sh92_headset_mapcase","rhs_6b23_6sh92_radio","rhs_6b23_6sh92_vog","rhs_6b23_6sh92_vog_headset","rhs_6b23_crewofficer","rhs_6b23_crew","rhs_6b23_engineer","rhs_6b23_medic","rhs_6b23_rifleman","rhs_6b23_sniper","rhs_6b23_vydra_3m","rhs_6b23_digi","rhs_6b23_6sh116","rhs_6b23_6sh116_vog","rhs_6b23_digi_6sh92","rhs_6b23_digi_6sh92_spetsnaz2","rhs_6b23_digi_6sh92_headset","rhs_6b23_digi_6sh92_headset_spetsnaz","rhs_6b23_digi_6sh92_headset_mapcase","rhs_6b23_digi_6sh92_radio","rhs_6b23_digi_6sh92_Spetsnaz","rhs_6b23_digi_6sh92_vog","rhs_6b23_digi_6sh92_Vog_Spetsnaz","rhs_6b23_digi_6sh92_vog_headset","rhs_6b23_digi_6sh92_Vog_Radio_Spetsnaz","rhs_6b23_digi_crewofficer","rhs_6b23_digi_crew","rhs_6b23_digi_engineer","rhs_6b23_digi_medic","rhs_6b23_digi_rifleman","rhs_6b23_digi_sniper","rhs_6b23_digi_vydra_3m","rhs_6b23_6sh116_flora","rhs_6b23_6sh116_vog_flora","rhsgref_6b23_khaki_medic","rhsgref_6b23_khaki_nco","rhsgref_6b23_khaki_officer","rhsgref_6b23_khaki_rifleman","rhsgref_6b23_khaki_sniper","rhsgref_6b23_khaki","rhs_6b23_ML","rhs_6b23_ML_6sh92","rhs_6b23_ML_6sh92_headset","rhs_6b23_ML_6sh92_headset_mapcase","rhs_6b23_ML_6sh92_radio","rhs_6b23_ML_6sh92_vog","rhs_6b23_ML_6sh92_vog_headset","rhs_6b23_ML_crewofficer","rhs_6b23_ML_crew","rhs_6b23_ML_engineer","rhs_6b23_ML_medic","rhs_6b23_ML_rifleman","rhs_6b23_ML_sniper","rhs_6b23_ML_vydra_3m","rhsgref_6b23_ttsko_digi_medic","rhsgref_6b23_ttsko_digi_nco","rhsgref_6b23_ttsko_digi_officer","rhsgref_6b23_ttsko_digi_rifleman","rhsgref_6b23_ttsko_digi_sniper","rhsgref_6b23_ttsko_digi","rhsgref_6b23_ttsko_forest_rifleman","rhsgref_6b23_ttsko_forest","rhsgref_6b23_ttsko_mountain_medic","rhsgref_6b23_ttsko_mountain_nco","rhsgref_6b23_ttsko_mountain_officer","rhsgref_6b23_ttsko_mountain_rifleman","rhsgref_6b23_ttsko_mountain_sniper","rhsgref_6b23_ttsko_mountain","rhs_6b43","rhs_6b5_khaki","rhs_6b5_rifleman_khaki","rhs_6b5_medic_khaki","rhs_6b5_officer_khaki","rhs_6b5_sniper_khaki","rhs_6b5","rhs_6b5_rifleman","rhs_6b5_medic","rhs_6b5_officer","rhs_6b5_sniper","rhs_6b5_ttsko","rhs_6b5_rifleman_ttsko","rhs_6b5_medic_ttsko","rhs_6b5_officer_ttsko","rhs_6b5_sniper_ttsko","rhs_6b5_vsr","rhs_6b5_rifleman_vsr","rhs_6b5_medic_vsr","rhs_6b5_officer_vsr","rhs_6b5_sniper_vsr","rhs_6sh46","rhs_6sh92","rhs_6sh92_headset","rhs_6sh92_radio","rhs_6sh92_vog","rhs_6sh92_vog_headset","rhs_6sh92_digi","rhs_6sh92_digi_headset","rhs_6sh92_digi_radio","rhs_6sh92_digi_vog","rhs_6sh92_digi_vog_headset","rhs_6sh92_vsr","rhs_6sh92_vsr_headset","rhs_6sh92_vsr_radio","rhs_6sh92_vsr_vog","rhs_6sh92_vsr_vog_headset","V_PlateCarrierGL_blk","V_PlateCarrierGL_rgr","V_PlateCarrierGL_mtp","V_PlateCarrierGL_tna_F","V_PlateCarrierGL_wdl","V_PlateCarrier1_blk","V_PlateCarrier1_rgr","V_PlateCarrier1_rgr_noflag_F","V_PlateCarrier1_tna_F","V_PlateCarrier1_wdl","V_PlateCarrier2_blk","V_PlateCarrier2_rgr","V_PlateCarrier2_rgr_noflag_F","V_PlateCarrier2_tna_F","V_PlateCarrier2_wdl","V_PlateCarrierSpec_blk","V_PlateCarrierSpec_rgr","V_PlateCarrierSpec_mtp","V_PlateCarrierSpec_tna_F","V_PlateCarrierSpec_wdl","V_PlateCarrierL_CTRG","V_PlateCarrierH_CTRG","V_DeckCrew_blue_F","V_DeckCrew_brown_F","V_DeckCrew_green_F","V_DeckCrew_red_F","V_DeckCrew_violet_F","V_DeckCrew_white_F","V_DeckCrew_yellow_F","eo_deckvest_1","eo_deckvest_2","eo_eodvest_3","eo_eodvest_2","eo_eodvest_1","eo_platecarrier_1","eo_platecarrier_4","eo_platecarrier_2","eo_platecarrier_5","eo_platecarrier_3","eo_ravenvest_1","eo_tacvest_4","eo_tacvest_2","eo_tacvest_1","eo_tacvest_3","V_EOD_blue_F","V_EOD_IDAP_blue_F","V_EOD_coyote_F","V_EOD_olive_F","V_PlateCarrierIAGL_dgtl","V_PlateCarrierIAGL_oli","V_PlateCarrierIA1_dgtl","V_PlateCarrierIA2_dgtl","V_TacVest_gen_F","rhsusf_iotv_ocp_Grenadier","rhsusf_iotv_ucp_Grenadier","rhsusf_iotv_ocp_Medic","rhsusf_iotv_ucp_Medic","rhsusf_iotv_ocp","rhsusf_iotv_ocp_Repair","rhsusf_iotv_ucp_Repair","rhsusf_iotv_ocp_Rifleman","rhsusf_iotv_ucp_Rifleman","rhsusf_iotv_ocp_SAW","rhsusf_iotv_ucp_SAW","rhsusf_iotv_ocp_Squadleader","rhsusf_iotv_ucp_Squadleader","rhsusf_iotv_ocp_Teamleader","rhsusf_iotv_ucp_Teamleader","rhsusf_iotv_ucp","rhsusf_mbav","rhsusf_mbav_grenadier","rhsusf_mbav_light","rhsusf_mbav_mg","rhsusf_mbav_medic","rhsusf_mbav_rifleman","V_CarrierRigKBT_01_heavy_EAF_F","V_CarrierRigKBT_01_heavy_Olive_F","V_CarrierRigKBT_01_light_EAF_F","V_CarrierRigKBT_01_light_Olive_F","V_CarrierRigKBT_01_EAF_F","V_CarrierRigKBT_01_Olive_F","rhsgref_otv_digi","rhsgref_otv_khaki","rhsusf_plateframe_sapi","rhsusf_plateframe_grenadier","rhsusf_plateframe_light","rhsusf_plateframe_machinegunner","rhsusf_plateframe_marksman","rhsusf_plateframe_medic","rhsusf_plateframe_rifleman","rhsusf_plateframe_teamleader","rhsusf_spc","rhsusf_spc_corpsman","rhsusf_spc_crewman","rhsusf_spc_iar","rhsusf_spc_light","rhsusf_spc_mg","rhsusf_spc_marksman","rhsusf_spc_patchless","rhsusf_spc_patchless_radio","rhsusf_spc_rifleman","rhsusf_spc_sniper","rhsusf_spc_squadleader","rhsusf_spc_teamleader","rhsusf_spcs_ocp_crewman","rhsusf_spcs_ucp_crewman","rhsusf_spcs_ocp_grenadier","rhsusf_spcs_ucp_grenadier","rhsusf_spcs_ocp_machinegunner","rhsusf_spcs_ucp_machinegunner","rhsusf_spcs_ocp_medic","rhsusf_spcs_ucp_medic","rhsusf_spcs_ocp","rhsusf_spcs_ocp_rifleman_alt","rhsusf_spcs_ucp_rifleman_alt","rhsusf_spcs_ocp_rifleman","rhsusf_spcs_ucp_rifleman","rhsusf_spcs_ocp_saw","rhsusf_spcs_ucp_saw","rhsusf_spcs_ocp_sniper","rhsusf_spcs_ucp_sniper","rhsusf_spcs_ocp_squadleader","rhsusf_spcs_ucp_squadleader","rhsusf_spcs_ocp_teamleader_alt","rhsusf_spcs_ucp_teamleader_alt","rhsusf_spcs_ocp_teamleader","rhsusf_spcs_ucp_teamleader","rhsusf_spcs_ucp","V_TacVest_blk","V_TacVest_brn","V_TacVest_camo","rhsgref_TacVest_ERDL","V_TacVest_khk","V_TacVest_oli","V_TacVest_blk_POLICE","V_I_G_resistanceLeader_F","V_PlateCarrier_Kerry","rhs_vydra_3m","FRITH_ruin_vestia_lite_ghm","FRITH_ruin_vestia_lite_grn","FRITH_ruin_vestia_lite_ltr","FRITH_ruin_vestia_lite_nja","FRITH_ruin_vestia_lite_tar","FRITH_ruin_vestia_ghm","FRITH_ruin_vestia_grn","FRITH_ruin_vestia_ltr","FRITH_ruin_vestia_nja","FRITH_ruin_vestia_tar","FRITH_ruin_vestiaGL_ghmchk","FRITH_ruin_vestiaGL_ghm","FRITH_ruin_vestiaGL_grnmtp","FRITH_ruin_vestiaGL_grn","FRITH_ruin_vestiaGL_ltrmtp","FRITH_ruin_vestiaGL_ltr","FRITH_ruin_vestiaGL_njadpm","FRITH_ruin_vestiaGL_nja","FRITH_ruin_vestiaGL_tartar","FRITH_ruin_vestiaGL_tar"];

OT_clothes_locals = ["U_I_C_Soldier_Bandit_2_F","U_I_C_Soldier_Bandit_3_F","U_C_Poor_1","U_C_Poor_2","eo_bandit","eo_bandit_1","eo_survivor","eo_survivor_1","eo_hoodie_red","eo_hoodie_grey","eo_hoodie_blue","eo_hoodie_bandit","eo_hoodie_kabeiroi","eo_retro_red","eo_retro_grey","eo_retro_blue","eo_retro_bandit","eo_retro_kabeiroi","eo_shirt_bandit","eo_shirt_kabeiroi","eo_shirt_stripe","eo_shirt_check","eo_shirt_plainblu","eo_shirt_plainblk","eo_shirt_checkbrn","eo_shirt_checkblk","U_FRITH_RUIN_SDR_Tshirt_blk_cyp","U_FRITH_RUIN_SDR_Tshirt_blk_boy","U_FRITH_RUIN_SDR_Tshirt_blk_drj","U_FRITH_RUIN_SDR_Tshirt_oli","U_FRITH_RUIN_SDR_Tshirt_oli_bet","U_FRITH_RUIN_SDR_Tshirt_cry","U_FRITH_RUIN_SDR_Tshirt_wht","U_FRITH_RUIN_SDR_Tshirt_wht_zap","U_FRITH_RUIN_SDR_Tshirt_wht_stk","U_FRITH_RUIN_SDR_Tshirt_wht_fpk","U_FRITH_RUIN_TSH_blk_cyp","U_FRITH_RUIN_TSH_blk_boy","U_FRITH_RUIN_TSH_blk_drj","U_FRITH_RUIN_TSH_oli","U_FRITH_RUIN_TSH_oli_bet","U_FRITH_RUIN_TSH_cry","U_FRITH_RUIN_TSH_wht","U_FRITH_RUIN_TSH_wht_zap","U_FRITH_RUIN_TSH_wht_stk","U_FRITH_RUIN_TSH_wht_fpk","U_FRITH_RUIN_WKR_dark","U_FRITH_RUIN_WKR_tan","U_FRITH_RUIN_WKR_lite"];
OT_clothes_expats = ["U_I_C_Soldier_Bandit_5_F","U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_redwhite","U_C_Poloshirt_salmon","U_C_Poloshirt_stripped","U_C_Man_casual_6_F","U_C_Man_casual_4_F","U_C_Man_casual_5_F"];
OT_clothes_tourists = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_redwhite","U_C_Poloshirt_stripped","U_C_E_LooterJacket_01_F","U_I_G_Story_Protagonist_F"];
OT_clothes_priest = "U_C_Man_casual_2_F";
OT_clothes_port = "U_Marshal";
OT_clothes_shops = ["U_C_Man_casual_2_F","U_C_Man_casual_3_F","U_C_Man_casual_1_F","U_C_E_LooterJacket_01_F"];
OT_clothes_carDealers = ["U_Marshal","U_C_Mechanic_01_F"];
OT_clothes_harbor = ["U_C_man_sport_1_F","U_C_man_sport_2_F","U_C_man_sport_3_F"];
OT_clothes_guerilla = ["U_I_C_Soldier_Para_1_F","U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_3_F","U_I_C_Soldier_Para_4_F","U_FRITH_RUIN_coffdpm","U_FRITH_RUIN_coffgrn","U_FRITH_RUIN_cofftan","U_FRITH_RUIN_sdr_fab_rs","U_FRITH_RUIN_sdr_fab","U_FRITH_RUIN_sdr_fabbrn_rs","U_FRITH_RUIN_sdr_fabbrn","U_FRITH_RUIN_sdr_fabdpm_rs","U_FRITH_RUIN_sdr_fabdpm","U_FRITH_RUIN_sdr_fabgrn_rs","U_FRITH_RUIN_sdr_fabgrn","U_FRITH_RUIN_sdr_fabkak_rs","U_FRITH_RUIN_sdr_fabkak","U_FRITH_RUIN_sdr_fabmtp_rs","U_FRITH_RUIN_sdr_fabmtp","U_FRITH_RUIN_sdr_faboli_rs","U_FRITH_RUIN_sdr_faboli","U_FRITH_RUIN_sdr_fabrus_rs","U_FRITH_RUIN_sdr_fabrus","U_FRITH_RUIN_sdr_fabtan_rs","U_FRITH_RUIN_sdr_fabtan","U_FRITH_RUIN_sdr_ltrdrk_rs","U_FRITH_RUIN_sdr_ltrdrk","U_FRITH_RUIN_sdr_ltrred_rs","U_FRITH_RUIN_sdr_ltrred","U_FRITH_RUIN_sdr_ltr_rs","U_FRITH_RUIN_sdr_ltr","eo_camo","eo_camo_1","eo_diamond","eo_diamond_1","eo_independant","eo_independant_1","eo_paramilitary_1","eo_shirt_tigerblu","eo_shirt_tigerblk","U_FRITH_RUIN_SDR_snip_crow","U_FRITH_RUIN_SDR_snip_hawk","U_FRITH_RUIN_offdpm","U_FRITH_RUIN_offgrn","U_FRITH_RUIN_offtan"];
OT_clothes_police = ["U_I_G_resistanceLeader_F","U_BG_Guerilla2_1","U_BG_Guerilla2_3","U_I_C_Soldier_Para_4_F"];
OT_vest_police = "V_TacVest_blk_POLICE";
OT_hat_police = "H_Cap_police";
OT_clothes_mob = "U_I_C_Soldier_Camo_F";

//NATO stuff
OT_NATO_HMG = "rhsgref_cdf_b_DSHKM";
OT_NATO_Vehicles_AirGarrison = [
	["rhs_uh1h_hidf_unarmed",3],
	["B_Heli_Transport_01_F",2],
	["rhsgref_cdf_b_Mi24D_Early",1],
	["rhsgref_b_mi24g_CAS",1],
	["rhs_uh1h_hidf_gunship",2],
	["rhsgref_cdf_b_reg_Mi8amt",2],
	["rhsgref_cdf_b_reg_Mi17Sh",1]
];

OT_NATO_Vehicles_JetGarrison = [
	["rhsgref_cdf_b_mig29s",2]
];

OT_NATO_Vehicles_StaticAAGarrison = ["rhsgref_cdf_b_Igla_AA_pod","rhsgref_cdf_b_Igla_AA_pod","I_E_SAM_System_03_F","I_E_Radar_System_01_F"]; //Added to every airfield

if(OT_hasJetsDLC) then {
	OT_NATO_Vehicles_JetGarrison pushback ["B_Plane_Fighter_01_F",1];
	OT_NATO_Vehicles_JetGarrison pushback ["B_Plane_Fighter_01_Stealth_F",1];
	OT_NATO_Vehicles_StaticAAGarrison pushback "I_E_Radar_System_01_F";
	OT_NATO_Vehicles_StaticAAGarrison pushback "I_E_SAM_System_03_F";
};

OT_NATO_StaticGarrison_LevelOne = ["rhsgref_cdf_b_DSHKM","rhsgref_cdf_b_DSHKM","rhsgref_cdf_b_reg_uaz_ags","rhsgref_BRDM2_b","rhsgref_cdf_b_reg_uaz_dshkm"];
OT_NATO_StaticGarrison_LevelTwo = ["rhsgref_cdf_b_DSHKM","rhsgref_cdf_b_SPG9M","rhsgref_cdf_b_AGS30_TriPod","rhsgref_BRDM2_b","RHS_MELB_AH6M","rhsgref_cdf_b_reg_uaz_ags","rhsgref_cdf_b_btr70","rhsgref_BRDM2_ATGM_b","rhsgref_cdf_b_reg_M252"];
OT_NATO_StaticGarrison_LevelThree = ["rhsgref_cdf_b_SPG9M","rhsgref_cdf_b_SPG9M","rhsgref_cdf_b_Igla_AA_pod","rhsgref_cdf_b_DSHKM","rhsgref_cdf_b_DSHKM","rhsgref_cdf_b_AGS30_TriPod","rhsgref_BRDM2_b","rhsgref_cdf_b_btr70","rhsgref_cdf_b_reg_uaz_ags","rhsgref_cdf_b_bmp1p","rhsgref_cdf_b_reg_M252","rhsgref_cdf_b_t72bb_tv","rhsgref_BRDM2_ATGM_b"];
OT_NATO_StaticGarrison_HQ = ["rhsgref_cdf_b_SPG9M","rhsgref_cdf_b_SPG9M","rhsgref_cdf_b_Igla_AA_pod","rhsgref_cdf_b_DSHKM","rhsgref_cdf_b_DSHKM","rhsgref_cdf_b_DSHKM","rhsgref_cdf_b_AGS30_TriPod","rhsgref_BRDM2_b","rhsgref_cdf_b_btr70","rhsgref_cdf_b_reg_uaz_ags","rhsgref_cdf_b_bmp1p","rhsgref_cdf_b_reg_M252","rhsgref_cdf_b_t80bv_tv","rhsgref_cdf_b_t80bv_tv","rhsgref_cdf_b_t80bv_tv","rhsgref_cdf_b_zsu234","rhsgref_cdf_b_zsu234","rhsgref_cdf_b_bmp2d","rhsgref_cdf_b_bmp2d"];

OT_NATO_CommTowers = ["Land_TTowerBig_1_F","Land_TTowerBig_2_F"];

OT_NATO_Unit_Sniper = "B_T_ghillie_tna_F";
OT_NATO_Unit_Spotter = "B_T_Spotter_F";
OT_NATO_Unit_AA_spec = "rhsgref_cdf_b_reg_specialist_aa";
OT_NATO_Unit_AA_ass = "rhsgref_cdf_b_reg_specialist_aa";
OT_NATO_Unit_HVT = "rhsgref_cdf_b_reg_general";
OT_NATO_Unit_TeamLeader = "rhsgref_cdf_b_reg_squadleader";
OT_NATO_Unit_SquadLeader = "rhsgref_cdf_b_reg_squadleader";

OT_NATO_Unit_PoliceCommander = "rhsgref_hidf_boat_driver";
OT_NATO_Unit_Police = "rhsgref_hidf_rifleman";
OT_NATO_Vehicle_PoliceHeli = ["rhs_uh1h_hidf"];OT_NATO_Vehicle_PoliceHeli = selectRandom OT_NATO_Vehicle_PoliceHeli;
OT_NATO_Vehicle_Quad = "B_Quadbike_01_F";
OT_NATO_Vehicle_Police = ["B_GEN_Offroad_01_gen_F","B_GEN_Offroad_01_covered_F"];OT_NATO_Vehicle_Police = selectRandom OT_NATO_Vehicle_Police;
OT_NATO_Vehicle_Transport = ["rhsgref_cdf_b_ural_open","rhsgref_cdf_b_ural","rhsgref_cdf_b_zil131","rhsgref_cdf_b_zil131_open"];
OT_NATO_Vehicle_Transport_Light = "B_T_LSV_01_unarmed_F";
OT_NATO_Vehicles_PoliceSupport = ["rhsgref_cdf_b_reg_uaz_dshkm","rhsgref_cdf_b_reg_uaz_ags"];OT_NATO_Vehicles_PoliceSupport = selectRandom OT_NATO_Vehicles_PoliceSupport;
OT_NATO_Vehicles_ReconDrone = "B_UAV_01_F";
OT_NATO_Vehicles_CASDrone = "B_UAV_02_CAS_F";
OT_NATO_Vehicles_AirSupport = ["rhsgref_b_mi24g_CAS","rhsgref_cdf_b_Mi24D_Early"];
OT_NATO_Vehicles_AirSupport_Small = ["rhs_uh1h_hidf_gunship"];
OT_NATO_Vehicles_GroundSupport = ["B_T_LSV_01_armed_F","rhsgref_cdf_b_reg_uaz_dshkm","rhsgref_BRDM2_HQ_b","rhsgref_cdf_b_reg_uaz_ags"];
OT_NATO_Vehicles_TankSupport = ["rhsgref_cdf_b_t80bv_tv","rhsgref_cdf_b_t80b_tv"];
OT_NATO_Vehicles_Convoy = ["B_T_UGV_01_rcws_olive_F","rhsgref_BRDM2_HQ_b","rhsgref_BRDM2_HQ_b","B_T_UGV_01_rcws_olive_F","rhsgref_BRDM2_b"];
OT_NATO_Vehicles_AirWingedSupport = ["rhs_l39_cdf_b_cdf","rhsgref_cdf_b_su25"];
OT_NATO_Vehicle_AirTransport_Small = "rhs_uh1h_hidf";
OT_NATO_Vehicle_AirTransport = ["rhsgref_cdf_b_reg_Mi8amt","B_Heli_Transport_01_F"];
OT_NATO_Vehicle_AirTransport_Large = "rhsgref_cdf_b_reg_Mi17Sh";
OT_NATO_Vehicle_Boat_Small = "B_Boat_Armed_01_minigun_F";
OT_NATO_Vehicles_APC = ["rhsgref_cdf_b_bmp1","rhsgref_cdf_b_bmp2","rhsgref_cdf_b_bmd1","rhsgref_cdf_b_bmd2"];

//New special force that comes midgame when base has been attacked
OT_NATO_APCBrigade_Lead = "rhsgref_cdf_b_para_squadleader";
OT_NATO_APCBrigade_Vehicles = ["rhsgref_cdf_b_bmp2d","rhsgref_cdf_b_bmp2d"];
OT_NATO_APCBrigade_Infantry = ["rhsgref_cdf_b_para_grenadier_rpg","rhsgref_cdf_b_para_grenadier_rpg","rhsgref_cdf_b_para_machinegunner","rhsgref_cdf_b_para_marksman","rhsgref_cdf_b_para_autorifleman"];//Squad Per Vehicle

//New to allow for specialized weaponery
OT_NATO_ReinforcementsLead = "rhsgref_cdf_b_ngd_squadleader";
OT_NATO_Reinforcements = ["rhsgref_cdf_b_ngd_grenadier_rpg","rhsgref_cdf_b_ngd_engineer","rhsgref_cdf_b_ngd_machinegunner","rhsgref_cdf_b_ngd_medic","rhsgref_cdf_b_ngd_rifleman","rhsgref_cdf_b_ngd_rifleman_lite"]; //Troops that come to assist police/ run checkpoints
OT_NATO_GarrisonLead = "rhsgref_cdf_b_reg_squadleader";
OT_NATO_Garrison = ["rhsgref_cdf_b_reg_specialist_aa","rhsgref_cdf_b_reg_grenadier_rpg","rhsgref_cdf_b_reg_engineer","rhsgref_cdf_b_reg_machinegunner","rhsgref_cdf_b_reg_marksman","rhsgref_cdf_b_reg_medic","rhsgref_cdf_b_reg_rifleman","rhsgref_cdf_b_reg_rifleman_akm","rhsgref_cdf_b_reg_rifleman_aks74","rhsgref_cdf_b_reg_grenadier","rhsgref_cdf_b_reg_rifleman_lite","rhsgref_cdf_b_reg_rifleman_rpg75","B_T_ghillie_tna_F"]; //Troops that gaurd objectives/bases
OT_NATO_ArmyLead = "B_W_Soldier_TL_F";
OT_NATO_Army = ["B_W_Soldier_A_F","B_W_Soldier_AR_F","B_W_Soldier_CBRN_F","B_W_Medic_F","B_W_Soldier_Exp_F","B_W_Soldier_GL_F","B_W_soldier_M_F","B_W_Soldier_AA_F","B_W_Soldier_AT_F","B_W_RadioOperator_F","B_W_Soldier_F","B_W_Soldier_LAT_F","B_W_Soldier_LAT2_F","B_T_Soldier_LAT2_F","B_T_ghillie_tna_F"]; //Troops that are sent to battle for towns/bases

OT_NATO_ReinforcementsWep = ["rhs_weap_akms_folded","rhs_weap_akms","rhs_weap_aks74u","arifle_Mk20C_F","SMG_03C_camo","arifle_AK12U_lush_F"];
OT_NATO_ReinforcementsWepGL = ["rhs_weap_akm_gp25","arifle_Mk20_GL_F"];
OT_NATO_ReinforcementsWepMG = ["LMG_Mk200_black_F","rhs_weap_pkm"];
OT_NATO_ReinforcementsWepSR = ["rhs_weap_svds","rhs_weap_m76"];

OT_NATO_GarrisonWep = ["arifle_Mk20_F","arifle_AK12_lush_F","arifle_MSBS65_camo_F","arifle_MSBS65_Mark_camo_F","arifle_MSBS65_UBS_camo_F","rhs_weap_ak105_zenitco01","rhs_weap_ak74m_camo","rhs_weap_asval","rhs_weap_m14_ris_wd","rhs_weap_aks74","rhs_weap_akm","rhs_weap_aks74n","rhs_weap_aks74u","rhs_weap_vhsd2_ct15x","rhs_weap_vhsd2","srifle_DMR_04_F","srifle_DMR_05_blk_F"];
OT_NATO_GarrisonWepGL = ["arifle_Mk20_GL_F","arifle_AK12_GL_lush_F","arifle_MSBS65_GL_camo_F","rhs_weap_ak74m_fullplum_gp25_npz","rhs_weap_ak74_gp25","rhs_weap_vhsd2_bg_ct15x"];
OT_NATO_GarrisonWepMG = ["arifle_RPK12_lush_F","LMG_Mk200_black_F","rhs_weap_pkm","rhs_weap_pkp"];
OT_NATO_GarrisonWepSR = ["rhs_weap_svdp","rhs_weap_t5000","rhs_weap_vss","rhs_weap_m76"];

OT_NATO_ArmyWep = ["arifle_MX_Black_F","arifle_MXC_Black_F","arifle_MXM_Black_F","srifle_DMR_05_blk_F","rhs_weap_ak74n_2_npz","rhs_weap_ak104"];
OT_NATO_ArmyWepGL = ["arifle_MX_GL_Black_F","rhs_weap_ak74n_2_gp25","rhs_weap_ak74m_gp25"];
OT_NATO_ArmyWepMG = ["LMG_Mk200_black_F","arifle_MX_SW_Black_F","arifle_RPK12_F","rhs_weap_pkp"];
OT_NATO_ArmyWepSR = ["rhs_weap_svdp","rhs_weap_vss","rhs_weap_t5000","srifle_DMR_04_F"];

OT_NATO_weapons_Police = ["SMG_03_camo","rhs_weap_savz61","SMG_02_F","SMG_05_F","rhs_weap_M590_8RD"];
OT_NATO_weapons_Pistols = ["hgun_Pistol_heavy_01_F","hgun_ACPC2_F","hgun_P07_F","hgun_Rook40_F","rhsusf_weap_m9"];

OT_NATO_GroundForces = []; // Don't touch

OT_NATOBluprints = ["rhsgref_cdf_b_ural_fuel","rhsgref_cdf_b_ural_repair","rhsgref_cdf_b_ural_open","rhsgref_cdf_b_ural","rhsgref_cdf_b_reg_uaz_open","rhsgref_cdf_b_reg_uaz_ags","rhsgref_cdf_b_reg_uaz_dshkm","rhsgref_cdf_b_reg_uaz_spg9","rhsgref_cdf_b_reg_uaz","rhsgref_cdf_b_btr60","rhsgref_BRDM2_HQ_b","RHS_AN2_B","rhsgref_cdf_b_reg_Mi8amt"]; //List of blueprints player can get from laptop

OT_CRIM_Weapons = ["rhs_weap_ak103","rhs_weap_ak74","rhs_weap_ak74_3","rhs_weap_ak74_2","rhs_weap_ak74m_desert","rhs_weap_ak74n","rhs_weap_akm","rhs_weap_akmn","rhs_weap_akms","rhs_weap_aks74","rhs_weap_aks74u","sgun_HunterShotgun_01_F","srifle_DMR_06_hunter_F","arifle_AKM_F","arifle_AKS_F","arifle_AK12_F","arifle_AK12_arid_F","rhs_weap_m1garand_sa43","rhs_weap_m21a","rhs_weap_savz58v","rhs_weap_savz58p"];
OT_CRIM_Pistols = ["rhs_weap_6p53","rhs_weap_pb_6p9","hgun_Pistol_heavy_02_F","hgun_Pistol_01_F","rhs_weap_makarov_pm","rhs_weap_tt33"];
OT_CRIM_Launchers = ["rhs_weap_rpg26","launch_RPG7_F","rhs_weap_rpg7","rhs_weap_rpg75","rhs_weap_rshg2"];

if (isClass(configfile >> "CfgPatches" >> "hlcweapons_core")) then { //NIARMS
	private _append = ["hlc_rifle_ak12","hlc_rifle_g3sg1ris","hlc_rifle_G36A1","hlc_rifle_augsr_b","hlc_rifle_auga3_b","hlc_rifle_G36V","hlc_rifle_ak74m"];
	{
		OT_NATO_GarrisonWep pushback _x;
	}foreach(_append);
	
	_append = ["hlc_rifle_RPK12","hlc_lmg_MG3KWS_b"];
	
	{
		OT_NATO_GarrisonWepMG pushback _x;
	}foreach(_append);
	
	_append = ["hlc_smg_mp5a4","hlc_smg_mp5sd5"];
	
	{
		OT_NATO_weapons_Police pushback _x;
	}foreach(_append);
	
	_append = ["hlc_rifle_G36C","hlc_rifle_G36CTac","hlc_rifle_aks74u","hlc_rifle_aku12"];
	
	{
		OT_NATO_ReinforcementsWep pushback _x;
	}foreach(_append);
	
	_append = ["hlc_rifle_g3a3v","hlc_rifle_ak12","hlc_rifle_G36MLIC","hlc_rifle_G36KMLIC","hlc_rifle_ak74m","hlc_rifle_aek971_mtk"];
	
	{
		OT_NATO_ArmyWep pushback _x;
	}foreach(_append);
	
	_append = ["hlc_rifle_RPK12","hlc_rifle_rpk74n"];
	
	{
		OT_NATO_ArmyWepMG pushback _x;
	}foreach(_append);
	
	_append = ["hlc_rifle_ak47","hlc_rifle_ak12","hlc_rifle_aku12","hlc_rifle_ak74_dirty","hlc_rifle_akm","hlc_rifle_aks74","hlc_rifle_aks74u","hlc_rifle_aek971worn","hlc_rifle_RK62"];
	
	{
		OT_CRIM_Weapons pushback _x;
	}foreach(_append);
		
	_append = ["hlc_pistol_C96_Wartime_Worn","hlc_Pistol_P228"];
	
	{
		OT_CRIM_Pistols pushback _x;
	}foreach(_append);
};

if (isClass(configfile >> "CfgPatches" >> "A3_Weapons_F_Aegis_LongRangeRifles_DMR_01")) then { //Aegis
	_append = ["B_A_MRAP_03_gmg_wdl_F","B_A_MRAP_03_hmg_wdl_F"];
	
	{
		OT_NATO_Vehicles_GroundSupport pushback _x;
	}foreach(_append);
	
	_append = ["B_A_APC_tracked_03_cannon_wdl_F"];
	
	{
		OT_NATO_Vehicles_APC pushback _x;
	}foreach(_append);
	
	_append = [["B_A_Soldier_TL_wdl_F","B_A_Soldier_AR_wdl_F","B_A_soldier_M_wdl_F","B_A_Soldier_GL_wdl_F","B_A_Medic_wdl_F","B_A_Soldier_AT_wdl_F","B_A_RadioOperator_wdl_F","B_A_Soldier_wdl_F"]];
	
	{
		OT_NATO_GroundForces pushback _x;
	}foreach(_append);
	
	_append = ["arifle_SA80_khk_F"];
	
	{
		OT_NATO_GarrisonWep pushback _x;
	}foreach(_append);
	
	_append = ["MMG_02_khaki_F"];
	
	{
		OT_NATO_GarrisonWepMG pushback _x;
	}foreach(_append);
	
	_append = ["srifle_WF50_F"];
	
	{
		OT_NATO_GarrisonWepSR pushback _x;
	}foreach(_append);
	
	_append = ["arifle_SA80_C_khk_F"];
	
	{
		OT_NATO_ArmyWep pushback _x;
	}foreach(_append);
	
	_append = ["LMG_Mk200_khk_F"];
	
	{
		OT_NATO_ArmyWepMG pushback _x;
	}foreach(_append);
	
	_append = ["SMG_04_khk_F","sgun_M4_F","SMG_01_khk_F"];
	
	{
		OT_NATO_ReinforcementsWep pushback _x;
	}foreach(_append);
	
	_append = ["sgun_Mp153_classic_F"];
	
	{
		OT_NATO_weapons_Police pushback _x;
	}foreach(_append);
	
};

private _GetParam = [0, 1] select (paramsArray select 9);
if (_GetParam IsEqualTo 1) then {HCEnabled = true};
_GetParam = [0, 1] select (paramsArray select 10);
if (_GetParam IsEqualTo 1) then {AllowAirD = true};

OT_NATO_Sandbag_Curved = "Land_BagFence_01_round_green_F";
OT_NATO_Barrier_Small = "Land_HBarrier_01_line_5_green_F";
OT_NATO_Barrier_Large = "Land_HBarrier_01_wall_6_green_F";

OT_NATO_Mortar = "B_T_Mortar_01_F";

OT_NATO_Vehicle_HVT = "rhsgref_cdf_b_reg_uaz";

OT_NATO_Vehicle_CTRGTransport = "B_CTRG_Heli_Transport_01_tropic_F";

//Criminal stuff
OT_CRIM_Unit = "C_man_p_fugitive_F";
OT_CRIM_Clothes = ["U_I_C_Soldier_Bandit_3_F","U_BG_Guerilla3_1","U_C_HunterBody_grn","U_I_G_Story_Protagonist_F"];
OT_CRIM_Goggles = ["G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","G_Balaclava_oli","G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_oli","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_tan"];

OT_piers = []; //spawns dudes that sell boats n stuff
OT_offices = ["Land_MultistoryBuilding_01_F","Land_MultistoryBuilding_04_F"];
OT_portBuildings = ["Land_Warehouse_01_F"];
OT_airportTerminals = ["Land_Airport_01_terminal_F","Land_Airport_02_terminal_F","Land_Hangar_F"];
OT_portBuilding = "Land_WarehouseShelter_01_F";
OT_policeStation = "Land_Cargo_House_V3_F";
OT_warehouse = "Land_Warehouse_03_F";
OT_warehouses = [OT_warehouse];
OT_barracks = "Land_Barracks_01_grey_F";
OT_workshopBuilding = "Land_cargo_house_slum_F";//changed by Gerhart
OT_refugeeCamp = "Land_Medevac_house_V1_F";
OT_trainingCamp = "Land_IRMaskingCover_02_F";
OT_hardwareStore = "Land_IndustrialShed_01_F";//"Land_Workshop_05_F";
OT_radarBuilding = "Land_Radar_Small_F";
OT_Jammer = "Land_DPP_01_transformer_F";

//Custom recruitables per mission
OT_Recruitables = [
    //Rifleman
	["I_soldier_F",[
        ["srifle_DMR_06_hunter_F","","","optic_Holosight_lush_F",["10Rnd_Mk14_762x51_Mag",10],[],""],
        [],
        ["hgun_Pistol_heavy_01_F","","","",["11Rnd_45ACP_Mag",11],[],""],
        ["eo_bandit",[["ACE_morphine",1],["ACE_epinephrine",1],["ACE_fieldDressing",2]]],
        ["FRITH_ruin_vestia_lite_ltr",[["HandGrenade",2,1],["11Rnd_45ACP_Mag",4,11],["MiniGrenade",4,1]]],
        ["eo_legstrappack_2",[["10Rnd_Mk14_762x51_Mag",6,10]]],
        "FRITH_ruin_modhat_ltr","eo_bandana_2",
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
		["FRITH_ruin_vestia_lite_grn",[["HandGrenade",2,1],["11Rnd_45ACP_Mag",4,11],["MiniGrenade",4,1]]],
		["eo_messengerbag_1",[["rhsgref_25Rnd_792x33_SmE_StG",3,25],["rhs_grenade_nbhgr39_mag",1,1],["rhs_grenade_nbhgr39B_mag",1,1]]],
		"FRITH_ruin_modhat_ltrpntred","eo_balaclava_1",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Rifleman (AT)
	["I_Soldier_LAT_F",[
        ["rhsusf_weap_MP7A2_desert","","","",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],
		["rhs_weap_rpg7","","","",["rhs_rpg7_PG7V_mag",1],[],""],
		["hgun_Pistol_heavy_01_F","","","",["11Rnd_45ACP_Mag",11],[],""],
		["eo_paramilitary_1",[["FirstAidKit",1],["ACE_fieldDressing",5],["ACE_epinephrine",2],["ACE_morphine",2],["SmokeShell",2,1],["11Rnd_45ACP_Mag",2,11],["rhsusf_mag_40Rnd_46x30_FMJ",1,40]]],
		["FRITH_ruin_vestiaGL_ltr",[["11Rnd_45ACP_Mag",2,11],["rhsusf_mag_40Rnd_46x30_FMJ",9,40]]],
		["eo_field",[["rhs_grenade_nbhgr39_mag",1,1],["rhs_grenade_nbhgr39B_mag",1,1],["RPG7_F",2,1],["rhs_rpg7_OG7V_mag",3,1]]],
		"FRITH_ruin_modhat_mettan","eo_balaclava_1",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Marksman
	["I_Soldier_M_F",[
        ["srifle_DMR_06_hunter_F","","","optic_Hamr",["10Rnd_Mk14_762x51_Mag",10],[],""],
		[],
		["hgun_Pistol_heavy_01_F","","","",["11Rnd_45ACP_Mag",11],[],""],
		["eo_shirt_tigerblk",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["11Rnd_45ACP_Mag",5,11]]],
		["FRITH_ruin_vestia_lite_tar",[["20Rnd_762x51_Mag",6,20]]],
		["eo_legstrappack_4",[["20Rnd_762x51_Mag",2,20],["HandGrenade",1,1],["SmokeShell",1,1]]],
		"FRITH_ruin_modhat_fabrus","eo_balaclavaLow_3",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Sniper
	["I_Sniper_F",[
        ["rhs_weap_m38_rail","","","optic_KHS_old",["rhsgref_5Rnd_762x54_m38",5],[],""],
		[],
		["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		["U_FRITH_RUIN_SDR_snip_hawk",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_17Rnd_9x19_FMJ",2,17]]],
		["FRITH_ruin_vestia_lite_ghm",[["rhsusf_mag_17Rnd_9x19_FMJ",1,17],["rhsgref_5Rnd_762x54_m38",15,5],["SmokeShell",2,1],["HandGrenade",2,1]]],
		["eo_legstrappack_2",[["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["rhsgref_5Rnd_762x54_m38",5,5]]],
		"FRITH_ruin_modhat_fabrus","eo_balaclavaLow_3",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Spotter
	["I_Spotter_F",[
        ["srifle_DMR_06_hunter_F","","","optic_Holosight_blk_F",["10Rnd_Mk14_762x51_Mag",10],[],""],
		[],
		["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		["eo_camo",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_17Rnd_9x19_FMJ",4,17],["10Rnd_Mk14_762x51_Mag",7,10]]],
		["FRITH_ruin_vestia_lite_grn",[["rhsusf_mag_17Rnd_9x19_FMJ",1,17],["SmokeShell",2,1],["HandGrenade",2,1],["10Rnd_Mk14_762x51_Mag",3,10]]],
		["eo_legstrappack_4",[["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["SmokeShell",4,1]]],
		"FRITH_ruin_modhat_ltrpntgrn","eo_bandana_3",
		["Binocular","","","",[],[],""],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Squad Leader
	["I_Soldier_SL_F",[
        ["srifle_DMR_06_hunter_F","","","optic_Holosight_blk_F",["10Rnd_Mk14_762x51_Mag",10],[],""],
		[],
		["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		["eo_independant_1",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_17Rnd_9x19_FMJ",4,17],["10Rnd_Mk14_762x51_Mag",7,10]]],
		["FRITH_ruin_vestia_lite_grn",[["rhsusf_mag_17Rnd_9x19_FMJ",1,17],["SmokeShell",2,1],["HandGrenade",2,1],["10Rnd_Mk14_762x51_Mag",3,10]]],
		["eo_legstrappack_4",[["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["SmokeShell",4,1]]],
		"FRITH_ruin_modhat_ltrpntwht","eo_bandana_3",
		["Binocular","","","",[],[],""],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Medic
	["I_Medic_F",[
        ["rhsusf_weap_MP7A2_desert","","","optic_Holosight_smg_blk_F",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],
		[],
		["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		["eo_hoodie_blue",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_17Rnd_9x19_FMJ",4,17],["rhsusf_mag_17Rnd_9x19_JHP",2,17]]],
		["FRITH_ruin_vestia_lite_grn",[["rhsusf_mag_17Rnd_9x19_FMJ",2,17],["SmokeShell",4,1],["rhsusf_mag_40Rnd_46x30_FMJ",5,40]]],
		["eo_field",[["ACE_bloodIV",4],["ACE_epinephrine",8],["ACE_fieldDressing",10]]],
		"FRITH_ruin_modhat_fabjap","eo_respirator_1",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //AT
	["I_Soldier_AT_F",[
        ["rhsusf_weap_MP7A2_desert","","","optic_Holosight_smg_blk_F",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],
		["rhs_weap_rpg7","","","",["rhs_rpg7_PG7V_mag",1],[],""],
		["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		["eo_survivor_1",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_17Rnd_9x19_FMJ",4,17],["rhsusf_mag_40Rnd_46x30_FMJ",5,40]]],
		["FRITH_ruin_vestiaGL_ltr",[["rhsusf_mag_40Rnd_46x30_FMJ",5,40],["rhs_grenade_anm8_mag",2,1],["rhs_charge_tnt_x2_mag",2,1]]],
		["eo_carryall_2",[["RPG7_F",4,1],["rhs_rpg7_TBG7V_mag",2,1]]],
		"FRITH_ruin_modhat_mettan","eo_bandana_4",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //AA
	["I_Soldier_AA_F",[
        ["rhsusf_weap_MP7A2_desert","","","optic_Holosight_smg_blk_F",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],
		["rhs_weap_rpg7","","","",["rhs_rpg7_PG7V_mag",1],[],""],
		["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		["eo_shirt_stripe",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_17Rnd_9x19_FMJ",4,17],["rhsusf_mag_40Rnd_46x30_FMJ",2,40]]],
		["FRITH_ruin_vestiaGL_ltr",[["rhsusf_mag_40Rnd_46x30_FMJ",5,40],["rhs_grenade_anm8_mag",2,1],["rhs_charge_tnt_x2_mag",2,1]]],
		["eo_carryall_2",[["RPG7_F",2,1],["rhs_rpg7_PG7VR_mag",2,1],["rhs_rpg7_type69_airburst_mag",3,1]]],
		"FRITH_ruin_modhat_metgrn","eo_bandana_4",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Assistant AT
	["I_Soldier_AAT_F",[
        ["rhsusf_weap_MP7A2_aor1","","","optic_Holosight_smg_blk_F",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],
		[],
		["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		["eo_hoodie_grey",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_17Rnd_9x19_FMJ",4,17]]],
		["FRITH_ruin_vestiaGL_ltr",[["rhs_grenade_anm8_mag",2,1],["rhs_charge_tnt_x2_mag",2,1]]],
		["eo_carryall_2",[["RPG7_F",8,1]]],
		"FRITH_ruin_modhat_fabtar","eo_bandana_4",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Assistant AA
	["I_Soldier_AAA_F",[
        ["rhsusf_weap_MP7A2_aor1","","","optic_Holosight_smg_blk_F",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],
		[],
		["rhsusf_weap_glock17g4","","","",["rhsusf_mag_17Rnd_9x19_JHP",17],[],""],
		["eo_shirt_plainblk",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_17Rnd_9x19_FMJ",4,17]]],
		["FRITH_ruin_vestiaGL_ltr",[["rhs_grenade_anm8_mag",2,1],["rhs_charge_tnt_x2_mag",2,1]]],
		["eo_carryall_2",[["RPG7_F",2,1]]],
		"FRITH_ruin_modhat_fabrus","eo_bandana_4",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ],
    //Grenadier
	["I_Soldier_GL_F",[
        ["rhsusf_weap_MP7A2_aor1","","","optic_Holosight_smg_blk_F",["rhsusf_mag_40Rnd_46x30_FMJ",40],[],""],
		[],
		["rhs_weap_M320","","","",["rhs_mag_M441_HE",1],[],""],
		["eo_hoodie_kabeiroi",[["ACE_fieldDressing",4],["ACE_epinephrine",2],["ACE_morphine",2],["rhsusf_mag_40Rnd_46x30_FMJ",4,40]]],
		["FRITH_ruin_vestia_lite_nja",[["rhsusf_mag_40Rnd_46x30_FMJ",9,40]]],
		["eo_field",[["rhs_mag_M397_HET",12,1],["rhs_mag_M433_HEDP",10,1],["rhs_mag_m714_White",5,1]]],
		"FRITH_ruin_modhat_mettan","eo_bandana_4",
		[],
		["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]]
    ]
];
