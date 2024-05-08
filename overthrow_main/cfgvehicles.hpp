#define MACRO_SALVAGEWRECK \
	class ACE_Actions { \
		class ACE_MainActions { \
			class OT_Remove { \
				condition = "!([player] call ace_repair_fnc_isInRepairFacility) && !(_target getvariable ['CanDelete',false]) && (_target call OT_fnc_hasOwner) && ((call OT_fnc_playerIsGeneral) || (_target call OT_fnc_playerIsOwner))"; \
				displayName = "Remove"; \
				statement = ""; \
					class OT_Remove_Confirm { \
						condition = "true"; \
						displayName = "Confirm"; \
						statement = "deleteVehicle _target"; \
					}; \
			}; \
			class OT_Salvage { \
				condition = "((damage _target) > 0.99 && ""ToolKit"" in (items player)) || [player] call ace_repair_fnc_isInRepairFacility"; \
				displayName = "Salvage"; \
				statement = "_target spawn OT_fnc_salvageWreck"; \
			}; \
			class OT_Unflip { \
				condition = "!(canMove _target) && (alive _target) && ((vehicle player) isEqualTo player)"; \
				displayName = "Unflip"; \
				statement = "_target call OT_fnc_unflipVehicle"; \
			}; \
			class OT_claimDrone { \
				condition = "(_target isKindOf 'UAV') && (alive _target) && ((vehicle player) isEqualTo player) && !(side _target isequalto west || side _target isequalto independent)"; \
				displayName = "Claim Drone"; \
				statement = "_target call OT_fnc_ClaimDrone"; \
			}; \
			class OT_paint { \
				condition = "((_target isKindOf 'AllVehicles') && !(_target iskindof 'UAV_01_base_F' || _target iskindof 'UAV_06_base_F') && (alive _target) && ((vehicle player) isEqualTo player) && (_target call OT_fnc_hasOwner) && ((call OT_fnc_playerIsGeneral) || (_target call OT_fnc_playerIsOwner)))"; \
				displayName = "Repaint"; \
				statement = "[_target] call OT_fnc_paintdialog"; \
			}; \
		}; \
	};


class CfgVehicles {
	class Item_Base_F;
	class ThingX;
	class CargoNet_01_ammo_base_F;
	class Land_Cargo10_grey_F;
	class B_G_HMG_02_high_F;

	//Overthrow Vehicles
	class I_Truck_02_ammo_F; 
	class OT_C_Truck_recovery : I_Truck_02_ammo_F {
		scope = 2;
		author = "ARMAzac";
		displayName = "KamAZ Recovery";
		side = 3;
		faction = "CIV_F";
		maximumLoad = 10000;
		ace_cargo_space = 0;
		class Library {
			libTextDesc = "The Field Assistance and Recovery Truck (FART [Patent Pending]) is a specialized heavy truck used for field repairs and gear recovery after a battle. It can recover all items and bodies within a 150m radius into it's cargohold.";
		};
	};
	
	class O_T_LSV_02_unarmed_F; 
	class OT_C_T_LSV : O_T_LSV_02_unarmed_F {
		scope = 2;
		side = 3;
		faction = "CIV_F";
		author = "deadorbit";
		displayName = "Civilian LSV";
		hiddenSelections[] = {"Camo1","Camo2","Camo3"};
		hiddenSelectionsTextures[] = {"\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_arid_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_arid_CO.paa","\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_arid_CO.paa"};
		textureList[] = {"Black",1,"GreenHex",0,"Arid",0};
		class Library {
			libTextDesc = "An Asian import vehicle that excels in difficult and harsh terrain.";
		};
	};
	
	class B_LSV_01_unarmed_F; 
	class OT_C_T_LSV2 : B_LSV_01_unarmed_F {
		scope = 2;
		side = 3;
		faction = "CIV_F";
		author = "deadorbit";
		displayName = "Civilian DAGOR";
		hiddenSelections[] = {"Camo_1","Camo_2","Camo_3","Camo_4"};
		hiddenSelectionsTextures[] = {"\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_01_sand_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_02_sand_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_03_sand_CO.paa","\A3\Soft_F_Exp\LSV_01\Data\NATO_LSV_Adds_sand_CO.paa"};
		textureList[] = {["Black",1,"Olive",0,"Sand",0};
		class Library {
			libTextDesc = "An American surplus millitary vehicle sold to the public.";
		};
	};
	class rhsgref_nat_uaz;
	class OT_C_rhsgref_nat_uaz : rhsgref_nat_uaz {
		scope = 2;
		side = 3;
		faction = "CIV_F";
		author = "deadorbit";
		displayName = "Civilian UAZ";
		class Library {
			libTextDesc = "An ancient Soviet patrol car, now sold en-mass to civilians.";
		};
	};
	class RHS_Ural_Civ_01; 
	class OT_C_Ural: RHS_Ural_Civ_01 {
		scope = 2;
		author = "deadorbit";
		displayName = "Pack Ural";
		side = 3;
		faction = "CIV_F";
		maximumLoad = 15000;
		ace_cargo_space = 6;
		hiddenSelectionsTextures[] = {"rhsafrf\addons\rhs_a2port_car\ural\data\ural_kabina_khk_co.paa","rhsafrf\addons\rhs_a2port_car\ural\data\ural_plachta_co.paa","rhsafrf\addons\RHS_Decals\Data\Labels\Misc\no_ca.paa"};
		editorPreview = "rhsafrf\addons\rhs_editorPreviews\data\rhs_Ural_MSV_01.paa";
		class Library {
			libTextDesc = "A more capacious version of the civilian ural modified to be able to carry more items than its normal variant, at a cost of cargo capacity.";
		};
	};
	//ACE actions----
	//Map
	class Land_MapBoard_F : ThingX {
		class ACE_Actions {
			class ACE_MainActions {
				displayName = "Interactions";
				distance = 6;

