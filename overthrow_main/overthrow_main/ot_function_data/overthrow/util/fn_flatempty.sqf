params ["_pos","_type","_params"];
    _pos = _pos findEmptyPosition [0,120,_type];
    if (_pos isEqualTo []) exitWith {[]};
    _params =+ _params;
    _params set [0, -1];
    _pos = _pos isFlatEmpty _params;
    if (_pos isEqualTo []) exitWith {[]};
_pos