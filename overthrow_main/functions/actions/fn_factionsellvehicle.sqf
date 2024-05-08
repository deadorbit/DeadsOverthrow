closeDialog 0;

private _target = targetedLegitVehicle;
private _faction = OT_interactingWith getvariable ["faction",""];
private _side = _faction call OT_fnc_SideFromFaction;
private _legit = server getVariable [format["legit%1",_side],0];

private _displayName = getText (configFile >>  "CfgVehicles" >> (typeof _target) >> "displayName");
private _cost = cost getVariable[(typeof _target),[100,0,0,0]];
private _price = _cost select 0;

deletevehicle targetedLegitVehicle;