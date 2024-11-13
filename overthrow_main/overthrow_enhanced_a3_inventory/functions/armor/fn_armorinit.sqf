private ["_curArmor","_maxArmorUniform","_maxArmorVest","_maxArmorHeadgear"];

_maxArmorUniform = 0;
_maxArmorVest = 0;
_maxArmorHeadgear = 0;
_maxUniformClass = "";
_maxVestClass = "";
_maxHeadgearClass = "";

{
    _curArmor = ["uniform",configName _x] call DEDF_fnc_armorCalc;
    if (_curArmor > _maxArmorUniform) then {
        _maxArmorUniform = _curArmor;
		_maxUniformClass = configName _x;
    };
} forEach (("isclass _x && getnumber (_x >> 'scope') == 2 && getText (_x >> 'uniformClass') != ''") configclasses (configfile >> "CfgVehicles"));

{
    _curArmor = ["gear",configName _x] call DEDF_fnc_armorCalc;
    if (_curArmor > _maxArmorVest) then {
        _maxArmorVest = _curArmor;
		_maxVestClass = configName _x;
    };
} forEach (("isclass _x && getnumber (_x >> 'scope') == 2 && getnumber (_x >> 'itemInfo' >> 'type') in [701]") configclasses (configfile >> "cfgweapons"));

{
	_curArmor = ["gear",configName _x] call DEDF_fnc_armorCalc;
    if (_curArmor > _maxArmorHeadgear) then {
        _maxArmorHeadgear = _curArmor;
		_maxHeadgearClass = configName _x;
    };
} forEach (("isclass _x && getnumber (_x >> 'scope') == 2 && getnumber (_x >> 'itemInfo' >> 'type') in [605]") configclasses (configfile >> "cfgweapons"));
missionNamespace setVariable ["OT_INV_MAX_ARMOR",[_maxArmorUniform, _maxArmorVest, _maxArmorHeadgear, (_maxArmorUniform + _maxArmorVest + _maxArmorHeadgear)]];
missionNamespace setVariable ["OT_INV_MAX_ARMOR_DEBUG",[_maxUniformClass, _maxHeadgearClass, _maxVestClass]];