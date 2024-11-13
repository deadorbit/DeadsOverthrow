params [["_cls", ""]];

if (typeName _cls isEqualTo "ARRAY") then {
	_cls = _cls select 0;
};

private _return = false;
switch(true) do {
	case([_cls] call DEDF_fnc_isMagazine);
	case([_cls] call DEDF_fnc_isWeapon) : {
		if !(OT_legal getOrDefault [_cls, false]) then {
			_return = true;
		};
	};
	case(OT_allIllegal getOrDefault [_cls, false]) : {
		_return = true;
	};
};

_return