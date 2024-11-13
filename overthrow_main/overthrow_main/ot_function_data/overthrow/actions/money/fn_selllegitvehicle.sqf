private _faction = OT_interactingWith getvariable ["faction",""];
private _side = _faction call OT_fnc_SideFromFaction;
private _legit = server getVariable [format["legit%1",_side],0];
private _NeededScore = floor(_legit);

if (!(isnull targetedLegitVehicle)) then {
	private _displayName = getText (configFile >>  "CfgVehicles" >> (typeof targetedLegitVehicle) >> "displayName");
	private _cost = cost getVariable[(typeof targetedLegitVehicle),[100,0,0,0]];
	private _price = _cost select 0;
	
	closeDialog 0;
	deleteVehicle targetedLegitVehicle;
	
	[_price*4] call OT_fnc_resistanceFunds;
	format ["%1 sold a %2 for %3",(name player),_displayName,[_price*4, 1, 0, true] call CBA_fnc_formatNumber] remoteExec ["OT_fnc_notifyMinor",0,false];
	server setVariable [format["legit%1",_side],_legit+0.1,true];
	server setVariable [format["standing%1",_faction],(server getVariable [format["standing%1",_faction],0]) + 5,true];
};