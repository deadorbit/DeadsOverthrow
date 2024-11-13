#define _ARMA_

/*
	Mod originally by EPOCH mod team, now free to use/modify/redistrubute under Arma Public License Share Alike (APL-SA)
	As such the contents of this mod are free to be used by anyone under the same license.
	
	Modifications by deadorbit for Overthrow:
		- Restructured mod slightly
		- Fixed broken uniform armor value calculation
		- Made compatiable with ACE armor values
		- Minor display tweaks
		- Completly redid armor value calculations
		- Added CBA options for customizing how armor protection is presented
		- Completly redid UI eventhandlers to better match the standard A3 UI behavior
		- Soft-removed magazine re-pack and medkit script
*/

class CfgPatches {
	class overthrow_enhanced_a3_inventory {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {
			"A3_Ui_F",
			"deads_F_main"
		};
	};
};

class RscProgress;
class RscCustomProgress: RscProgress {
	texture = "";
	textureExt = "";
	colorBar[] = {1,1,1,1};
	colorExtBar[] = {1,1,1,1};
	colorFrame[] = {1,1,1,1};
	x = "0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
	y = "16 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "26 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	colorBackground[] = {1,1,1,0.75};
};
class RscTotalArmorProgress: RscProgress {
	texture = "";
	textureExt = "";
	colorBar[] = {1,1,1,1};
	colorExtBar[] = {1,1,1,1};
	colorFrame[] = {1,1,1,1};
	x = "1.5 * 					(			((safezoneW / safezoneH) min 1.2) / 40) + 		(safezoneX + (safezoneW - 					((safezoneW / safezoneH) min 1.2))/2)";
	y = "22.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + 		(safezoneY + (safezoneH - 					(			((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
	w = "11 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
	h = "1 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
};

class CfgFunctions {
	class overthrow_enhanced_a3_inventory {
		tag = "OT_INV"; //Originally EPOCH
		class GUI {
			file = "overthrow_enhanced_a3_inventory\functions";
			class subMenu {};
			class uiMain {};
			class uiInit {
				postInit = 1;
			};
		};
		class Armor {
			file = "overthrow_enhanced_a3_inventory\functions\armor";
			
			class armorInit {
				preInit = 1;
			};
			class armorUICalc {};
		};
		class ArmorEvents {
			file = "overthrow_enhanced_a3_inventory\functions\armor\events";
			
			class armorlbdrag {};
			class armorlbdrop {};
			class armorImgClick {};
		};
		class Deprecated {
			file = "overthrow_enhanced_a3_inventory\functions\deprecated";
			
			class ammoRepack {};
		};
	};
};

class CfgItemInteractions {
	/*
	class AllAmmoSettings
	{
		interactActions[] = {{"REPACK","call EPOCH_fnc_ammoRepack;"}};
	};
	class FirstAidKit
	{
		interactActions[] = {
			{
				"Check Pulse",
				"_target = player;
					
					if (cursorTarget isKindof 'Man') then {_target = cursorTarget};
					
					if ((damage _target) > 0.1) then {
						hintSilent format['%1 Needs Medical Attention!',name _target];
					} else {
						hintSilent format['%1, Does Not Need Medical Attention.',name _target];
					};",
				"!('ItemWatch' in (assignedItems player))",
				1,
				"hintSilent 'Watch Needed';"
			}
		};
	};
	*/
	/*
	class stripWeapon {
			
	};
	*/
	class ALL {
		interactActions[] = {{"Quick Loot", "systemChat str(uiNamespace getVariable ['OT_INV_interactedItem',[]);"}};
	};
};

class Extended_PreInit_EventHandlers {
    class overthrow_enhanced_a3_inventory_CBASettings {
        init = "call compile preprocessFileLineNumbers '\overthrow_enhanced_a3_inventory\functions\cba\XEH_preInit.sqf'";
    };
};
