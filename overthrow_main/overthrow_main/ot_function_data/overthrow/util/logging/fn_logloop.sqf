//Script to prevent too many logs from being created at once and possibly hurting FPS/crashing arma
if (isNil "OT_queuedLogs") then {
	OT_queuedLogs = [];
};

private _log = (OT_queuedLogs select 0);
if !(isNil "_log") then {
	_log params ["_message", "_type", "_force", "_timeStamp"];
	
	if (OT_printDebug || _force) then {
		private _msg = format ["OT_%1: %2", _type, _message];
		diag_log _msg;
	};
	
	if (OT_logging) then {
		[_message, _type, _timeStamp] call OT_fnc_logToProfile;
	};
	OT_queuedLogs deleteAt 0;
};

//Recursivly call function
[OT_fnc_logLoop, [], 1] call CBA_fnc_waitAndExecute;