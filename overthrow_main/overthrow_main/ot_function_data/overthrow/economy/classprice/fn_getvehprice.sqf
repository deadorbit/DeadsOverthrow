params [["_cls", ""]];

private _multiply = 80;
if(_cls isKindOf "Air") then {_multiply = 700}; //Planes/Helis have less armor

private _clsCfg = (configFile >> "CfgVehicles" >> _cls);
private _cost = getNumber (_clsCfg >> "armor") * _multiply;
private _steel = round(getNumber (_clsCfg >> "armor") * 0.5);
private _numturrets = count("!((configName _x) select [0,5] == ""Cargo"") && !((count getArray (_x >> ""magazines"")) isEqualTo 0)" configClasses(_clsCfg >> "Turrets"));
private _plastic = 2;
if(_numturrets > 0) then {
	_cost = _cost + (_numturrets * _cost * 10);
	_steel = _steel + 50;
	_plastic = 5 * _numturrets;

	if(_name isKindOf "Air") then {_cost = _cost * 2};
};
if(isNil {cost getVariable _name}) then {
	cost setVariable [_name,[_cost,0,_steel,_plastic],true];
};