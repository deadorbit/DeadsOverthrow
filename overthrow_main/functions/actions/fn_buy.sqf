params [["_amnt",1]];

private _idx = lbCurSel 1500;
private _cls = lbData [1500,_idx];
private _search = ctrlText 1700;
private _escape = false;

if(ctrlvisible 2000) then {
	_amnt = parsenumber(ctrltext 2000);
	if(_amnt <= 0) exitwith {
		ctrlsettext [2000,"1"];
		_escape = true;
	};
};

if(_escape) exitwith {};//User gave an invalid number

private _town = (getPos player) call OT_fnc_nearestTown;
private _standing = [_town] call OT_fnc_support;

private _price = (lbValue [1500,_idx] * _amnt);
if(_price isEqualTo -1) exitWith {};

private _chems = server getVariable ["reschems",0];
private _cost = cost getVariable [_cls,[0,0,0,0]];
if(_cls in OT_allExplosives && _chems < (_cost select 3)) exitWith {format["You need %1 chemicals",_cost select 3] call OT_fnc_notifyMinor};



private _money = player getVariable "money";
if(_money < _price) exitWith {"You cannot afford that!" call OT_fnc_notifyMinor};

//If faction dealer, increase standing
private _civ = OT_interactingWith;
if(!isNil "_civ" && _civ getVariable ["factionrep",false] && !((_cls isKindOf "Land") || (_cls isKindOf "Air") || (_cls isKindOf "Ship"))) then {
	_faction = _civ getVariable ["faction",""];
	if !(_faction isEqualTo "") then {
		_increase = floor (_price / 10000);
		if(_increase > 0) then {
			private _factionName = server getvariable format["factionname%1",_faction];
			server setVariable [format["standing%1",_faction],(server getVariable [format["standing%1",_faction],0]) + _increase,true];
			format["+%1 %2",_increase,_factionName] call OT_fnc_notifyMinor;
		};
	};
};

if(_cls == "Set_HMG") exitWith {
	private _pos = (getpos player) findEmptyPosition [5,100,"C_Quadbike_01_F"];
	if (count _pos == 0) exitWith {"Not enough space, please clear an area nearby" call OT_fnc_notifyMinor};

	[-_price] call OT_fnc_money;
	private _veh = "I_G_Quadbike_01_F" createVehicle _pos;
	[_veh,getPlayerUID player] call OT_fnc_setOwner;
	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	_veh addBackpackCargoGlobal ["I_G_HMG_02_weapon_F", 1];
	_veh addBackpackCargoGlobal ["I_G_HMG_02_support_high_F", 1];
	_veh addmagazinecargoglobal ["ace_csw_100Rnd_127x99_mag", 1];

	player reveal _veh;
	format["You bought a Quad Bike w/ HMG for $%1",_price] call OT_fnc_notifyMinor;
	playSound "3DEN_notificationDefault";
};

if(_cls == "Set_SPG") exitWith {
	private _pos = (getpos player) findEmptyPosition [5,100,"C_Quadbike_01_F"];
	if (count _pos == 0) exitWith {"Not enough space, please clear an area nearby" call OT_fnc_notifyMinor};

	[-_price] call OT_fnc_money;
	private _veh = "I_G_Quadbike_01_F" createVehicle _pos;
	[_veh,getPlayerUID player] call OT_fnc_setOwner;
	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	_veh addweaponCargoGlobal ["RHS_SPG9_Gun_Bag", 1];
	_veh addweaponCargoGlobal ["RHS_SPG9_Tripod_Bag", 1];
	_veh addmagazinecargoglobal ["ace_compat_rhs_afrf3_mag_PG9V", 1];

	player reveal _veh;
	format["You bought a Quad Bike w/ SPG for $%1",_price] call OT_fnc_notifyMinor;
	playSound "3DEN_notificationDefault";
};

if(_cls == "EasyMG") exitWith {
	private _pos = (getpos player) findEmptyPosition [5,100,"I_C_Offroad_02_LMG_F"];
	if (count _pos == 0) exitWith {"Not enough space, please clear an area nearby" call OT_fnc_notifyMinor};

	[-_price] call OT_fnc_money;
	private _veh = "I_C_Offroad_02_LMG_F" createVehicle _pos;
	[_veh,getPlayerUID player] call OT_fnc_setOwner;
	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	clearItemCargoGlobal _veh;

	player reveal _veh;
	format["You bought a Jeep w/ LMG for $%1",_price] call OT_fnc_notifyMinor;
	playSound "3DEN_notificationDefault";
};

