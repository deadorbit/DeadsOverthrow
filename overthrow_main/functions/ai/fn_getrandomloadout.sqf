params ["_unit",["_baseloadout",[]],["_params",[]]];

private _index = "";
if(_unit isEqualType "") then {
    _index = _unit;
}else{
    _index = typeof _unit;
};

private _loadouts = spawner getVariable [format["loadouts_%1",_index],[]];
private _loadout = [];
if(count _loadouts > 0) then {
    //return a cached loadout
    _loadout = selectRandom _loadouts;
}else{
    //generate one and cache it
    if((count _baseloadout) isEqualTo 0) then {
        _baseloadout = getUnitLoadout _unit;
    };
	_options = [_baseloadout] + _params;
	if (_unit in OT_NATO_Garrison) then {
    _options = [_baseloadout,OT_NATO_GarrisonWep,OT_NATO_GarrisonWepGL,OT_NATO_GarrisonWepMG,OT_NATO_GarrisonWepSR,true];
	}else{
		if (_unit in OT_NATO_Reinforcements) then {
			_options = [_baseloadout,OT_NATO_ReinforcementsWep,OT_NATO_ReinforcementsWepGL,OT_NATO_ReinforcementsWepMG,OT_NATO_ReinforcementsWepSR,true];
		}else{
			if(OT_NATO_Army findif {_unit in _x} != -1) then {
				_options = [_baseloadout,OT_NATO_ArmyWep,OT_NATO_ArmyWepGL,OT_NATO_ArmyWepMG,OT_NATO_ArmyWepSR,true];
			}else{
				_options = [_baseloadout] + _params;
			};
		};
	};
    _loadout = _options call OT_fnc_randomizeLoadout;
    spawner setVariable [format["loadouts_%1",_index],[_loadout],false];
};
_loadout;
