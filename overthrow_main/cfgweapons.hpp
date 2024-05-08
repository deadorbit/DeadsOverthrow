class CfgWeapons {
	class ItemCore;
	class WeaponCore;
	class OT_ItemCore: ItemCore {
        type = 4096;//4;
        detectRange = -1;
        simulation = "ItemMineDetector";
    };
	class InventoryItem_Base_F;
    class OT_Ganja: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\ganja_x_ca.paa";
        displayName = "Ganja";
        descriptionShort = "1/2 oz. of the finest bud around.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 2;
        };
    };
	class OT_Blow: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\blow_x_ca.paa";
        displayName = "Blow";
        descriptionShort = "A white powder that turns madmen into world leaders, or world leaders into madmen.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 2;
        };
    };
	class OT_Wood: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\wood_x_ca.paa";
        displayName = "Wood";
        descriptionShort = "A porous and fibrous structural tissue found in the stems and roots of trees and other woody plants.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 125;
        };
    };
	class OT_Lumber: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\wood_x_ca.paa";
        displayName = "Lumber";
        descriptionShort = "Lumber or timber is a type of wood that has been processed into beams and planks, a stage in the process of wood production.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 50;
        };
    };
	class OT_Steel: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\steel_x_ca.paa";
        displayName = "Steel";
        descriptionShort = "An alloy of iron and other elements, primarily carbon, that is widely used in construction and other applications because of its high tensile strength and low cost.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 200;
        };
    };
	class OT_Plastic: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\plastic_x_ca.paa";
        displayName = "Plastic";
        descriptionShort = "A material consisting of a wide range of synthetic or semi-synthetic organic compounds that are malleable and can be molded into solid objects.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 75;
        };
    };
	class OT_Sugarcane: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\cane_x_ca.paa";
        displayName = "Sugarcane";
        descriptionShort = "A perennial grass of the genus Saccharum used to produce Sugar.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 25;
        };
    };
	class OT_Sugar: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\sugar_x_ca.paa";
        displayName = "Sugar";
        descriptionShort = "The generalized name for sweet, short-chain, soluble carbohydrates, many of which are used in food.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 15;
        };
    };
	class OT_Grapes: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\cane_x_ca.paa";
        displayName = "Grapes";
        descriptionShort = "A fruit, botanically a berry, of the deciduous woody vines of the flowering plant genus Vitis. Can be turned into Wine.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 13;
        };
    };
	class OT_Wine: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\cane_x_ca.paa";
        displayName = "Wine";
        descriptionShort = "An alcoholic beverage made from grapes, generally Vitis vinifera, fermented without the addition of sugars, acids, enzymes, water, or other nutrients.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 25;
        };
    };
	class OT_Olives: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\cane_x_ca.paa";
        displayName = "Olives";
        descriptionShort = "A species of small tree in the family Oleaceae, found in the Mediterranean Basin from Portugal to the Levant, the Arabian Peninsula, and southern Asia as far east as China, as well as the Canary Islands, Mauritius, and Altis.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 13;
        };
    };
	class OT_Fertilizer: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\fertilizer_x_ca.paa";
        displayName = "Fertilizer";
        descriptionShort = "A chemical, most commenly nitrogen, of natural or synthetic origin that is applied to soils or to plant tissues (usually leaves) to supply one or more plant nutrients essential to the growth of plants.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 20;
        };
    };
	class OT_ammo50cal: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\ammo50cal_x_ca.paa";
        displayName = "100 x 50 Cal BMG";
        descriptionShort = "100 Rounds of .50 Calibre 660 grain FMJ xM33 ammunition for use in Static weapons.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 25;
        };
    };
	class OT_NatoData: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\natodata_x_ca.paa";
		model = "a3\props_f_enoch\military\equipment\laptop_03_f.p3d";
        displayName = "NATO Laptop";
        descriptionShort = "A laptop that contains sensitive technical data about a NATO vehicle, reverse-engineer it to access the blueprint it protects.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 50;
        };
    };
	class OT_Ore: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\Ore_x_ca.paa";
        displayName = "Iron Ore";
        descriptionShort = "A basic rocky compound consiting mostly of iron, if it were to be mixed with the right materials it could be turnded into steel";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 30;
        };
    };
	class OT_BE: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\basicequipment_x_ca.paa";
        displayName = "Basic Equipment";
        descriptionShort = "A collection of various tools used during hard labor. These are required to run most basic businesses.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 15;
        };
    };
	class OT_NVC: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\nvc_x_ca.paa";
        displayName = "Non-Volatile Chemicals";
        descriptionShort = "Various chemcials ranging from household cleaners to industrial solvants. Consumed in the production of many materials.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 15;
        };
    };
	class OT_MP: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\mp_x_ca.paa";
        displayName = "Machine Parts";
        descriptionShort = "Incredibly durable parts for various complex and precise mechanical operations. They are a necessity for crafting many valuable export products.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 40;
        };
    };
	class OT_Furniture: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\furniture_x_ca.paa";
        displayName = "Furniture";
        descriptionShort = "Finely crafted wooden furniture sets that go for quite a profit when sold.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 75;
        };
    };
	class OT_CE: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\ce_x_ca.paa";
        displayName = "Consumer Electronics";
        descriptionShort = "Generic knockoffs of name brand electronics that can be sold for a large sum of cash.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 30;
        };
    };
	class OT_AGM: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\agc_x_ca.paa";
        displayName = "Artillary Guidance Module";
        descriptionShort = "A highly sophisticated electronic capable of single-handedly calculating the many factors needed to predict a projectile's trajectory. Warranty void on use.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 3;
        };
    };
	class OT_AircraftPart: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\aircraftpart_x_ca.paa";
        displayName = "Aircraft Parts";
        descriptionShort = "Components necessary in the construction of complex aeronautical machinery.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 75;
        };
    };
	class OT_NatoParts: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ui\items\natoparts_x_ca.paa";
        displayName = "Nato Vehicle Parts";
        descriptionShort = "Proprietary parts needed to manufacture NATO vehicles.";
        descriptionUse = "";
        class ItemInfo: InventoryItem_Base_F {
            mass = 50;
        };
    };
	//Craftable items
	class ACE_ItemCore;
	class ACE_fieldDressing : ACE_ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 5;
		ot_craftRecipe = "[[""Uniform_Base"",1]]";
	};

	class ACE_DeadManSwitch : ACE_ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 5;
		ot_craftRecipe = "[[""ACE_Cellphone"",1]]";
	};

	class ACE_splint : ACE_ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1]]";
	};

	class ACE_tourniquet : ACE_ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Uniform_Base"",1]]";
	};

	class optic_KHS_old : ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""Binocular"",2],[""ToolKit"",1],[""SmokeShell"",4]]";
	};

	class optic_Yorris : ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 1;
		ot_craftRecipe = "[[""SmokeShell"",1],[""Binocular"",1]]";
	};
	//Craftable Rockets
		class rhs_rpg7_OG7V_mag : ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 2;
		ot_craftRecipe = "[[""HandGrenade"",6],[""SmokeShell"",2],[""Uniform_Base"",1]]";
	};
		class rhs_rpg7_PG7V_mag : ItemCore {
		ot_craftable = 1;
		ot_craftQuantity = 2;
		ot_craftRecipe = "[[""HandGrenade"",6],[""SmokeShell"",2],[""Uniform_Base"",1]]";
	};
};
