"Select a location" call OT_fnc_notifyMinor;
_ferryoptions = [];
{
	private _p = markerPos(_x);
	private _t = _p call OT_fnc_nearestTown;
	private _dist = (player distance _p);
	private _cost = floor(_dist * 0.005);
	private _go = {
		_this spawn {
			private _destpos = _this;
			player setVariable ["OT_ferryDestination",_destpos,false];
			private _desttown = _destpos call OT_fnc_nearestTown;
			private _pos = (getpos player) findEmptyPosition [10,100,OT_vehType_ferry];
			if (count _pos isEqualTo 0) exitWith {
				"Not enough space, please clear an area nearby" call OT_fnc_notifyMinor;
			};
			private _cost = floor((player distance _destpos) * 0.005);
			player setVariable ["OT_ferryCost",_cost,false];
			_money = player getVariable ["money",0];
			if(_money < _cost) then {
				"You cannot afford that!" call OT_fnc_notifyMinor
			}else{
				[-_cost] call OT_fnc_money;
				_veh = OT_vehType_ferry createVehicle _pos;

				clearWeaponCargoGlobal _veh;
				clearMagazineCargoGlobal _veh;
				clearBackpackCargoGlobal _veh;
				clearItemCargoGlobal _veh;

				private _dir = 0;
				while {!(surfaceIsWater ([_pos,800,_dir] call BIS_fnc_relPos)) && _dir < 360} do {
					_dir = _dir + 45;
				};

				_veh setDir _dir;
				player reveal _veh;
				createVehicleCrew _veh;
				_veh lockDriver true;
				private _driver = driver _veh;
				player moveInCargo _veh;

				_driver globalchat format["Departing for %1 in 10 seconds",_desttown];

				sleep 5;
				_driver globalchat format["Departing for %1 in 5 seconds",_desttown];
				sleep 5;

				private _g = group (driver _veh);
				private _wp = _g addWaypoint [_destpos,50];
				_wp setWaypointType "MOVE";
				_wp setWaypointSpeed "NORMAL";

				_veh addEventHandler ["GetOut", {
					params ["_vehicle","_position","_unit"];
					_unit setVariable ["OT_ferryDestination",[],false];
				}];

				systemChat format["Departing for %1, press Y to skip (-$%2)",_desttown,_cost];

				waitUntil {
					!alive player
					|| !alive _veh
					|| !alive _driver
					|| (vehicle player isEqualTo player)
					|| (player distance _destpos < 80)
				};

				if(vehicle player isEqualTo _veh && alive _driver) then {
					_driver globalchat format["We've arrived in %1, enjoy your stay",_desttown];
				};
				sleep 15;
				if(vehicle player isEqualTo _veh && alive _driver) then {
					moveOut player;
					_driver globalchat "Alright, bye";
				};
				if(random 100 > 90) then {
					[player] spawn OT_fnc_NATOsearch;
				};
				if(!alive _driver) exitWith{};
				_timeout = time + 800;

				_wp = _g addWaypoint [_pos,0];
				_wp setWaypointType "MOVE";
				_wp setWaypointSpeed "NORMAL";

				waitUntil {_veh distance _pos < 100 || time > _timeout};
				if(!alive _driver) exitWith{};

				deleteVehicle _driver;
				deleteVehicle _veh;
			};
		};
	};
	if(_dist > 1000) then {
		_ferryoptions pushback [format["%1 (-$%2)",_t,_cost],_go,_p];
	};
}foreach(OT_ferryDestinations);
_ferryoptions call OT_fnc_playerDecision;