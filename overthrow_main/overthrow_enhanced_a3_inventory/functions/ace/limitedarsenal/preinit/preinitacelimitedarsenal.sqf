[
	"ace_arsenal_leftPanelFilled",
	{
		_thisArgs params ["_ammobox"];
		_this params ["_arsenalDisplay", "_curLeftPanelIDC"];
		
		private _listBox = _arsenalDisplay displayCtrl _curLeftPanelIDC;
		systemChat str(_listBox);
		{
			private _dispise = _x;
			systemChat str(_dispise);
		}foreach(_listBox);
	},
	[];
] call CBA_fnc_addEventHandlerArgs;