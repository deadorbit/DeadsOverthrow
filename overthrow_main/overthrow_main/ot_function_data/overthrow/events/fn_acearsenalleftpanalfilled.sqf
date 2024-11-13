params [["_ammobox", objNull]];
private _params = [_ammobox];

private _handle = 
[
	"ace_arsenal_leftPanelFilled",
	{
		_thisArgs params ["_ammobox"];
		_this params ["_arsenalDisplay", "_curLeftPanelIDC"];
		
		diag_log format ["OT_INFO: LeftPanal Updated, Display: %1, Ctrl: %2",_arsenalDisplay, _curLeftPanelIDC];
		private _previousHandle = uiNameSpace getVariable ["OT_ACEArsenalLBSelChanged", ["",-1]];
		_previousHandle params ["_prevCtrl", "_prevIDX"];
		
		if (_prevIDX >= 0) then {
			diag_log format["Removing Handler: %1 in %2", _prevIDX, _prevCtrl];
			_prevCtrl ctrlRemoveEventHandler ["LBSelChanged", _prevIDX];
			uiNameSpace setVariable ["OT_ACEArsenalLBSelChanged", ["",-1]];
		};
		
		private _leftContainer = _arsenalDisplay displayCtrl 13;
		private _handle = 
		[
			_leftContainer,
			"LBSelChanged",
			{(_this + _thisArgs) call OT_fnc_ACEArsenalLeftLbSelChanged},
			[_ammobox]
		] call CBA_fnc_addBISEventHandler;
		diag_log format["UIHandler added: %1 to %2", _handle, _leftContainer];
		
		uiNameSpace setVariable ["OT_ACEArsenalLBSelChanged", [_leftContainer, _handle]];
	},
	_params
] call CBA_fnc_addEventHandlerArgs;

_handle