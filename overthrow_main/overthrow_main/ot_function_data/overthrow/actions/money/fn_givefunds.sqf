closeDialog 0;
OT_inputHandler = {
	_pos = getpos player;
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
	
	if(_cangive) then {
		_val = parseNumber(ctrltext 1400);
		_cash = player getVariable ["money",0];
		if(_val > _cash) then {_val = _cash};
		if(_val > 0) then {
			[_val] call OT_fnc_resistanceFunds;
			[-_val] call OT_fnc_money;
			format ["%1 donated $%2 to the resistance",name player,[_val, 1, 0, true] call CBA_fnc_formatNumber] remoteExec ["OT_fnc_notifyMinor",0,false];
		};
	}else{
		"You need to be near an owned base/town to transfer funds." call OT_fnc_notifyMinor;
	};
};

["How much to donate to resistance?",player getVariable ["money",100]] spawn OT_fnc_inputDialog;
