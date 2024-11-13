params [["_cls", ""]];

if (typeName _cls isEqualTo "ARRAY") then {
	_cls = _cls select 0;
};

private _return = false;
if ([_cls] call DEDF_fnc_isWeapon && [_cls] call OT_fnc_isIllegal) then {
	_return = true;
};

_return