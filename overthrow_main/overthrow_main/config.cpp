class CfgPatches {
	class overthrow_main {
		author = "deadorbit + gearheart + ARMAZAC";
		name = "overthrow_main";
		url = "https://steamcommunity.com/sharedfiles/filedetails/?id=774201744";
		requiredAddons[]= {
			"cba_ui",
			"cba_xeh",
			"cba_jr",
			"ace_main",
			"ace_medical",
			"rhs_main",
			"rhsusf_main",
			"rhsgref_main",
			"rhssaf_main",
			"overthrow_nr6_hal",
			"overthrow_enhanced_a3_inventory",
			"overthrow_lambs_intergration",
			"ot_object_data",
			"ot_ui_data",
			"ot_function_data",
			"ot_misc_data",
			"deads_F_main"
		};
		requiredVersion=2.16;
        version = "1.0";
		units[] = {};
		weapons[] = {};
	};
};

class CfgItemInteractions{};//See overthrow_enhanced_a3_inventory.pbo for info

class CfgMods {
	class Mod_Base;
	class DOT : Mod_Base {
		picture 		=	"\A3\Data_f\Images\dlc_bundle_ca.paa";
		logo 			= 	"\overthrow_main\ot_ui_data\ui\icons\OT_mod_ico_small_ca.paa";	
		logoOver 		=	"\overthrow_main\ot_ui_data\ui\icons\OT_mod_ico_small_ca.paa";
		logoSmall 		=	"\overthrow_main\ot_ui_data\ui\icons\OT_mod_ico_tiny_ca.paa";
		tooltipOwned 	=	"Dead's Overthrow, By: deadorbit";
		overview 		=	"modifcation of the original Arma 3 OverThrow mod, by deadorbit";
		overviewText 	= 	"Dead's Overthrow";
		author 			= 	"deadorbit";
		hideName		=	1;
		hidePicture		=	0;
		name 			=	"Dead's Overthrow";
		dir				=	"DOT";
		actionName 		= 	"Website";
		action			= 	"https://arma3.com/";
	};
};
