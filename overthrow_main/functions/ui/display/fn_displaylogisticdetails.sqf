disableSerialization;
params ["_ctrl","_index"];

_textctrl = (findDisplay 8001) displayCtrl 1100;
private _netId = _ctrl lbData _index;
private _veh = _netId call BIS_fnc_objectFromNetId;
private _cls = "";

if(!isnil{_veh}) then {
	_cls = typeof _veh;
};

if(_cls iskindof "AllVehicles" || _cls iskindof "ThingX") then {
	private _pic = getText(configFile >> "cfgVehicles" >> _cls >> "editorPreview");
	private _name = _cls call OT_fnc_vehicleGetName;

	private _owner = players_NS getVariable ("name"+(_veh call OT_fnc_getOwner));
	if(isNil "_owner") then {_owner = "Someone"};
	if(!isNil "_pic" && !(_pic isEqualTo "")) then {
		ctrlSetText [1200,_pic];
	};
	private _txt = "<br/>";
	private _near = (getpos _veh) call OT_fnc_nearestTown;
	if(!(_cls iskindof "ReammoBox_F" || _cls isKindOf "Cargo_base_F" || _cls isKindOf OT_item_Safe)) then {
		private _fuel = round((fuel _veh) * 100);
		private _near = (getpos _veh) call OT_fnc_nearestTown;

		private _loadPounds = (loadAbs _veh) / 10;
		private _loadKg = 0;
		if(_loadPounds > 0) then {
			_loadKg = (_loadPounds / 2.205) toFixed 1;
		};

		//get wheel state
		private _wheelsNeeded = 0;
		private _tracksNeeded = 0;
		private _hasWheels = false;
		private _hasTracks = false;
		private _engineOut = false;
		private _fuelTankOut = false;
		private _rotorOutV = false;
		private _rotorOutH = false;
		private _gunOut = false;
		{
			private _hit = configName _x;
			if((_hit find "Wheel") > -1) then {
				_hasWheels = true;
				if (_veh getHitPointDamage _hit >= 1) then {
					_wheelsNeeded = _wheelsNeeded + 1;
				};
			};
			if((_hit find "Track") > -1) then {
				_hasTracks = true;
				if (_veh getHitPointDamage _hit >= 1) then {
					_tracksNeeded = _tracksNeeded + 1;
				};
			};
			if(_hit isEqualTo "HitEngine") then {
				if (_veh getHitPointDamage _hit >= 1) then {
					_engineOut = true;
				};
			};
			if(_hit isEqualTo "HitFuel") then {
				if (_veh getHitPointDamage _hit >= 1) then {
					_fuelTankOut = true;
				};
			};
			if(_hit isEqualTo "HitVRotor") then {
				if (_veh getHitPointDamage _hit >= 1) then {
					_rotorOutV = true;
				};
			};
			if(_hit isEqualTo "HitHRotor") then {
				if (_veh getHitPointDamage _hit >= 1) then {
					_rotorOutH = true;
				};
			};
			if(_hit isEqualTo "HitGun") then {
				if (_veh getHitPointDamage _hit >= 1) then {
					_gunOut = true;
				};
			};
		} forEach ("true" configClasses (configfile >> "CfgVehicles" >> _cls >> "HitPoints"));

		if !(_cls isKindOf "StaticWeapon") then {
			_txt = format["%1Fuel: %2%3<br/>",_txt,_fuel,"%"];
			_txt = format["%1Load: %2kg<br/>",_txt,_loadKg];
			if(_hasWheels) then {
				if(_wheelsNeeded isEqualTo 0) then {
					_txt = format["%1All wheels OK<br/>",_txt];
				}else{
					_txt = format["%1Need %2 wheels<br/>",_txt,_wheelsNeeded];
				};
			};

			if(_hasTracks) then {
				if(_tracksNeeded isEqualTo 0) then {
					_txt = format["%1All tracks OK<br/>",_txt];
				}else{
					_txt = format["%1Need %2 tracks<br/>",_txt,_tracksNeeded];
				};
			};

			if(_engineOut) then {
				_txt = format["%1Engine disabled<br/>",_txt];
			};

			if(_fuelTankOut) then {
				_txt = format["%1Fuel tank ruptured<br/>",_txt];
			};

			if(_rotorOutV) then {
				_txt = format["%1Main rotor disabled<br/>",_txt];
			};
			if(_rotorOutH) then {
				_txt = format["%1Tail rotor disabled<br/>",_txt];
			};
		};

		if(_gunOut) then {
			_txt = format["%1Gun disabled<br/>",_txt];
		};

		private _totalAmmo = 0;
		private _turrets = "!((configName _x) select [0,5] == ""Cargo"") && !((count getArray (_x >> ""magazines"")) isEqualTo 0)" configClasses (configfile >> "CfgVehicles" >> _cls >> "Turrets");
		private _hasAmmo = (count _turrets) > 0;
		private _ammotxt = "";
		{
			_x params ["_ammocls","_num"];
			_totalAmmo = _totalAmmo + _num;
			_ammotxt = format["%1%2 x %3<br/>",_ammotxt,_num,_ammocls call OT_fnc_magazineGetName];
		}foreach(magazinesAmmo _veh);

		if(_totalAmmo > 0) then {
			_txt = format["%1<br/>Ammo:<br/>%2",_txt,_ammotxt];
		}else{
			if(_hasAmmo) then {
				_txt = format["%1<br/>Out Of Ammo<br/>",_txt];
			};
		};

		_textctrl = (findDisplay 8001) displayCtrl 1100;

		_textctrl ctrlSetStructuredText parseText format["
			<t align='center' size='1.2'>%1</t><br/>
			<t align='center' size='1'>Owner: %2</t><br/>
			<t align='center' size='1'>Near: %4</t><br/>
			<t align='left' size='0.7'>%3</t>
		",_name,_owner,_txt,_near];
		
		if (((_veh call OT_fnc_getOwner) == (getplayeruid player)) || (call OT_fnc_playerIsGeneral)) then {
			ctrlShow [1602, true];
		}else{
			ctrlShow [1602, false];
		};
	}else{
		ctrlShow [1602, false];
		private _near = (getpos _veh) call OT_fnc_nearestTown;
		if (_veh getvariable["ace_cargo_customname",""] != "") then {
			_name = format["%1 (%2)",_veh getvariable "ace_cargo_customname",_name];
		};
		private _loadPounds = (loadAbs _veh) / 10;
		private _loadKg = 0;
		if(_loadPounds > 0) then {
			_loadKg = (_loadPounds / 2.205) toFixed 1;
		};
		
		_txt = format["%1Load: %2kg<br/>",_txt,_loadKg];
		
		private _money = 0;
		if(_cls iskindof OT_item_Safe) then {
			_money = _veh getVariable ["money",0];
			_txt = format["Money Stored: %1",_money];
		};
		
		_textctrl = (findDisplay 8001) displayCtrl 1100;

		_textctrl ctrlSetStructuredText parseText format["
			<t align='center' size='1.2'>%1</t><br/>
			<t align='center' size='1'>Owner: %2</t><br/>
			<t align='center' size='1'>Near: %4</t><br/>
			<t align='left' size='0.7'>%3</t>
		",_name,_owner,_txt,_near];
	};
}else{
	//Town
	private _town = _ctrl lbData _index;
	private _importance = "Village";
	private _garrison = "Light QRF Garrison";
	private _population = server getVariable format["population%1",_town];
	private _stability = server getVariable [format["stability%1",_town],100];
	if(_population >= 100) then {
		_garrison = "Large QRF Garrison";
		_importance = "Town";
	};
	if(_town in OT_capitals) then {
		_importance = "Regional Capital";
		_garrison = "Heavy QRF Garrison";
	};
	if(_town in OT_mainCapital) then {
		_importance = "Capital";
		_garrison = "Overwhelming QRF Garrison";
	};
	_textctrl ctrlSetStructuredText parseText format["
		<t align='center' size='1.5'>%1</t><br/>
		<t align='center' size='1.2'>%2</t><br/>
		<t align='center' size='1'>%3</t><br/>
		<t align='center' size='0.7'>Population: %4| Stability: %5</t><br/>",
		_town,_importance,_garrison,_population,_stability
	];
};