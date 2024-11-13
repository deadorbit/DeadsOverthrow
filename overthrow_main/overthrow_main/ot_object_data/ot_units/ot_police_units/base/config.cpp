class CfgPatches {
	class ot_police_units_base {
		addonRootClass = "overthrow_main";
		
		name = "ot_police_units_base";
		requiredAddons[]= {
			"cba_xeh",
			"ace_main",
			"a3_characters_f",
			"rhssaf_c_troops",
			"ot_weapons",
			"ot_vehicles"
		};
		requiredVersion = 0.01;
        version = 0.01;
		units[] = {"OT_AltisPoliceCaptainNoMods", "OT_AltisPoliceCommanderNoMods", "OT_AltisPoliceManNoMods", "OT_AltisPoliceManLightNoMods", "OT_AltisPoliceManHeavyNoMods", "OT_AltisPoliceATHeavyNoMods"};
		weapons[] = {};
	};
};

class CfgVehicles {
	//Police (Captain)
	class B_Soldier_unarmed_F;
	class OT_AltisPoliceCaptain_Base: B_Soldier_unarmed_F {
		scope = 0;
		displayName = "Military Police Captain";
		role = "Rifleman";
		icon = "iconManLeader";
		ot_isPolice = 1;
		faction = "ot_units_faction";
		vehicleClass = "ot_units_police";
		
		Weapons[] = {"SMG_02_F","rhsusf_weap_glock17g4","Binocular","Throw","Put"};
		Magazines[] = {"30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","rhsusf_mag_17Rnd_9x19_JHP","rhsusf_mag_17Rnd_9x19_JHP","SmokeShellBlue", "Chemlight_blue", "Chemlight_blue"};
		items[] = {"FirstAidKit"};
		
		linkedItems[] = {};
		respawnLinkedItems[] = {};
		respawnWeapons[] = {};
		respawnMagazines[] = {};
	};
	class OT_AltisPoliceCaptainNoMods : OT_AltisPoliceCaptain_Base {
		scope = 2;
		uniformClass = "rhssaf_uniform_m10_digital_desert";
		linkedItems[] = {"V_TacVest_blk_POLICE", "H_MilCap_blue", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"};
	};
	
	//Police (Commander)
	class OT_AltisPoliceCommander_Base : OT_AltisPoliceCaptain_Base {
		displayName = "Military Police Commander";
		Magazines[] = {"30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","rhsusf_mag_17Rnd_9x19_JHP","rhsusf_mag_17Rnd_9x19_JHP", "SmokeShellBlue", "SmokeShellBlue", "Chemlight_blue", "Chemlight_blue", "rhs_mag_an_m14_th3", "rhs_mag_an_m14_th3"};
	};	
	class OT_AltisPoliceCommanderNoMods : OT_AltisPoliceCommander_Base {
		scope = 2;
		uniformClass = "rhssaf_uniform_m10_digital_desert";
		
		linkedItems[] = {"rhssaf_vest_md12_digital_desert", "rhssaf_beret_blue_un", "ItemGPS", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"};
	};
	
	//Policemen
	class OT_AltisPoliceMan_Base : OT_AltisPoliceCommander_Base {
		displayName = "Military Police";
		uniformClass = "rhssaf_uniform_m10_digital_desert";
		icon = "iconMan";
		
		Weapons[] = {"SMG_05_F", "Throw", "Put"};
		Magazines[] = {"30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02", "30Rnd_9x21_Mag_SMG_02", "Chemlight_blue"};
	};
	class OT_AltisPoliceManNoMods : OT_AltisPoliceMan_Base {
		scope = 2;
		uniformClass = "rhssaf_uniform_m10_digital_desert";
		linkedItems[] = {"V_TacVest_blk_POLICE","rhssaf_helmet_m97_nostrap_blue_tan_ess_bare", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"};
	};
	
	//Policeman (Light)
	class OT_AltisPoliceManLight_Base : OT_AltisPoliceMan_Base {
		displayName = "Military Police (Light)";
	
		Weapons[] = {"rhsusf_weap_m9", "Throw", "Put"};
		Magazines[] = {"rhsusf_mag_15Rnd_9x19_JHP", "rhsusf_mag_15Rnd_9x19_JHP", "rhsusf_mag_15Rnd_9x19_JHP", "rhsusf_mag_15Rnd_9x19_JHP", "rhsusf_mag_15Rnd_9x19_JHP", "rhsusf_mag_15Rnd_9x19_JHP", "rhsusf_mag_15Rnd_9x19_JHP", "rhsusf_mag_15Rnd_9x19_JHP", "Chemlight_blue"};
	};
	class OT_AltisPoliceManLightNoMods : OT_AltisPoliceManLight_Base {
		scope = 2;
		uniformClass = "rhssaf_uniform_m10_digital_desert";
		linkedItems[] = {"rhs_belt_holster", "H_Cap_police", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"};
	};
	
	//Policeman (Heavy)
	class OT_AltisPoliceManHeavy_Base : OT_AltisPoliceMan_Base {
		displayName = "Military Police (Heavy)";
		uniformClass = "rhssaf_uniform_m10_digital_desert";
		
