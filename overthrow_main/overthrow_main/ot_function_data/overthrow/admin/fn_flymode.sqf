if ( ((call BIS_fnc_admin) isEqualTo 0) && !(isServer) ) exitWith {
	["%1 tried to access an admin command.", name player] call BIS_fnc_logFormat;
};

["%1 accessed an admin command.", name player] call BIS_fnc_logFormat;

player allowdamage false;		
OT_flymode = true;

[] spawn {
	systemChat "Fly mode is enabled, press C to end, you will have 15 seconds before you can take damage again.";
	private _handlerId = "";
	private _keyhandler = {
		params ["_ctrl", "_key", "_shift", "_ctrlKey", "_alt"];
		
		if (_key isEqualTo 46) exitWith {
			OT_flyMode = false;
			[] spawn {
				sleep 15;
				player allowdamage true;
				systemChat "You can now take damage ;)"
			};
			true;
		};
		false
	};
			
	_handlerId = (findDisplay 46) displayAddEventHandler ["KeyDown",_keyhandler];

	while {OT_flymode} do { 
		sleep (1 / diag_fps);
		_pos1 = positionCameraToWorld [0,0,0];
		_pos2 = positionCameraToWorld [0,0,1];
		_dir = _pos1 vectorFromTo _pos2;
		//systemChat str(_dir);
		player setpos (getpos player vectorAdd (_dir vectorMultiply 25));
	};
	
	(findDisplay 46) displayRemoveEventHandler ["KeyDown",_handlerId];
};