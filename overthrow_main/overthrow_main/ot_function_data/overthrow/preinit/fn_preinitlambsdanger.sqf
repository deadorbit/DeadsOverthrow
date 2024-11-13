if (isNil "bigboss") exitWith {}; //They arn't playing overthrow? 
if (isClass (configFile >> "CfgPatches" >> "lambs_main")) exitWith {
	if (isServer || player isEqualTo bigboss || (count ([] call CBA_fnc_players) == 1)) then {
		[
			format ["<t size='1' color='#ff0000'>Lambs Workshop ver. detected! This mod already has Lambs built in. Please deactivate the steam version to prevent issues.</t>"],
			0,
			0.2,
			30,
			0,
			0,
			2
		] spawn BIS_fnc_dynamicText;
		["OT_ERROR: Lambs danger workshop is enabled, this will break the AI! Please disable it and then reload the mission.", "ERROR"] call OT_fnc_debugLog;
	};
};