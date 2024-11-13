//They are driving or in a non-civilian vehicle including statics
private _veh = vehicle _this;
private _cls = typeOf _veh;

if !(OT_allCivVehs getOrDefault [_cls, false]) exitWith {
	true
};
//They are driving or in a car with a weapon attached
if ((_veh getVariable ["OT_attachedClass",""]) != "") exitWith {
	true;
};

//Drivers are not checked for weapons because you cannot shoot and drive, otherwise...
if((driver _veh) isEqualTo _this) exitWith{false};

// carrying a weapon or illegal gear
if (_this call OT_fnc_hasWeaponEquipped || [headgear _this] call OT_fnc_isIllegal || [vest _this] call OT_fnc_isIllegal) exitWith {true};

false
