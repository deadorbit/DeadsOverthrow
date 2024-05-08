params[["_target",vehicle player]];

private _notvehicle = false;
if (_target isEqualTo player) then {
	_target = OT_warehouseTarget;
	_notvehicle = true;
};

if (player call OT_fnc_unitSeenNATO) exitWith {"Cannot transfer while the enemy is seeing you" call OT_fnc_notifyMinor;};
//if (player getvariable ["OT_inrestrictedzone",false]) exitWith {"Cannot transfer in the restricted zone" call OT_fnc_notifyMinor;};

if (isNull _target || isNil "_target") exitWith {};

private _objects = [];
private _b = player call OT_fnc_nearestRealEstate;
private _iswarehouse = false;

if (!_notvehicle) then {
	{
		if (!(_x isEqualTo _target) && {(_x isKindOf "Car" or _x isKindOf "Air" or _x isKindOf "B_CargoNet_01_ammo_F" or _x isKindOf "Ship" or _x isKindOf "Tank" or _x isKindOf "B_Slingload_01_Cargo_F" or _x isKindOf "OT_Land_Cargo10_grey_F") && !(side _x isEqualTo west) && !({alive _x} count crew _x > 0)}) then {_objects pushback _x};
	} foreach (player nearEntities [["Car","B_CargoNet_01_ammo_F","Air","Ship","Tank","B_Slingload_01_Cargo_F","OT_Land_Cargo10_grey_F"],20]);
};

if (!_notvehicle  && _objects isEqualTo []) exitWith {
	"Cannot find any containers or other vehicles within 20m of this vehicle" call OT_fnc_notifyMinor;
};

if (count _objects isEqualTo 1) then {
	[_target, (_objects select 0)] call OT_fnc_transferHelper;
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
			[_target, _x]
		];
	} foreach (_objects);
	"Transfer to which container?" call OT_fnc_notifyBig;
	_options call OT_fnc_playerDecision;
};
