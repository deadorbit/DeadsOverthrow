disableSerialization;

params [["_unit", player]];
if !(alive player) exitWith {};

private _hudRsc = (uiNameSpace getVariable "OT_statsHUD");
//Text defaults
private _moneyTxt = "$ 0";
private _warningTxt = "CLEAN";
private _seenData = [[0.9,0.9,0.9,0], OT_IMAGE_EYECLOSED];

private _moneyLabel = _hudRsc displayCtrl 101;
private _seenBGLabel = _hudRsc displayCtrl 102;
private _seenLabel = _hudRsc displayCtrl 1021;
private _warningLabel = _hudRsc displayCtrl 103;

private _money = [player getVariable ["money",0], 1, 0, true] call CBA_fnc_formatNumber;
_moneyTxt = "$ " + (["0,000,000,000,000", _money] call OT_fnc_formatOverlayedString);
_moneyLabel ctrlSetStructuredText (parseText _moneyTxt);

_seenData = [] call OT_fnc_playerSeenStatus;
_seenData params ["_seenCol", "_seenImg"];

_seenBGLabel ctrlSetText _seenImg;
_seenLabel ctrlSetText OT_IMAGE_EYE;
_seenLabel ctrlSetTextColor _seenCol;

_warningTxt = [] call OT_fnc_playerGearStatus;
_warningLabel ctrlSetStructuredText (parseText _warningTxt);


private _qrf = "";
private _attacking = server getVariable ["NATOattacking", OT_nation];
//Battle is starting
/*
if(!isNil "OT_QRFstart" && (time - OT_QRFstart) < 600) then {
	/*
	IF (IS FIRST UPDATE) THEN {
		SHOW COOL MESSAGE WARNING _unitS
		[[
			["CAMP ROGAIN,", "<t align = 'center' shadow = '1' size = '0.7' font='PuristaBold'>%1</t>"],
			["RESUPPLY POINT", "<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"],
			["10 MINUTES LATER ...", "<t align = 'center' shadow = '1' size = '1.0'>%1</t>", 15]
		]] spawn BIS_fnc_typeText;
	}
	*/
/*
	private _secs = 600 - round(time - OT_QRFstart);
	private _mins = 0;
	if(_secs > 59) then {
		_mins = floor(_secs / 60);
		_secs = round(_secs % 60);
	};
	if(_mins < 10) then {_mins = format["0%1",_mins]};
	if(_secs < 10) then {_secs = format["0%1",_secs]};
	_qrf = format["<t size='0.8'>Battle of %1 | </t>Starting: (%2:%3)",_attacking,_mins,_secs];
	//TODO: Battle Count, I.e 1st Battle of whatever
};

if(!isNil "OT_QRFstart" && (time - OT_QRFstart) > 600) then {
	private _progress = server getVariable ["QRFprogress",0];
	if(_progress > 0) then {
		_qrf = format["<t size='0.8'>Battle of %1 | </t><t color='#5D8AA8'>(%2%3)</t>",_attacking,round (_progress * 100),'%'];
	}else{
		_qrf = format["<t size='0.8'>Battle of %1 | </t><t color='#008000'>(%2%3)</t>",_attacking,round abs (_progress * 100),'%'];
	}
};
*/

/*
private _currentMoney = __unit getVariable ["money",0];
if (OT_HUD_LASTMONEYUPDATEAMOUNT isNotEqualTo _currentMoney) then {
	//Check if animation should be played (I.e no displays are open, _unit is not unconscious)
	//If true, play money increase animation and sound effect
};
*/

/*
private _txt = format [
	"<t size='0.8' shadow='2' align='center'>$%1 | %2 | %3<br/>%4</t>",
	[__unit getVariable ["money",0], 1, 0, true] call CBA_fnc_formatNumber,
	_seen,
	_wanted,
	_qrf
];

private _setText = (uiNameSpace getVariable "OT_statsHUD") displayCtrl 1001;
_setText ctrlSetStructuredText (parseText format ["%1", _txt]);
_setText ctrlCommit 0;
*/

[OT_fnc_statsSystemLoop, _this, 1] call CBA_fnc_waitAndExecute;
