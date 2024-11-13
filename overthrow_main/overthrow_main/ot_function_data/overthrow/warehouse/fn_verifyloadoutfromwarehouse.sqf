params ["_unit",["_correct",true]];

private _ignore = [];
private _town = (getpos _unit) call OT_fnc_nearestTown;

{
    _x params [["_cls",""], ["_count",0]];
    if !(_cls in _ignore) then {
        private _boxAmount = _cls call OT_fnc_qtyinwarehouse;
        if(_boxAmount < _count) then {
            //take off the difference
            call {
                if(binocular _unit isEqualTo _cls) exitWith {
                    if(_correct) then {_unit removeWeapon _cls};
                    _count = 0;
                    _missing pushback _cls;
                };
                if(primaryWeapon _unit isEqualTo _cls) exitWith {
                    if(_correct) then {
                        _ignore append primaryWeaponItems _unit;
                        _unit removeWeapon _cls;_unit removeWeapon _cls;
                    };
                    _count = 0;
                    _missing pushback _cls;
                };
                if(secondaryWeapon _unit isEqualTo _cls) exitWith {
                    if(_correct) then {
                        _ignore append secondaryWeaponItems _unit;
                        _unit removeWeapon _cls;
                    };
                    _count = 0;
                    _missing pushback _cls;
                };
                if(handgunWeapon _unit isEqualTo _cls) exitWith {
                    if(_correct) then {_unit removeWeapon _cls};
                    _count = 0;
                    _missing pushback _cls;
                };
                _totake = _count - _boxAmount;
                if(_cls isKindOf ["Default",configFile >> "CfgMagazines"]) exitWith {
                    while{_count > _boxAmount} do {
                        _count = _count - 1;
                        if(_correct) then {_unit removeMagazine _cls};
                        _missing pushback _cls;
                    };
                };
                while{_count > _boxAmount} do {
                    _count = _count - 1;
                    if(_correct) then {_unit removeItem _cls};
                    _missing pushback _cls;
                };
            }
        };

        if(_count > 0) then {
			[_cls,_num,_town] call OT_fnc_removefromwarehouse;
        };
    };
}foreach(_unit call OT_fnc_unitStock);

{
    if !(_x isEqualTo "ItemMap") then {
        if !([_x,_num,_town] call OT_fnc_removefromwarehouse) then {
            if(_correct) then {_unit unlinkItem _x};
            _missing pushback _x;
        };
    };
}foreach(assignedItems _unit);

private _backpack = backpack _unit;
if !(_backpack isEqualTo "") then {
    if !([_backpack,_num,_town] call OT_fnc_removefromwarehouse) then {
        _missing pushback _backpack;
        if(_correct) then {
            //Put the items from the backpack back in the warehouse
            {
				[_x,1,_town] remoteexec ["OT_fnc_addToWarehouse",2];
            }foreach(backpackItems _unit);
            removeBackpack _unit;
        };
    };
};

private _vest = vest _unit;
if !(_vest isEqualTo "") then {
    if !([_vest,_num,_town] call OT_fnc_removefromwarehouse) then {
        _missing pushback _vest;
        if(_correct) then {
            //Put the items from the vest back in the warehouse
            {
				[_x,1,_town] remoteexec ["OT_fnc_addToWarehouse",2];
            }foreach(vestItems _unit);
            removeVest _unit;
        };
    };
};

private _helmet = headgear _unit;
if !(_helmet isEqualTo "") then {
    if !([_helmet,_num,_town] call OT_fnc_removefromwarehouse) then {
        _missing pushback _helmet;
        if(_correct) then {removeHeadgear _unit};
    };
};

private _goggles = goggles _unit;
if !(_goggles isEqualTo "") then {
    if !([_goggles,_num,_town] call OT_fnc_removefromwarehouse) then {
        _missing pushback _goggles;
        if(_correct) then {removeGoggles _unit};
    };
};

_missing
