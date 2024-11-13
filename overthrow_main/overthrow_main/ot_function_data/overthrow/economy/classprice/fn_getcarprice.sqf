params [["_cls", ""]];

private _clsConfig = configFile >> "cfgVehicles" >> _cls;
private _cost = round(getNumber (_clsConfig >> "armor") + (getNumber (_clsConfig >> "enginePower") * 2));
_cost = _cost + round(getNumber (_clsConfig >> "maximumLoad") * 0.1);

if(_cls isKindOf "Truck_F") then {_cost = _cost * 2};
if(getText (_clsConfig >> "faction") != "CIV_F") then {_cost = _cost * 1.5};