				class mapinfo {
					displayName = "Map Info";
	                statement = "[] spawn OT_fnc_mapInfoDialog;";
				};
	      class resetui {
					displayName = "Reset UI";
	        statement = "[] spawn OT_fnc_setupPlayer;";
				};
	      class sleepAction {
					displayName = "Sleep";
	        statement = "createDialog ""OT_sleep_dialog"";";
				};
			};
		};
	};
	//ammobox
	class B_CargoNet_01_ammo_F : CargoNet_01_ammo_base_F {
		class ACE_Actions {
			class ACE_MainActions {
				displayName = "Interactions";
				distance = 6;

				class arsenal {
					displayName = "Open Arsenal (This Ammobox)";
					condition = "!(call OT_fnc_playerIsAtWarehouse)";
	                statement = "[_target,_player] call OT_fnc_openArsenal;";
				};
				class warehouse {
					displayName = "Open Arsenal (Warehouse)";
					condition = "(call OT_fnc_playerIsAtWarehouse)";
	                statement = "['WAREHOUSE',_player,_target] call OT_fnc_openArsenal;";
				};
			};
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
		crew = "B_Soldier_f";
	};
	//END ACE actions----
	class Mapboard_tanoa_F: Land_MapBoard_F {
		displayName = "Map (Tanoa)";
		hiddenSelectionsTextures[] = {"\overthrow_main\ui\maptanoa.paa"};
	};
    class OT_GanjaItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = "Ganja";
        author = "ARMAzac";
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(OT_GanjaItem,1)
        };
    };
	class OT_BlowItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = "Blow";
        author = "ARMAzac";
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(OT_BlowItem,1)
        };
    };

	//ACE Interactions
    class Man;
    class CAManBase: Man {
        fsmDanger = "overthrow_main\fsm\lambs_danger.fsm";
        class ACE_Actions {
            class ACE_MainActions {
                class OT_InteractionActions {
                    condition = "(alive _target) && (!isplayer _target) && !(side _target isEqualTo west)";
                    selection = "pelvis";
                    distance = 4;
                    displayName = "Talk";
                    statement = "_target call OT_fnc_talkToCiv";
                };
            };
		};
       /*class ACE_SelfActions {
            class ACE_Equipment {
                class OT_StartSpliff
                {
                    displayName = "Smoke a spliff";
                    condition = "('OT_Ganja' in (items player)) && (!(_player getVariable ['ot_isSmoking', false]))";
                    statement = "[_player] spawn ot_fnc_startSpliff";
                    showDisabled = 0;
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    icon = "\overthrow_main\ui\icons\light_cig.paa";
                };
                class OT_StopSpliff
                {
                    displayName = "Ditch your spliff!";
                    condition = "(goggles _player) in OT_cigsArray && ((_player getVariable ['ot_isSmoking', false]))";
                    statement = "[_player] spawn ot_fnc_stopSpliff";
                    showDisabled = 0;
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    icon = "\overthrow_main\ui\icons\light_cig.paa";
                };
            };
        };*/
	};

	class Furniture_base_F;
	class Land_Workbench_01_F : Furniture_base_F {
		class ACE_Actions {
			class ACE_MainActions {
				displayName = "Interactions";
				distance = 4;
				class OT_Craft {
					condition = "true";
					displayName = "Craft";
					statement = "call OT_fnc_craftDialog";
				};
			};
		};
	};

	class LandVehicle;
	class Car : LandVehicle {
		MACRO_SALVAGEWRECK
	};
	class Tank : LandVehicle {
		MACRO_SALVAGEWRECK
	};
	class Motorcycle : LandVehicle {
		MACRO_SALVAGEWRECK
	};

	class Air;
	class Helicopter : Air {
		MACRO_SALVAGEWRECK
	};
	class Plane : Air {
		MACRO_SALVAGEWRECK
	};

	class Ship;
	class Ship_F : Ship {
		MACRO_SALVAGEWRECK
	};

	//Houses (Tanoa)
	class House_Small_F;
    class House_F;
	/*
    class Land_Slum_01_F: House_Small_F {
        ot_isPlayerHouse = 1;
        ot_template = '[["Land_MetalCase_01_small_F", [-0.746442,-0.078261,0.594079],0.418328,1,0,[0,0],"","",true,false],["Land_CampingChair_V2_F",[1.22725,1.2502,0.594079],199.447,1,0,[0,0],"","",true,false],["Mapboard_tanoa_F",[-0.340959,1.65805,0.59408],327.71,1,0,[0,0],"","",true,false],["OfficeTable_01_new_F",[1.54124,1.92773,0.59408],0,1,0,[0,0],"","",true,false],["Land_Workbench_01_F",[2.70912,-1.90632,0.594079],180,1,0,[0,0],"","",true,false],["B_CargoNet_01_ammo_F",[4.56925,1.31465,0.59408],0,1,0,[0,0],"","",true,false]]';
    };
    class Land_Slum_02_F: House_Small_F {
        ot_isPlayerHouse = 1;
        ot_template = '[["Land_MetalCase_01_small_F", [-2.58489,-0.659296,0.559122],0.418328,1,0,[0,0],"","",true,false],["Land_Workbench_01_F",[2.247,2.4636,0.559122],90,1,0,[0,-0],"","",true,false],["Land_CampingChair_V2_F",[-1.65537,3.79657,0.559121],199.447,1,0,[0,0],"","",true,false],["B_CargoNet_01_ammo_F",[-1.74631,-3.67237,0.559122],0,1,0,[0,0],"","",true,false],["Mapboard_tanoa_F",[1.75104,-3.70061,0.559122],155.874,1,0,[0,-0],"","",true,false],["OfficeTable_01_new_F",[-1.34138,4.4741,0.559122],0,1,0,[0,0],"","",true,false]]';
    };
	class Land_House_Native_01_F: House_Small_F {
		ot_isPlayerHouse = 1;
        ot_template = '[["Land_CampingChair_V2_F", [2.26438,-2.22928,0.2],17.5159,1,0,[0,0],"","",true,false],["OfficeTable_01_new_F",[1.97339,-2.917,0.2],178.069,1,0,[0,-0],"","",true,false],["Land_Workbench_01_F",[-2.34453,2.75383,0.200001],0,1,0,[0,0],"","",true,false],["B_CargoNet_01_ammo_F",[-3.88622,-2.36955,0.200001],0,1,0,[0,0],"","",true,false],["Mapboard_tanoa_F",[4.03968,2.56928,0.200001],32.4555,1,0,[0,0],"","",true,false],["Land_MetalCase_01_small_F",[4.28656,-2.64937,0.2],212.206,1,0,[0,0],"","",true,false]]';
	};
    class Land_House_Native_02_F: House_Small_F {
        ot_isPlayerHouse = 1;
        ot_template = '[["Land_CampingChair_V2_F", [0.0907892,-1.587,0.103002],17.5159,1,0,[0,0],"","",true,false],["OfficeTable_01_new_F",[-0.200199,-2.27472,0.103003],178.069,1,0,[0,-0],"","",true,false],["Mapboard_tanoa_F",[1.78568,2.06457,0.103003],32.4555,1,0,[0,0],"","",true,false],["Land_MetalCase_01_small_F",[2.12703,-2.08529,0.103003],212.206,1,0,[0,0],"","",true,false],["Land_Workbench_01_F",[-2.40922,2.34683,0.103003],0,1,0,[0,0],"","",true,false],["B_CargoNet_01_ammo_F",[-3.11908,-1.7698,0.103003],0,1,0,[0,0],"","",true,false]]';
    };
	//Houses (Malden)
	class i_House_Small_02_b_base_F : House_Small_f {
		ot_isPlayerHouse = 1;
        ot_template = '[["Land_Workbench_01_F", [-1.36485,0.870917,0],90,1,0,[0,-0],"","",true,false],["Land_MetalCase_01_small_F",[1.28859,-1.0394,0.23],92.8353,1,0,[0,-0],"","",true,false],["OfficeTable_01_new_F",[2.5086,-1.0345,0.23],180.373,1,0,[0,0],"","",true,false],["Land_CampingChair_V2_F",[2.71048,-0.444679,0.23],7.55273,1,0,[0,0],"","",true,false],["B_CargoNet_01_ammo_F",[1.61679,-2.76766,0],0,1,0,[0,0],"","",true,false],["MapBoard_altis_F",[2.48146,2.91809,0.23],41.3345,1,0,[0,0],"","",true,false]]';
	};

	//Houses (CUP)
	class Land_House_C_5_EP1: House_Small_F {
		ot_isPlayerHouse = 1;
        ot_template = '[["Land_MetalCase_01_small_F",[-0.507421,-0.278264,0.377357],0,1,0,[],"","",true,false], ["B_CargoNet_01_ammo_F",[-1.09897,-1.48947,0.377357],0,1,0,[],"","",true,false], ["Land_Workbench_01_F",[-4.09043,2.20817,0.324941],270,1,0,[],"","",true,false], ["Land_MapBoard_F",[-4.07916,-4.87537,0.325],210,1,0,[],"","",true,false] ]';
	};
	//Houses (Livonia)
	class Land_House_1W01_F : House_Small_f {
		ot_isPlayerHouse = 1;
        ot_template = '[["Land_MetalCase_01_small_F",[-0.0391073,-2.38339,-0.00100088],269.766,1,0,[2.80922e-005,-0.000455107],"","",true,false],["Land_CampingChair_V2_F",[-0.95352,2.19191,-0.000998974],205.312,1,0,[0.000419523,0.00036544],"","",true,false],["OfficeTable_01_new_F",[-0.669114,2.76221,-0.000998974],3.3096e-005,1,0,[-6.48772e-005,0.000181224],"","",true,false],["Land_MapBoard_Enoch_F",[2.80548,0.361253,-0.00155544],86.6927,1,0,[-0.294008,-0.0546504],"","",true,false],["B_CargoNet_01_ammo_F",[2.65323,-1.62338,-0.00099659],360,1,0,[-0.000187827,0.000360995],"","",true,false],["Land_Workbench_01_F",[2.20189,2.67528,-0.000597],359.805,1,0,[0.103474,-0.00103475],"","",true,false]]';
	};
	class Land_House_1W10_F : House_Small_f {
		ot_isPlayerHouse = 1;
        ot_template = '[["Land_CampingChair_V2_F",[0.920077,-0.901972,0.034317],24.7907,1,0,[-0.124043,0.271041],"","",true,false],["OfficeTable_01_new_F",[0.640592,-1.47487,0.0357647],179.487,1,0,[-0.00276878,-0.297944],"","",true,false],["Land_MetalCase_01_small_F",[1.14552,1.94735,0.0331335],92.3128,1,0,[-0.297861,-0.0119579],"","",true,false],["Land_Workbench_01_F",[-2.52448,-1.38322,0.0522304],180.992,1,0,[0.0054578,-0.297945],"","",true,false],["B_CargoNet_01_ammo_F",[-3.02816,1.29547,0.0548558],179.482,1,0,[-0.00272333,-0.298135],"","",true,false],["Land_MapBoard_Enoch_F",[3.00379,-1.43205,0.061625],134.089,1,0,[0.654025,0.845397],"","",true,false]]';
	};
	class Land_House_1W02_F : House_Small_f {
		ot_isPlayerHouse = 1;
        ot_template = '[["Land_MetalCase_01_small_F",[-0.538328,0.901626,-0.0010004],174.741,1,0,[-9.37514e-005,9.29899e-005],"","",true,false],["Land_CampingChair_V2_F",[2.85857,-0.415011,-0.000994682],292.015,1,0,[-0.00038614,-0.00123639],"","",true,false],["OfficeTable_01_new_F",[3.44428,-0.666138,-0.000999928],86.7032,1,0,[0.000145824,6.21702e-005],"","",true,false],["Land_MapBoard_Enoch_F",[-1.49216,3.31236,0.0428715],355.179,1,0,[-0.360939,0.0461294],"","",true,false],["B_CargoNet_01_ammo_F",[2.64869,3.16984,-0.0010004],179.483,1,0,[-0.000110829,1.88703e-005],"","",true,false],["Land_Workbench_01_F",[-4.55341,1.23832,-0.00100088],269.89,1,0,[0.00126416,2.55769e-005],"","",true,false]]';
	};
    //Shops (Tanoa)
    class Land_FuelStation_01_shop_F: House_F {
        ot_isShop = 1;
        ot_template = '[["Land_CashDesk_F",[-0.746313,-1.1316,0.277551],0,1,0,[],"","",true,false]]';
    };
    class Land_Shop_City_02_F: House_F {
        ot_isShop = 1;
        ot_template = '[["Land_CashDesk_F",[7.16479,-4.60961,0.0704632],0,1,0,[],"","",true,false]]';
    };
    class Land_Shop_Town_01_F: House_F {
        ot_isShop = 1;
        ot_template = '[["Land_CashDesk_F",[1.26089,-3.41939,0.131084],90,1,0,[],"","",true,false]]';
    };
    class Land_Shop_Town_03_F: House_F {
        ot_isShop = 1;
        ot_template = '[["Land_CashDesk_F",[2.77324,-4.32109,0.141195],0,1,0,[],"","",true,false]]';
    };
    class Land_Supermarket_01_F: House_F {
        ot_isShop = 1;
        ot_template = '[]';
    };
	//Shops (Malden)
	class i_Shop_02_b_base_f : House_F {
		ot_isShop = 1;
        ot_template = '[]';
	};
	class Land_i_Shop_02_V3_F: House_F {
        ot_isShop = 1;
        ot_template = '[]';
    };
	class Land_u_Shop_02_V3_F: Land_i_Shop_02_V3_F {
        ot_isShop = 0;
		ot_template = '[]';
    };

	//Shops (CUP)
	class Land_A_GeneralStore_01: House_F {
        ot_isShop = 1;
        ot_template = '[["Land_CashDesk_F",[-6.93629,2.99194,0],180.686,1,0,[],"","",true,false]]';
    };

    //Car Dealers (Tanoa)
    class Land_FuelStation_01_workshop_F: House_F {
        ot_isCarDealer = 1;
        ot_template = '[["Land_CashDesk_F",[2.87972,-3.57524,0.277551],0,1,0,[],"","",true,false]]';
    };
    class Land_FuelStation_02_workshop_F: House_F {
        ot_isCarDealer = 1;
        ot_template = '[["Land_CashDesk_F",[2.21226,0.566814,0.53],0,1,0,[],"","",true,false]]';
    };
	 class Land_FuelStation_03_shop_F: House_F {
        ot_isCarDealer = 1;
        ot_template = '[]';
    };
	//Car Dealers (Livonia)
	class Land_FuelStation_Build_F: House_F {
        ot_isCarDealer = 1;
        ot_template = '[]';
    };
	*/
	//Car Dealers (Altis)
	class Land_CarService_F: House_F {
        ot_isCarDealer = 1;
        ot_template = '[]';
    };

	//Unlocks uniforms (ace_nouniformrestrictions)
    class Civilian;
    class B_Soldier_diver_base_F;
    class C_man_1;
    class I_G_Soldier_F;
    class I_G_Soldier_lite_F;
    class I_G_Soldier_SL_F;
    class I_G_Soldier_TL_F;
    class I_G_Soldier_AR_F;
    class I_G_medic_F;
    class I_G_engineer_F;
    class I_G_Soldier_exp_F;
    class I_G_Soldier_GL_F;
    class I_G_Soldier_M_F;
    class I_G_Soldier_LAT_F;
    class I_G_Soldier_A_F;
    class I_G_officer_F;
    class I_Soldier_diver_base_F;
    class O_Soldier_diver_base_F;
    class I_G_Sharpshooter_F;
    class B_Soldier_F;
    class I_C_Soldier_Para_2_F;
    class I_G_Soldier_LAT2_F;
    class I_crew_F;
    class O_R_Gorka_F;
    class I_L_Soldier_Base_F;
    class C_Uniform_ParadeUniform_01_base_F;
    class C_Uniform_ParadeUniform_01_belt_base_F;
	class B_GEN_Soldier_F;
	
    class Civilian_F: Civilian {
        modelSides[] = {6};
    };
    class SoldierWB: CAManBase {
        modelSides[] = {6};
    };
    class SoldierEB: CAManBase {
        modelSides[] = {6};
    };
    class SoldierGB: CAManBase {
        modelSides[] = {6};
    };
    class B_Soldier_base_F: SoldierWB {
        modelSides[] = {6};
    };
    class B_Soldier_02_f: B_Soldier_base_F {
        modelSides[] = {6};
    };
    class B_Soldier_03_f: B_Soldier_base_F {
        modelSides[] = {6};
    };
    class B_Soldier_04_f: B_Soldier_base_F {
        modelSides[] = {6};
    };
    class B_Soldier_05_f: B_Soldier_base_F {
        modelSides[] = {6};
    };
    class B_RangeMaster_F: B_Soldier_base_F {
        modelSides[] = {6};
    };
    class B_Helipilot_F: B_Soldier_04_f {
        modelSides[] = {6};
    };
    class B_Pilot_F: B_Soldier_05_f {
        modelSides[] = {6};
    };
    class B_helicrew_F: B_Helipilot_F {
        modelSides[] = {6};
    };
    class B_diver_F: B_Soldier_diver_base_F {
        modelSides[] = {6};
    };
    class B_Story_SF_Captain_F: B_Soldier_02_f {
        modelSides[] = {6};
    };
    class B_Story_Protagonist_F: B_Soldier_02_f {
        modelSides[] = {6};
    };
    class b_soldier_survival_F: B_Soldier_base_F {
        modelSides[] = {6};
    };
    class C_man_1_1_F: C_man_1 {
        modelSides[] = {6};
    };
    class C_man_p_fugitive_F: C_man_1 {
        modelSides[] = {6};
    };
    class C_man_p_beggar_F: C_man_p_fugitive_F {
        modelSides[] = {6};
    };
    class C_man_w_worker_F: C_man_1 {
        modelSides[] = {6};
    };
    class C_scientist_F: C_man_w_worker_F {
        modelSides[] = {6};
    };
    class C_man_hunter_1_F: C_man_1 {
        modelSides[] = {6};
    };
    class C_man_pilot_F: C_man_1 {
        modelSides[] = {6};
    };
    class C_journalist_F: C_man_1 {
        modelSides[] = {6};
    };
    class I_G_Soldier_base_F: SoldierGB {
        modelSides[] = {6};
    };
    class B_G_Soldier_F: I_G_Soldier_F {
        modelSides[] = {6};
    };
    class O_G_Soldier_F: I_G_Soldier_F {
        modelSides[] = {6};
    };
    class B_G_Soldier_lite_F: I_G_Soldier_lite_F {
        modelSides[] = {6};
    };
    class O_G_Soldier_lite_F: I_G_Soldier_lite_F {
        modelSides[] = {6};
    };
    class B_G_Soldier_SL_F: I_G_Soldier_SL_F {
        modelSides[] = {6};
    };
    class O_G_Soldier_SL_F: I_G_Soldier_SL_F {
        modelSides[] = {6};
    };
    class B_G_Soldier_TL_F: I_G_Soldier_TL_F {
        modelSides[] = {6};
    };
    class O_G_Soldier_TL_F: I_G_Soldier_TL_F {
        modelSides[] = {6};
    };
    class B_G_Soldier_AR_F: I_G_Soldier_AR_F {
        modelSides[] = {6};
    };
    class O_G_Soldier_AR_F: I_G_Soldier_AR_F {
        modelSides[] = {6};
    };
    class B_G_medic_F: I_G_medic_F {
        modelSides[] = {6};
    };
    class O_G_medic_F: I_G_medic_F {
        modelSides[] = {6};
    };
    class B_G_engineer_F: I_G_engineer_F {
        modelSides[] = {6};
    };
    class O_G_engineer_F: I_G_engineer_F {
        modelSides[] = {6};
    };
    class B_G_Soldier_exp_F: I_G_Soldier_exp_F {
        modelSides[] = {6};
    };
    class O_G_Soldier_exp_F: I_G_Soldier_exp_F {
        modelSides[] = {6};
    };
    class B_G_Soldier_GL_F: I_G_Soldier_GL_F {
        modelSides[] = {6};
    };
    class O_G_Soldier_GL_F: I_G_Soldier_GL_F {
        modelSides[] = {6};
    };
    class B_G_Soldier_M_F: I_G_Soldier_M_F {
        modelSides[] = {6};
    };
    class O_G_Soldier_M_F: I_G_Soldier_M_F {
        modelSides[] = {6};
    };
    class B_G_Soldier_LAT_F: I_G_Soldier_LAT_F {
        modelSides[] = {6};
    };
    class O_G_Soldier_LAT_F: I_G_Soldier_LAT_F {
        modelSides[] = {6};
    };
    class B_G_Soldier_A_F: I_G_Soldier_A_F {
        modelSides[] = {6};
    };
    class O_G_Soldier_A_F: I_G_Soldier_A_F {
        modelSides[] = {6};
    };
    class B_G_officer_F: I_G_officer_F {
        modelSides[] = {6};
    };
    class O_G_officer_F: I_G_officer_F {
        modelSides[] = {6};
    };
    class I_G_Story_SF_Captain_F: B_G_Soldier_F {
        modelSides[] = {6};
    };
    class I_Soldier_base_F: SoldierGB {
        modelSides[] = {6};
    };
    class I_Soldier_03_F: I_Soldier_base_F {
        modelSides[] = {6};
    };
    class I_Soldier_04_F: I_Soldier_base_F {
        modelSides[] = {6};
    };
    class I_officer_F: I_Soldier_base_F {
        modelSides[] = {6};
    };
    class I_diver_F: I_Soldier_diver_base_F {
        modelSides[] = {6};
    };
    class O_Soldier_base_F: SoldierEB {
        modelSides[] = {6};
    };
    class O_Soldier_02_F: O_Soldier_base_F {
        modelSides[] = {6};
    };
    class O_officer_F: O_Soldier_base_F {
        modelSides[] = {6};
    };
    class O_diver_F: O_Soldier_diver_base_F {
        modelSides[] = {6};
    };
    class C_Driver_1_F: C_man_1 {
        modelSides[] = {6};
    };
    class C_Marshal_F: B_RangeMaster_F {
        modelSides[] = {6};
    };
    class B_Soldier_VR_F: B_Soldier_base_F {
        modelSides[] = {6};
    };
    class O_Soldier_VR_F: O_Soldier_base_F {
        modelSides[] = {6};
    };
    class I_Soldier_VR_F: I_Soldier_base_F {
        modelSides[] = {6};
    };
    class C_Soldier_VR_F: C_man_1 {
        modelSides[] = {6};
    };
    class B_Protagonist_VR_F: B_Soldier_base_F {
        modelSides[] = {6};
    };
    class O_Protagonist_VR_F: O_Soldier_base_F {
        modelSides[] = {6};
    };
    class I_Protagonist_VR_F: I_Soldier_base_F {
        modelSides[] = {6};
    };
    class C_Protagonist_VR_F: C_man_1 {
        modelSides[] = {6};
    };
    class B_G_Sharpshooter_F: I_G_Sharpshooter_F {
        modelSides[] = {6};
    };
    class O_G_Sharpshooter_F: I_G_Sharpshooter_F {
        modelSides[] = {6};
    };
    class B_Captain_Pettka_F: B_Soldier_02_f {
        modelSides[] = {6};
    };
    class B_Captain_Jay_F: B_Soldier_02_f {
        modelSides[] = {6};
    };
    class I_Captain_Hladas_F: I_officer_F {
        modelSides[] = {6};
    };
    class Underwear_F: B_Soldier_F {
        modelSides[] = {6};
    };
    class B_G_Captain_Ivan_F: I_C_Soldier_Para_2_F {
        modelSides[] = {6};
    };
    class C_man_sport_1_F: C_man_1 {
        modelSides[] = {6};
    };
    class C_man_sport_2_F: C_man_1 {
        modelSides[] = {6};
    };
    class C_man_sport_3_F: C_man_1 {
        modelSides[] = {6};
    };
    class C_Man_casual_1_F: C_man_1 {
        modelSides[] = {6};
    };
    class C_IDAP_Man_Base_F: Civilian_F {
        modelSides[] = {6};
    };
    class C_Story_Mechanic_01_F: Civilian_F {
        modelSides[] = {6};
    };
    class O_A_soldier_base_F: O_officer_F {
        modelSides[] = {6};
    };
    class B_G_Soldier_LAT2_F: I_G_Soldier_LAT2_F {
        modelSides[] = {6};
    };
    class O_G_Soldier_LAT2_F: I_G_Soldier_LAT2_F {
        modelSides[] = {6};
    };
    class I_Story_Crew_F: I_crew_F {
        modelSides[] = {6};
    };
    class C_E_Man_Base_F: Civilian_F {
        modelSides[] = {6};
    };
    class C_E_LooterJacket_01_F: C_E_Man_Base_F {
        modelSides[] = {6};
    };
    class O_R_Gorka_black_F: O_R_Gorka_F {
        modelSides[] = {6};
    };
    class B_CBRN_Man_Base_F: B_Soldier_F {
        modelSides[] = {6};
    };
    class I_L_Uniform_01_camo_F: I_G_Soldier_LAT_F {
        modelSides[] = {6};
    };
    class I_L_Uniform_01_deserter_F: I_G_Soldier_F {
        modelSides[] = {6};
    };
    class I_L_Uniform_01_tshirt_skull_F: I_L_Soldier_Base_F {
        modelSides[] = {6};
    };
    class I_L_Uniform_01_tshirt_black_F: I_L_Uniform_01_tshirt_skull_F {
        modelSides[] = {6};
    };
    class I_L_Uniform_01_tshirt_sport_F: I_L_Uniform_01_tshirt_skull_F {
        modelSides[] = {6};
    };
    class I_L_Uniform_01_tshirt_olive_F: I_L_Uniform_01_tshirt_skull_F {
        modelSides[] = {6};
    };
    class B_Uniform_ParadeUniform_01_US_F: C_Uniform_ParadeUniform_01_base_F {
        modelSides[] = {6};
    };
    class B_Uniform_ParadeUniform_01_US_decorated_F: C_Uniform_ParadeUniform_01_base_F {
        modelSides[] = {6};
    };
    class O_Uniform_ParadeUniform_01_CSAT_F: C_Uniform_ParadeUniform_01_belt_base_F {
        modelSides[] = {6};
    };
    class O_Uniform_ParadeUniform_01_CSAT_decorated_F: C_Uniform_ParadeUniform_01_belt_base_F {
        modelSides[] = {6};
    };
    class I_Uniform_ParadeUniform_01_AAF_F: C_Uniform_ParadeUniform_01_belt_base_F {
        modelSides[] = {6};
    };
    class I_Uniform_ParadeUniform_01_AAF_decorated_F: C_Uniform_ParadeUniform_01_belt_base_F {
        modelSides[] = {6};
    };
    class I_E_Uniform_ParadeUniform_01_LDF_F: C_Uniform_ParadeUniform_01_belt_base_F {
        modelSides[] = {6};
    };
    class I_E_Uniform_ParadeUniform_01_LDF_decorated_F: C_Uniform_ParadeUniform_01_belt_base_F {
        modelSides[] = {6};
    };
	class rhs_infantry_msv_base: SoldierGB {
        modelSides[] = {6};
    };
	class rhs_msv_rifleman: rhs_infantry_msv_base {
		modelSides[] = {6};
	};
	class rhsgref_tla_base: SoldierGB {
        modelSides[] = {6};
    };
	class rhsgref_tla_para1: rhsgref_tla_base {
        modelSides[] = {6};
    };
	class rhsgref_tla_para2: rhsgref_tla_base {
        modelSides[] = {6};
    };
	class rhsgref_hidf_base: SoldierWB {
        modelSides[] = {6};
    };
	class rhsgref_hidf_rifleman: rhsgref_hidf_base {
        modelSides[] = {6};
    };
	class Com_Police_N: B_GEN_Soldier_F { //You may use anything you want, just make sure it's unique
        _generalMacro = "B_GEN_Soldier_F"; //Don't change this line!
        scope = 2; //This means whether you'll be able to see the unit in the dropdown menu or not
		side = 1; //0 Means Opfor
        faction = "BLU_F"; //Your Faction
        vehicleclass = "ASTR_Infanrty"; //Unit Group
        displayName = "Millitary Police Sergeant";
        nakedUniform = "U_BasicBody";
        uniformClass = "U_B_GEN_Commander_F";
		genericnames = "AfroMen";	//Right now your soldiers will have African names, you can get rid of this line
		identitytypes[] = {"WhiteHead_18"};	//Right now your soldiers will look African, you can get rid of this line

        //backpack = "eo_Messengerbag_4";	//You can use this line to add a backpack to your unit (delete "//" those first)
        linkedItems[] = {"V_TacVest_blk_POLICE","rhsgref_helmet_pasgt_un","G_Balaclava_lowprofile", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"}; //Helmets, vests and small items go here
        respawnLinkedItems[] = {};
		Weapons[] = {"SMG_02_F","rhsusf_weap_glock17g4","Throw","Put"}; // only add rifle & / pistol classname, leave throw and put they are used for explosives and grenades 
        respawnWeapons[] = {}; 
		items[] = {"FirstAidKit"};
        Magazines[] = {"30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","rhsusf_mag_17Rnd_9x19_JHP","rhsusf_mag_17Rnd_9x19_JHP","SmokeShellBlue"};  //Ammo goes here
        respawnMagazines[] = {};
    };
	
	class Com_Police_N2: B_GEN_Soldier_F { //You may use anything you want, just make sure it's unique
        _generalMacro = "B_GEN_Soldier_F"; //Don't change this line!
        scope = 2; //This means whether you'll be able to see the unit in the dropdown menu or not
		side = 1; //0 Means Opfor
        faction = "BLU_F"; //Your Faction
        vehicleclass = "ASTR_Infanrty"; //Unit Group
        displayName = "Millitary Police";
        nakedUniform = "U_BasicBody";
        uniformClass = "U_B_GEN_Soldier_F";
		genericnames = "AfroMen";	//Right now your soldiers will have African names, you can get rid of this line
		identitytypes[] = {"WhiteHead_02"};	//Right now your soldiers will look African, you can get rid of this line

        //backpack = "eo_Messengerbag_3"; You can use this line to add a backpack to your unit (delete "//" those first)
        linkedItems[] = {"V_TacVest_blk_POLICE","H_Beret_blk","G_Bandanna_aviator", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"}; //Helmets, vests and small items go here
        respawnLinkedItems[] = {};
		Weapons[] = {"SMG_05_F","rhsusf_weap_glock17g4","Throw","Put"}; // only add rifle & / pistol classname, leave throw and put they are used for explosives and grenades 
        respawnWeapons[] = {};
		items[] = {"FirstAidKit"};		
        Magazines[] = {"30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","rhsusf_mag_17Rnd_9x19_JHP","rhsusf_mag_17Rnd_9x19_JHP","Chemlight_blue"};  //Ammo goes here
        respawnMagazines[] = {};
    };
	
	class Com_Police_N3: B_GEN_Soldier_F { //Atlas Police Sergent for with WS DLC
        _generalMacro = "B_GEN_Soldier_F"; //Don't change this line!
        scope = 2; //This means whether you'll be able to see the unit in the dropdown menu or not
		side = 1; //0 Means Opfor
        faction = "BLU_F"; //Your Faction
        vehicleclass = "ASTR_Infanrty"; //Unit Group
        displayName = "Millitary Police Sergeant";
        nakedUniform = "U_BasicBody";
        uniformClass = "U_B_GEN_Commander_F";
		genericnames = "AfroMen";	//Right now your soldiers will have African names, you can get rid of this line
		identitytypes[] = {"WhiteHead_18"};	//Right now your soldiers will look African, you can get rid of this line

        //backpack = "eo_Messengerbag_4";	//You can use this line to add a backpack to your unit (delete "//" those first)
        linkedItems[] = {"lxWS_H_Beret_Colonel","V_TacVest_blk_POLICE","G_Bandanna_shades", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"}; //Helmets, vests and small items go here
        respawnLinkedItems[] = {};
		Weapons[] = {"SMG_02_F","rhsusf_weap_glock17g4","Throw","Put"}; // only add rifle & / pistol classname, leave throw and put they are used for explosives and grenades 
        respawnWeapons[] = {}; 
		items[] = {"FirstAidKit"};
        Magazines[] = {"30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","rhsusf_mag_17Rnd_9x19_JHP","rhsusf_mag_17Rnd_9x19_JHP","SmokeShellBlue"};  //Ammo goes here
        respawnMagazines[] = {};
    };
	
		class Com_Police_N4: B_GEN_Soldier_F { //You may use anything you want, just make sure it's unique
        _generalMacro = "B_GEN_Soldier_F"; //Don't change this line!
        scope = 2; //This means whether you'll be able to see the unit in the dropdown menu or not
		side = 1; //0 Means Opfor
        faction = "BLU_F"; //Your Faction
        vehicleclass = "ASTR_Infanrty"; //Unit Group
        displayName = "Millitary Police";
        nakedUniform = "U_BasicBody";
        uniformClass = "U_B_GEN_Soldier_F";
		genericnames = "AfroMen";	//Right now your soldiers will have African names, you can get rid of this line
		identitytypes[] = {"WhiteHead_02"};	//Right now your soldiers will look African, you can get rid of this line

        //backpack = "eo_Messengerbag_3"; You can use this line to add a backpack to your unit (delete "//" those first)
        linkedItems[] = {"lxWS_H_PASGT_basic_UN_F","V_lxWS_UN_Vest_Lite_F","G_Balaclava_blk_lxWS", "ItemMap", "ItemCompass", "ItemWatch", "ItemRadio"}; //Helmets, vests and small items go here
        respawnLinkedItems[] = {};
		Weapons[] = {"SMG_05_F","rhsusf_weap_glock17g4","Throw","Put"}; // only add rifle & / pistol classname, leave throw and put they are used for explosives and grenades 
        respawnWeapons[] = {};
		items[] = {"FirstAidKit"};		
        Magazines[] = {"30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02","rhsusf_mag_17Rnd_9x19_JHP","rhsusf_mag_17Rnd_9x19_JHP","Chemlight_blue"};  //Ammo goes here
        respawnMagazines[] = {};
    };

};

// experiment EH for lambs danger 
class Extended_Explosion_Eventhandlers {
	class CAManBase {
        class LAMBS_CAManBase_Explosion {
            Explosion = "_this call lambs_danger_fnc_immediateActionEH";
        };
    };
};
