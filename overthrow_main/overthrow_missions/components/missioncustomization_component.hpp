#define EOCLOTHESLOCALS \
	eo[] = {}

#if __has_include("eo_backpacks\config.bin")
	#undef EOCLOTHESLOCALS
	#define eo[] = {"eo_hoodie_red","eo_hoodie_grey","eo_hoodie_blue","eo_hoodie_bandit","eo_hoodie_kabeiroi","eo_retro_red","eo_retro_grey","eo_retro_blue","eo_retro_bandit","eo_retro_kabeiroi","eo_shirt_bandit","eo_shirt_kabeiroi","eo_shirt_stripe","eo_shirt_check","eo_shirt_plainblu","eo_shirt_plainblk","eo_shirt_checkbrn","eo_shirt_checkblk"}
#endif

class OT_missionCustomization_base {
	startCameraPos[] = {250, 250, 5};
	startCameraTarget[] = {500,500,1};
	
	OT_nation = "PLACEHOLDER LAND";
	OT_saveName = "Overthrow.default";

	OT_tutorial_backstoryText = "PLACEHOLDER";
	OT_startDate = [1984,1,01,8,00];

	OT_faction_NATO = "BLU_F";
	OT_spawnFaction = "rhsgref_faction_nationalist";

	OT_flag_NATO = "Flag_NATO_F";
	OT_flag_NATO_txt = "a3\data_f\flags\flag_nato_co.paa";
	OT_flag_CRIM = "Flag_Syndikat_F";
	OT_flag_Crim_txt = "\A3\Data_F_Enoch\Flags\flag_looters_co.paa";
	OT_flag_IND = "Flag_Altis_F";
	OT_flag_IND_txt = "\A3\Data_F\Flags\flag_Altis_CO.paa";
	OT_flagImage = "\A3\ui_f\data\map\markers\flags\Altis_ca.paa";
	OT_flagMarker = "flag_Altis";

	OT_populationMultiplier = 1;
	
	class OT_clothing {
		class OT_clothes_expats {
			shared[] = {"U_I_C_Soldier_Bandit_5_F","U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_redwhite","U_C_Poloshirt_salmon","U_C_Poloshirt_stripped","U_C_Man_casual_6_F","U_C_Man_casual_4_F","U_C_Man_casual_5_F"};
		};
		class OT_clothes_tourists {
			shared[] = {"U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_redwhite","U_C_Poloshirt_stripped","U_C_E_LooterJacket_01_F","U_I_G_Story_Protagonist_F"};
		};
		class OT_clothes_priest {
			shared[] = {"U_C_Man_casual_2_F"};
		};
		class OT_clothes_port {
			shared[] = {"U_Marshal"};
		};
		class OT_clothes_shop {
			shared[] = {"U_C_Man_casual_2_F","U_C_Man_casual_3_F","U_C_Man_casual_1_F","U_C_IDAP_Man_shorts_F","U_C_FormalSuit_01_black_F","U_C_FormalSuit_01_tshirt_gray_F","U_C_Uniform_Scientist_02_formal_F"};
		};
		class OT_clothes_carDealers {
			shared[] = {"U_Marshal", "U_C_Mechanic_01_F"};
		};
		class OT_clothes_harbor {
			shared[] = {"U_C_man_sport_1_F","U_C_man_sport_2_F","U_C_man_sport_3_F"};
		};
		class OT_clothes_guerilla {
			shared[] = {"U_I_C_Soldier_Para_1_F","U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_3_F","U_I_C_Soldier_Para_4_F","U_BG_Guerilla2_1","U_I_L_Uniform_01_tshirt_olive_F","rhsgref_uniform_altis_lizard","rhsgref_uniform_dpm","rhsgref_uniform_flecktarn_full","rhsgref_uniform_og107","rhsgref_uniform_woodland_olive","rhsgref_uniform_TLA_1","rhsgref_uniform_para_ttsko_mountain","rhsgref_uniform_3color_desert","rhsgref_uniform_alpenflage","rhsgref_uniform_reed","rhsgref_uniform_para_ttsko_urban","rhsgref_uniform_gorka_1_f","rhssaf_uniform_m93_oakleaf","rhssaf_uniform_m93_oakleaf_summer"};
		};
		class OT_clothes_locals {
			shared[] = {"U_I_C_Soldier_Bandit_1_F","U_I_C_Soldier_Bandit_2_F","U_I_C_Soldier_Bandit_3_F","U_C_Poor_1","U_C_Poor_2"};
			EOCLOTHESLOCALS;
		};
	};
};