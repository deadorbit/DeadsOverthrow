params ["_unit"];

[_unit, _unit] call ace_common_fnc_claim;
_unit allowFleeing 0;

/*if (_unit in OT_NATO_Garrison) then {
    if((random 100) < 50) then {
		_unit setUnitLoadout [_unit call OT_fnc_getRandomLoadout, true];
	};
}else{*/
if (_unit in OT_NATO_Reinforcements) then {
	if((random 100) > 10) then {
		_unit setUnitLoadout [_unit call OT_fnc_getRandomLoadout, true];
		_unit setskill ["general",0.3 + random(0.3)];
	};
}else{
	if((random 100) > 50) then {
		_unit setUnitLoadout [_unit call OT_fnc_getRandomLoadout, true];
		_unit setskill ["general",0.5 + random(0.4)];
	};
};

_unit addEventHandler ["HandleDamage", {
	_me = _this select 0;
	_src = _this select 3;
	if(captive _src) then {
		if((vehicle _src) != _src || (_src call OT_fnc_unitSeenNATO)) then {
			_src setCaptive false;
		};
	};
	if (!alive _me) then {
		if (!isNil {_me getVariable "garrison"}) then {
			private _mevar = _me getVariable "garrison";
			private _HasDied = server getVariable format["GarrKilled%1",_mevar];
			server setVariable [format ["GarrKilled%1",_mevar],_HasDied + 1,true];
		};
	};
}];

//(hopefully) check that they have two FAKs worth of ace medical items
private _amnt = -1;
private _stock = _unit call OT_fnc_getsearchstock;
private _idx = _stock findif {(_x select 0) IsEqualTo "FirstAidKit"};

if(!(_idx == -1)) then {
	_idx = _stock select _idx;
	_amnt = _idx select 1;
	if(_amnt == 1) then {
		(uniformcontainer _unit) additemcargoglobal ["FirstAidKit",1];
	};
}else{
	(uniformcontainer _unit) additemcargoglobal ["FirstAidKit",2];
};

_unit setVariable ["reconseen",false,true];

_unit addEventHandler ["Dammaged", OT_fnc_EnemyDamagedHandler];