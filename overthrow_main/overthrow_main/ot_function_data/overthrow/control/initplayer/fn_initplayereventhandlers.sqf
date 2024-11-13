

player addEventHandler ["WeaponAssembled",{
	params ["_me","_wpn"];
	private _pos = getPosATL _wpn;
	if(typeof _wpn in OT_staticWeapons) then {
		if(_me call OT_fnc_unitSeen) then {
			_me setCaptive false;
		};
	};
	if(isplayer _me) then {
		[_wpn,getplayeruid player] call OT_fnc_setOwner;
	};
}];

player addEventHandler ["InventoryOpened", {
	params ["","_veh"];
	private _locked = false;
	if !(_veh call OT_fnc_playerIsOwner) then {
		private _isgen = call OT_fnc_playerIsGeneral;
		if(!_isgen && (_veh getVariable ["OT_locked",false])) exitWith {
			hint format["This inventory has been locked by %1",server getVariable "name"+(_veh call OT_fnc_getOwner)];
			_locked = true;
		};
	};
	_locked
}];

player addEventHandler ["GetInMan",{
	params ["_unit","_position","_veh"];

	call OT_fnc_notifyVehicle;

	if(_position == "driver") then {
		if !(_veh call OT_fnc_hasOwner) then {
			[_veh,getplayeruid player] call OT_fnc_setOwner;
			_veh setVariable ["stolen",true,true];
			if((_veh getVariable ["ambient",false]) && (random 100) > 30) then {
				["play", _veh] call BIS_fnc_carAlarm;
				[(getpos player) call OT_fnc_nearestTown,-5,"Stolen vehicle",player] call OT_fnc_support;
				//does anyone hear the alarm?
				_nummil = {side _x isEqualTo west} count (_veh nearObjects ["CAManBase",200]);
				if(_nummil > 0) then {
					player setCaptive false;
					[player] call OT_fnc_revealToNATO;
				};
			};
		}else{
			if !(_veh call OT_fnc_playerIsOwner) then {
				private _isgen = call OT_fnc_playerIsGeneral;
				if(!_isgen && (_veh getVariable ["OT_locked",false])) then {
					moveOut player;
					hint format["This vehicle has been locked by %1",server getVariable "name"+(_veh call OT_fnc_getOwner)];
				};
			};
		};
	}else{
		if (isNull (driver _veh)) then {
			if !(_veh call OT_fnc_playerIsOwner) then {
				private _isgen = call OT_fnc_playerIsGeneral;
				if(!_isgen && (_veh getVariable ["OT_locked",false])) then {
					moveOut player;
					hint format["This vehicle has been locked by %1",server getVariable "name"+(_veh call OT_fnc_getOwner)];
				};
			};
		};
	};
	/*_g = _veh getVariable ["vehgarrison",false];
	if(_g isEqualType "") then {
		_vg = server getVariable format["vehgarrison%1",_g];
		_vg deleteAt (_vg find (typeof _veh));
		server setVariable [format["vehgarrison%1",_g],_vg,false];
		_veh setVariable ["vehgarrison",nil,true];
		{
			_x setCaptive false;
		}foreach(crew _veh);
		[_veh] call OT_fnc_revealToNATO;
	}; */
	_g = _veh getVariable ["airgarrison",false];
	if(_g isEqualType "") then {
		_vg = server getVariable format["airgarrison%1",_g];
		_vg deleteAt (_vg find (typeof _veh));
		server setVariable [format["airgarrison%1",_g],_vg,false];
		_veh setVariable ["airgarrison",nil,true];
		{
			_x setCaptive false;
		}foreach(crew _veh);
		[_veh] call OT_fnc_revealToNATO;
	};
}];

//Set event handlers for ace interations
["ace_cargoLoaded",OT_fnc_cargoLoadedHandler] call CBA_fnc_addEventHandler;
["ace_common_setFuel",OT_fnc_refuelHandler] call CBA_fnc_addEventHandler;
["ace_explosives_place",OT_fnc_explosivesPlacedHandler] call CBA_fnc_addEventHandler;
["ace_repair_setWheelHitPointDamage",OT_fnc_WheelRemovedHandler] call CBA_fnc_addEventHandler;
["acex_fortify_onDeployStart",OT_fnc_onDeployStartHandler] call CBA_fnc_addEventHandler;

player addEventHandler ["Respawn",OT_fnc_respawnHandler];

OT_keyHandlerID = [21, [false, false, false], OT_fnc_keyHandler] call CBA_fnc_addKeyHandler;