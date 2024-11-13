/*
	Currently detected mods:
		OT_has_TFAR = Task Force Radio
		OT_has_WS 	= Western Sahara
		OT_has_NI 	= Nation Indepedent Arsenal
		OT_has_FW 	= The Free World Armoury
		OT_has_3F 	= 3CB factions
		OT_has_CupW = CUP-Weapons
		OT_has_IC 	= Ivory Cars
		OT_has_GM	= Global Mobalization
		OT_has_BW	= BWMOD
		OT_has_AG	= Aegis
*/

private _append = [];
OT_AdditionalUnforms = [];

//---CDLC---//
if(OT_has_WS) then {
	WS_local = [];
	WS_guerilla = ["U_lxWS_Djella_02_Brown","U_lxWS_Djella_02_Sand","U_lxWS_Djella_03_Green","U_lxWS_Djella_02_Grey","U_SFIA_deserter_lxWS","U_lxWS_SFIA_deserter","U_lxWS_ION_Casual2","U_lxWS_ION_Casual3","U_lxWS_ION_Casual4","U_lxWS_ION_Casual5","U_lxWS_ION_Casual6"];
	OT_clothes_guerilla append WS_guerilla;

	OT_AdditionalUnforms append WS_local;
	OT_AdditionalUnforms append OT_clothes_guerilla;
	OT_AdditionalUnforms append [
		"U_lxWS_C_Djella_03", "U_lxWS_C_Djella_06",
		"U_lxWS_C_Djella_02", "U_lxWS_C_Djella_02a",
		"U_lxWS_C_Djella_07", "U_lxWS_C_Djella_05",
		"U_lxWS_C_Djella_04", "U_lxWS_C_Djella_01",
		"U_lxWS_Tak_02_A", "U_lxWS_Tak_03_B","U_lxWS_Tak_03_A",
		"U_lxWS_Tak_03_C", "U_lxWS_Tak_01_B"
	];
	
	OT_policeUnitCaptain	= "OT_AltisPoliceCaptainWS";
	OT_policeUnitCommander 	= "OT_AltisPoliceCommanderWS"; 
	OT_policeUnitLight 		= "OT_AltisPoliceManLightWS";
	OT_policeUnitRegular 	= "OT_AltisPoliceManWS";
	OT_policeUnitHeavy 		= "OT_AltisPoliceManHeavyWS";
	OT_policeUnitMedic 		= "OT_AltisPoliceMedicWS";
	OT_policeUnitAT 		= "OT_AltisPoliceATWS";
	OT_policeUnitHeavyAT	= "OT_AltisPoliceATHeavyWS";
	
	OT_NATO_Vehicles_GroundSupport append ["B_APC_Wheeled_01_command_lxWS"];
	OT_NATO_Vehicles_APC append ["B_APC_Wheeled_01_atgm_lxWS"];
	
	//Reinforcement weapons
	OT_NATO_ReinforcementsWep append [
		"arifle_VelkoR5_lxWS", "sgun_aa40_tan_lxWS", 
		"arifle_SLR_Para_lxWS"
	];
	OT_NATO_ReinforcementsWepGL append [
		"arifle_VelkoR5_GL_lxWS"
	];
	OT_NATO_ReinforcementsWepMG append [
		"arifle_XMS_M_Sand_lxWS"
	];
	//Garison Weps
	OT_NATO_GarrisonWep append [
		"srifle_EBR_blk_lxWS", "arifle_Velko_lxWS"
	];
	OT_NATO_GarrisonWepMG append [
		"LMG_S77_lxWS"
	];
	//Army weps
	OT_NATO_ArmyWep append [
		"arifle_XMS_Base_Sand_lxWS", "arifle_XMS_Base_lxWS", "arifle_Velko_lxWS"
	];
	OT_NATO_ArmyWepGL append [
		"arifle_XMS_GL_Sand_lxWS", "arifle_XMS_Shot_Sand_lxWS"
	];
	OT_NATO_ArmyWepMG append [
		"LMG_S77_Compact_lxWS"
	];
	OT_NATO_ArmyWepSR append [
		"srifle_EBR_blk_lxWS"
	];
	//Attachments
	OT_NATO_WepLowOptics append [
		"optic_Hamr_sand_lxWS", "optic_r1_high_black_sand_lxWS",
		"optic_r1_high_lxWS", "optic_r1_high_sand_lxWS",
		"optic_r1_low_sand_lxWS", "optic_r1_low_lxWS"
	];
	OT_NATO_WepMuzzles append [
		"suppressor_h_lxWS", "suppressor_m_lxWS",
		"suppressor_m_sand_lxWS", "suppressor_h_sand_lxWS",
		"muzzle_snds_12Gauge_lxWS"
	];
	OT_NATO_WepPointers append [
		"acc_pointer_IR_sand_lxWS", "saber_light_sand_lxWS",
		"saber_light_ir_sand_lxWS", "saber_light_lxWS",
		"saber_light_ir_lxWS"
	];
	//Blueprints
	OT_NATOBluprints append [
		"APC_Wheeled_01_atgm_base_lxWS","APC_Wheeled_01_command_base_lxWS",
		"B_UAV_02_lxWS","APC_Wheeled_01_mortar_base_lxWS",
		"B_ION_APC_Wheeled_02_hmg_lxWS","B_ION_Heli_Light_02_dynamicLoadout_lxWS",
		"B_GEN_APC_Wheeled_02_hmg_lxWS","B_UN_Heli_Transport_02_lxWS",
		"B_MBT_03_cannon_lxWS"
	];
};

