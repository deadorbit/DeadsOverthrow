// put in to allow flashlight to be used without getting shot in face is then defined in initvar.sqf
private _covert = _this getvariable ["OT_covert",0];
private _ret = false;
if(_covert == 0) then {
	if(!(secondaryWeapon _this in OT_legal) or !(handgunWeapon _this in OT_legal) or !(primaryWeapon _this in OT_legal)) exitwith {_ret = true};
}else{
	if(!(primaryWeapon _this in OT_legal) || !(secondaryWeapon _this in OT_legal)) exitwith {_ret = true};
	if(!(handgunWeapon _this in OT_legal) && (currentweapon _this == handgunWeapon _this)) exitwith {_ret = true};
};
_ret