if(_cls == "IEDDrone") exitWith {
	private _pos = (getpos player) findEmptyPosition [5,100,"I_G_UAV_02_IED_lxWS"];
	if (count _pos == 0) exitWith {"Not enough space, please clear an area nearby" call OT_fnc_notifyMinor};

	[-_price] call OT_fnc_money;
	private _veh = "I_G_UAV_02_IED_lxWS" createVehicle _pos;
	createVehicleCrew _veh;
	_veh setVariable ["OT_spawntrack",true,true];
	[_veh] joinSilent (creategroup independent);
	_veh setVehicleAmmo 0;
	[_veh,getPlayerUID player] call OT_fnc_setOwner;
	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	clearItemCargoGlobal _veh;

	player reveal _veh;
	format["You bought an IED Drone for $%1",_price] call OT_fnc_notifyMinor;
	playSound "3DEN_notificationDefault";
	hint "To use a UAV, scroll your mouse wheel to 'Open UAV Terminal' then right click your green quadcopter on the ground and 'Connect terminal to UAV'";
};

if(_cls == "OT_Land_Cargo10_grey_F") exitWith {
	private _pos = (getpos player) findEmptyPosition [5,100,"OT_Land_Cargo10_grey_F"];
	if (count _pos == 0) exitWith {"Not enough space, please clear an area nearby" call OT_fnc_notifyMinor};

	[-_price] call OT_fnc_money;
	private _veh = "OT_Land_Cargo10_grey_F" createVehicle _pos;
	createVehicleCrew _veh;
	[_veh,getPlayerUID player] call OT_fnc_setOwner;
	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	clearItemCargoGlobal _veh;

	player reveal _veh;
	format["You bought a Container for $%1",_price] call OT_fnc_notifyMinor;
	playSound "3DEN_notificationDefault";
};

if(OT_interactingWith getVariable ["factionrep",false] && ((_cls isKindOf "Land") || (_cls isKindOf "Air") || (_cls isKindOf "Ship"))) exitWith {
	private _blueprints = server getVariable ["GEURblueprints",[]];
	if !(_cls in _blueprints) then {
		_blueprints pushback _cls;
		[-_price] call OT_fnc_money;
		server setVariable ["GEURblueprints",_blueprints,true];
		_factionName = OT_interactingWith getVariable ["factionrepname",""];
		format["%1 has bought %2 blueprint from %3",name player,_cls call OT_fnc_vehicleGetName,_factionName] remoteExec ["OT_fnc_notifyMinor",0,false];
		closeDialog 0;
	};
};