if (OT_has_RF) then {
	OT_NATO_ArmyLead pushBack ["B_QRF_Soldier_SL_RF"];
	OT_NATO_Army pushBack [
		"B_QRF_Soldier_AR_RF", "B_QRF_medic_RF",
		"B_QRF_Soldier_GL_RF", "B_QRF_Soldier_RF",
		"B_QRF_soldier_LAT2_RF", "B_QRF_Sharpshooter_RF",
		"B_QRF_soldier_UAV_RF", "B_Patrol_Soldier_AT_F",
		"B_Patrol_Soldier_A_F", "B_support_CMort_RF"
	];
	OT_NATO_ArmyBaseGroup pushBack [
		"B_QRF_Soldier_AR_RF", "B_QRF_medic_RF",
		"B_QRF_soldier_LAT2_RF", "B_support_CMort_RF"
	];
	OT_NATO_PoliceWep append ["srifle_h6_blk_rf"];
	OT_NATO_GarrisonWep append ["SMG_01_black_RF"];
	OT_NATO_GarrisonWepSR append ["srifle_h6_tan_rf"];
	OT_NATO_ArmyWepSR append ["srifle_h6_tan_rf"];
	
	OT_NATO_PoliceWepPistol append [
		"hgun_Glock19_Tan_RF", "hgun_Glock19_RF"
	];
	OT_NATO_WepPistol append [
		"hgun_DEagle_RF", "hgun_DEagle_classic_RF",
		"hgun_Glock19_auto_Tan_RF", "hgun_Glock19_auto_RF"
	];
	
	OT_NATO_WepLowOptics append [
		"optic_rds_RF", "optic_VRCO_RF",
		"optic_VRCO_tan_RF"
	];
	OT_NATO_WepMuzzles append [
		"suppressor_65_black_RF", "suppressor_65_sand_RF"
	];
	//---Vehicles---//
	OT_vehTypes_civ append [
		"C_Pickup_rf", "C_Pickup_covered_rf"
	];
	OT_NATO_Vehicles_GroundSupport append [
		"B_Pickup_mmg_rf"
	];
	OT_NATO_Vehicle_PoliceHeli append [
		"B_GEN_Heli_EC_01_RF"
	];
	OT_NATO_Vehicles_AirSupport_Small append [
		"B_Heli_light_03_dynamicLoadout_RF"
	];
	OT_NATO_Vehicle_AirTransport_Small append [
		"B_Heli_light_03_unarmed_RF"
	];
	OT_NATO_Vehicle_AirTransport append [
		"B_Heli_EC_03_RF", "B_Heli_EC_04_military_RF"
	];
	OT_NATO_Vehicle_Police append [
		"B_GEN_Pickup_covered_rf", "B_Pickup_mmg_rf"
	];
};

