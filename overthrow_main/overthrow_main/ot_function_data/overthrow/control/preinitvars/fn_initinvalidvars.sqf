private _hasNI = (isClass(configfile >> "CfgPatches" >> "hlcweapons_core"));

private _invalidItems = [];

private _invalidMags = [
	//Blank Magazines
	["rhsusf_100Rnd_762x51_m82_blank", true],
	["rhsusf_50Rnd_762x51_m82_blank", true],
	["rhs_mag_20Rnd_556x45_M200_Stanag", true],
	["rhs_mag_30Rnd_556x45_M200_Stanag", true],
	//Non-removable rockets
	["gm_1Rnd_64mm_heat_pg18", true],
	["gm_1Rnd_66mm_heat_m72a3", true],
	["gm_1Rnd_70mm_he_m585_fim43", true],
	["gm_1Rnd_72mm_he_9m32m", true],
	["gm_2rnd_72mm_he_9m32m_gad", true],
	["gm_2rnd_72mm_he_9m32m_gad_mi2_left", true],
	["gm_2rnd_72mm_he_9m32m_gad_mi2_right", true],
	["NLAW_F", true],
	["rhs_m136_hedp_mag", true],
	["rhs_m136_hp_mag", true],
	["rhs_m136_mag", true],
	["rhs_m72a7_mag", true],
	["rhs_m80_mag", true],
	["rhs_panzerfaust60_mag", true],
	["rhs_rpg18_mag", true],
	["rhs_rpg26_mag", true],
	["rhs_rpg75_mag", true],
	["rhs_rshg2_mag", true],
	["sp_fwa_1nd_m72a1_law_rocket", true],
	//Meme ammo
	["gm_1Rnd_2650mm_potato_dm11", true],
	["rhsusf_5Rnd_doomsday_Buck", true],
	["rhsusf_8Rnd_doomsday_Buck", true],
	//'magazines'
	["rhs_mag_fold_stock", true],
	["ACE_PreloadedMissileDummy", true],
	["rhs_fgm148_magazine_AT_empty", true]
];

OT_invalidMags = createHashMapFromArray _invalidMags;

private _invalidWeapons = [
	["gm_p2a1_launcher_blk", true]
];

OT_invalidWeapons = createHashMapFromArray _invalidWeapons;

private _convertWeapons = [
	["ACE_launch_NLAW_ready_F", "launch_NLAW_F"]
];

	if (_wpn == "rhs_weap_M590_8RD") exitwith {"rhsusf_8Rnd_00buck"};
	if (_wpn == "rhs_weap_savz61") exitwith {"rhsgref_20rnd_765x17_vz61"};
	if (_wpn == "sgun_Mp153_classic_F") exitwith {"4Rnd_12Gauge_Pellets"};
	if (_wpn == "arifle_Velko_lxWS") exitwith {"35Rnd_556x45_Velko_reload_tracer_green_lxWS"};

