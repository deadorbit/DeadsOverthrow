//Function takes in NATO millitary vehicle and initalizes it
//Attempts to remove vehicle from spawn table at an objective so it won't respawn till 'bought' again by the AI


params ["_unit","_target","_found","_IsAirport"];

private _cls = typeof _unit;
if(_cls == "rhsusf_stryker_m1126_m2_d" || _cls == "rhsusf_stryker_m1126_mk19_d") then {
	[
		_unit,
		[
			"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_hull_d_co.paa","rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_parts_d_co.paa","rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_slat_d_co.paa",
			"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_crows_d_co.paa","rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_wheels_d_co.paa","rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_acc_d_co.paa",
			"rhsusf\addons\rhsusf_stryker\data\rhsusf_m1126_acc_d_ca.paa","rhsusf\addons\rhsusf_m1a1\DUKE\data\duke_antennae_c_co.paa","rhsusf\addons\rhsusf_props\jerrycans\scepterMFC\data\rhsusf_mfc_d_co.paa",
			"rhsusf\addons\rhsusf_props\jerrycans\scepterMFC\data\rhsusf_mfc_d_co.paa","rhsusf\addons\rhsusf_props\jerrycans\scepterMWC\data\rhsusf_mwc_d_co.paa","rhsusf\addons\rhsusf_props\jerrycans\scepterMWC\data\rhsusf_mwc_d_co.paa"
		]
	] call BIS_fnc_setObjectTexture;
};

//For garrisoned vehicles
_spawnpos = getpos _unit;
[_unit, _unit] call ace_common_fnc_claim;
_unit allowdamage false;

if !(_target isEqualTo "") then {
	_unit setVariable ["UnitTarget",_target,false];
	_unit setVariable ["UnitFound",_found,false];
	_unit setVariable ["IsAirport",_IsAirport,false];
	_unit allowCrewInImmobile [true,true];

	_unit addEventHandler ["Killed", {
		private _me = (_this select 0);
		private _target = _me getVariable "UnitTarget";
		private _found = _me getVariable "UnitFound";
		private _IsAirport = _me getVariable "IsAirport";
		private _vehgarrison = (_target select 3);
		private _type = TypeOf _me;
		private _ListNum = _vehgarrison find _type;
		private _rem = _vehgarrison deleteAt _ListNum;
		if !(_IsAirport) then {
			OT_objectiveData set [_found,[_target select 0,_target select 1,_target select 2,_vehgarrison]];
		}else{
			OT_airportData set [_found,[_target select 0,_target select 1,_target select 2,_vehgarrison]];
		};
	}];

	_unit addEventHandler ["GetOut", {
		private _me = (_this select 0);
		if (!(side _me IsEqualTo blufor) && {(alive _me)}) then {
			[objnull, _unit] call ace_common_fnc_claim;
			//To Do: Remove from garrison
		};
	}];
};
	
_unit addEventHandler ["GetIn", {
	private _me = (_this select 0);
	if (!(side _me IsEqualTo blufor) && {(alive _me)}) then {
		[objnull, _me] call ace_common_fnc_claim;
	};
}];

_unit allowdamage true;