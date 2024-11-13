params ["_container", "_unit", "_lpfHandle"];
private _params = [_container, _unit, _lpfHandle];

private _handle = 
[
	"ace_arsenal_displayClosed", 
	{
		_thisArgs params ["_container","_unit", "_lpfHandle"];
		private _invHandle = -1;
		private _cachedLoadout = getUnitLoadout _unit;
		
		systemChat "Validating Inventory...";
		[format["%1 started validating inventory from %2 at %3",_unit, _container, (getpos _container)]] call OT_fnc_debugLog;
		
		private _cachedLoadout = getUnitLoadout _unit;
		[_unit] call DEDF_fnc_clearUnitLoadout;
		[_unit] call DEDF_fnc_lockUnitInventory;
		
		//Wait to make sure no one else is currently validating at the same ammo box (can cause race condition)
		[
			{
				_this params ["_container", "_unit", "_cachedLoadout"];
				([_container] call OT_fnc_canDump || !(alive _unit))
			},
			{
				_this params ["_container", "_unit", "_cachedLoadout"];
				
				systemChat "ran";
				if (alive _unit) then {
					private _dumpData = [_unit, true, serverTime];
					_container setVariable ["OT_dumpingData", _dumpData, true];
					
					_unit setUnitLoadout _cachedLoadout;
					[_container, _unit] call DEDF_fnc_validateInvFromBox;
				}else{
					systemChat "Validation Failed";
				};
				
				[_unit, -1] call DEDF_fnc_unlockUnitInventory;
			},
			[_container, _unit, _cachedLoadout],
			15,
			{
				_this params ["_container", "_unit", "_cachedLoadout"];
				
				systemChat "Validation Failed";
				_unit lockInventory false;
				_unit removeEventHandler ["InventoryOpened", _invHandle];
			}
		] call CBA_fnc_waitUntilAndExecute;
		
		["ace_arsenal_leftPanelFilled", _lpfHandle] call CBA_fnc_removeEventHandler;
		[_thisType, _thisId] call CBA_fnc_removeEventHandler;
	},
	_params
] call CBA_fnc_addEventHandlerArgs;

_handle