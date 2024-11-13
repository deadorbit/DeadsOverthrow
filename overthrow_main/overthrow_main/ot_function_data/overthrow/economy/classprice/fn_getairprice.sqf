params [["_cls", ""]];
	
private _clsConfig = configFile >> "cfgVehicles" >> _cls;
private _multiply = 3;
private _steel = 0;
private _plastic = 0;
private _cost = 0;

if(_cls isKindOf "Plane") then {_multiply = 6};
private _cost = (getNumber (_clsConfig >> "armor") + getNumber (_clsConfig >> "enginePower")) * _multiply;
_cost = _cost + round(getNumber (_clsConfig >> "maximumLoad") * _multiply);
private _steel = round(getNumber (_clsConfig >> "armor"));
private _numturrets = count("true" configClasses(_clsConfig >> "Turrets"));
private _plastic = 2;
if(_numturrets > 0) then {
	_cost = _cost + (_numturrets * _cost * _multiply);
	_steel = _steel * 3;
	_plastic = 6;
};

[_cost, 0, _steel, _plastic]