params ["_unit","_veh"];
private _full = false;
private _istruck = false;
if((typeof _veh) isEqualTo "OT_C_Truck_recovery") then {_istruck = true};

private _cargo = getMagazineCargo backpackContainer _unit;
{
	private _cls = _x;
	private _count = 0;
	private _amnt = ((_cargo select 1) select _count);
		
	if (!(_veh canAdd [_cls,_amnt]) && !_isTruck) exitWith {
		_full = true;
	};
	
	_veh addMagazineCargoGlobal [_cls, _amnt];
	
	_count = _count + 1;
}foreach(_cargo select 0);

if !(_full) then {
	private _cargo = getItemCargo backpackContainer _unit;
	{
		private _cls = _x;
		private _count = 0;
		private _amnt = ((_cargo select 1) select _count);
			
		if (!(_veh canAdd [_cls,_amnt]) && !_isTruck) exitWith {
			_full = true;
		};
		
		_veh addItemCargoGlobal [_cls, _amnt];
		
		_count = _count + 1;
	}foreach(_cargo select 0);
};


if !(_full) then {
	private _cargo = getWeaponCargo backpackContainer _unit;
	{
		private _cls = _x;
		private _count = 0;
		private _amnt = ((_cargo select 1) select _count);
			
		if (!(_veh canAdd [_cls,_amnt]) && !_isTruck) exitWith {
			_full = true;
		};
		
		_veh addWeaponCargoGlobal [_cls, _amnt];
		
		_count = _count + 1;
	}foreach(_cargo select 0);
};

