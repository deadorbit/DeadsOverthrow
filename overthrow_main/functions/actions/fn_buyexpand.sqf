private _b = (position player) call OT_fnc_nearestLocation;
if((_b select 1) isEqualTo "Business") then {
    if (call OT_fnc_playerIsGeneral) then {
		 private _Business = (_b select 0);
		 private _target = 0;
		 
		{
			if ((_x select 0) == _Business) then {_target = _x};
		} forEach OT_BusinessLevel;
		
		private _level = _target select 1;
		private _price = 100000;
		
       	if (_Level == 1) then {_price = 100000};
		if (_Level == 2) then {_price = 250000};
		if (_Level == 3) then {_price = 500000};
		if (_Level == 4) then {_price = 750000};
        private _money = [] call OT_fnc_resistanceFunds;
        if(_money >= _price) then {
            [-_price] call OT_fnc_resistanceFunds;
			private _found = OT_BusinessLevel find _target;
			OT_BusinessLevel set [_found, [_Business,_level + 1,_target select 2]];
			publicVariable "OT_BusinessLevel";
            format["%1 has been expanded",_Business] remoteExec ["OT_fnc_notifyMinor",0,false];
        }else{
            format["The resistance cannot afford this"] remoteExec ["OT_fnc_notifyMinor",0,false];
        };
    };
};
