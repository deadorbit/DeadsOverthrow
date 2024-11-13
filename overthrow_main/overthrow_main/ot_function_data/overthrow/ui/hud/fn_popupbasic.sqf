/* ----------------------------------------------------------------------------
Function: OT_fnc_popupbasic

Description:
    - 	A function that makes an animated popup appear on the bottom left corner of the players screen
	and dissapears after a certain amount of time or a certain condition is met. Only 1 popupbasic can
	be shown at once.

Parameters:
	-	_headerText(String): 	structuredText that by default appears in bold and centered in the smaller, upper box.
	-	_bodyText(String): 		structuredText that fills the lower text box.

Optional:
	-	_code(Code): 			Default: {[false,""]} 	A string of code that must returns an array: [Boolean,String].
			The first index is used to check if the popup should be closed, if true, the script stops repeating and the pop up closes.
			The second index is used to set the StructuredText of the popup body, leave a blank string "" to leave the text unchanged.
			Code is unschedlued, attempting to call scheudled code inside of it may cause problems with termination.
	-	_codeparams(Array)		Default: []				An array of any dataset used as the parameters when the function is called.
	-	_overwrite(boolean):	Default: false	 		If this popup will overwrite and end the current popup (if one exists).
	-	_reshowOnDeath(boolean)	Default: false			If the popup will be redisplayed if the player is respawned (and their HUD is refreshed).
	-	_maxTime(integer)		Default: 30				The maximum amount of time in seconds the popup will be shown if the condition is never met. -1 to have it last until the condition is met (or the popup is overwritten).

Example:
	Simple:
		["Hello!", "How are you?", {[false,""]}, [], true, true, 15] spawn OT_fnc_popupbasic;
	Advanced:
		private _startingCount = {((side _x) isEqualTo East) && alive _x} count allUnits;
		private _bodyText = format["<t align='center'>Kill all the Opfor!<br/>Opfor Remaining: <t color='#ff0000'>%1/%1</t></t>",_startingCount];
		private _code = {
			params["_startingCount"];
			private _enemies = {((side _x) isEqualTo East) && alive _x} count allUnits;
			private _bodyText = format["<t align='center'>Kill all the Opfor!<br/>Opfor Remaining: <t color='#ff0000'>%1/%2</t></t>",_enemies,_startingCount];
			private _condition = (_enemies isEqualTo 0);
			[_condition,_bodyText]
		};
		private _codeparams = [_startingCount];
		["Kill Mission", _bodyText, _code, _codeparams, true, true, -1] spawn OT_fnc_popupbasic;
Returns:
    - Nothing

Author:
    deadorbit
---------------------------------------------------------------------------- */
params["_headerText", "_bodyText", ["_code", {[false, ""]}], ["_codeparams", []], ["_overwrite", false], ["_reshowOnDeath", false], ["_maxTime", 30]];
if (!canSuspend) exitWith {};

//First run of popup system
if(isNil "OT_current_popup") then {OT_current_popup = []};
//Popup spot is occupied and shouldnt be overwritten, or the script was called by mistake
private _overwriting = false;
if(!(OT_current_popup isEqualTo [])) then {
	if(!_overwrite) exitWith {};
	//Popup should be created and is overwritting an old one
	_overwriting = true;
	systemchat "Overwriting old Popup...";
};

systemchat "Creating Popup...";

private _popupLayer = format["popup%1",round(diag_tickTime*10)];
//Use this to track a "termination" request. I.e: the popup has been overwritten, or to recreate popup after death
private _currentPopup = [_headerText, _bodyText, _code, _codeparams, _overwrite, _reshowOnDeath, _maxTime,_popupLayer];
//Additional value is for switching popups
_currentPopup = _currentPopup + [false];
OT_current_popup = _currentPopup;

if (_overwriting) then {
	private _timer = 15;
	//Wait for the old popup to gracefully exit (hopefully)
	systemchat "Waiting For Old Popup to close";
	waitUntil{uiSleep 1; _timer = _timer - 1; !(alive player) || (_timer isEqualTo 0) || (OT_current_popup select 8)};
};

//Spawn popup script for error handling
private _handle = _currentPopup spawn {
	params["_headerText", "_bodyText", "_code", "_codeparams", "_overwrite", "_reshowOnDeath", "_maxTime", "_popupLayer"];
	disableSerialization;
	
	_popupLayer cutRsc ["OT_RscPopupBasic","PLAIN",0,false];
	//Wait for HUD to finish preload
	private _timeout = 60;
	waitUntil{uiSleep 1; _timeout = _timeout - 1; (_timeout < 1 || !(uiNamespace getVariable ["OT_RscPopupBasic",-1] isEqualTo -1))};

	//If the UI fails to load for some reason, just forgot it
	if (_timeout < 1) exitWith {
		OT_current_popup = [];
		_popupLayer cutText ["","PLAIN"];
		(format["Popup %1 failed to load",_headerText]) call BIS_fnc_log;
	};
	
	private _popupDisplay 	= uiNamespace getVariable "OT_RscPopupBasic";
	private _ctrlGroup 		= _popupDisplay displayCtrl 100;
	private _header 		= _ctrlGroup controlsGroupCtrl 10;
	private _body 			= _ctrlGroup controlsGroupCtrl 20;
	
	_header ctrlSetStructuredText parseText _headerText;
	_body ctrlSetStructuredText parseText _bodyText;
	//Play animation for popup to appear
	private _handle = [_ctrlGroup,"on","right",1] spawn OT_fnc_controlEdgeSlide;
	//Wait for animation to finish playing
	waitUntil{uiSleep 0.5; isNull _handle};
	systemChat "Pop up in place!";
	
	//Precompile the code to be ran
	//Variable that holds values returned from code
	private _data = [false,""];
	
	private _condition = false;
	private _text = "";
	private _timer = _maxTime;
	
	systemChat "Running code";
	
	//De'Morgan's Law my beloved
	while{!(_condition || _timer isEqualTo 0)} do {
		uiSleep 1;
		
		_data = _codeparams call _code;
		_condition = _data select 0;
		_text = _data select 1;
		
		if (!(_text isEqualTo "")) then {
			_body ctrlSetStructuredText (parseText _text);
		};
		
		_timer = _timer - 1;
	};
	
	systemChat "Condition finished";
};

//Wait for popup to be overwritten, player to have died, or for popup to finish its job
waitUntil{uiSleep 1; !(OT_current_popup isEqualTo _currentPopup) || !(alive player) || (isNull _handle)};

//Script termination request
if(!(OT_current_popup isEqualTo _currentPopup) || !(alive player)) then {
	terminate _handle;
	(format["Popup %1 has been terminated",_headerText]) call BIS_fnc_log;
	//If the reason was due to player's death, remove the hud just in case
	if (!(alive player)) exitWith {
		_popupLayer cutText ["","PLAIN"];
	};
};

//Assume popup is to be removed at this point
private _popupDisplay 	= uiNamespace getVariable "OT_RscPopupBasic";
private _ctrlGroup 		= _popupDisplay displayCtrl 100;

if (!(_ctrlGroup isEqualTo controlNull)) then {
	_handle = [_ctrlGroup,"off","right",1] spawn OT_fnc_controlEdgeSlide;
	waitUntil{uiSleep 1; isNull _handle};
};

_popupLayer cutText ["","PLAIN"];

if(OT_current_popup isEqualTo _currentPopup) then {
	OT_current_popup = [];
}else{
	OT_current_popup set [8, true];
};

systemChat "Popup removed";
