/*
params ["_target", "_ammobox", "_unit", "_startLoadout", "_TestVar"];
private _params = [_target, _ammobox, _unit, _startLoadout];

private _handle = 
[
	"ace_arsenal_displayOpened",
	{
		_thisArgs params ["_target", "_ammobox", "_unit", "_startLoadout"];
		
		[_thisType, _thisId] call CBA_fnc_removeEventHandler;
	},
	_params
] call CBA_fnc_addEventHandlerArgs;

_handle
*/
-1