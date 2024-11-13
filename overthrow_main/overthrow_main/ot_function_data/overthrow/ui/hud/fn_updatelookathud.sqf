disableSerialization;

OT_PLAYER_LOOKATHUD_MUTEX = true;

private _layer = ["lookAt"] call BIS_fnc_rscLayer;
private _target = OT_PLAYER_LOOKATTARGET;
private _curHUD = uiNameSpace getVariable ["OT_talkToHUD", controlNull];

private _HUDExists = (_curHUD isNotEqualTo controlNull);
private _isValidTarget = (_target isNotEqualTo objNull);

if (_HUDExists) then {
	private _lookAtGroup = _curHUD displayCtrl 101;
	
	if (_isValidTarget) then {
		//idk
	}else{
		//Close
		[_lookAtGroup, false, 1, 0.25] call DEDF_fnc_ctrlFadeSimple;
		//Pretend as if it dosnt exist
		uiNameSpace setVariable ["OT_talkToHUD", controlNull];
	};
	
	OT_PLAYER_LOOKATHUD_MUTEX = false;
}else{
	//Create and check each frame for HUD to load
	if (_isValidTarget) then {
		OT_PLAYER_LOOKATHUD_MUTEX = false;
		_layer cutRsc ["Default", "PLAIN"];
		_layer cutRsc ["OT_talkToHUD", "PLAIN", 0, false];

		[
			{
				!isNull (uiNameSpace getVariable "OT_talkToHUD")
			},
			{
				[] call OT_fnc_updateLookAtHUD;
			}
		] call CBA_fnc_waitUntilAndExecute;
	}else{
		//Hud is closed and no new data, so ignore
		OT_PLAYER_LOOKATHUD_MUTEX = false;
	};
};