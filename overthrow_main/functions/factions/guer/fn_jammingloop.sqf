if (isnil "OT_JammingPos") then {
	OT_JammingPos = [];
};

while {true} do {
	sleep 20; 
	if ((count OT_JammingPos) > 0) then {
		{
			_Objpos = _x select 0;
			_Town = _x select 1;
			_abandoned = server getVariable "NATOabandoned";
			if (_Town in _abandoned) then {
				_objs = nearestObjects [_Objpos, [OT_NATO_Vehicles_ReconDrone], 350];
				{
					if (alive _x) then {
						_x setDamage 1;
					}
				}foreach(_objs);
			};
		}foreach(OT_JammingPos);
	};
};