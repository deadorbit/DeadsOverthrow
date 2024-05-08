private _pos = _this select 0;
private _veh = _this select 1;
private _town = _pos call OT_fnc_nearestTown;
private _population = server getVariable [format["population%1",_town],0];

if (_population > 0) then {
	if (_population < 1990) then {
		_population = _population + 10;
		server setVariable [format["population%1",_town],_population];
	};
};