private ["_town","_cls","_cost","_stability"];

private _town = _this select 0;
private _cls = _this select 1;
private _standing = _this select 2;
private _DistanceMult = 1;
private _cost = cost getVariable [_cls,[10,0,0,0]];
private _baseprice = _cost select 0;
if((count _this) == 3) then {
	_stability = server getVariable [format["stability%1",_town],50];
}else{
	_stability = _this select 3;
};
private _population = server getVariable [format["population%1",_town],1500];
if(_population < 200) then {_population = 200};
if(_population > 1500) then {_population = 1500};
if(_town isEqualTo OT_nation) then {_population = 1500};

if (_stability < 1) then {_stability = 1};
if (_stability > 100) then {_stability = 100};

if!(_town isEqualTo OT_nation) then {
	_townpos = server getVariable _town;
	_NearestPort = _townpos call OT_fnc_nearestPort;
	_Distance = _NearestPort distance _townpos;
	_DistanceMult = 1 max (1+(_Distance/25000));
};

private _buyprice = [_town,_cls,_standing] call OT_fnc_getPrice;
_price = 0;

if(_cls in (OT_allWeapons + OT_allMagazines) && (_town in OT_allTowns)) then {
	_stock = server getVariable format["gunstock%1",_town];
	{
		if((_x select 0) isEqualTo _cls) exitWith {_price = _x select 1};
	}foreach(_stock);
}else{
	_stability = 1.51282 - (0.00634061*_stability);
	_population = 5.80362 - (4.00324 * (_population^0.0268385));
	_price = ((_baseprice*2) * (_stability*_population*_DistanceMult));
};

if(_buyprice < _price) then {_price = _buyprice};

_price = floor(_price);
1 max _price
