params ["_target","_unit",["_ammobox",false]];

if(_ammobox isEqualTo false) then {
    _ammobox = _target;
};

private _weapons = [];
private _magazines = [];
private _items = ["ItemMap"];
private _backpacks = [];

private _closed = -1;

private _missing = [];

if(_target isEqualType "") then {
    [_unit,true] call OT_fnc_dumpIntoWarehouse;
    _unit linkItem "ItemMap";

	private _town = _unit call OT_fnc_nearestTown;
	private _townwarehouse = warehouse getvariable [_town,nil];
	if(isnil{_townwarehouse}) then {
		warehouse setvariable [_town,[]];
		_townwarehouse = warehouse getvariable _town;
	};

	private _itemVars = +_townwarehouse;
	{
		_items pushback (_x select 0);
	}foreach(_itemVars);

    _closed = ["ace_arsenal_displayClosed", {
        _thisArgs params ["_unit"];
        _unit call OT_fnc_verifyLoadoutFromWarehouse;

        [_thisType, _thisId] call CBA_fnc_removeEventHandler;
    },[_unit]] call CBA_fnc_addEventHandlerArgs;
}else{
    [_unit,_ammobox,true] call OT_fnc_dumpStuff;
	if !(_ammobox canAdd "RHS_SPG9_Gun_Bag") then {
		systemchat "Warning: This ammo box is (nearly) full, forcing any more items inside via the arsenal may result in their permenant deletion, consider using a differnt box."
	};
    _unit linkItem "ItemMap";
    _weapons = weaponCargo _ammobox;
    _weapons = _weapons arrayIntersect _weapons;
    _magazines = magazineCargo _ammobox;
    _magazines = _magazines arrayIntersect _magazines;
    _items = itemCargo _ammobox;
    _items pushback "ItemMap";
    _items = _items arrayIntersect _items;
    _backpacks = backpackCargo _ammobox;
    _backpacks = _backpacks arrayIntersect _backpacks;

    _closed = ["ace_arsenal_displayClosed", {
        _thisArgs params ["_target","_unit","_ammobox"];
        private _ignore = [];
        _boxstock = _ammobox call OT_fnc_unitStock;
        {
			_x params [["_cls",""], ["_count",0]];
            diag_log _cls;
            if !(_cls in _ignore) then {
                private _boxAmount = 0;
                {
                    if(_x#0 isEqualTo _cls) exitWith {
                        _boxAmount = _x#1;
                    };
                }foreach(_boxstock);

                if(_boxAmount < _count) then {
                    //take off the difference
                    call {
                        if(binocular _unit isEqualTo _cls) exitWith {
                            _unit removeWeapon _cls;
                            _count = 0;
                            _missing pushback _cls;
                        };
                        if(primaryWeapon _unit isEqualTo _cls) exitWith {
                            _ignore append primaryWeaponItems _unit;
                            _unit removeWeapon _cls;
                            _count = 0;
                            _missing pushback _cls;
                        };
                        if(secondaryWeapon _unit isEqualTo _cls) exitWith {
                            _ignore append secondaryWeaponItems _unit;
                            _unit removeWeapon _cls;
                            _count = 0;
                            _missing pushback _cls;
                        };
                        if(handgunWeapon _unit isEqualTo _cls) exitWith {
                            _unit removeWeapon _cls;
                            _count = 0;
                            _missing pushback _cls;
                        };
                        _totake = _count - _boxAmount;
                        if(_cls isKindOf ["Default",configFile >> "CfgMagazines"]) exitWith {
                            while{_count > _boxAmount} do {
                                _count = _count - 1;
                                _unit removeMagazine _cls;
                                _missing pushback _cls;
                            };
    					};
                        while{_count > _boxAmount} do {
                            _count = _count - 1;
                            _unit removeItem _cls;
                            _missing pushback _cls;
                        };
                    }
                };

                if(_count > 0) then {
                    call {
        				if(_cls isKindOf "Bag_Base") exitWith {
        					[_ammobox, _cls, _count] call CBA_fnc_removeBackpackCargo;
        				};
        				if(_cls isKindOf ["Rifle",configFile >> "CfgWeapons"]) exitWith {
        					[_ammobox, _cls, _count] call CBA_fnc_removeWeaponCargo;
        				};
        				if(_cls isKindOf ["Launcher",configFile >> "CfgWeapons"]) exitWith {
        					[_ammobox, _cls, _count] call CBA_fnc_removeWeaponCargo;
        				};
        				if(_cls isKindOf ["Pistol",configFile >> "CfgWeapons"]) exitWith {
        					[_ammobox, _cls, _count] call CBA_fnc_removeWeaponCargo;
        				};
        				if(_cls isKindOf ["Default",configFile >> "CfgMagazines"]) exitWith {
        					[_ammobox, _cls, _count] call CBA_fnc_removeMagazineCargo;
        				};
        				[_ammobox, _cls, _count] call CBA_fnc_removeItemCargo;
        			};
                };
            };
		}foreach(_unit call OT_fnc_unitStock);

        {
            if !(_x isEqualTo "ItemMap") then {
                if !([_ammobox, _x, 1] call CBA_fnc_removeItemCargo) then {
                    _unit unlinkItem _x;
                    _missing pushback _x;
                };
            };
        }foreach(assignedItems _unit);

        private _backpack = backpack _unit;
        if !(_backpack isEqualTo "") then {
            if !(_backpack in backpackCargo _ammobox) then {
                _missing pushback _backpack;
                //Put the items from the backpack back in the ammobox
                {
                    call {
        				if(_x isKindOf "Bag_Base") exitWith {
        					[_ammobox, _x, 1] call CBA_fnc_addBackpackCargo;
        				};
        				if(_x isKindOf ["Rifle",configFile >> "CfgWeapons"]) exitWith {
        					[_ammobox, _x, 1] call CBA_fnc_addWeaponCargo;
        				};
        				if(_x isKindOf ["Launcher",configFile >> "CfgWeapons"]) exitWith {
        					[_ammobox, _x, 1] call CBA_fnc_addWeaponCargo;
        				};
        				if(_x isKindOf ["Pistol",configFile >> "CfgWeapons"]) exitWith {
        					[_ammobox, _x, 1] call CBA_fnc_addWeaponCargo;
        				};
        				if(_x isKindOf ["Default",configFile >> "CfgMagazines"]) exitWith {
        					[_ammobox, _x, 1] call CBA_fnc_addMagazineCargo;
        				};
        				[_ammobox, _x, 1] call CBA_fnc_removeItemCargo;
        			};
                }foreach(backpackItems _unit);
                removeBackpack _unit;
            }else{
                [_ammobox, _backpack, 1] call CBA_fnc_removeBackpackCargo;
            };
        };

        private _vest = vest _unit;
        if !(_vest isEqualTo "") then {
            if !(_vest in itemCargo _ammobox) then {
                _missing pushback _vest;
                //Put the items from the vest back in the ammobox
                {
                    call {
        				if(_x isKindOf "Bag_Base") exitWith {
        					[_ammobox, _x, 1] call CBA_fnc_addBackpackCargo;
        				};
        				if(_x isKindOf ["Rifle",configFile >> "CfgWeapons"]) exitWith {
        					[_ammobox, _x, 1] call CBA_fnc_addWeaponCargo;
        				};
        				if(_x isKindOf ["Launcher",configFile >> "CfgWeapons"]) exitWith {
        					[_ammobox, _x, 1] call CBA_fnc_addWeaponCargo;
        				};
        				if(_x isKindOf ["Pistol",configFile >> "CfgWeapons"]) exitWith {
        					[_ammobox, _x, 1] call CBA_fnc_addWeaponCargo;
        				};
        				if(_x isKindOf ["Default",configFile >> "CfgMagazines"]) exitWith {
        					[_ammobox, _x, 1] call CBA_fnc_addMagazineCargo;
        				};
        				[_ammobox, _x, 1] call CBA_fnc_removeItemCargo;
        			};
                }foreach(vestItems _unit);
                removeVest _unit;
            }else{
                /*To account for CBA bug #1153: https://github.com/CBATeam/CBA_A3/issues/1153
                //Remove when CBA fixes issue
                private _numvests = 0;
                {
                    if(_x isEqualTo _vest) then {
                        _numvests = _numvests + 1;
                    };
                }foreach(itemCargo _ammobox);
                [_ammobox, _vest, 1] call CBA_fnc_removeItemCargo;
                _numvests = _numvests - 1;
                //Put vests back to account for bug
                if(_numvests > 0) then {
                    [_ammobox, _vest, _numvests] call CBA_fnc_addItemCargo;
                };*/
            };
        };

        private _helmet = headgear _unit;
        if !(_helmet isEqualTo "") then {
            if !(_helmet in itemCargo _ammobox) then {
                _missing pushback _helmet;
                removeHeadgear _unit;
            }else{
                [_ammobox, _helmet, 1] call CBA_fnc_removeItemCargo;
            };
        };

        private _goggles = goggles _unit;
        if !(_goggles isEqualTo "") then {
            if !(_goggles in itemCargo _ammobox) then {
                _missing pushback _goggles;
                removeGoggles _unit;
            }else{
                [_ammobox, _goggles, 1] call CBA_fnc_removeItemCargo;
            };
        };

        [_thisType, _thisId] call CBA_fnc_removeEventHandler;
    },[_target,_unit,_ammobox]] call CBA_fnc_addEventHandlerArgs;
};

[_ammobox, true, false] call ace_arsenal_fnc_removeVirtualItems;
[_ammobox,_weapons+_magazines+_items+_backpacks,false] call ace_arsenal_fnc_addVirtualItems;

[_ammobox, _unit] call ace_arsenal_fnc_openBox;
