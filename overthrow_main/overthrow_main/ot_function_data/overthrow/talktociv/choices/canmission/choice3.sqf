private _civ = OT_interactingWith;
_faction = _civ getvariable ["faction",""];
_factionName = _civ getvariable ["factionrepname",""];
private _standing = server getVariable [format["standing%1",_faction],0];

_gear = spawner getvariable[format["facvehicles%1",_faction],[]];
_s = [];
_blueprints = server getVariable ["GEURblueprints",[]];


private _side = _faction call OT_fnc_SideFromFaction;
private _legit = server getVariable [format["legit%1",_side],0];
private _factionName = getText (configFile >> "cfgFactionClasses" >> _faction >> "displayName");

{
	if !(_x in _blueprints) then {
		_cost = cost getVariable[_x,[100,0,0,0]];
		_req = 0;
		_base = _cost select 0;
		if(_base > 1000) then {_req = 10};
		if(_base > 10000) then {_req = 20};
		if(_base > 60000) then {_req = 30};
		if(_base > 75000) then {_req = 40};
		if(_base > 125000) then {_req = 50};
		if(_base > 200000) then {_req = 60};
		if(_base > 500000) then {_req = 70};
		if(_base > 750000) then {_req = 80};
		if(_base > 1250000) then {_req = 90};
		if(_base > 2500000) then {_req = 95};
		_vehScore = [_x] call OT_fnc_getLegitScore;

		_s pushback [_x,-1,((_standing >= _req) && (_legit >= _vehScore)),format["+%1 standing to %2 required for this blueprint<br/>+%3 legitimacy required for this blueprint",_req,_factionName,[_vehscore, 1, 1] call CBA_fnc_formatNumber]];
	};
}foreach(_gear);
createDialog "OT_dialog_buy";
[OT_nation,_tstanding,_s,5*_discount] call OT_fnc_buyDialog;