systemTime params ["_year", "_month", "_day", "_hour", "_minute", "_second", "_millisecond"];

private _waitperiod = 60;
private _mode = server getvariable ["OT_Despawn",2];
if (_mode == 0) exitwith {};
if (_mode == 1) then {_waitperiod = 15};

private _systime = _hour * 60;  
_systime = _systime + _minute;  
_systime = _systime + (_day * 1440);
{ 
	private _timedead = _x getvariable ["deathtimer",nil]; 
	if(isnil{_timedead}) then { 
		_x setvariable ["deathtimer",_systime]; 
	}else{ 
		if((_systime - _timedead) >= _waitperiod) then { 
			_x setvariable ["deathtimer",999999];//There time has come (again)
			hideBody _x; 
		}; 
	};
	sleep(0.1);
}foreach(alldead);