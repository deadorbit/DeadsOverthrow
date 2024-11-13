private _civ = OT_interactingWith;
private _town = (getpos player) call OT_fnc_nearestTown;
private _talk = ["Do you know any gangs nearby?"];
//find nearest gang
private _gangid = -1;
private _gang = [];
private _name = "";
private _revealed = server getVariable ["revealedGangs",[]];
{
	_x params ["_pos","_name"];
	private _gangs = OT_civilians getVariable [format["gangs%1",_name],[]];
	private _found = false;
    if(count _gangs > 0) then {
		if !((_gangs select 0) in _revealed) then {
			_gangid = _gangs select 0;
			_found = true
		};
	};
	if(_found) exitWith {};
}foreach([OT_townData,[],{(_x select 0) distance2D player},"ASCEND",{((_x select 0) distance2D player) < 3000}] call BIS_fnc_SortBy);

private _code = {

};

if(_gangid > -1) then {
	_gang = OT_civilians getVariable [format["gang%1",_gangid],[]];
	_name = _gang select 8;
	private _support = [_town] call OT_fnc_support;
	if(_support > 50) then {
		_talk pushback format["I know of a gang called %1, I'll mark their camp on your map, maybe they'll have some jobs for you",_name];
		_talk pushback "Thanks!";
		_talk pushback "Anything for the resistance";
		_code = {
			params ["_town","_gangid","_gang"];
			private _town = (getpos player) call OT_fnc_nearestTown;
            _mrkid = format["gang%1",_town];
            _mrk = createMarker [_mrkid, _gang select 4];
            _mrkid setMarkerType "ot_Camp";
            _mrkid setMarkerColor "colorOPFOR";
			private _revealed = server getVariable ["revealedGangs",[]];
            _revealed pushback _gangid;
			server setVariable ["revealedGangs",_revealed,true];
		};
	}else{
		_talk pushback format["I do, but I doubt they'd like it if I told you where they were",_name];
		_code = {
			params ["_town","_gangid","_gang","_name"];
			_gangoptions = [];
			_gangoptions pushBack [
				"Offer $500",{
					params ["_town","_gangid","_gang","_name"];
					private _civ = OT_interactingWith;
					private _cash = player getVariable ["money",0];
					if(_cash >= 500) then {
						[
							player,
							_civ,
							["What if I gave you $500?",format["Yeah, OK. I know of a gang called %1, I'll mark their camp on your map, maybe they'll have some jobs for you",_name]],
							{
								params ["_town","_gangid","_gang","_name"];
								private _town = (getpos player) call OT_fnc_nearestTown;
								[-500] call OT_fnc_money;
								_mrkid = format["gang%1",_town];
		                        _mrk = createMarker [_mrkid, _gang select 4];
		                        _mrkid setMarkerType "ot_Camp";
		                        _mrkid setMarkerColor "colorOPFOR";
								private _revealed = server getVariable ["revealedGangs",[]];
		                        _revealed pushback _gangid;
								server setVariable ["revealedGangs",_revealed,true];
							},
							[_town,_gangid,_gang,_name]
						] call OT_fnc_doConversation;
					}else{
						"You cannot afford that" call OT_fnc_notifyMinor;
					};
				},
				[_town,_gangid,_gang,_name]
			];

			_gangoptions pushBack ["Cancel",{}];
			_gangoptions call OT_fnc_playerDecision;
		}
	};
}else{
	_talk pushback "Sorry, but I don't know about any gangs near here";
	_code = {};
};

[
	player,
	_civ,
	_talk,
	_code,
	[_town,_gangid,_gang,_name]
] call OT_fnc_doConversation;