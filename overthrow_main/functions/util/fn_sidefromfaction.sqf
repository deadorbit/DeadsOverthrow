params ["_faction"];

private _FacSide = getNumber (configfile >> "CfgFactionClasses" >> _faction >> "side");
private _side = "N/a";

if (_FacSide == 0) then {
	_side = "Opfor";
}else{
	if (_FacSide == 1) then {
		_side = "Blufor";
	}else{
		if (_FacSide == 2) then {
			_side = "Independant";
		};
	};
};

_side
