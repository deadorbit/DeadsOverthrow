//scheduled 
if !(canSuspend) exitwith {};

private _allflags = missionnamespace getvariable ["dynflags",[]];
private _count = 0;
{
	sleep 0.5;
	private _flag = _x select 0;
	private _town = _x select 1;
	if (_town == "") then {
		_town = (getpos _flag) call OT_fnc_nearestTown;
		_allflags set [_count,[_flag,_town]]; 
	};
	
	private _abandoned = server getVariable ["NATOabandoned",[]];
	if !(_town in _abandoned) then {
		_flag setFlagTexture OT_flag_NATO_txt;
	}else{
		private _stability = server getVariable [format["stability%1",_town],0];
		if (_stability < 50) then {
			_flag setFlagTexture OT_flag_Crim_txt;
		}else{
			_flag setFlagTexture OT_flag_IND_txt;
		};
	};
	_count = _count + 1;
}foreach(_allflags);
missionnamespace setvariable ["dynflags",_allflags,true];