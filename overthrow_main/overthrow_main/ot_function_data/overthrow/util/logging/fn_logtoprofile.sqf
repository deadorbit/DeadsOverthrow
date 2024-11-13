params [["_message", ""], ["_type", "INFO"], ["_timeStamp", ""]];

private _logs = profileNameSpace getVariable ["OT_logHistory", []];
private _logCatIdx = _logs findIf {(_x select 0) isEqualTo _type};

if (_logCatIdx isEqualTo -1) then {
	_logCatIdx = count _logs;
	_logs pushBack [_type, []];
};

private _logCat = _logs select _logCatIdx;
_logCatLogs = _logCat select 1;
_logCat pushBack [_message, _timeStamp];

profileNameSpace setVariable ["OT_logHistory", _logs];
