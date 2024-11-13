createDialog "OT_dialog_FacUpgrade";

private _target = OT_factoryLevel + 1;

private _cost = ((500000*(_target^2))+(2500000*_target)-2000000) * 2;

_cost = [_cost, 1, 0, true] call CBA_fnc_formatNumber;
 
((findDisplay -20) displayCtrl -23) ctrlSetStructuredText parseText format["<t size='1' align='center'>Upgrade the Factory (%1/3) for $%2?</t>",_target,_cost];