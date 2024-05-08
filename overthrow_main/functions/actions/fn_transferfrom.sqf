private _veh = vehicle player;

if (_veh isEqualTo player) exitWith {};
if (player call OT_fnc_unitSeenNATO) exitWith {"Cannot transfer while the enemy is seeing you" call OT_fnc_notifyMinor;};
//if (player getvariable ["OT_inrestrictedzone",false]) exitWith {"Cannot transfer in the restricted zone" call OT_fnc_notifyMinor;};

private _objects = [];
{
	if (!(_x isEqualTo _veh) && {(_x isKindOf "Car" or _x isKindOf "Air" or _x isKindOf "B_CargoNet_01_ammo_F" or _x isKindOf "Ship" or _x isKindOf "Tank" or _x isKindOf "B_Slingload_01_Cargo_F") && !(side _x isEqualTo west) && !({alive _x} count crew _x > 0)}) then {_objects pushback _x};
} foreach (player nearEntities [["Car","B_CargoNet_01_ammo_F","Air","Ship","Tank","B_Slingload_01_Cargo_F"],20]);

if (_objects isEqualTo []) exitWith {
	"Cannot find any containers or other vehicles within 20m of this vehicle" call OT_fnc_notifyMinor;
};
private _sorted = [_objects,[],{_x distance player},"ASCEND"] call BIS_fnc_SortBy;
private _target = _sorted select 0;

if (_veh call OT_fnc_unitSeen) then {
	if((_target getVariable ["stockof",""]) isEqualType 0) then {
		{
			_x setCaptive false;
		}foreach(crew _veh);
		[_veh] call OT_fnc_revealToNATO;
		hint "You were caught stealing!";
	};
};

if (count _objects isEqualTo 1) then {
	[(_objects select 0), vehicle player] call OT_fnc_transferHelper;
} else {
	private _options = [];
	{
		private _name = (typeof _x) call OT_fnc_vehicleGetName;
		if (_x getvariable["ace_cargo_customname",""] != "") then {
			_name = format["%1 (%2)",_x getvariable "ace_cargo_customname",_name];
		};
		_options pushback [
			format[
				"%1 (%2m)",
				_name,
				round (_x distance player)
			],
			OT_fnc_transferHelper,
			[_x, vehicle player]
		];
	} foreach (_objects);
	"Transfer from which container?" call OT_fnc_notifyBig;
	_options call OT_fnc_playerDecision;
};
