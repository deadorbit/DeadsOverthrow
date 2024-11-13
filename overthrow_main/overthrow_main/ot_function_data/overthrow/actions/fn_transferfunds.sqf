closeDialog 0;
private _idx = lbCurSel 1500;
inputData = lbData [1500,_idx];
OT_inputHandler = {
	_val = parseNumber(ctrltext 1400);
	_cash = server getVariable ["money",0];
	if(_val > _cash) then {_val = _cash};
	if(_val > 0) then {
		[-_val] call OT_fnc_resistanceFunds;
		_player = objNull;
		private _uid = inputData;
		{
		    if(getplayeruid _x isEqualTo _uid) exitWith {_player = _x};
		}foreach(allplayers);
		
		if !(isNull _player) then {
		
			_pos = getpos _player;
			_cangive = false;
			
			_base = _pos call OT_fnc_nearestBase;
			if !(isNil "_base") then {
				if((_base select 0) distance _pos < 200) then {
					_cangive = true;
				};
			};
			
			_base = _pos call OT_fnc_nearestObjective;
			if !(isNil "_base") then {
				if(((_base select 1) in (server getvariable "NATOabandoned")) && ((_base select 0) distance _pos) < 200) then {
					_cangive = true;
				};
			};
			
			_town = _pos call OT_fnc_nearestTown;
			if(_town in (server getvariable "NATOabandoned")) then {
				_postown = server getVariable _town;
				if((_postown distance _pos) < 350) then {
					_cangive = true;
				};
			};
		
			if (_cangive) then {
				[_val] remoteExec ["OT_fnc_money",_player,false];
				format["Transferred $%1 resistance funds to %2",[_val, 1, 0, true] call CBA_fnc_formatNumber,players_NS getvariable [format["name%1",_uid],"player"]] call OT_fnc_notifyMinor;
			}else{
				format["Receiver must be near an owned base/town to have funds transfered to."] call OT_fnc_notifyMinor;
			};
		}else{
			private _money = [_uid,"money"] call OT_fnc_getOfflinePlayerAttribute;
			[_uid,"money",_money+_val] call OT_fnc_setOfflinePlayerAttribute;
			format["Transferred $%1 resistance funds to %2",[_val, 1, 0, true] call CBA_fnc_formatNumber,players_NS getvariable [format["name%1",_uid],"player"]] call OT_fnc_notifyMinor;
		};
	};
};

["How much to send to this player?",1000] call OT_fnc_inputDialog;
