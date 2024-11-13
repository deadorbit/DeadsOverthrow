OT_jobsOffered = [];
private _civ = OT_interactingWith;
private _prevTime = _civ getvariable ["lastmission",-300];

if((serverTime < (_prevTime + 300)) && !(OT_debugMode)) exitwith {
	private _talk = ["I still don't have any new jobs, check back in a few minutes"];
	private _code = {};
	[_civ, player, _talk, _code, []] call OT_fnc_doConversation;
};

private _town = (getpos player) call OT_fnc_nearestTown;
private _standing = [_town] call OT_fnc_support;
if(_standing < 0) then {
	format["Resistance Support in this town is too low (%1)",_support] call OT_fnc_notifyMinor;
}else{
	private _id = player call OT_fnc_playerMID;
	_civ setvariable ["lastmission", serverTime];
	call OT_fnc_requestJobShop;
};