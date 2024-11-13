private _civ = OT_interactingWith;
private _talk = ["No."];
private _code = {};
[_civ,player,_talk,_code,[]] call OT_fnc_doConversation;
"You need +40 rep to buy from this gang" call OT_fnc_notifyMinor;