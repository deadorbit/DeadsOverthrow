private _wanted = "CLEAN";
if !(captive player) then {
	private _hiding = player getVariable ["OT_hiding", 0];
	if((_hiding > 0) && (_hiding < 30)) then {
		_wanted = format["<t color='#C0392B'>(%1) WANTED</t>", _hiding];
	}else{
		_wanted = "<t color='#C0392B'>WANTED</t>";
	};
}else{
	if(vehicle player == player) then {
		if((player call OT_fnc_hasWeaponEquipped) || (headgear player in OT_illegalHeadgear) ||  (vest player in OT_illegalVests) || (!(hmd player isEqualTo "") && !(hmd player isEqualTo "ACE_NVG_Gen1"))) then {
			_wanted = "<t color='#ffaa00'>VISIBLE</t>";//Warn that being seen will result in being wante //Warn that illegal item is in inventory
		}else{
				{
				_cls = _x select 0; 
				if (OT_allIllegal getOrDefault [_cls, false]) exitwith {
					_wanted = "<t color='#ffff99'>INVENTORY</t>"; //Warn that illegal item is in inventory
				}; 
			}foreach(player call OT_fnc_getSearchStock);
		};
	}else{
		if(player call OT_fnc_illegalInCar) then {
			_wanted = "<t color='#ffaa00'>VEHICLE</t>";
		}else{
			if((vehicle player) call OT_fnc_illegalInInventory) then {
				_wanted = "<t color='#ffff99'>CARGO</t>";
			};
		};
	};
};

_wanted
