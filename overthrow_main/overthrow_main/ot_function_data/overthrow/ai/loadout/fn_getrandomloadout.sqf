params [["_unit", ""], ["_baseloadout", []], ["_params", []], ["_forceNew", false]];

if((typeName _unit) isEqualTo "OBJECT") then {
	_unit = (typeOf _unit);
};

private _loadouts = spawner getVariable [format["loadouts_%1", str(_unit)], []];
private _loadout = [];
private _options = [];
if(_loadouts isNotEqualTo [] && !(_forceNew)) then {
    //return a cached loadout
    _loadout = selectRandom _loadouts;
}else{
    //generate one and cache it
    if(_baseLoadout isEqualTo []) then {
        _baseloadout = getUnitLoadout _unit;
	};
	switch (true) do {
		case (_unit in OT_NATO_AllGarrison) : {
			_options = [_baseloadout, OT_NATO_GarrisonWep, OT_NATO_GarrisonWepGL, OT_NATO_GarrisonWepMG, OT_NATO_GarrisonWepSR, OT_NATO_GarrisonAT, OT_NATO_WepPistol, true];
		};
		case (_unit in OT_NATO_AllArmy) : {
			_options = [_baseloadout, OT_NATO_ArmyWep, OT_NATO_ArmyWepGL, OT_NATO_ArmyWepMG, OT_NATO_ArmyWepSR, OT_NATO_ArmyWepAT, OT_NATO_WepPistol, true];
		};
		case (_unit in OT_NATO_AllReinforcements) : {
			_options = [_baseloadout, OT_NATO_ReinforcementsWep, OT_NATO_ReinforcementsWepGL, OT_NATO_ReinforcementsWepMG, OT_NATO_ReinforcementsWepSR, OT_NATO_ReinforcementsWepAT, OT_NATO_WepPistol, false];
		};
		case ([_unit] call OT_fnc_isPolice) : {
			_options = [_baseloadout, OT_NATO_PoliceWep, OT_NATO_PoliceWepGL, [], [], [], OT_NATO_PoliceWepPistol, false, _unit, true];
		};
		default {
			_options = [_baseloadout] + _params;
		};
	};
	
    _loadout = _options call OT_fnc_randomizeLoadout;
	_loadouts pushBack _loadout;
    spawner setVariable [format["loadouts_%1", str(_unit)], _loadouts, false];
};

_loadout