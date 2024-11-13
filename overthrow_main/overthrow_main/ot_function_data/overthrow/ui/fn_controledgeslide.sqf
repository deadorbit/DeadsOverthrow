/* ----------------------------------------------------------------------------
Function: OT_fnc_controlEdgeSlide

Description:
    - 	Plays an animation moving the given control off or on the screen from the
	given edge.

Parameters:
	-	_control(Control): 		Control to be slid.

Optional:
	-	_direction(string)		Default: 1	String representing direction to move control. Can be: "off", "on" respectivly.
	-	_edge(string): 			Default: 1 	Number representing screen edge the control should come from. Can be: "left", "right", "top", "bottom", respectivly.
	-	_speed(integer): 		Default: 0	Time units it takes for the control to slide into place, see Bis wiki for more info.
	-	_sldeInPos([x,y]):		Default: []	Position to slide control in from outside the screen. If no position is supplied, the current position is used

Example:
	[(_myDisplay displayCtrl _myCtrl), 0, 0, 1] spawn OT_fnc_controlEdgeSlide;

Returns:
    - Nothing

Author:
    deadorbit
---------------------------------------------------------------------------- */
params ["_control", ["_direction" ,0], ["_edge", 1], ["_speed", 1], ["_slideInPos", []]];

private _ctrlPos = (ctrlPosition _control);
private _ctrlStartX = _ctrlPos select 0;
private _ctrlStartY = _ctrlPos select 1;
private _ctrlW = _ctrlPos select 2;
private _ctrlH = _ctrlPos select 3;

private _endPos = _slideInPos;
private _startPos = [0,0];


if((count _slideInPos) isEqualTo 0) then {
	_endPos = [_ctrlStartX,_ctrlStartY];
};

switch (_edge) do {
	case "left": {//Left
		_startPos = [0 - _ctrlH + safeZoneX, _ctrlStartY];
	};
	case "right": {//Right
		_startPos = [(1 * safeZoneW) + safezoneX, _ctrlStartY];
	};
	case "top": {//Top
		_startPos = [_ctrlStartX, 0 - _ctrlH + safeZoneY];
	};
	case "bottom": {//Bottom
		_startPos = [_ctrlStartX, (1 * safeZoneH) + safezoneY];
	};
};

if(_direction isEqualTo "on") then {
	_control ctrlSetPosition _startPos;
	_control ctrlCommit 0;
	_control ctrlShow true;
}else{
	private _temp = _startPos;
	_startPos = _endPos;
	_endPos = _temp;
};

_control ctrlSetPosition _endPos;
_control ctrlCommit _speed;

waitUntil{uiSleep 1; (_control isEqualTo controlNull) || (isNil "_control") || (ctrlCommitted _control) || !(alive player)};