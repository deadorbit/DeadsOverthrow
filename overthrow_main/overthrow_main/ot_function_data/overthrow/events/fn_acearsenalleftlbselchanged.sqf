params ["_control", "_lbCurSel", "_lbSelection"];
_thisArgs params ["_container"];

"OT_ACEArsenalLayer" cutText ["", "PLAIN"];

private _item = [_control lbData _lbCurSel, _control lnbData [_lbCurSel, 0]] select (ctrlType _control == 102);
if (_item isEqualTo "") exitWith{};

private _rscLayer = ["OT_ACEArsenalLayer"] call BIS_fnc_rscLayer;

private _name = _item call OT_fnc_anythingGetName;
if (_name isEqualTo "Unknown") exitWith {};
private _count = [_container, _item] call DEDF_fnc_countCargo;

//diag_log format["Item Sel: %1", _item];

[(format["<t shadow='1' color='#C6C9CE' font='OxaniumBold' align='center'>%1<br/><t size='0.9' font='OxaniumRegular'>%2x in box</t></t>", _name, _count]), 0, -0.2, 2, 0.5, 0, _rscLayer] spawn BIS_fnc_dynamicText;