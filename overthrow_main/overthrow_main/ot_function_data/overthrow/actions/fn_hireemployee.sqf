private _idx = lbCurSel 1501;
private _name = lbData [1501,_idx];
private _rate = server getVariable [format["%1employ",_name],0];
_rate = _rate + 1;
private _target = 1;

	{
	 if ((_x select 0) == _name) then {_target = (_x select 1)};
	} forEach OT_BusinessLevel;
	
if(_rate > 10 * _target) exitWith {};
server setVariable [format["%1employ",_name],_rate,true];
_name remoteExec ["OT_fnc_refreshEmployees",2,false];
[] call OT_fnc_showBusinessInfo;
