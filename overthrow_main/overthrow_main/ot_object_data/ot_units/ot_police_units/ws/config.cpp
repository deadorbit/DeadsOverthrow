class CfgPatches {
	class ot_police_units_ws {
		addonRootClass = "overthrow_main";
		
		name = "ot_police_units_ws";
		requiredAddons[]= {
			"cba_xeh",
			"ace_main",
			"a3_characters_f",
			"data_f_lxWS",
			"ot_police_units_base"
		};
		requiredVersion = 0.01;
        version = 0.01;
		units[] = {"OT_AltisPoliceCaptainWS", "OT_AltisPoliceCommanderWS", "OT_AltisPoliceManWS", "OT_AltisPoliceManLightWS", "OT_AltisPoliceManHeavyWS", "OT_AltisPoliceMedicWS", "OT_AltisPoliceATWS", "OT_AltisPoliceATHeavyWS"};
		weapons[] = {};
		
		skipWhenMissingDependencies = 1;
	};
};

class CfgVehicles {
	//Policeman (Captain)
	class OT_AltisPoliceCaptain_Base;
	class OT_AltisPoliceCaptainWS : OT_AltisPoliceCaptain_Base {
		scope = 2;
		uniformClass = "U_lxWS_UN_Camo1";
		linkedItems[] = {"V_TacVest_blk_POLICE", "H_MilCap_blue", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"};
	};

	//Policeman (Commander)
	class OT_AltisPoliceCommander_Base;
	class OT_AltisPoliceCommanderWS : OT_AltisPoliceCommander_Base {
		scope = 2;
		uniformClass = "U_lxWS_UN_Camo1";
		
		linkedItems[] = {"V_lxWS_UN_Vest_Lite_F", "lxWS_H_Beret_Colonel", "ItemGps", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"};
	};
	//Policeman
	class OT_AltisPoliceMan_Base;
	class OT_AltisPoliceManWS : OT_AltisPoliceMan_Base {
		scope = 2;
		uniformClass = "U_lxWS_UN_Camo2";
		linkedItems[] = {"V_lxWS_UN_Vest_Lite_F", "lxWS_H_ssh40_un", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"};
	};

	//Policeman (Light)
	class OT_AltisPoliceManLight_Base;
	class OT_AltisPoliceManLightWS : OT_AltisPoliceManLight_Base {
		scope = 2;
		uniformClass = "U_lxWS_UN_Camo2";
		linkedItems[] = {"rhs_belt_holster", "H_Cap_police", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"};
	};

	//Policeman (Heavy)
	class OT_AltisPoliceManHeavy_Base;
	class OT_AltisPoliceManHeavyWS : OT_AltisPoliceManHeavy_Base {
		scope = 2;
		uniformClass = "U_lxWS_UN_Camo2";
		
		backpack = "B_LegStrapBag_coyote_F";
		linkedItems[] = {"V_lxWS_UN_Vest_F", "H_bmask_snake_lxws", "G_Balaclava_snd_lxWS", "ACE_NVG_Gen1_Brown", "ItemGPS", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"};
	};

	//Police Medic
	class OT_AltisPoliceMedic_Base;
	class OT_AltisPoliceMedicWS : OT_AltisPoliceMedic_Base {
		scope = 2;
		backpack = "B_AssaultPack_desert_lxWS";
		uniformClass = "U_lxWS_UN_Camo3";
		linkedItems[] = {"lxWS_H_PASGT_goggles_UN_F", "V_Plain_crystal_F", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"};
	};
	
	//Police AT
	class OT_AltisPoliceAT_Base;
	class OT_AltisPoliceATWS : OT_AltisPoliceAT_Base {
		scope = 2;
		uniformClass = "U_lxWS_UN_Camo3";
		linkedItems[] = {"H_EarProtectors_sand_F", "V_lxWS_UN_Vest_Lite_F", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"};
	};
	//Police AT (Heavy)
	class OT_AltisPoliceATHeavy_Base;
	class OT_AltisPoliceATHeavyWS : OT_AltisPoliceATHeavy_Base {
		scope = 2;
		uniformClass = "U_lxWS_UN_Camo3";
		
		backpack = "B_Carryall_desert_lxWS";
		linkedItems[] = {"lxWS_H_bmask_white", "V_lxWS_UN_Vest_F", "G_Balaclava_blk_lxWS", "ItemGps", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"};
	};
};