private _civ = OT_interactingWith;
[
	player,
	_civ,
	[
		"How can I make some legal money?",
		"Legal money? Where's the fun in that. I guess you could try talking to the store owners and seeing if they have any odd jobs.",
		"Thanks, I guess...",
		"Actaully, I do have one thing in mind. I have a package that needs delivery. It's only a short trip but my friend needs it urgently, if you know what I mean.",
		"I don't think I want to know what you mean, but if you make it worth my while.",
		"Of course, how's $500? Get a vehicle, load the package into it using ACE, and unload near my guy's house."
	],
	(OT_tutorialMissions select 2)
] call OT_fnc_doConversation;