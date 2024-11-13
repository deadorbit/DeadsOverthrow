params [["_key", ""]];

private _handle = OT_local_PFEH getOrDefault [_key, -1];

if (_key isEqualTo -1) exitWith {
	[format["Tried to remove nonexistant PFEH: %1", _key], "ERROR"] call OT_fnc_debugLog;
};

[_handle] call CBA_fnc_removePerFrameHandler;

OT_local_PFEH set [_key, -1];