if(_cls isKindOf "Man") exitWith {
	[_cls,getpos player,group player] call OT_fnc_recruitSoldier;
};
if(_cls in OT_allSquads) exitWith {
	[_cls,getpos player] call OT_fnc_recruitSquad;
};
if(_cls == OT_item_UAV) exitWith {
	private _pos = (getpos player) findEmptyPosition [5,100,_cls];
	if (count _pos == 0) exitWith {"Not enough space, please clear an area nearby" call OT_fnc_notifyMinor};

	[-_price] call OT_fnc_money;

	private _veh = createVehicle [_cls, _pos, [], 0,""];
	_veh setVariable ["OT_spawntrack",true,true]; //Tells virtualization to track this vehicle like it's a player.
	private _crew = createVehicleCrew _veh;
	{
		[_x,getPlayerUID player] call OT_fnc_setOwner;
	}foreach(crew _veh);

	[_veh,getPlayerUID player] call OT_fnc_setOwner;

	if("ItemGPS" in (assignedItems player)) then {
		player addItem OT_item_UAVterminal;
	}else{
		if !(OT_item_UAVterminal in (assignedItems player)) then {
			player linkItem OT_item_UAVterminal;
		};
	};

	player connectTerminalToUAV _veh;

	player reveal _veh;
	format["You bought a Quadcopter",_cls call OT_fnc_vehicleGetName] call OT_fnc_notifyMinor;
	playSound "3DEN_notificationDefault";
	hint "To use a UAV, scroll your mouse wheel to 'Open UAV Terminal' then right click your green quadcopter on the ground and 'Connect terminal to UAV'";
};
if(_cls in OT_allVehicles || _cls == "I_G_Quadbike_01_F") exitWith {
	private _pos = (getpos player) findEmptyPosition [5,100,_cls];
	if (count _pos == 0) exitWith {"Not enough space, please clear an area nearby" call OT_fnc_notifyMinor};

	[-_price] call OT_fnc_money;
	private _veh = _cls createVehicle _pos;
	[_veh,getPlayerUID player] call OT_fnc_setOwner;
	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	clearItemCargoGlobal _veh;

	if(_cls == OT_vehType_service) then {
		_veh addItemCargoGlobal ["ToolKit", 1];
		[_veh,3,"ACE_Wheel"] call ace_repair_fnc_addSpareParts;
	};

	player reveal _veh;
	format["You bought a %1 for $%2",_cls call OT_fnc_vehicleGetName,_price] call OT_fnc_notifyMinor;
	playSound "3DEN_notificationDefault";
};
if(_cls isKindOf "Ship") exitWith {
	private _pos = (getpos player) findEmptyPosition [5,100,_cls];
	if (count _pos == 0) exitWith {"Not enough space, please clear an area nearby" call OT_fnc_notifyMinor};

	[-_price] call OT_fnc_money;
	private _veh = _cls createVehicle _pos;
	[_veh,getPlayerUID player] call OT_fnc_setOwner;
	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	clearItemCargoGlobal _veh;

	player reveal _veh;
	format["You bought a %1",_cls call OT_fnc_vehicleGetName] call OT_fnc_notifyMinor;
	playSound "3DEN_notificationDefault";
};
if(_cls in OT_allClothing) exitWith {
	[-_price] call OT_fnc_money;

	if((player getVariable ["OT_shopTarget","Self"]) == "Vehicle") then {
		(vehicle player) addItemCargoGlobal [_cls,1];
	}else{
		if((backpack player != "") && (player canAdd _cls)) then {
			player addItemToBackpack _cls;
			"Clothing added to your backpack" call OT_fnc_notifyMinor;
		}else{
			player forceAddUniform _cls;
		};
	};

	playSound "3DEN_notificationDefault";
};
if(_cls == "V_RebreatherIA") exitWith {
	[-_price] call OT_fnc_money;

	if((backpack player != "") && (player canAdd _cls)) then {
		player addItemToBackpack _cls;
		"Rebreather added to your backpack" call OT_fnc_notifyMinor;
	}else{
		player addVest _cls;
	};
	playSound "3DEN_notificationDefault";
};
if(
	(_cls isKindOf ["Launcher",configFile >> "CfgWeapons"])
	||
	(_cls isKindOf ["Rifle",configFile >> "CfgWeapons"])
	||
	(_cls isKindOf ["Pistol",configFile >> "CfgWeapons"])
) exitWith {
	[-_price] call OT_fnc_money;

	private _box = objNull;
	{
		private _owner = _x call OT_fnc_getOwner;
		if(!isNil "_owner") then {
			if(_owner == getplayerUID player) exitWith {_box = _x};
		};
	}foreach(nearestObjects [getpos player, [OT_item_Storage],1200]);

	// @todo probably add to box if possible
	player addWeaponGlobal _cls;

	playSound "3DEN_notificationDefault";
};
if(_cls isKindOf ["Default",configFile >> "CfgMagazines"]) exitWith {
	if !(player canAdd [_cls,_amnt]) exitwith {
		"There is not enough room in your inventory" call OT_fnc_notifyMinor;
		_handled = false;
	};
	
	if(_cls in OT_allExplosives) then {
		server setVariable ["reschems",_chems - (_cost select 3),true];
	};
	[-_price] call OT_fnc_money;
	player addMagazine _cls;
	playSound "3DEN_notificationDefault";
};
private _handled = true;
private _b = player getVariable ["OT_shopTarget","Self"];
if(_b != "Vehicle") then {
	if(_cls isKindOf "Bag_Base") then {
		if(backpack player != "") then {
			"You already have a backpack" call OT_fnc_notifyMinor;
			_handled = false;
		};
	}else{
		if !(player canAdd [_cls,_amnt]) then {
			"There is not enough room in your inventory" call OT_fnc_notifyMinor;
			_handled = false;
		};
	};
}else{
	_veh = vehicle player;
	if (!(_veh canAdd [_cls,_amnt])) then {
		"This vehicle is full." call OT_fnc_notifyMinor;
		_handled = false;
	};
};

if(_handled) then {
	playSound "3DEN_notificationDefault";
	if (_cls in OT_illegalItems) exitWith {
		[-_price] call OT_fnc_money;
		player addItem _cls;

		if(player call OT_fnc_unitSeenNATO) then {
			[player] remoteExec ["OT_fnc_NATOsearch",2,false];
		};
	};
	if (_cls in OT_allStaticBackpacks) exitWith {
		[-_price] call OT_fnc_money;
		player addBackpack _cls;
	};
	if (_cls in OT_allOptics) exitWith {
		[-_price] call OT_fnc_money;
		player addItem _cls;
	};
	player setVariable ["money",_money-_price,true];

	if(_b == "Vehicle") then {
		if(_cls isKindOf "Bag_Base") then {
			(vehicle player) addBackpackCargoGlobal [_cls,1];
		}else{
			(vehicle player) addItemCargoGlobal [_cls,_amnt];
		};
	}else{
		if(_cls isKindOf "Bag_Base") then {
			player addBackpack _cls;
		}else{
			[_cls,_amnt] call OT_fnc_addItemMultiple;
		};
	};
};

