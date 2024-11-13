params ["_unit", "_killer", "_instigator", "_useEffects"];
if (isNIl "OT_killedLootDropMutex") then {
	OT_killedLootDropMutex = false;
};

if !(isServer) exitWith {};

//Gets sides to validate death
if(_killer isKindOf "LandVehicle") then {
	_killer = (effectiveCommander _killer);
};
private _sideUnit = [_unit] call DEDF_fnc_unitSideConfig;
private _sideKiller = [_killer] call DEDF_fnc_unitSideConfig;

if (isNIl "OT_dropHistory") then {
	OT_dropHistory = [];
};

//If death was vaugly player related (INDEP killing all but CIV or INDEP)
if ((_sideKiller isEqualTo 2) && !((_sideUnit isEqualTo 2) || (_sideUnit isEqualTo 3))) then {
	
	private _code = {
		OT_killedLootDropMutex = true;
		
		params ["_unit"];
		
		if (isNil "OT_maxLootDrops") then {
			OT_maxLootDrops = 2;
		};
	
		if (isNil "OT_dropChance") then {
			OT_dropChance = 33;
		};
		
		if (isNil "OT_dropHistory") then {
			OT_dropHistory = [];
		};
		
		private _dropTable = ["MapItem", 1]; //Fallback
		switch (true) do {
			case ([typeOf _unit] call OT_fnc_isPolice) : {
				_dropTable = OT_DeadBodyLootPool_Police;
			};
			default {
				_dropTable = OT_DeadBodyLootPool_Main;
			};
		};
		private _count = OT_maxLootDrops;
		private _maxTries = 5; //Max tries to create drop if adding it goes wrong
		
		while {_count > 0 && _maxTries > 0} do {
			if ((random 100) >= OT_dropChance) then {
				private _drop = selectRandomWeighted _dropTable;
				
				switch (true) do {
					case((typeName _drop) isEqualTo "ARRAY") : {
						//Assume Magazine
						_drop params ["_mag", "_ammo"];
						if (!([_unit, [_mag, _ammo]] call DEDF_fnc_unitAddMagazineAmmoCargo)) then {
							_maxTries = _maxTries - 1;
							continue
						};
					};
					case([_drop] call DEDF_fnc_isWeapon) : {
						if (!([_unit, _drop] call OT_fnc_unitAddWeaponCargo)) then {
							_maxTries = _maxTries - 1;
							continue
						};
					};
					
					default {
						if (!([_unit, _drop] call DEDF_fnc_unitAddItemCargo)) then {
							_maxTries = _maxTries - 1;
							continue
						};
					};
				};
				diag_log format["OT_INFO: %1 on %2", _drop, typeOf _unit];
				OT_dropHistory pushback _drop;
			};
		
			_count = _count - 1;
		};
		OT_killedLootDropMutex = false;
	};
	
	/*
		Only allow one corpse to have loot added at a time
		inorder to prevent potential lag spikes if a large
		amount of units are killed at once.
	*/
	[
		{
			!(OT_killedLootDropMutex)
		},
		_code,
		[_unit],
		60,
		{
			//We died so another can live (probably mutex broke somehow, so unlock it)
			OT_killedLootDropMutex = false
		}
	] call CBA_fnc_waitUntilAndExecute;
};