private _b = player call OT_fnc_nearestRealEstate;
private _building = objNull;
if(typename _b isEqualTo "ARRAY") then {
	_building = _b select 0;
	_pos = getpos _building;
	private _name = _building getVariable "name";

	_cls = typeof _building;
	if(_cls isEqualTo OT_flag_IND) then {
		_name = _building getVariable "name";
		private _mrkid = format["%1-base",_pos];
		deleteMarker _mrkid;
		
		private _bases = server getVariable ["bases",[]];
		private _target = "";
		{
			if ((_x select 0) isEqualTo _pos) then {
				_target = _x;
			}
		}foreach(_bases);
		private _index = _bases find _target;
		_bases deleteAt _index;
		server setVariable ["bases",_bases];
		
		private _baseObjects = ["Land_IRMaskingCover_02_F","Land_Hangar_F",OT_barracks,"Land_Airport_01_hangar_F",OT_refugeeCamp,"Land_Cargo_Tower_V4_F","Land_Cargo_Tower_V3_F","Land_Cargo_Tower_V2_F","Land_Cargo_Tower_V1_F","Land_Cargo_Patrol_V4_F"];
		private _objects = nearestObjects [_pos, [], 100];
		{
			if ((typeof _x) in _baseObjects) then {
				deleteVehicle _x;
			};
		}foreach(_objects);
		deleteVehicle _building;
	};
};