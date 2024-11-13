private _fitness = _this getVariable ["OT_fitness",1];

if(ace_advanced_fatigue_anreserve < 2300) then {
	ace_advanced_fatigue_anreserve = ace_advanced_fatigue_anreserve + (_fitness * 12);
	if(_fitness isEqualTo 5) then {ace_advanced_fatigue_anreserve = 2300};
};
private _resilience = player getVariable ["OT_resilience",1];
private _y = (player getVariable "ace_medical_damageThreshold") * ((0.25 * _resilience) + 0.75);
if(_resilience != _y) then {
	player setvariable ["ace_medical_damageThreshold",_y];
};
[OT_fnc_perkSystem,_this,2] call CBA_fnc_waitAndExecute;
