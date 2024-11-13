params ["_gangid","_gang","_name"];
private _talk = ["Do you want to join the resistance?"];
private _civ = OT_interactingWith;
private _town = _gang select 2;
private _support = [_town] call OT_fnc_support;
private _code = {};
if(_support >= 100) then {
	_talk pushback format["We've heard good things about what you've been doing. I guess we're in"];
	_talk pushback "Good to have you on board";
	_code = {
		params ["_civ","","_gangid"];
		[_civ,_gangid,player] call OT_fnc_gangJoinResistance;
	};
}else{
	_talk pushback format["I dunno, you've been a big help to us but support for your 'resistance' isnt great around here."];
	_code = {
		params ["_civ","_town","_gangid","_gang","_name"];
		_gangoptions = [];
		_gangoptions pushBack [
			"Offer $5000",{
				params ["_civ","_town","_gangid","_gang","_name"];
				private _cash = player getVariable ["money",0];
				if(_cash >= 5000) then {
					[
						player,
						_civ,
						["What if I gave you $5000?",format["Yeah, OK.",_name]],
						{
							params ["_civ","_gangid"];
							[_civ,_gangid,player] call OT_fnc_gangJoinResistance;
							[-5000] call OT_fnc_money;
						},
						[_civ,_gangid]
					] call OT_fnc_doConversation;
				}else{
					"You cannot afford that" call OT_fnc_notifyMinor;
				};
			},
			[_civ,_town,_gangid,_gang,_name]
		];

		_gangoptions pushBack ["Cancel",{}];
		_gangoptions call OT_fnc_playerDecision;
	}
};
[player,_civ,_talk,_code,[_civ,_town,_gangid,_gang,_name]] call OT_fnc_doConversation;