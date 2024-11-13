if !(isServer) exitWith {};

call compile preprocessFileLineNumbers "overthrow_main\data\prices.sqf";
{
	cost setVariable[_x select 0,_x select 1, true];
}forEach(OT_priceData);

private _overwritePrices = call compile preprocessFileLineNumbers "overthrow_main\data\prices\surplusprice.sqf";
_overwritePrices = _overwritePrices + (call compile preprocessFileLineNumbers "overthrow_main\data\prices\BASE\productionresources.sqf");
_overwritePrices = _overwritePrices + (call compile preprocessFileLineNumbers "overthrow_main\data\prices\BASE\meta.sqf");
{
	cost setVariable [_x select 0, _x select [1, 4], true];
}foreach(_overwritePrices);