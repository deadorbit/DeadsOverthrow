#include "\overthrow_main\ot_object_data\macros\cfgvehiclemacros.hpp"

class Man;
class CAManBase: Man {
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
	class ACE_SelfActions {
		class ACE_Equipment {
			class OT_DisplayWeapon {
				displayName = "Display Item";
				class OT_DisplayWeapon {
					displayName = "Display Weapon";
					condition = "(alive player) && (vehicle player isEqualTo player) && !(currentWeapon player isEqualTo '' && (isNil 'OT_DISPLAYINGWEAPON'))";
					statement = "['Weapon'] spawn OT_fnc_displayItem";
				};
				class OT_DisplayHelmet {
					displayName = "Display Helmet";
					condition = "(alive player) && (vehicle player isEqualTo player) && !(headGear player isEqualTo '')";
					statement = "['Helmet'] spawn OT_fnc_displayItem";
				};
				class OT_DisplayVest {
					displayName = "Display Vest";
					condition = "(alive player) && (vehicle player isEqualTo player) && !(vest player isEqualTo '')";
					statement = "['Vest'] spawn OT_fnc_displayItem";
				};
			};
		};
	};
};

//Cargonet interactions
class Slingload_base_F;
class CargoNet_01_base_F : Slingload_base_F {
	class ACE_Actions {
		class ACE_MainActions {
			displayName = "Interactions";
			distance = 6;
			class OT_openArsenal {
				displayName = "Open Arsenal";
				//progressbaryes!!!!
				condition = "(([_target, _player, []] call ace_common_fnc_canInteractWith) && !(lockedInventory _target) && !(lockedInventory _player))";
				statement = "[_target,_player] call OT_fnc_openArsenal;";
			};
			class OT_openArsenalWarehouse {
				displayName = "Open Arsenal (Warehouse)";
				condition = "([_target, _player, []] call ace_common_fnc_canInteractWith && ([player] call OT_fnc_positionIsAtWarehouse))";
				statement = "['WAREHOUSE',_player,_target] call OT_fnc_openArsenal;";
			};
			class OT_cargo {
				condition = "true";
				displayName = "OT Cargo";
				icon = "";
				statement = "";
				class OT_dumpStuff {
					displayName = "Dump Everything";
					condition = "(([_target, _player, []] call ace_common_fnc_canInteractWith) && !(lockedInventory _target) && !(lockedInventory _player))";
					statement = "[_player, _target] remoteexec ['OT_fnc_dumpStuff',_player,false];";
				};
				class OT_dumpStuffWarehoue {
					displayName = "Dump Everything (Warehouse)";
					condition = "([_target, _player, []] call ace_common_fnc_canInteractWith && ([player] call OT_fnc_positionIsAtWarehouse))";
					statement = "[_player] remoteexec ['OT_fnc_dumpIntoWarehouse', _player, false];";
				};
				class OT_lockCargo {
					displayName = "Lock Ammobox";
					condition = "([_target, _player, []] call ace_common_fnc_canInteractWith && _target call OT_fnc_playerIsOwner && !(_target getVariable ['OT_locked',false]))";
					statement = "_target setVariable ['OT_locked',true,true]; 'Ammobox Locked!' remoteexec ['OT_fnc_notifyMinor',_player,false];";
				};
				class OT_unlockCargo {
					displayName = "Unlock Ammobox";
					condition = "([_target, _player, []] call ace_common_fnc_canInteractWith && _target call OT_fnc_playerIsOwner && _target getVariable ['OT_locked',false])";
					statement = "_target setVariable ['OT_locked',false,true]; 'Ammobox Unlocked' remoteexec ['OT_fnc_notifyMinor',_player,false];";
				};
				class OT_takeStuffWarehouse {
					displayName = "Take From Warehouse";
					condition = "([_target, _player, []] call ace_common_fnc_canInteractWith && ([player] call OT_fnc_positionIsAtWarehouse))";
					statement = "OT_warehouseTarget = _target; closeDialog 0; createDialog 'OT_dialog_warehouse'; [] call OT_fnc_warehouseDialog;";
				};
			};
		};
	};
};

//Safe interactions
class Items_base_F;
class PlasticCase_01_base_F : Items_base_F {
	class ACE_Actions {
		class OT_safe {
			displayName = "OT Money";
			class OT_storeMoney {
				displayName = "Store Money";
				condition = "([_target, _player, []] call ace_common_fnc_canInteractWith)";
				statement = "[_target] remoteexec ['OT_fnc_safePutMoney',_player,false];";
			};
			class OT_takeMoney {
				displayName = "Take Money";
				condition = "([_target, _player, []] call ace_common_fnc_canInteractWith)";
				statement = "[_target] remoteexec ['OT_fnc_safeTakeMoney',_player,false];";
			};
			class OT_setPassword {
				displayName = "Set Password";
				condition = "([_target, _player, []] call ace_common_fnc_canInteractWith)";
				statement = "[_target] remoteexec ['OT_fnc_safeSetPassword',_player,false];";
			};
		};
	};
};

class Land_Cargo10_grey_F;
class OT_Land_Cargo10_grey_F : Land_Cargo10_grey_F {
	class ACE_Actions {
		class ACE_MainActions {
			displayName = "Interactions";
			class OT_container {
				condition = "true";
				displayName = "OT Containers";
				icon = "";
				statement = "";
				class OT_openContainer {
					displayName = "Accese Inventory";
					condition = "([_target, _player, []] call ace_common_fnc_canInteractWith)";
					statement = "[_player,['gear',_target]] remoteexec ['action',_player,false];";
				};
				class OT_lockContainer {
					displayName = "Lock Container";
					condition = "([_target, _player, []] call ace_common_fnc_canInteractWith && _target call OT_fnc_playerIsOwner && !(_target getVariable ['OT_locked',false]))";
					statement = "_target setVariable ['OT_locked',true,true]; 'Container Locked!' remoteexec ['OT_fnc_notifyMinor',_player,false];";
				};
				class OT_unlockContainer {
					displayName = "Unlock Container";
					condition = "([_target, _player, []] call ace_common_fnc_canInteractWith && _target call OT_fnc_playerIsOwner && _target getVariable ['OT_locked',false])";
					statement = "_target setVariable ['OT_locked',true,true]; 'Container Unlocked!' remoteexec ['OT_fnc_notifyMinor',_player,false];";
				};
			};
		};
	};
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
	OT_ADDVEHICLEACTIONS;
};
class Tank : LandVehicle {
	OT_ADDVEHICLEACTIONS;
};
class Motorcycle : LandVehicle {
	OT_ADDVEHICLEACTIONS;
};

class Air;
class Helicopter : Air {
	OT_ADDVEHICLEACTIONS;
};
class Plane : Air {
	OT_ADDVEHICLEACTIONS;
};

class Ship;
class Ship_F : Ship {
	OT_ADDVEHICLEACTIONS;
};

class House_Small_F;
class House_F;
class Land_CarService_F: House_F {
    ot_isCarDealer = 1;
    ot_template = '[]';
};