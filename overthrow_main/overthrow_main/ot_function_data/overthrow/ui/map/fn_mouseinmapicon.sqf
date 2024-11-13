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
params [["_iconSize", [10, 10]], ["_iconPos", [(worldSize/2), (worldSize/2)]]];

private _mapCtrl 		= findDisplay 46 displayCtrl 51;
private _mapScale 		= ctrlMapScale _mapCtrl;
private _mapMousePos 	= ctrlMousePosition _mapCtrl;
private _worldMousePos 	= _mapCtrl ctrlMapScreenToWorld _mapMousePos;

private _iconXSize = (_iconSize select 0) / _mapScale; //Size in meters
private _iconYSize = (_iconSize select 1) / _mapScale;

[_iconPos,[_iconXSize]] call BIS_fnc_isInsideArea;