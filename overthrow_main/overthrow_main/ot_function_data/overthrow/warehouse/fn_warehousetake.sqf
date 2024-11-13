if (OT_taking) exitWith {};

OT_taking = true;
private _idx = lbCurSel 1500;
private _cls = lbData [1500,_idx];
private _num = _this select 0;

private _town = (getpos player) call OT_fnc_nearestTown;
private _townwarehouse = warehouse getvariable [_town,nil];

if(isnil{_townwarehouse}) then {
	warehouse setvariable [_town,[]];
	_townwarehouse = warehouse getvariable _town;
};
private _id = _townwarehouse findif {(_x select 0) isEqualTo _cls};

if(!(_id == -1)) then {
	private _d = _townwarehouse select _id;
	private _amnt = _d select 1;

	if(_num > _amnt || _num isEqualTo -1) then {
		_num = _amnt;
	};

	_count = 0;
	private _veh = (vehicle player);
	private	_iswarehouse = false;
	if(_veh isEqualTo player) then {
		_b = OT_warehouseTarget call OT_fnc_nearestRealEstate;
		if(typename _b isEqualTo "ARRAY") then {
			_building = _b select 0;
			if((typeof _building) == OT_warehouse && _building call OT_fnc_hasOwner) then {
				_iswarehouse = true;
				_veh = OT_warehouseTarget;
			};
		};
	};

	if(_veh isEqualTo player) exitWith {
		"No warehouse within range" call OT_fnc_notifyMinor;
	};

	while {_count < _num} do {
		if (!(_veh isKindOf OT_item_Storage) && !(_veh canAdd _cls)) exitWith {hint "This vehicle is full, use a truck for more storage"; closeDialog 0; _num = _count};
		[_cls, _veh] call {
			params ["_cls", "_veh"];
			if(_cls isKindOf ["Rifle",configFile >> "CfgWeapons"]) exitWith {
				_veh addWeaponCargoGlobal [_cls,1];
			};
			if(_cls isKindOf ["Launcher",configFile >> "CfgWeapons"]) exitWith {
				_veh addWeaponCargoGlobal [_cls,1];
			};
			if(_cls isKindOf ["Pistol",configFile >> "CfgWeapons"]) exitWith {
				_veh addWeaponCargoGlobal [_cls,1];
			};
			if(_cls isKindOf ["Default",configFile >> "CfgMagazines"]) exitWith {
				_veh addMagazineCargoGlobal [_cls,1];
			};
			if(_cls isKindOf "Bag_Base") exitWith {
				_cls = _cls call BIS_fnc_basicBackpack;
				_veh addBackpackCargoGlobal [_cls,1];
			};
			_veh addItemCargoGlobal [_cls,1];
		};
		_count = _count + 1;
	};
	systemchat format["%1 %2",_cls,_num];
	[_cls,_num,_town] call OT_fnc_removefromwarehouse;

	[] call OT_fnc_warehouseDialog;
};
OT_taking = false;