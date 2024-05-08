private ["_unit"];

_unit = _this select 0;

[_unit, _unit] call ace_common_fnc_claim;
(group _unit) setVariable ["VCM_Disable",true];

private _pos = getpos _unit;
private _firstname = OT_firstNames_local select (round((_pos select 0) random (count OT_firstNames_local)));
private _lastname = OT_lastNames_local select (round((_pos select 1) random (count OT_lastNames_local)));
private _fullname = [format["%1 %2",_firstname,_lastname],_firstname,_lastname];
[_unit,_fullname] remoteExecCall ["setName",0,_unit];

removeAllWeapons _unit;
removeAllAssignedItems _unit;
removeGoggles _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeVest _unit;

[_unit, (OT_faces_local call BIS_fnc_selectRandom)] remoteExec ["setFace", 0, _unit];
[_unit, "NoVoice"] remoteExecCall ["setSpeaker", 0, _unit];

_unit allowDamage false;
_unit disableAI "MOVE";

_unit forceAddUniform (OT_clothes_carDealers call BIS_fnc_selectRandom);

[_unit,"self"] call OT_fnc_setOwner;
