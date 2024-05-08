params ["_unit","_town"];

[_unit, (OT_faces_western call BIS_fnc_selectRandom)] remoteExecCall ["setFace", 0, _unit];
[_unit, (OT_voices_western call BIS_fnc_selectRandom)] remoteExecCall ["setSpeaker", 0, _unit];

_unit setVariable ["garrison",_town,false];

[_unit, _unit] call ace_common_fnc_claim;
_unit setskill ["general",0.1 + random(0.25)];
_unit setSkill ["aimingAccuracy",0.1 + (random 0.3)]; //Po-po are not known for being great shots
_unit allowFleeing 0;
_unit disableAI "FSM";
//private _stability = server getVariable format["stability%1",_town];

_unit addEventHandler ["HandleDamage", {
	_me = _this select 0;
	_src = _this select 3;
	if(captive _src) then {
		if((vehicle _src) != _src || (_src call OT_fnc_unitSeenNATO)) then {
			_src setCaptive false;
		};
	};
}];

if((random 100) > 33) then {
	_unit setUnitLoadout [_unit call OT_fnc_getRandomLoadout, true];
};

if((random 100) < 20) then {
	removegoggles _unit;
}else{
	removegoggles _unit;
	_unit addGoggles (OT_NATO_Goggles_Police call BIS_fnc_selectRandom);
};

_unit addEventHandler ["Dammaged", OT_fnc_EnemyDamagedHandler];

_unit spawn OT_fnc_PoliceRemoveObj;
