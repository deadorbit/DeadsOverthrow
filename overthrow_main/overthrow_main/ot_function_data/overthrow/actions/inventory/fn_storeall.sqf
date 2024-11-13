private _target = vehicle player;
private _notvehicle = false;
if(_target isEqualTo player) then {
	_target = OT_warehouseTarget;
};

if(isNull _target || isNil "_target") exitWith {};

private _objects = [];
private _buildingData = [player] call OT_fnc_nearestRealEstate;
private _iswarehouse = false;
if(_buildingData isEqualType []) then {
	private _building = _buildingData select 0;
	if((typeof _building) == OT_warehouse && _building call OT_fnc_hasOwner) then {
		_iswarehouse = true;
		_objects pushback _building;
	};
};

if(_notvehicle && _objects isEqualTo []) exitWith {
	"No warehouse within range" call OT_fnc_notifyMinor;
};

[_target, (_objects select 0)] call OT_fnc_transferHelper;
