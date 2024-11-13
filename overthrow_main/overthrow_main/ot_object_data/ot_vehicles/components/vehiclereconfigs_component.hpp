#include "\overthrow_main\ot_object_data\macros\cfgvehiclemacros.hpp"

class Item_Base_F;
class ThingX;
class CargoNet_01_ammo_base_F;
class Land_Cargo10_grey_F;
class B_G_HMG_02_high_F;

//Overthrow Vehicles
class O_T_LSV_02_unarmed_F; 
class OT_C_LSV_02_unarmed_F : O_T_LSV_02_unarmed_F {
	scope = 2;
	side = 3;
	faction = "CIV_F";
	author = "deadorbit";
	displayName = "Civil LSV";
	hiddenSelections[] = {"Camo1","Camo2","Camo3"};
	hiddenSelectionsTextures[] = {"\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_arid_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_arid_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_arid_CO.paa"};
	textureList[] = {"Black",1,"GreenHex",0,"Arid",0};
	class Library {
		libTextDesc = "An Asian import vehicle that excels in difficult and harsh terrain. Note: NATO will NOT consider this a hostile vehicle.";
	};
};

class B_LSV_01_unarmed_F; 
class OT_C_LSV_01_unarmed_f : B_LSV_01_unarmed_F {
	scope = 2;
	side = 3;
	faction = "CIV_F";
	author = "deadorbit";
	displayName = "Civil DAGOR";
	hiddenSelections[] = {"Camo_1","Camo_2","Camo_3","Camo_4"};
	hiddenSelectionsTextures[] = {"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_sand_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_sand_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_sand_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_sand_CO.paa"};
	textureList[] = {"Black", 1, "Olive", 0, "Sand", 0};
	class Library {
		libTextDesc = "An American surplus millitary vehicle sold to the public. Note: NATO will NOT consider this a hostile vehicle.";
	};
};

class rhsgref_nat_uaz_open;
class OT_C_uaz_open : rhsgref_nat_uaz_open {
	scope = 2;
	side = 3;
	faction = "CIV_F";
	author = "deadorbit";
	displayName = "Civil UAZ";
	hiddenSelectionsTextures[] = {"\rhsafrf\addons\rhs_a2port_car\uaz\data\uaz_main_civil_co.paa"};
	class Library {
		libTextDesc = "An ancient Soviet patrol car, now sold en-mass to civilians. Note: NATO will NOT consider this a hostile vehicle.";
	};
};

class rhsgref_nat_uaz;
class OT_C_Truck_recovery_mini : rhsgref_nat_uaz {
	scope = 2;
	author = "deadorbit";
	displayName = "Recoverer MINI";
	side = 3;
	faction = "CIV_F";
	maximumLoad = 2000;
	ace_cargo_space = 0;
	class Library {
		libTextDesc = "New from INDEP Labs is the Recoverer MINI. Capable of utalizing the same quantum-space nano-drive technology to automatically loot dead bodies like the truck variant but for only a fraction of the cost. Will automatically harvest corpses in a 25m radius. Note: NATO will consider this a hostile vehicle.";
	};
};

class rhsgref_nat_ural; 
class OT_C_Ural: rhsgref_nat_ural {
	scope = 2;
	side = 3;
	author = "deadorbit";
	displayName = "Pack Ural";
	faction = "CIV_F";
	maximumLoad = 15000;
	ace_cargo_space = 6;
	class Library {
		libTextDesc = "A more capacious version of the civilian ural modified to be able to carry more items than its normal variant, at a cost of ACE cargo capacity.";
	};
};

class OT_Land_Cargo10_grey_F : Land_Cargo10_grey_F {
	maximumLoad = 100000;
	ace_cargo_space = 0;
	ace_cargo_size = 15;
	class TransportItems{};
	class TransportMagazines{};
	class TransportWeapons{};
	class TransportBackpacks{};
	transportMaxMagazines = 128;
	transportMaxBackpacks = 12;
	transportMaxWeapons = 24;
	disableInventory = 0;
};

class OT_B_G_HMG_02_high_F : B_G_HMG_02_high_F {
	crew = "B_Soldier_lite_F";
};

class OT_GanjaItem: Item_Base_F {
    scope = 2;
    scopeCurator = 2;
    displayName = "Ganja";
    author = "ARMAzac";
    vehicleClass = "Items";
    class TransportItems {
		class xx_ot_ganjaitem {
			name = "OT_GanjaItem";
			count = 1;
		};
    };
};

class OT_BlowItem: OT_GanjaItem {
    displayName = "Blow";
    class TransportItems {
		class xx_ot_ganjaitem {
			name = "OT_BlowItem";
			count = 1;
		};
    };
};

class C_IDAP_UAV_01_backpack_F;
class OT_inflatable_backpack : C_IDAP_UAV_01_backpack_F {
	displayName = "Portable Canoe Backpack";
	class assembleInfo {
		assembleTo = "rhsgref_civ_canoe";
		dissasembleTo[] = {};
		base = "";
		displayName = "Civilian Canoe";
		primary = 1;
	};
};