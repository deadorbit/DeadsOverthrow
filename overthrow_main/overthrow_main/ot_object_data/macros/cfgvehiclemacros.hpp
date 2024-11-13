#define OT_ADDVEHICLEACTIONS \
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
	}
	
#define OT_ACELOCKOBJECT(displayNameText)\
	class OT_unlockContainer { \
		displayName = displayNameText; \
		condition = "([_target, _player, []] call ace_common_fnc_canInteractWith && _target call OT_fnc_playerIsOwner && _target getVariable ['OT_locked',false])"; \
		statement = "_target setVariable ['OT_locked',true,true]; 'Container Unlocked!' remoteexec ['OT_fnc_notifyMinor',_player,false];"; \
	}