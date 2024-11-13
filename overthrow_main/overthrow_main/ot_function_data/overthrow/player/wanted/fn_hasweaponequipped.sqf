// put in to allow flashlight to be used without getting shot in face is then defined in initvar.sqf
private _covert = _this getvariable ["OT_covert",0];
private _ret = false;

if (OT_allIllegal getOrDefault [(primaryWeapon _this), false]) exitWith {true};
if (OT_allIllegal getOrDefault [(secondaryWeapon _this), false]) exitWith {true};

if(_covert == 0) then {
	if (OT_allIllegal getOrDefault [(handgunWeapon _this), false]) exitWith {_ret = true};
}else{
	if (OT_allIllegal getOrDefault [(handgunWeapon _this), false] && (currentweapon _this == handgunWeapon _this)) exitWith {_ret = true};
};

_ret