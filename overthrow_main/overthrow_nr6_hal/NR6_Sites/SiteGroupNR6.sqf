//[position of site, radius of site,  number of groups, chance for patrol,,minimum building size, side, array of available groups for guard to spawn (can be a config path or array), controlled HAL leaders] call NR6_Sites;

//Ex: [(getPos this),100,4,0.2,1,west,[['rhsusf_army_ocp_teamleader', 'rhsusf_army_ocp_grenadier','rhsusf_army_ocp_autorifleman','rhsusf_army_ocp_rifleman'],['rhsusf_army_ocp_grenadier', 'rhsusf_army_ocp_rifleman']], [LeaderHQ,LeaderHQB]] call NR6_fnc_Sites; 

private 
    [
    "_grp","_SpawnPos","_SpawnRadius","_Pool","_GrpQuantity","_Leaders","_i","_Side","_SpawnRGroup","_PatrolPercent","_MinBuilding"
    ];


_SpawnPos = _this select 0;
_SpawnRadius = _this select 1;
_GrpQuantity = _this select 2;
_PatrolPercent = _this select 3;
_MinBuilding = _this select 4;
_Side = _this select 5;
_Pool = _this select 6;
_Leaders = _this select 7;


if (isNil ("LeaderHQ")) then {LeaderHQ = objNull};
if (isNil ("LeaderHQB")) then {LeaderHQB = objNull};
if (isNil ("LeaderHQC")) then {LeaderHQC = objNull};
if (isNil ("LeaderHQD")) then {LeaderHQD = objNull};
if (isNil ("LeaderHQE")) then {LeaderHQE = objNull};
if (isNil ("LeaderHQF")) then {LeaderHQF = objNull};
if (isNil ("LeaderHQG")) then {LeaderHQG = objNull};
if (isNil ("LeaderHQH")) then {LeaderHQH = objNull};

if (isNil ("RydHQ_ExcludedG")) then {RydHQ_ExcludedG = []};
if (isNil ("RydHQB_ExcludedG")) then {RydHQB_ExcludedG = []};
if (isNil ("RydHQC_ExcludedG")) then {RydHQC_ExcludedG = []};
if (isNil ("RydHQD_ExcludedG")) then {RydHQD_ExcludedG = []};
if (isNil ("RydHQE_ExcludedG")) then {RydHQE_ExcludedG = []};
if (isNil ("RydHQF_ExcludedG")) then {RydHQF_ExcludedG = []};
if (isNil ("RydHQG_ExcludedG")) then {RydHQG_ExcludedG = []};
if (isNil ("RydHQH_ExcludedG")) then {RydHQH_ExcludedG = []};

for "_x" from 1 to _GrpQuantity do
{
  [_SpawnPos,_SpawnRadius,_Side,_Pool,_SpawnRadius,_MinBuilding,_PatrolPercent,_Leaders] call SpawnRGroupS;
};