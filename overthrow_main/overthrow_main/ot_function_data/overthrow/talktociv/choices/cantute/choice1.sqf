OT_jobsOffered = [];
private _civ = OT_interactingWith;
private _prevTime = _civ getvariable ["lastmission",-300];

if((serverTime < (_prevTime + 300)) && !(OT_debugMode)) exitwith {
	private _talk = ["I still don't have any new jobs, check back in a few minutes"];
	private _code = {};
	[_civ, player, _talk, _code, []] call OT_fnc_doConversation;
};

_civ setvariable ["lastmission", serverTime];
call OT_fnc_requestJobResistance;