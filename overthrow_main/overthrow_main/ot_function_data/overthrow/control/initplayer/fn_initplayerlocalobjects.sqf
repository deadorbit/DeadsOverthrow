params [["_array", ((allMissionObjects "Building") + vehicles)]];

if (isNil "OT_DEBUG_COUNT") then {
	OT_DEBUG_COUNT = 0;
};

if ((count _array) <= 0) exitWith {
	systemChat "All Local Objects initilized";
};

for _i from 1 to 5000 do {
	if ((count _array) <= 0) then {break};
	
	private _element = _array call BIS_fnc_arrayPop;
	
	systemChat str(OT_DEBUG_COUNT);
	OT_DEBUG_COUNT = OT_DEBUG_COUNT + 1;
	
	if !(_element isKindOf "Vehicle") then {
		if(_x call OT_fnc_hasOwner) then {
			_x call OT_fnc_initObjectLocal;
		};
	};
};

[
	{
		params["_array"];
		[_array] call OT_fnc_initLocalObjects;
	},
	[_array],
	0.03
] call CBA_fnc_waitAndExecute;