if(OT_has_GM) then {
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
	OT_NATO_PoliceWep append _append;
	
	OT_CRIM_Weapons append ["gm_ak74n_wud","gm_akm_wud","gm_akmsn_wud","gm_mpiak74n_blk","gm_mpiaks74nk_blk","gm_mpikm72_brn","gm_mpikm_brn","gm_mpikms72ksd_brn","gm_rpk_wud","gm_rpk74n_wud"];
	
		_append = ["gm_pim_blk","gm_pimb_blk","gm_pm63_handgun_blk","gm_pm_blk"];
	OT_CRIM_Pistols append _append;
	
		_append = ["gm_m49_blk","gm_p210_blk"];
	OT_NATO_WepPistol append _append;
	
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

if (OT_has_AG) then {
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
		OT_NATO_PoliceWep pushback _x;
	}foreach(_append);
};

//---Community Mods---//
if (OT_has_NI) then {

		_append = [
			"hlc_rifle_ak47", "hlc_rifle_ak12", 
			"hlc_rifle_aku12", "hlc_rifle_ak74_dirty",
			"hlc_rifle_akm", "hlc_wp_MK17IUR_762R",
			"hlc_rifle_aks74", "hlc_rifle_aks74u",
			"hlc_rifle_aek971worn", "hlc_rifle_RK62",
			"hlc_rifle_rpk", "hlc_rifle_rpk74n",
			"hlc_rifle_STGW57", "hlc_rifle_M1941LMG",
			"hlc_rifle_RPK12"
		];
	OT_CRIM_Weapons append _append;
	
		_append = [
			"hlc_pistol_C96_Wartime_Worn", "hlc_Pistol_P228",
			"hlc_pistol_P226WestGerman", "hlc_pistol_M712_worn_stock"
		];
	OT_CRIM_Pistols append _append;
	
		_append = ["hlc_pistol_P226R_357Elite","hlc_pistol_P229R_Combat","hlc_pistol_P239_40","hlc_pistol_Mk25D"];
	OT_NATO_WepPistol append _append;
	
		_append = ["hlc_smg_mp5a4","hlc_smg_mp5sd5","hlc_rifle_augpara_t","hlc_rifle_auga2para_t","hlc_rifle_saiga12k","hlc_rifle_vendimus","hlc_rifle_augsrcarb_t","hlc_rifle_SG550Sniper"];
	OT_NATO_PoliceWep append _append;

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

if (OT_has_BW) then {
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

if(OT_has_FW) then {
		_append = ["sp_fwa_smg_mp40","sp_fwa_mas_49_56","sp_fwa_fn_modelDA1","sp_fwa_fn49_arg","sp_fwa_m1918a2_bar","sp_fwa_ar18_shorty","sp_fwa_ar10_porto_alu","sp_fwa_ar15_603_m16a1_captured","sp_fwa_fal_factory_50_63","sp_fwa_sig510_3","sp_fwa_smg_mp40_black","sp_fwa_stg44","sp_fwa_bren_mk2","sp_fwa_fm2429","sp_fwa_ruger_mini14_ac556","sp_fwa_bm59_mk3_alpine"];
	OT_CRIM_Weapons append _append;
	
		_append = ["sp_fwa_l9a1_hipower_wood"];
	OT_CRIM_Pistols append _append;
	
		_append = ["sp_fwa_l9a1_hipower"];
	OT_NATO_WepPistol append _append;
	
		_append = ["sp_fwa_enfield_l42_walnut","sp_fwa_enfield_l8_walnut","sp_fwa_smg_carlg_m45","sp_fwa_smg_portsaid_m45","sp_fwa_smg_mk5sterling","sp_fwa_smg_mk6sterling","sp_fwa_smg_mk7a8sterling_stock_beech","sp_fwa_m2a1_carbine","sp_fwa_smg_thompson_m1a1","sp_fwa_smg_mat49","sp_fwa_ruger_mini14"];
	OT_NATO_PoliceWep append _append;
	
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

if(OT_has_3F) then {
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

if(OT_has_CupW) then {
	OT_NATO_ArmyWep append ["CUP_arifle_ACR_tan_556","CUP_CZ_BREN2_556_11_Tan","CUP_arifle_L85A2","CUP_arifle_HK_M27","CUP_arifle_mk18_black","CUP_arifle_CZ805_A1_coyote"];
	OT_NATO_ArmyWepGL append ["CUP_arifle_ACR_EGLM_tan_556","CUP_CZ_BREN2_556_11_GL_Tan","CUP_arifle_L85A2_GL","CUP_arifle_HK_M27_AG36","CUP_arifle_CZ805_GL_coyote"];
	OT_NATO_ArmyWepSR append ["CUP_srifle_L129A1_d","CUP_srifle_RSASS_Sand","CUP_srifle_CZ750"];
	OT_NATO_ArmyWepMG append ["CUP_lmg_Mk48_tan","CUP_lmg_Mk48_nohg_des"];
	
	_append = ["CUP_arifle_AK47_Early","CUP_arifle_AK107","CUP_arifle_AK74_Early","CUP_arifle_AKM_Early","CUP_arifle_AKMS_Early","CUP_arifle_AK47","CUP_arifle_AKS74_Early","CUP_arifle_AKS74U","CUP_arifle_FNFAL","CUP_arifle_FNFAL_sand","CUP_arifle_Galil_SAR_black","CUP_arifle_FNFAL5061_wooden","CUP_arifle_Sa58_Klec","CUP_arifle_M16A1","CUP_arifle_M16A2","CUP_arifle_Sa58P","CUP_arifle_Sa58s","CUP_SKS","CUP_arifle_TYPE_56_2_Early"];
	OT_CRIM_Weapons append _append;
	
		_append = ["sp_fwa_l9a1_hipower_wood"];
	OT_CRIM_Pistols append _append;
	
		_append = ["sp_fwa_l9a1_hipower"];
	OT_NATO_WepPistol append _append;
	
		_append = ["CUP_arifle_M4_MOE_BW","CUP_srifle_CZ550","CUP_smg_M3A1","CUP_smg_Mac10","CUP_smg_MP5A5","CUP_smg_MP5SD6","CUP_srifle_LeeEnfield","CUP_smg_bizon","CUP_srifle_Remington700","CUP_arifle_Sa58_sporter_compact","CUP_smg_saiga9","CUP_arifle_SAIGA_MK03_Wood","CUP_arifle_SR3M_Vikhr","CUP_smg_UZI"];
	OT_NATO_PoliceWep append _append;
};

if(OT_has_IC) then {
	OT_vehTypes_civ append ["ivory_cv","ivory_suburban","ivory_taurus","ivory_evox","ivory_supra","ivory_gti","ivory_prius","ivory_190e","ivory_e36","ivory_challenger","ivory_wrx"];
	OT_luxCars append ["ivory_911","ivory_mp4","ivory_elise","ivory_lfa","ivory_r34","ivory_r8_spyder"];
};

if(OT_has_WS) then {
	{
		private _mass = getNumber(configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "mass");
		private _cost = round(_mass * 4);
		cost setVariable [_x,[_cost,0,0,1],true];
		OT_allClothing pushbackunique _x;
	}foreach (OT_AdditionalUnforms);
	
	_append = ["G_Balaclava_blk_lxWS","G_Balaclava_oli_lxWS","G_Balaclava_snd_lxWS","G_Headset_lxWS","G_Combat_lxWS"];
	{
		OT_allFacewear pushBackUnique _x;
		if(isServer && _x != "None" && isNil {cost getVariable _x}) then {
			private _mass = getNumber(configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "mass");
			cost setVariable [_x,[_m*3,0,0,ceil(_m*0.5)],true];
		};
	}foreach(_append);
};

if(OT_has_GM) then {

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

if(OT_has_3F) then {
	OT_AdditionalUnforms = [];
	{
		private _mass = getNumber(configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "mass");
		private _cost = round(_mass * 4);
		cost setVariable [_x,[_cost,0,0,1],true];
		OT_allClothing pushbackunique _x;
	}foreach (OT_AdditionalUnforms);
};