private _civ = OT_interactingWith;
private _talk = ["Not a chance in Hell"];
private _code = {};
[_civ,player,_talk,_code,[]] call OT_fnc_doConversation;
"You need +100 rep to recruit this gang" call OT_fnc_notifyMinor;