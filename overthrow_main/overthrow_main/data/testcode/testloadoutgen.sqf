if (isNil "spawner") then {
	spawner = [true] call CBA_fnc_createNamespace;
};

OT_has_WS = true;
OT_has_RF = true;
call compile preprocessFileLineNumbers "\overthrow_missions\missions\deadsotaltis.altis\initvar.sqf";
call compile preprocessFileLineNumbers "\overthrow_missions\missions\deadsotaltis.altis\initvarmodcompat.sqf";

private _testUnitClasses = [
	"B_recon_F",
	"B_recon_LAT_F",
	"B_Patrol_Soldier_MG_F",
	"B_Patrol_Soldier_AR_F",
	"B_Recon_Sharpshooter_F",
	"rhsusf_army_ocp_maaws",
	"rhsusf_army_ocp_sniper",
	"rhsusf_army_ocp_engineer",
	"rhsusf_army_ocp_machinegunner",
	"B_soldier_AR_F",
	"B_Soldier_GL_F",
	"B_ghillie_ard_F",
	"B_soldier_LAT2_F",
	"B_support_CMort_RF",
	OT_policeUnitMedic,
	OT_policeUnitHeavy,
	OT_policeUnitCommander
];

private _output = "";
private _newline = "
";
private _runs = 3;
private _total = 0;
private _pos = getPos player;
_pos params ["_posX", "_posY", "_posZ"];
private _gridData = [[_posX, _posY], 6, 5];
{
	private _unit = _x;
	private _loadouts = [];
	for "_i" from 1 to _runs do {
		_loadouts pushback ([_unit, [], [], true] call OT_fnc_getRandomLoadout);
	};
	{
		private _bob = (group player) createUnit [_unit, getpos player, [], 15, ""];
		_bob setUnitLoadout _x;
		_bob disableAI "ALL";
		_bob setPosATL ([_total, _gridData] call OT_fnc_gridPosFromIDX) + [0];
		_output = _output + format["#%1 %2 Loadout",_forEachIndex, _unit] + _newline + str(_x) + _newline;
		
		_total = _total + 1;
	}foreach(_loadouts);
}foreach(_testUnitClasses);

_output