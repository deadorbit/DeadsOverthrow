private _civ = OT_interactingWith;
[
	player,
	_civ,
	[
		"You sell Ganja right?",
		"I sure do, wanna blaze it?",
		"Not right now, I need some cash first",
		"Oh OK, sell it to the civilians then, I know a few trusted buyers, just make sure not to get near the feds. They can sniff this stuff out in a second."
	],
	(OT_tutorialMissions select 1)
] call OT_fnc_doConversation;