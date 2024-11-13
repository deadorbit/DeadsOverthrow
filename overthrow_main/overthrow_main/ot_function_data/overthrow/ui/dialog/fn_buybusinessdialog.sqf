params ["_mode"];

createDialog "OT_dialog_BusConfirm";

private _ob = (getpos player) call OT_fnc_nearestLocation;
private _Business = _ob select 0;

if (_mode isEqualTo 'Expand') then {
	private _target = "";
	private _cost = 0;
	
	{
		if ((_x select 0) == _Business) then {_target = _x};
	}forEach OT_BusinessLevel;
	
	private _Level = _target select 1;
	
	if (_Level == 1) then {_cost = 100000};
	if (_Level == 2) then {_cost = 250000};
	if (_Level == 3) then {_cost = 500000};
	if (_Level == 4) then {_cost = 750000};
	
	_cost = [_cost, 1, 0, true] call CBA_fnc_formatNumber;

	((findDisplay -20) displayCtrl 1101) ctrlSetStructuredText parseText format["<t size='1.5' align= 'center' valign= 'middle' font = ""PuristaMedium"">Confirmation: Pay $%1 to upgrade this business?</t>",_cost];
	((findDisplay -20) displayCtrl 1600) buttonSetAction "closeDialog 0; [] spawn OT_fnc_buyExpand;";
};

