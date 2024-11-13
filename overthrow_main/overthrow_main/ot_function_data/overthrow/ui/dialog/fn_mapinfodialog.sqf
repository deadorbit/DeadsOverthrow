
if (visibleMap) exitWith {};
if (!isNil "OT_MapSingleClickEHId" || !isNil "OT_MapEHId") exitWith {};

hint "Click on a location";

OT_MapSingleClickEHId = addMissionEventHandler["MapSingleClick", {
	params ["", "_pos", "_alt", "_shift"];
	private _loc = _pos call OT_fnc_nearestLocation;
	private _txt = "";
	_loc call {
		params ["_name","_type","_data"];
		if (_type == "Town") exitWith {
			private _town = _name;
			private _pop = server getVariable format["population%1",_town];
			private _stability = server getVariable format["stability%1",_town];
			private _abandon = "Under NATO Control";
			if(_town in (server getVariable ["NATOabandoned",[]])) then {
				if(_stability < 50) then {
					_abandon = "Anarchy";
				}else{
					_abandon = "Under Resistance Control";
				};
			};
			private _rep = [_town] call OT_fnc_support;
			private _plusmin = "";
			if(_rep > -1) then {
				_plusmin = "+";
			};
			if (_town == OT_mainCapital) then {
				_txt = format [
					"<t size='1.2' color='#222222'>%1</t><br/><t size='0.5' color='#222222'>Status: %7</t><br/><t size='0.5' color='#222222'>Population: %2</t><br/><t size='0.5' color='#222222'>Stability: %3%4</t><br/><t size='0.5' color='#222222'>Resistance Support: %5%6</t><br/><t size='0.5' color='#222222'>Capital",
					_town,
					[_pop, 1, 0, true] call CBA_fnc_formatNumber,
					_stability,
					"%",
					_plusmin,
					_rep,
					_abandon
				];
			}else{
				_txt = format [
					"<t size='1.2' color='#222222'>%1</t><br/><t size='0.5' color='#222222'>Status: %7</t><br/><t size='0.5' color='#222222'>Population: %2</t><br/><t size='0.5' color='#222222'>Stability: %3%4</t><br/><t size='0.5' color='#222222'>Resistance Support: %5%6</t>",
					_town,
					[_pop, 1, 0, true] call CBA_fnc_formatNumber,
					_stability,
					"%",
					_plusmin,
					_rep,
					_abandon
				];
			};
		};
		if (_type in ["Objective","Radio Tower","Airport"]) exitWith {
			private _abandon = "Under NATO Control";
			if(_name in (server getVariable ["NATOabandoned",[]])) then {
				_abandon = "Under Resistance Control";
				_txt = format [
					"<t size='1.2' color='#222222'>%1</t><br/><t size='0.5' color='#222222'>Status: %2</t>",
					_name,
					_abandon
				];
			}else{
				if((_type == "Objective") || (_type == "Airport")) then {//This is not an optimal way to do this but im tired
					_defense = (_data select 2);
					_txt = format [
						"<t size='1.2' color='#222222'>%1</t><br/><t size='0.5' color='#222222'>Status: %2</t><br/><t size='0.5' color='#222222'>Defensive Strength: %3</t>",
						_name,
						_abandon,
						_defense
					];
				}else{
					_txt = format [
						"<t size='1.2' color='#222222'>%1</t><br/><t size='0.5' color='#222222'>Status: %2</t>",
						_name,
						_abandon
					];
				};
			};
		};
		if (_type == "Faction") exitWith {
			private _faction = _name;
			private _name = getText (configFile >> "cfgFactionClasses" >> _faction >> "displayName");
			private _standing = server getVariable [format["standing%1",_faction],0];
			_txt = format [
				"<t size='1.2' color='#222222'>%1</t><br/><t size='0.5' color='#222222'>Standing: %2</t>",
				_name,
				_standing
			];
		};
		if (_type == "Business") exitWith {
			private _target = "";
			private _input = "None";
			private _output = "Money";
			
			{
				if ((_x select 1) == _name) exitWith {_target = _x};
			}forEach OT_economicData;
			
			private _abandon = "Inactive";
			if(_name in (server getVariable ["GEURowned",[]])) then {
				_abandon = "Owned";
			};
			
			if ((count _target) isEqualTo 4) then {
				private _inputA = _target select 2;
				private _outputA = _target select 3;
				if !(_inputA isEqualTo "") then {
					_input = getText (configfile >> "CfgWeapons" >> _inputA >> "displayName");
				}else{
					_input = "None, improved with fertilizer"
				};
				_output = getText (configfile >> "CfgWeapons" >> _outputA >> "displayName");
			}else{
				if ((count _target) isEqualTo 5) then { 
					private _inputA = _target select 2;
					private _inputB = _target select 3;
					private _outputA = _target select 4;
					_inputA = getText (configfile >> "CfgWeapons" >> _inputA >> "displayName");
					_inputB = getText (configfile >> "CfgWeapons" >> _inputB >> "displayName");
					_output = getText (configfile >> "CfgWeapons" >> _outputA >> "displayName");
					_input = format ["%1, %2",_inputA,_inputB];
				};
			};
			
			
			_txt = format [
				"<t size='1.2' color='#222222'>%1</t><br/><t size='0.5' color='#222222'>Status: %2</t><br/><t size='0.5' color='#222222'>Input: %3</t><br/><t size='0.5' color='#222222'>Output: %4</t>",
				_name,
				_abandon,
				_input,
				_output
			];
		};
	};
	[_txt, [safeZoneX + (0.8 * safeZoneW), (0.2 * safeZoneW)], 0.5, 10, 0, 0, 2] call OT_fnc_dynamicText;
}];

OT_MapEHId = addMissionEventHandler["Map", {
	params ["_mapIsOpened", "_mapIsForced"];
	if (!_mapIsOpened) then {
		diag_log "Removing OT_MapSingleClick";
		if (isNil "OT_MapSingleClickEHId" || isNil "OT_MapEHId") exitWith {};
		removeMissionEventHandler ["MapSingleClick", OT_MapSingleClickEHId];
		removeMissionEventHandler ["Map", OT_MapEHId];
		OT_MapSingleClickEHId = nil;
		OT_MapEHId = nil;
	};
}];

openMap true;
