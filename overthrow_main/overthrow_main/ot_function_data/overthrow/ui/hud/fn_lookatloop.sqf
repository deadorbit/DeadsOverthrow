if !(alive player) exitWith {};

getCursorObjectParams params ["_cTarget", "_selections"];
//Store incase its needed for another script
OT_PLAYER_CURSOROBJECT = _cTarget;

if !(OT_PLAYER_LOOKATTARGET isEqualTo _cTarget || OT_PLAYER_LOOKATHUD_MUTEX) then {
	private _distance = player distance _cTarget;
	switch (true) do {
		//Short Circuit to prevent null error
		case (isNull _cTarget) : {
			OT_PLAYER_LOOKATTARGET = objNull;
			[] call OT_fnc_updateLookAtHUD;
		};
		case ((_distance < 7) && (_cTarget isKindOf "CAManBase") && (alive _cTarget) && !((side _cTarget) isEqualTo west)) : {
			OT_PLAYER_LOOKATTARGET = _cTarget;
			[] call OT_fnc_updateLookAtHUD;
		};
		default {
			OT_PLAYER_LOOKATTARGET = objNull;
			[] call OT_fnc_updateLookAtHUD;
		};
	};
};

[OT_fnc_lookAtLoop, _this, 0.5] call CBA_fnc_waitAndExecute;