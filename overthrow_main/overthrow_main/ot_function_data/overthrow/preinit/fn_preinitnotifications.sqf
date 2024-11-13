if (isNil "bigboss" && !OT_debugMode) then {
	private _txt = "Overthrow mod is loaded but not playing an OT mission. This 'mod' is not designed to be ran outside an OT mission!";
	[
		_txt,
		2,
		3,
		[1,1,1,1],
		true
	] spawn BIS_fnc_WLSmoothText; // no sounds, letters appear in a smooth transition
};

if (fileExists "z\lambs\addons\main\config.bin" && !(isNil "bigboss")) then {
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

OT_notifies = [];
OT_notifyHistory = [];

[] call OT_fnc_notificationLoop;