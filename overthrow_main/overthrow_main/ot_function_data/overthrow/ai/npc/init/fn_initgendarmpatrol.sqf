private _group = _this;

private _town = (leader _group) getVariable "garrison";
private _center = _town call OT_fnc_getRandomRoadPosition;

_group setVariable ["Vcm_Disable", true];
_group setVariable ["VCM_NORESCUE", true];
_group setVariable ["VCM_TOUGHSQUAD", true];
_group setCombatBehaviour "AWARE";
_group setSpeedMode "LIMITED";
_group setFormation selectRandom ["DIAMOND", "VEE", "WEDGE", "STAG COLUMN", "LINE"];

[_group, _center, 200, 4, [200, 200, 0, false, 200], true] call lambs_wp_fnc_taskPatrol;

//Holster Weapon (Atleast to start with)
[_group] spawn {
	params ["_group"];
	{
		sleep random(2);
		_x action ['SwitchWeapon', _x, _x, 100];
	}foreach(units _group);
};