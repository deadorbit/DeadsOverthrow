class CfgPatches {
	class ot_production_resources {
		addonRootClass = "overthrow_main";
		
		name = "ot_production_resources";
		requiredAddons[]= {
			"cba_xeh",
			"ace_main"
		};
		requiredVersion = 0.01;
        version = 0.01;
		units[] = {};
		weapons[] = {"OT_GanjaItem","OT_BlowItem"};
	};
};

class CfgWeapons {
	class ItemCore;
	class OT_ItemCore: ItemCore {
        type = 4096;//4;
        detectRange = -1;
        simulation = "ItemMineDetector";
		descriptionUse = "";
    };
	class InventoryItem_Base_F;
    class OT_Ganja: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ot_object_data\ot_production_resources\ui\ganja_x_ca.paa";
        displayName = "Ganja";
        descriptionShort = "1/2 oz. of the finest bud around.";
        class ItemInfo: InventoryItem_Base_F {
            mass = 2;
        };
    };
	class OT_Blow: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ot_object_data\ot_production_resources\ui\blow_x_ca.paa";
        displayName = "Blow";
        descriptionShort = "A white powder that turns madmen into world leaders, or world leaders into madmen.";
        class ItemInfo: InventoryItem_Base_F {
            mass = 2;
        };
    };
	class OT_Wood: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ot_object_data\ot_production_resources\ui\wood_x_ca.paa";
        displayName = "Wood";
        descriptionShort = "A porous and fibrous structural tissue found in the stems and roots of trees and other woody plants.";
        class ItemInfo: InventoryItem_Base_F {
            mass = 125;
        };
    };
	class OT_Lumber: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ot_object_data\ot_production_resources\ui\wood_x_ca.paa";
        displayName = "Lumber";
        descriptionShort = "Lumber or timber is a type of wood that has been processed into beams and planks, a stage in the process of wood production.";
        class ItemInfo: InventoryItem_Base_F {
            mass = 50;
        };
    };
	class OT_Steel: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ot_object_data\ot_production_resources\ui\steel_x_ca.paa";
        displayName = "Steel";
        descriptionShort = "An alloy of iron and other elements, primarily carbon, that is widely used in construction and other applications because of its high tensile strength and low cost.";
        class ItemInfo: InventoryItem_Base_F {
            mass = 200;
        };
    };
	class OT_Plastic: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ot_object_data\ot_production_resources\ui\plastic_x_ca.paa";
        displayName = "Plastic";
        descriptionShort = "A material consisting of a wide range of synthetic or semi-synthetic organic compounds that are malleable and can be molded into solid objects.";
        class ItemInfo: InventoryItem_Base_F {
            mass = 75;
        };
    };
	class OT_Sugarcane: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ot_object_data\ot_production_resources\ui\cane_x_ca.paa";
        displayName = "Sugarcane";
        descriptionShort = "A perennial grass of the genus Saccharum used to produce Sugar.";
        class ItemInfo: InventoryItem_Base_F {
            mass = 25;
        };
    };
	class OT_Sugar: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ot_object_data\ot_production_resources\ui\sugar_x_ca.paa";
        displayName = "Sugar";
        descriptionShort = "The generalized name for sweet, short-chain, soluble carbohydrates, many of which are used in food.";
        class ItemInfo: InventoryItem_Base_F {
            mass = 15;
        };
    };
	class OT_Grapes: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ot_object_data\ot_production_resources\ui\cane_x_ca.paa";
        displayName = "Grapes";
        descriptionShort = "A fruit, botanically a berry, of the deciduous woody vines of the flowering plant genus Vitis. Can be turned into Wine.";
        class ItemInfo: InventoryItem_Base_F {
            mass = 13;
        };
    };
	class OT_Wine: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ot_object_data\ot_production_resources\ui\cane_x_ca.paa";
        displayName = "Wine";
        descriptionShort = "An alcoholic beverage made from grapes, generally Vitis vinifera, fermented without the addition of sugars, acids, enzymes, water, or other nutrients.";
        class ItemInfo: InventoryItem_Base_F {
            mass = 25;
        };
    };
	class OT_Olives: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ot_object_data\ot_production_resources\ui\cane_x_ca.paa";
        displayName = "Olives";
        descriptionShort = "A species of small tree in the family Oleaceae, found in the Mediterranean Basin from Portugal to the Levant, the Arabian Peninsula, and southern Asia as far east as China, as well as the Canary Islands, Mauritius, and Altis.";
        class ItemInfo: InventoryItem_Base_F {
            mass = 13;
        };
    };
	class OT_Fertilizer: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ot_object_data\ot_production_resources\ui\fertilizer_x_ca.paa";
        displayName = "Fertilizer";
        descriptionShort = "A chemical, most commenly nitrogen, of natural or synthetic origin that is applied to soils or to plant tissues (usually leaves) to supply one or more plant nutrients essential to the growth of plants.";
        class ItemInfo: InventoryItem_Base_F {
            mass = 20;
        };
    };
	class OT_ammo50cal: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ot_object_data\ot_production_resources\ui\ammo50cal_x_ca.paa";
        displayName = "100 x 50 Cal BMG";
        descriptionShort = "100 Rounds of .50 Calibre 660 grain FMJ xM33 ammunition for use in Static weapons.";
        class ItemInfo: InventoryItem_Base_F {
            mass = 25;
        };
    };
	class OT_NatoData: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ot_object_data\ot_production_resources\ui\natodata_x_ca.paa";
		model = "a3\props_f_enoch\military\equipment\laptop_03_f.p3d";
        displayName = "NATO Laptop";
        descriptionShort = "A laptop that contains sensitive technical data about a NATO vehicle, reverse-engineer it to access the blueprint it protects.";
        class ItemInfo: InventoryItem_Base_F {
            mass = 50;
        };
    };
	class OT_Ore: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ot_object_data\ot_production_resources\ui\Ore_x_ca.paa";
        displayName = "Iron Ore";
        descriptionShort = "A basic rocky compound consiting mostly of iron, if it were to be mixed with the right materials it could be turnded into steel";
        class ItemInfo: InventoryItem_Base_F {
            mass = 30;
        };
    };
	class OT_BE: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ot_object_data\ot_production_resources\ui\basicequipment_x_ca.paa";
        displayName = "Basic Equipment";
        descriptionShort = "A collection of various tools used during hard labor. These are required to run most basic businesses.";
        class ItemInfo: InventoryItem_Base_F {
            mass = 15;
        };
    };
	class OT_NVC: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ot_object_data\ot_production_resources\ui\nvc_x_ca.paa";
        displayName = "Non-Volatile Chemicals";
        descriptionShort = "Various chemcials ranging from household cleaners to industrial solvants. Consumed in the production of many materials.";
        class ItemInfo: InventoryItem_Base_F {
            mass = 15;
        };
    };
	class OT_MP: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ot_object_data\ot_production_resources\ui\mp_x_ca.paa";
        displayName = "Machine Parts";
        descriptionShort = "Incredibly durable parts for various complex and precise mechanical operations. They are a necessity for crafting many valuable export products.";
        class ItemInfo: InventoryItem_Base_F {
            mass = 40;
        };
    };
	class OT_Furniture: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ot_object_data\ot_production_resources\ui\furniture_x_ca.paa";
        displayName = "Furniture";
        descriptionShort = "Finely crafted wooden furniture sets that go for quite a profit when sold.";
        class ItemInfo: InventoryItem_Base_F {
            mass = 75;
        };
    };
	class OT_CE: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ot_object_data\ot_production_resources\ui\ce_x_ca.paa";
        displayName = "Consumer Electronics";
        descriptionShort = "Generic knockoffs of name brand electronics that can be sold for a large sum of cash.";
        class ItemInfo: InventoryItem_Base_F {
            mass = 30;
        };
    };
	class OT_AGM: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ot_object_data\ot_production_resources\ui\agc_x_ca.paa";
        displayName = "Artillary Guidance Module";
        descriptionShort = "A highly sophisticated electronic capable of single-handedly calculating the many factors needed to predict a projectile's trajectory. Warranty void on use.";
        class ItemInfo: InventoryItem_Base_F {
            mass = 3;
        };
    };
	class OT_AircraftPart: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ot_object_data\ot_production_resources\ui\aircraftpart_x_ca.paa";
        displayName = "Aircraft Parts";
        descriptionShort = "Components necessary in the construction of complex aeronautical machinery.";
        class ItemInfo: InventoryItem_Base_F {
            mass = 75;
        };
    };
	class OT_NatoParts: OT_ItemCore {
        scope = 2;
        picture = "\overthrow_main\ot_object_data\ot_production_resources\ui\natoparts_x_ca.paa";
        displayName = "Nato Vehicle Parts";
        descriptionShort = "Proprietary parts needed to manufacture NATO vehicles.";
        class ItemInfo: InventoryItem_Base_F {
            mass = 50;
        };
    };
};