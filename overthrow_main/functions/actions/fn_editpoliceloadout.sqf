closeDialog 0;

private _soldier = "Police" call OT_fnc_getSoldier;

_soldier params ["","","_loadout","_clothes"];

private _items = [];

private _town = (getpos player) call OT_fnc_nearestTown;
private _townwarehouse = warehouse getvariable [_town,nil];
if(isnil{_townwarehouse}) then {
	warehouse setvariable [_town,[]];
	_townwarehouse = warehouse getvariable _town;
};

private _itemVars = +_townwarehouse;
{
	_items pushback (_x select 0);
}foreach(_itemVars);

if((count _items) isEqualTo 0) exitWith {hint "Cannot edit loadout, no items in warehouse"};

//spawn a virtual dude
private _start = (getpos player) findEmptyPosition [5,40,OT_Unit_Police];
private _civ = (group player) createUnit [OT_Unit_Police, _start, [],0, "NONE"];
_civ disableAI "MOVE";
_civ disableAI "AUTOTARGET";
_civ disableAI "TARGET";
_civ disableAI "WEAPONAIM";
_civ disableAI "FSM";

[_civ, (OT_faces_local call BIS_fnc_selectRandom)] remoteExecCall ["setFace", 0, _civ];

if(_clothes != "") then {
	_civ forceAddUniform _clothes;
}else{
	_clothes = (OT_clothes_guerilla call BIS_fnc_selectRandom);
	_civ forceAddUniform _clothes;
};

_civ setskill ["courage",1];

removeAllWeapons _civ;
removeAllAssignedItems _civ;
removeGoggles _civ;
removeBackpack _civ;
removeHeadgear _civ;
removeVest _civ;

_civ setUnitLoadout [_loadout, false];
_civ setFatigue 0;

if ((_civ getVariable ["cba_projectile_firedEhId", -1]) != -1) then {
    _civ call CBA_fnc_removeUnitTrackProjectiles;
};

[_civ, true, false] call ace_arsenal_fnc_removeVirtualItems;
[_civ,_items,false] call ace_arsenal_fnc_addVirtualItems;
private _abandoned = server getVariable ["NATOabandoned",[]];
{
	_town = _x;
	_townpos = server getvariable _x;
	if (_town in _abandoned) then {
		server setVariable [format["police%1",_town],0,true]
	};
}foreach(OT_allTowns);

["ace_arsenal_displayOpened", {
    _thisArgs params ["_unit"];
    [{
        switch (true) do {
            case (primaryWeapon _this != ""): {
                _this switchMove "amovpercmstpslowwrfldnon";
            };
            case (handgunWeapon _this != ""): {
                _this switchMove "amovpercmstpslowwpstdnon";
            };
            default {
                _this switchMove "amovpercmstpsnonwnondnon";
            };
        };
    }, _unit] call CBA_fnc_execNextFrame;

    [_thisType, _thisId] call CBA_fnc_removeEventHandler;
},[_civ]] call CBA_fnc_addEventHandlerArgs;

["ace_arsenal_displayClosed", {
    _thisArgs params ["_unit"];
    private _loadout = getUnitLoadout _unit;
    OT_Loadout_Police = _loadout;
	publicVariable "OT_Loadout_Police";

    ["Police", _loadout] remoteExec ["ace_arsenal_fnc_addDefaultLoadout",0,false];

    playSound "3DEN_notificationDefault";
    "Saved police loadout" call OT_fnc_notifyMinor;
    deleteVehicle _unit;

    [_thisType, _thisId] call CBA_fnc_removeEventHandler;
},[_civ]] call CBA_fnc_addEventHandlerArgs;

[_civ,_civ] call ace_arsenal_fnc_openBox;
