params [["_object", objNull, [objNull]],["_type", "", [""]]];

if ((isNull _object) or {_type == ""}) exitWith {false};

private _index = _object addEventHandler [_type, ""];

_object removeEventHandler [_type, _index];

_index > 0