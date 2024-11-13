/* ----------------------------------------------------------------------------
Function: OT_fnc_getNPCIcon

Description:
	TODO

Parameters:

Optional:

Example:

Returns:

Author:
    deadorbit
---------------------------------------------------------------------------- */

params [["_unit", objNull]];
if (_unit isEqualTo objNull) exitWith {""};
private _return = OT_IMAGE_TALKTO_GENERIC;

switch (true) do {
	case((_unit getvariable ["shop",[]]) isNotEqualTo []) : {
		_return = OT_IMAGE_TALKTO_GENERAL;
	};
};

_return