params [["_message", ""], ["_type", "INFO"], ["_force", false], ["_timeStamp", ""]];

if (isNil "OT_printDebug") then {
	OT_printDebug = (IsServer);
};

if (isNil "OT_logging") then {
	OT_logging = nil;
};

if (isNil "OT_queuedLogs") then {
	[] call OT_fnc_logLoop;
};

if (_timeStamp isEqualTo "") then {
	private _dateTime = systemTimeUTC;
	_timeStamp = format["%1:%2:%3:%4",_dateTime select 2, _dateTime select 3, _dateTime select 4, _dateTime select 5];
};
OT_queuedLogs pushBack [_message, _type, _force, _timeStamp];

//Also send message to server
if !(isServer) then {
	[_message, _type, _force, _timeStamp] remoteExec ["OT_fnc_debugLog", 2];
};