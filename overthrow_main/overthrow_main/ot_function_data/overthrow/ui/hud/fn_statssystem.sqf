disableSerialization;

OT_HUD_LASTMONEYUPDATEAMOUNT = player getVariable ["money", 0];

OT_PLAYER_CURSOROBJECT = objNull;
OT_PLAYER_LOOKATTARGET = objNull;
OT_PLAYER_LOOKATHUD_MUTEX = false;

private _layer = ["stats"] call bis_fnc_rscLayer;
_layer cutRsc ["OT_statsHUD", "PLAIN", 0, false];

[
	{
		!isNull (uiNameSpace getVariable "OT_statsHUD")
	},
	{
		[OT_fnc_statsSystemLoop, [], 1] call CBA_fnc_waitAndExecute;
		[OT_fnc_lookAtLoop, [], 1] call CBA_fnc_waitAndExecute;
	}
] call CBA_fnc_waitUntilAndExecute;