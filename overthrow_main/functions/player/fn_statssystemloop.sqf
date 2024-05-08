params ["_player"];
if !(alive _player) exitWith {};

private _wanted = "CLEAN";
if !(captive _player) then {
	private _hiding = _player getVariable ["OT_hiding", 0];
	if((_hiding > 0) && (_hiding < 30)) then {
		_wanted = format["<t color='#C0392B'>(%1) WANTED</t>",_hiding];
	}else{
		_wanted = "<t color='#C0392B'>WANTED</t>";
	};
}else{
	if(vehicle player == player) then {
		if((_player call OT_fnc_hasWeaponEquipped) || (headgear _player in OT_illegalHeadgear) ||  (vest _player in OT_illegalVests) || (!(hmd _player isEqualTo "") && !(hmd _player isEqualTo "ACE_NVG_Gen1"))) then {
			_wanted = "<t color='#ffaa00'>VISIBLE</t>"; //Warn that illegal item is in inventory
		}else{
				{
				_cls = _x select 0; 
				if ((_cls in OT_allWeapons + OT_allMagazines + OT_illegalHeadgear + OT_illegalVests + OT_allStaticBackpacks + OT_allOptics+OT_allExplosives+OT_alldrugs) && !(_cls in OT_legal)) exitwith {
					_wanted = "<t color='#ffff99'>INVENTORY</t>"; //Warn that being seen will result in being wanted
				}; 
			}foreach(_player call OT_fnc_getSearchStock);
		};
	}else{
		if(player call OT_fnc_illegalInCar) then {
			_wanted = "<t color='#ffaa00'>VEHICLE</t>";
		}else{
			if((vehicle player) call OT_fnc_illegalInInventory) then {
				_wanted = "<t color='#ffff99'>CARGO</t>";
			};
		};
	};
};

private _seen = "^.^";
if(_player call OT_fnc_unitSeenNATO) then {
	_seen = "<t color='#0000FF'>O_O</t>";//changed from 5D8AA8 and o_o
}else{
	if(_player call OT_fnc_unitSeenCRIM) then {
		_seen = "<t color='#FF0000'>O_O</t>";//changed from B2282f and o_o
	};
};
private _qrf = "";
private _attacking = server getVariable ["NATOattacking",OT_nation];
if(!isNil "OT_QRFstart" && (time - OT_QRFstart) < 600) then {
	private _secs = 600 - round(time - OT_QRFstart);
	private _mins = 0;
	if(_secs > 59) then {
		_mins = floor(_secs / 60);
		_secs = round(_secs % 60);
	};
	if(_mins < 10) then {_mins = format["0%1",_mins]};
	if(_secs < 10) then {_secs = format["0%1",_secs]};
	_qrf = format["<t size='0.8'>Battle of %1 | </t>Starting: (%2:%3)",_attacking,_mins,_secs];
};

if(!isNil "OT_QRFstart" && (time - OT_QRFstart) > 600) then {
	private _progress = server getVariable ["QRFprogress",0];
	if(_progress > 0) then {
		_qrf = format["<t size='0.8'>Battle of %1 | </t><t color='#5D8AA8'>(%2%3)</t>",_attacking,round (_progress * 100),'%'];
	}else{
		_qrf = format["<t size='0.8'>Battle of %1 | </t><t color='#008000'>(%2%3)</t>",_attacking,round abs (_progress * 100),'%'];
	}
};

private _txt = format [
	"<t size='0.8' shadow='2' align='center'>$%1 | %2 | %3<br/>%4</t>",
	[_player getVariable ["money",0], 1, 0, true] call CBA_fnc_formatNumber,
	_seen,
	_wanted,
	_qrf
];

private _setText = (uiNameSpace getVariable "OT_statsHUD") displayCtrl 1001;
_setText ctrlSetStructuredText (parseText format ["%1", _txt]);
_setText ctrlCommit 0;

private _cTarget = cursorObject;
private _lookingat = "";
if((!isnull _cTarget) && (_cTarget distance player < 7) && (_cTarget isKindOf "CAManBase") && (alive _cTarget) && (!isplayer _cTarget) && !(side _cTarget isEqualTo west)) then {
	_lookingat = name _cTarget;
	_txt = format["<t size='0.7' shadow='2' align='center'>Press [Y] to talk with %1</t>",_lookingat];
}else{
	_txt = "";
};

_setText = (uiNameSpace getVariable "OT_statsHUD") displayCtrl 1002;
_setText ctrlSetStructuredText (parseText format ["%1", _txt]);
_setText ctrlCommit 0;

[OT_fnc_statsSystemLoop,_this,1] call CBA_fnc_waitAndExecute;
