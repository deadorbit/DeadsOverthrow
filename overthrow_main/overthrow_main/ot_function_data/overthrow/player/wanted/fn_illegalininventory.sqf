_target = _this; 
_foundillegal = false;
if(isplayer _target) then { 
	{ 
		_cls = _x select 0; 
		if (OT_allIllegal getOrDefault [_cls, false]) then {
			_foundillegal = true; 
		}; 
		if (OT_allDrugs getOrDefault [_cls, false]) then { 
			_count = _x select 1; 
			for "_i" from 1 to _count do { 
				_target removeItem _cls; 
				_cop addItem _cls; 
			}; 
			_foundillegal = true; 
			}; 
	}foreach(_target call OT_fnc_getSearchStock);
};

_foundillegal