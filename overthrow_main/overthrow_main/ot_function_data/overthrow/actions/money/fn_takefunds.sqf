closeDialog 0;
OT_inputHandler = {
	_val = parseNumber(ctrltext 1400);
	_cash = server getVariable ["money",0];
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
		if(_val > _cash) then {_val = _cash};
		if(_val > 0) then {
			[-_val] call OT_fnc_resistanceFunds;
			[_val] call OT_fnc_money;
		};
	}else{
		"You need to be near an owned base/town to transfer funds." call OT_fnc_notifyMinor;
	};
};

["How much to take from resistance?",1000] call OT_fnc_inputDialog;
