closedialog 0;
createDialog "OT_dialog_logistics";
lbClear 1500;
ctrlShow [1602, false];
ctrlshow [2001,false];
ctrlshow [1103,false];
ctrlshow [1102,false];

private _s = [OT_townData,[],{(_x select 0) distance2d player}] call BIS_fnc_sortby;

private _ctrl = (findDisplay 8001) displayCtrl 1101;
_ctrl ctrlSetStructuredText parseText format["<t size='1.7' shadow='2' align='left' valign = 'middle'>Logistics</t>"];
private _abandoned = server getVariable ["NATOabandoned",[]];
{
	private _cls = "TOWN";
    private _pos = _x select 0;
    private _town = _x select 1;
	private _isabandoned = false;
	private _pic = "";
	private _stability = server getVariable [format["stability%1",_town],100];
	if (_town in _abandoned) then {
		_isabandoned = true;
	};
	private _color = [_stability,_isabandoned] call {
		params ["_stability","_isabandoned"];
		if((!_isabandoned) && (_stability >= 50)) exitwith {
			_pic = OT_flag_NATO_txt;
			[0.1,0.1,0.9,1]
		};
		if((!_isabandoned) && (_stability < 50)) exitwith {
			_pic = OT_flag_NATO_txt;
			[0.9,0.9,0,1]
		};
		if(_isabandoned && (_stability <= 50)) exitwith {
			_pic = OT_flag_Crim_txt;
			[0.8,0,0,1]
		};
		if(_isabandoned && (_stability > 50)) exitwith {
			_pic = OT_flag_IND_txt;
			[0.3,1,0,1]
		};
 	};
    private _dis = round(_pos distance2D player);
    private _t = "m";
    if(_dis > 999) then {
		_dis = (_dis / 1000) toFixed 1;
		_t = "km";
	};
	
	_idx = lbAdd [1500,format["%1 (%2%3)",_town,_dis,_t]];
	lbSetData [1500,_idx,_town];
	lbSetColor [1500,_idx,_color];
	lbSetPicture [1500,_idx,_pic];
}foreach(_s);
