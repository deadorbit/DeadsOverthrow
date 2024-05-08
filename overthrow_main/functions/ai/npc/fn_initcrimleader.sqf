params ["_unit","_town","_gangid","_home"];

(group _unit) setVariable ["VCM_NORESCUE",true];
(group _unit) setVariable ["VCM_TOUGHSQUAD",true];
(group _unit) setVariable ["VCM_Disable",true];

[_unit, _unit] call ace_common_fnc_claim;

[_unit, "SIT_LOW", "FULL"] call BIS_fnc_ambientAnimCombat;

_unit setVariable ["crimleader",true,true];//robodog
_unit setVariable ["hometown",_town,true];//robodog

//_unit disableai "TARGET";
_unit disableAI "PATH";

[_unit, (OT_faces_local call BIS_fnc_selectRandom)] remoteExecCall ["setFace", 0, _unit];
[_unit, (OT_voices_local call BIS_fnc_selectRandom)] remoteExecCall ["setSpeaker", 0, _unit];

private _gang = OT_civilians getVariable [format["gang%1",_gangid],[]];
_unit setUnitLoadout [_gang select 5,true];
if((random 100) > 25) then {
	(uniformContainer _unit) addItemCargoGlobal ["OT_Ganja",ceil(random 3)];
}else{
	(uniformContainer _unit) addItemCargoGlobal ["OT_Blow",ceil(random 3)];
};

_unit addGoggles (OT_CRIM_Goggles call BIS_fnc_selectRandom);

_unit addEventHandler ["Dammaged", OT_fnc_EnemyDamagedHandler];
//_unit addEventHandler ["FiredNear", {params ["_unit"];_unit enableAI "PATH"}];

//[_unit,_home] spawn OT_fnc_initCrimLeaderCommandCheck;
