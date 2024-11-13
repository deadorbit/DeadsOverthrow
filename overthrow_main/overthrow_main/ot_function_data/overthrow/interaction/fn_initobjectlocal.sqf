if (isNil "OT_item_Map") then {
	OT_item_Map = "Mapboard_tanoa_F";
};
if (isNil "OT_item_Storage") then {
	OT_item_Storage = "B_CargoNet_01_ammo_F";
};
if (isNil "OT_item_Desk") then {
	OT_item_Desk = "OfficeTable_01_new_F";
};
if (isNil "OT_item_Radio") then {
	OT_item_Radio = "Land_PortableLongRangeRadio_F";
};
if (isNil "OT_item_Tent") then {
	OT_item_Tent = "Land_TentDome_F";
};
if (isNil "OT_item_Safe") then {
	OT_item_Safe = "Land_MetalCase_01_small_F";
};
if (isNil "OT_item_Workbench") then {
	OT_item_Workbench = "Land_Workbench_01_F";
};

private _done = _this getVariable["initlocal",false];

if(!_done) then {
	if((typeof _this) isEqualTo OT_item_Safe) then {
		_this lockInventory true;
	};

	if(typeof _this isEqualTo "Land_Cargo_House_V4_F") then {
		[_this] call ace_repair_fnc_moduleAssignRepairFacility;
	};

	if(_this isKindOf "Man" || _this isKindOf "FlagCarrier" || _this isKindOf "LandVehicle") exitWith {};

	if(_this call OT_fnc_getOwner == getPlayerUID player) then {
		[_this, 0, ["ACE_MainActions"], OT_ACEremoveAction] call ace_interact_menu_fnc_addActionToObject;
		[_this, 0, ["ACE_MainActions","OT_Remove"], OT_ACEremoveActionConfirm] call ace_interact_menu_fnc_addActionToObject;
	};

	if(_this isKindOf "Building" || _this isKindOf "LandVehicle") exitWith{};

	_dir = 0;
	if(typeof _this isEqualTo "C_Rubberboat") then {
		_dir = 90;
	};
	[_this, true, [0, 2, 0.4],_dir] call ace_dragging_fnc_setCarryable;
};
_this setVariable["initlocal",true,false];