private _convertPrimMagazines = [
	//Specific magazines for weapons
	[
		"gm_m16a1_blk",
		["gm_20Rnd_556x45mm_B_T_M196_stanag_gry", "gm_20Rnd_556x45mm_B_M193_stanag_gry"]
	],
	[
		"sp_fwa_enfield_l42_walnut",
		["sp_fwa_10Rnd_762_L42", "sp_fwa_10Rnd_762_L42_Tracer"]
	],
	[
		"sp_fwa_enfield_l8_walnut",
		["sp_fwa_10Rnd_762_L42", "sp_fwa_10Rnd_762_L42_Tracer"]
	],
	[
		"arifle_SPAR_02_snd_F",
		["rhs_mag_100Rnd_556x45_M855A1_cmag_mixed", "150Rnd_556x45_Drum_Sand_Mag_Tracer_F"]
	],
	[
		"arifle_MX_SW_F",
		["100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag_Tracer"]
	],
	//VHSD2
	[
		"rhs_weap_vhsd2",
		["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t", "rhssaf_30rnd_556x45_TDIM_G36", "rhssaf_30rnd_556x45_MDIM_G36"]
	],
	[
		"rhs_weap_vhsd2_ct15x",
		["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t", "rhssaf_30rnd_556x45_TDIM_G36", "rhssaf_30rnd_556x45_MDIM_G36"]
	],
	[
		"rhs_weap_vhsd2_bg",
		["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t", "rhssaf_30rnd_556x45_TDIM_G36", "rhssaf_30rnd_556x45_MDIM_G36"]
	],
	[
		"rhs_weap_vhsd2_bg_ct15x",
		["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t", "rhssaf_30rnd_556x45_TDIM_G36", "rhssaf_30rnd_556x45_MDIM_G36"]
	],
	[
		"rhs_weap_vhsk2",
		["rhsgref_30rnd_556x45_vhs2", "rhsgref_30rnd_556x45_vhs2_t", "rhssaf_30rnd_556x45_TDIM_G36", "rhssaf_30rnd_556x45_MDIM_G36"]
	],
	//Sterling
	[
		"sp_fwa_smg_mk5sterling",
		["sp_fwa_32Rnd_9x19_L2A3_Sterling_Tracer", "sp_fwa_32Rnd_9x19_L2A3_Sterling_Ball", "sp_fwa_32Rnd_9x19_L2A3_Sterling"]
	],
	[
		"sp_fwa_smg_mk6sterling",
		["sp_fwa_32Rnd_9x19_L2A3_Sterling_Tracer", "sp_fwa_32Rnd_9x19_L2A3_Sterling_Ball", "sp_fwa_32Rnd_9x19_L2A3_Sterling"]
	],
	[
		"sp_fwa_smg_mk7a8sterling_stock_beech",
		["sp_fwa_32Rnd_9x19_L2A3_Sterling_Tracer", "sp_fwa_32Rnd_9x19_L2A3_Sterling_Ball", "sp_fwa_32Rnd_9x19_L2A3_Sterling"]
	],
	//M16A1
	[
		"hlc_wp_m16A1",
		["rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red", "rhs_mag_20Rnd_556x45_Mk262_Stanag"]
	],
	[
		"UK3CB_M16A1",
		["rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red", "rhs_mag_20Rnd_556x45_Mk262_Stanag"]
	],
	//SPAR
	[
		"arifle_SPAR_02_snd_F",
		["150Rnd_556x45_Drum_Sand_Mag_F", "150Rnd_556x45_Drum_Sand_Mag_Tracer_F"]
	],
	//Kozlice
	[
		"sgun_HunterShotgun_01_F",
		["2Rnd_12Gauge_Pellets", "2Rnd_12Gauge_Pellets", "2Rnd_12Gauge_Slug"]
	],
	[
		"sgun_HunterShotgun_01_sawedoff_F",
		["2Rnd_12Gauge_Pellets", "ACE_2Rnd_12Gauge_Pellets_No4_Buck", "2Rnd_12Gauge_Slug"]
	],
	//XMS-SW
	[
		"arifle_XMS_M_lxWS",
		["75Rnd_556x45_Stanag_green_lxWS", "75Rnd_556x45_Stanag_red_lxWS", "75Rnd_556x45_Stanag_lxWS"]
	],
	[
		"arifle_XMS_M_Sand_lxWS",
		["75Rnd_556x45_Stanag_green_lxWS", "75Rnd_556x45_Stanag_red_lxWS", "75Rnd_556x45_Stanag_lxWS"]
	],
	[
		"arifle_XMS_M_khk_lxWS",
		["75Rnd_556x45_Stanag_green_lxWS", "75Rnd_556x45_Stanag_red_lxWS", "75Rnd_556x45_Stanag_lxWS"]
	],
	//AA40
	[
		"sgun_aa40_lxWS",
		["20Rnd_12Gauge_AA40_Pellets_lxWS", "20Rnd_12Gauge_AA40_Slug_lxWS", "8Rnd_12Gauge_AA40_HE_lxWS"]
	],
	[
		"sgun_aa40_tan_lxWS",
		["20Rnd_12Gauge_AA40_Pellets_Tan_lxWS", "20Rnd_12Gauge_AA40_Slug_Tan_lxWS", "8Rnd_12Gauge_AA40_HE_Tan_lxWS"]
	],
	[
		"sgun_aa40_snake_lxWS",
		["20Rnd_12Gauge_AA40_Pellets_Snake_lxWS", "20Rnd_12Gauge_AA40_Slug_Snake_lxWS", "8Rnd_12Gauge_AA40_HE_Snake_lxWS"]
	],
	//Hades
	[
		"srifle_h6_blk_rf", 
		["10Rnd_556x45_AP_Stanag_red_RF"]
	],
	[
		"srifle_h6_tan_rf",
		["10Rnd_556x45_AP_Stanag_red_RF", "10Rnd_556x45_AP_Stanag_green_Tan_RF"]
	],
	[
		"srifle_h6_oli_rf",
		["10Rnd_556x45_AP_Stanag_red_RF", "10Rnd_556x45_AP_Stanag_red_khk_RF"]
	],
	[
		"srifle_h6_digi_rf",
		["10Rnd_556x45_AP_Stanag_red_RF", "10Rnd_556x45_AP_Stanag_red_khk_RF"]
	],
	[
		"srifle_h6_gold_rf",
		["30Rnd_556x45_AP_Stanag_RF"]
	],
	//Grenade Launcher Rounds
	[
		"rhsusf_mag_6Rnd_M781_Practice",
		["rhsusf_mag_6Rnd_M433_HEDP", "rhsusf_mag_6Rnd_M397_HET", "rhsusf_mag_6Rnd_M576_Buckshot"]
	],
	[
		"rhs_mag_M781_Practice",
		["rhs_mag_M433_HEDP", "rhs_mag_M397_HET", "rhs_mag_m576"]
	],
	//Everything else
	["ot_rhs_weap_m4_le6920", ["OT_20Rnd_233Rem_mag"]],
	["ot_rhs_weap_m4_le6920T", ["OT_20Rnd_233Rem_mag"]],
	["ot_weap_mr556", ["rhs_mag_20Rnd_556x45_M193_Stanag", "rhs_mag_20Rnd_556x45_M855_Stanag"]],
	["arifle_Velko_lxWS", ["35Rnd_556x45_Velko_reload_tracer_green_lxWS"]],
	["hlc_rifle_augsrcarb_t", ["hlc_30Rnd_556x45_B_AUG"]],
	["hlc_rifle_MG36", ["hlc_100rnd_556x45_M_G36"]],
	["hlc_rifle_SG550Sniper", ["hlc_30Rnd_556x45_EPR_sg550"]],
	["hlc_rifle_vendimus", ["hlc_30rnd_300BLK_PMAG_T"]],
	["rhs_weap_M590_8RD", ["rhsusf_8Rnd_00buck"]],
	["rhs_weap_savz61", ["rhsgref_20rnd_765x17_vz61"]],
	["sgun_Mp153_classic_F", ["4Rnd_12Gauge_Pellets"]],
	["sp_fwa_smg_thompson_m1928a1", ["sp_fwa_50Rnd_45acp_thompson_m1a1_Ball"]],
	["UK3CB_M16A1_LSW", ["rhs_mag_100Rnd_556x45_M855_cmag_mixed"]],
	//Blank magazines
	["rhs_mag_20Rnd_556x45_M200_Stanag", ["rhs_mag_30Rnd_556x45_M855_Stanag"]],
	["rhs_mag_30Rnd_556x45_M200_Stanag", ["rhs_mag_30Rnd_556x45_M855_Stanag"]],
	["rhsusf_50Rnd_762x51_m82_blank", ["rhsusf_50Rnd_762x51_m62_tracer"]],
	["rhsusf_100Rnd_762x51_m82_blank", ["rhsusf_100Rnd_762x51_m62_tracer"]],
	["rhsusf_mag_6Rnd_M781_Practice", ["rhsusf_mag_6Rnd_M433_HEDP", "rhsusf_mag_6Rnd_M397_HET", "rhsusf_mag_6Rnd_M576_Buckshot"]],
	["rhs_mag_M781_Practice", ["rhsusf_mag_6Rnd_M433_HEDP", "rhsusf_mag_6Rnd_M397_HET"]],
	//HE mags (The AI is a nightmare with them)
	["rhsusf_8Rnd_FRAG", ["rhsusf_8Rnd_00Buck"]],
	["rhsusf_8Rnd_HE", ["rhsusf_8Rnd_00Buck"]],
	["rhsusf_5Rnd_FRAG", ["rhsusf_5Rnd_00Buck"]],
	["rhsusf_5Rnd_HE", ["rhsusf_5Rnd_00Buck"]],
	["rhsusf_mag_10Rnd_STD_50BMG_mk211", ["ACE_10Rnd_127x99_API_Mag", "rhsusf_mag_10Rnd_STD_50BMG_M33", "ACE_10Rnd_127x99_AMAX_Mag"]],
	//Used missles
	["rhs_fgm148_magazine_AT_empty", ["rhs_fgm148_magazine_AT"]],
	//'Magazines'
	["rhs_mag_fold_stock", ["rhs_30Rnd_762x39mm_bakelite"]],
	//Fallback
	["", ["rhsgref_1Rnd_00Buck"]]
];
//Mod compat
if(_hasNI) then {
	_convertPrimMagazines pushBack ["hlc_rifle_G36C", ["hlc_30rnd_556x45_Tracers_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_S_G36"]];
	_convertPrimMagazines pushBack ["rhs_weap_g36c", ["hlc_30rnd_556x45_Tracers_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_S_G36"]];
}else{
	_convertPrimMagazines pushBack ["hlc_rifle_G36C", ["rhssaf_30rnd_556x45_EPR_G36","rhssaf_30rnd_556x45_Tracers_G36","rhssaf_30rnd_556x45_SPR_G36","rhssaf_30rnd_556x45_SOST_G36"]];
	_convertPrimMagazines pushBack ["rhs_weap_g36c", ["rhssaf_30rnd_556x45_EPR_G36","rhssaf_30rnd_556x45_Tracers_G36","rhssaf_30rnd_556x45_SPR_G36","rhssaf_30rnd_556x45_SOST_G36"]];
};

OT_convertPrimMagazines = createHashMapFromArray _convertPrimMagazines;

private _proprietaryScopes = [
	["gm_c7a1_oli", ["gm_c79a1_oli"]],
	["gm_g11k2_blk", ["gm_g11_lps_prism11mm_blk"]],
	["gm_gvm95_blk", ["gm_c79a1_blk"]],
	["gm_msg90a1_blk", ["gm_zf10x42_stanaghk_blk"]],
	["gm_psg1_blk", ["gm_zf6x42_psg1_stanag_blk"]],
	["hlc_rifle_SG550Sniper", ["hlc_optic_FNSTANAG4X_550"]]
];

OT_proprietaryScopes = createHashMapFromArray _proprietaryScopes;

OT_arsenalIgnore = [
	"ACE_launch_NLAW_ready_F",
	"launch_NLAW_F"
];