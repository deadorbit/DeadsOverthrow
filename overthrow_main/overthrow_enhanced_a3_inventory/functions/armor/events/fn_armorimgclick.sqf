params [["_data",[]]];
if ((count _data) isEqualTo 0) exitWith {};
_data params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
if (_button isNotEqualTo 0) exitWith{};

private _idc = ctrlIDC _control;
private _type = 0;

uiNamespace setVariable ["OT_INV_interactedItem",[]];

switch (_idc) do {
	//Uniform Box
	case(6331): {
		_type = 801;
	};
	//Vest Box
	case(6381): {
		_type = 701;
	};
	//Headgear Box
	case(6240): {
		_type = 605;
	};
};

['refresh', [], _type] call OT_INV_fnc_uiMain;