/*
	Note: Custom crafting classes:
		"HandGrenade" = any throwable grenade item
		"Uniform_Base" = any uniform item
		"SmokeShell" = any chemlight
*/

class OT_crafting_recipes {
	class OT_recipe_base {
		item = ""; //item class name
		amount = 0;
		image = ""; //Custom image, leave blank to use base class image
		catagory = ""; //Can be "item","medical","weapon","explosive"
		cost = "[]"; //What it takes to craft in simpleArray format, ex: "[[""className1"",amount],[""className2"",amount]]..."
		time = 0; //Unused, might be used for playing an animation
	};
	class rhs_mine_stockmine43_2m_mag : OT_recipe_base { //for simplicity, craft recipies should be named item class
		item = "rhs_mine_stockmine43_2m_mag";
		amount = 1;
		catagory = "explosive";
		cost = "[[""HandGrenade"", 1], [""ACE_packingBandage"", 1]]";
	};
	class rhsusf_m112x4_mag : OT_recipe_base { //for simplicity, craft recipies should be named item class
		item = "rhsusf_m112x4_mag";
		amount = 1;
		catagory = "explosive";
		cost = "[[""DemoCharge_Remote_Mag"", 4], [""ACE_packingBandage"", 1]]";
	};
};

/*
OT_craftableItems pushBack ["rhs_ec400_mag",[["OT_NVC",1],["OT_Fertilizer",1],["Uniform_Base",1]],5];
OT_craftableItems pushBack ["rhs_charge_tnt_x2_mag",[["rhs_ec400_mag",3],["ACE_packingBandage",1]],1];
OT_craftableItems pushBack ["rhs_charge_M2tet_x2_mag",[["rhs_ec400_mag",7],["Uniform_Base",1]],1];
OT_craftableItems pushBack ["ACE_Fortify",[["ToolKit",1],["OT_Wood",1]],1];
OT_craftableItems pushBack ["ACE_Tripod",[["ToolKit",1],["OT_Steel",1]],1];
OT_craftableItems pushBack ["ACE_Clacker",[["ToolKit",1]],1];
OT_craftableItems pushBack ["ACE_DefusalKit",[["ToolKit",1]],1];
OT_craftableItems pushBack ["ACE_packingBandage",[["ACE_fieldDressing",5]],1];
OT_craftableItems pushBack ["rhs_acc_1p78",[["Binocular",2],["ToolKit",1],["SmokeShell",4]],1];
OT_craftableItems pushBack ["muzzle_snds_L",[["Uniform_Base",1],["ACE_packingBandage",3],["toolkit",1]],1];
OT_craftableItems pushBack ["muzzle_snds_acp",[["Uniform_Base",1],["ACE_packingBandage",5],["toolkit",1]],1];
OT_craftableItems pushBack ["rhsgref_8Rnd_762x63_M2B_M1rifle",[["OT_nvc",1],["Uniform_Base",1],["SmokeShell",1]],10];
OT_craftableItems pushBack ["rhs_weap_m38",[["OT_wood",3],["OT_ore",1],["ToolKit",1]],1];
OT_craftableItems pushBack ["rhsgref_5Rnd_762x54_m38",[["OT_nvc",1],["Uniform_Base",1],["SmokeShell",1]],20];
OT_craftableItems pushBack ["rhs_weap_m1garand_sa43",[["OT_wood",2],["OT_ore",2],["ToolKit",1]],1];
OT_craftableItems pushBack ["rhsgref_8Rnd_762x63_M2B_M1rifle",[["OT_nvc",1],["Uniform_Base",1],["SmokeShell",1]],10];

if (OT_has_WS) then {
	OT_craftableItems pushBack ["arifle_Galat_worn_lxWS",[["OT_wood",2],["OT_ore",2],["ToolKit",1]],1];
	OT_craftableItems pushBack ["30Rnd_762x39_Mag_worn_lxWS",[["OT_nvc",1],["Uniform_Base",1],["SmokeShell",1]],3];
	OT_craftableItems pushBack ["arifle_SLR_GL_lxWS",[["OT_wood",1],["OT_ore",3],["ToolKit",1]],1];
	OT_craftableItems pushBack ["20Rnd_762x51_slr_lxWS",[["OT_nvc",1],["Uniform_Base",1],["SmokeShell",1]],5];
	OT_craftableItems pushBack ["1Rnd_40mm_HE_lxWS",[["HandGrenade",3],["SmokeShell",1]],2];
	OT_craftableItems pushBack ["1Rnd_50mm_Smoke_lxWS",[["SmokeShell",4]],2];
	OT_craftableItems pushBack ["1Rnd_58mm_AT_lxWS",[["HandGrenade",4],["SmokeShell",1]],1];
	OT_craftableItems pushBack ["B_shield_backpack_lxWS",[["OT_Steel",1],["ToolKit",1]],1];
	OT_craftableItems pushBack ["I_shield_backpack_lxWS",[["OT_Steel",1],["ToolKit",1]],1];
};
if (OT_has_NI) then {
	OT_craftableItems pushBack ["hlc_optic_VOMZ3d",[["Binocular",2],["SmokeShell",4]],1];
	OT_craftableItems pushBack ["HLC_Panel_Under_Ladder_L_Pride",[["SmokeShell",10]],1];
	OT_craftableItems pushBack ["HLC_ISOPOD",[["SmokeShell",25]],1];
};

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

class CfgMagazines {
    class DemoCharge_Remote_Mag;
    class IEDUrbanSmall_Remote_Mag: DemoCharge_Remote_Mag {
        ot_craftable = 1;
        ot_craftQuantity = 1;
        ot_craftRecipe = "[[""HandGrenade"",4],[""ACE_Cellphone"",1]]";
    };
    class IEDLandSmall_Remote_Mag: IEDUrbanSmall_Remote_Mag {
        ot_craftable = 1;
        ot_craftQuantity = 1;
        ot_craftRecipe = "[[""HandGrenade"",4],[""ACE_Cellphone"",1]]";
    };
    class IEDUrbanBig_Remote_Mag: DemoCharge_Remote_Mag {
        ot_craftable = 1;
        ot_craftQuantity = 2;
        ot_craftRecipe = "[[""CA_LauncherMagazine"",2],[""ACE_Cellphone"",2]]";
    };
    class IEDLandBig_Remote_Mag: IEDUrbanBig_Remote_Mag {
        ot_craftable = 1;
        ot_craftQuantity = 2;
        ot_craftRecipe = "[[""OT_Fertilizer"",1],[""OT_NVC"",1],[""ACE_Cellphone"",2]]";
    };
};

*/