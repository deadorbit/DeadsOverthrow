private _town = "";
private _type = "";
private _townpos = [];
if(typename _this isEqualTo "ARRAY") then {
	_type = _this select 0;
	_town = _this select 1;
	_townpos = _this select 2;
}else{
	_type = typeof _this;
	_town = (getpos _this) call OT_fnc_nearestTown;
	_townpos = (getpos _this);
};

if(isNil "_town") exitWith {[-1,-1,-1,-1,"?"]};
private _stability = server getVariable format["stability%1",_town];
if (_stability == 0) then {_stability = 1};
_stability = (0.0100925*_stability) + 0.49232; //min 0.5 at 1%, 0.9 at 40%, 1.5 at 100%

private _population = server getVariable format["population%1",_town];
if(_population > 1000) then {_population = 1000};
if(_population < 200) then {_population = 200};
_population = (0.0015 * _population) + 0.5;

private _nearestPort = _townpos call OT_fnc_nearestPort;
private _distance = _nearestPort distance _townpos;
_distance = 1 - (0.00001*_distance);

([_type] call {
	params ["_type"];
	if (_type in OT_spawnHouses) exitWith {[]};
	if(_type in OT_lowPopHouses) exitWith {[4000,8,0.35,"Poor"]};
	if(_type in OT_mansions) exitWith {[50000,10,0.35,"Amazing"]};
	if(_type in OT_medPopHouses) exitWith {[7500,12,0.2,"Average"]};
	if(_type in OT_highPopHouses) exitWith {[15000,15,0.15,"Great"]};
	if(_type in OT_hugePopHouses) exitWith {[50000,40,0.06,"Awesome"]};
	if(_type == OT_warehouse) exitWith {[3000,0,0.35,"Warehouse"]};
	[]
}) params [["_baseprice", 2500],["_totaloccupants",4],["_multiplier",0.35],["_size","Squalid"]];

if(_town isEqualTo OT_mainCapital) then {
	_baseprice = _baseprice * 1.5
}else{
	if(_town in OT_capitals) then {_baseprice = _baseprice * 1.25};
};

private _price = round(((_baseprice*2) * _stability * _population * _distance) * OT_standardMarkup);
_price = _price max 1000;

private _sell = round((_baseprice*2) * _stability * _population);
private _lease = round((_stability * _population * _distance) * ((_baseprice * _multiplier) * _totaloccupants * 0.2));
if !(_town in (server getvariable ["NATOabandoned",[]])) then {_lease = round(_lease * 0.35)};
private _diff = server getVariable ["OT_difficulty",1];
if(_diff isEqualTo 0) then {_lease = round(_lease * 1.2)};
if(_diff isEqualTo 2) then {_lease = round(_lease * 0.8)};
if(_lease < 1) then {_lease = 1};
[_price,_sell,_lease,_totaloccupants,_size]
