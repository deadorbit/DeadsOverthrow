class CfgPatches {
	class ot_kamazrecoverer {
		addonRootClass = "overthrow_main";
		
		name = "ot_kamazrecoverer";
		requiredAddons[]= {
			"cba_xeh",
			"ace_main",
			"rhs_main",
			"rhsusf_main",
			"rhsgref_main",
			"rhssaf_main",
			"A3_Soft_F_Gamma_Truck_02",
			"ot_weapons"
		};
		requiredVersion = 0.01;
        version = 0.01;
		units[] = {"OT_C_Truck_recovery"};
		weapons[] = {};
	};
};

class CfgVehicles {
	class Truck_02_base_F;
	class Truck_02_Ammo_base_F : Truck_02_base_F {
			class TextureSources{
			class EAF;
			class Green;
			class GreenHex;
			class Indep;
			class Opfor;
			class Sand;
			class SFIA;
			class OT_Guer : Indep {
				author = "deadorbit";
				displayName = "Overthrow Guerilla";
				textures[] = {"\overthrow_main\ot_object_data\ot_vehicles\ot_kamazrecoverer\data\ot_zamakguercamo_cab_co.paa","\overthrow_main\ot_object_data\ot_vehicles\ot_kamazrecoverer\data\ot_zamakguercamo_repair_co.paa","\A3\Soft_F_Beta\Truck_02\Data\Truck_02_int_CO.paa","\A3\Soft_F_Beta\Truck_02\Data\Truck_02_chassis_INDP_CO.paa"};
			};
		}; 
	};
	class I_Truck_02_ammo_F : Truck_02_Ammo_base_F {};
	
	class OT_C_Truck_recovery : I_Truck_02_ammo_F {
		scope = 2;
		author = "ARMAzac";
		displayName = "KamAZ Recoverer";
		side = 3;
		faction = "CIV_F";
		maximumLoad = 10000;
		ace_cargo_space = 0;
		hiddenSelectionsTextures[] = {"\overthrow_main\ot_object_data\ot_vehicles\ot_kamazrecoverer\data\ot_zamakguercamo_cab_co.paa","\overthrow_main\ot_object_data\ot_vehicles\ot_kamazrecoverer\data\ot_zamakguercamo_repair_co.paa","\A3\Soft_F_Beta\Truck_02\Data\Truck_02_int_CO.paa","\A3\Soft_F_Beta\Truck_02\Data\Truck_02_chassis_INDP_CO.paa"};
		class Library {
			libTextDesc = "The Field Assistance and Recovery Truck (FART [Patent Pending]) is a specialized heavy truck used for field repairs and gear recovery after a battle. It can recover all items and bodies within a 150m radius into it's cargohold. Note: NATO does consider this a hostile vehicle when driven. Warrenty void if struck by an ATGM.";
		};
	};
};