		ot_backpackcargo = "[['rhs_charge_tnt_x2_mag',2,1]]"; //SimpleArray format
		Weapons[] = {"SMG_02_F","rhsusf_weap_glock17g4","Throw","Put"};
		Magazines[] = {"30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","rhsusf_mag_17Rnd_9x19_JHP","rhsusf_mag_17Rnd_9x19_JHP"};
	};
	class OT_AltisPoliceManHeavyNoMods : OT_AltisPoliceManHeavy_Base {
		scope = 2;
		uniformClass = "rhssaf_uniform_m10_digital_desert";
		
		backpack = "B_LegStrapBag_coyote_F";
		linkedItems[] = {"V_EOD_blue_F", "rhsusf_hgu56p_visor_mask_saf", "ACE_NVG_Gen1_Brown", "ItemGps", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"};
		
		class EventHandlers {
			
		};
	};
	
	//Police Medic
	class OT_AltisPoliceMedic_Base : OT_AltisPoliceMan_Base {
		displayName = "Military Police Medic";
		uniformClass = "U_B_GEN_Soldier_F";
		icon = "iconManMedic";
		picture = "pictureHeal";
		nameSound = "veh_infantry_medic_s";
		textSingular = "medic";
		textPlural = "medics";
		attendant = 1;
		ot_isPoliceMedic = 1;
		role = "CombatLifeSaver";
		
		class SpeechVariants {
			class Default {
				speechSingular[] = {"veh_infantry_medic_s"};
				speechPlural[] = {"veh_infantry_medic_p"};
			};
		};
		
		ot_backpackCargo = "[['FirstAidKit', 5], ['Medikit', 1]]";
		Weapons[] = {"rhsusf_weap_m9","Throw","Put"};
		Magazines[] = {"rhsusf_mag_15Rnd_9x19_JHP", "rhsusf_mag_15Rnd_9x19_JHP", "rhsusf_mag_15Rnd_9x19_JHP", "rhsusf_mag_15Rnd_9x19_JHP", "rhsusf_mag_15Rnd_9x19_JHP", "rhsusf_mag_15Rnd_9x19_JHP", "rhsusf_mag_15Rnd_9x19_JHP", "rhsusf_mag_15Rnd_9x19_JHP", "SmokeShellBlue", "SmokeShellBlue", "Chemlight_blue"};
	};
	class OT_AltisPoliceMedicNoMods : OT_AltisPoliceMedic_Base {
		scope = 2;
		backpack = "B_AssaultPack_cbr";
		uniformClass = "rhssaf_uniform_m10_digital_desert";
		linkedItems[] = {"rhssaf_helmet_m97_nostrap_blue", "V_Plain_crystal_F", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"};
	};
	
	//Police AT
	class OT_AltisPoliceAT_Base : OT_AltisPoliceCommander_Base {
		displayName = "Military Police AT";
		uniformClass = "U_B_GEN_Soldier_F";
		icon = "iconManAT";
		nameSound = "veh_infantry_AT_s";
		textSingular = "AT soldier";
		textPlural = "AT soldiers";
		role = "MissileSpecialist";
		threat[] = {0.8, 0.8, 0.3};
		
		Weapons[] = {"SMG_05_F", "rhs_weap_m72a7", "Throw", "Put"};
		Magazines[] = {"rhs_m72a7_mag", "30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","Chemlight_blue"};
		
		class SpeechVariants {
			class Default {
				speechSingular[] = {"veh_infantry_AT_s"};
				speechPlural[] = {"veh_infantry_AT_p"};
			};
		};
	};
	class OT_AltisPoliceATNoMods : OT_AltisPoliceAT_Base {
		scope = 2;
		uniformClass = "rhssaf_uniform_m10_digital_desert";
		linkedItems[] = {"H_EarProtectors_sand_F", "V_TacVest_blk_POLICE", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"};
	};
	
	//Police AT (Heavy)
	class OT_AltisPoliceATHeavy_Base : OT_AltisPoliceAT_Base {
		displayName = "Military Police AT (Heavy)";
		
		ot_backpackCargo = "[['rhs_mag_maaws_HEDP',2,1],['rhs_mag_maaws_HEAT',1,1]]"; //SimpleArray format
		Weapons[] = {"SMG_05_F", "rhs_weap_maaws", "Throw", "Put"};
		Magazines[] = {"30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02", "Chemlight_blue"};
	};
	class OT_AltisPoliceATHeavyNoMods : OT_AltisPoliceATHeavy_Base {
		scope = 2;
		uniformClass = "rhssaf_uniform_m10_digital_desert";
		
		backpack = "B_Carryall_cbr";
		linkedItems[] = {"rhsusf_hgu56p_visor_saf", "V_EOD_blue_F", "ACE_NVG_Gen1_Brown", "ItemGps", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"};
	};
};

class Extended_init_EventHandlers {
	class OT_AltisPoliceManHeavy_Base {
		init = "_this call OT_fnc_initHeavyUnit";
	};
};