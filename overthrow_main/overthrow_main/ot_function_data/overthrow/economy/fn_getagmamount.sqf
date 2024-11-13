params ["_cls"];

private _returnVal = 0;
private _hasart = getnumber(configFile >> "CfgVehicles" >> _cls >> "artilleryScanner");
if(_hasart == 1) then {
	_returnVal = 2;
	if(_cls iskindof "StaticMortar") then {_returnVal = 1};
	if(_cls iskindof "OTR21_Base") then {_returnVal = 3};
};

_returnVal