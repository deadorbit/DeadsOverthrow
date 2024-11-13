closeDialog 0;
private _cash = server getVariable ["money",0];
if(_cash >= 2500) then {
	[-2500] call OT_fnc_resistanceFunds;
	[independent, 100, true] call ace_fortify_fnc_updateBudget;
}else{
	"The resistance can't afford this." call OT_fnc_notifyMinor;
};