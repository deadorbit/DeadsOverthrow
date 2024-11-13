params [["_cls", ""]];

private _cfg = (configFile >> "CfgVehicles" >> _cls >> "ot_isPolice");

(_cfg isNotEqualTo configNull)