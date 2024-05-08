params ["_town","_cls",["_standing",0]];
private _price = 1;
private _DistanceMult = 1;
private _population = server getVariable [format["population%1",_town],750];
if(_town isEqualTo OT_nation) then {_population = 1500};
if(_population < 200) then {_population = 200};
if(_population > 1500) then {_population = 1500};

private _stability = server getVariable [format["stability%1",_town],50];
if(_town isEqualTo OT_nation) then {_stability = 100};
if (_stability < 1) then {_stability = 1};

private _civ = OT_interactingWith;

if!(_town isEqualTo OT_nation) then {
	_townpos = server getVariable _town;
	_NearestPort = _townpos call OT_fnc_nearestPort;
	_Distance = _NearestPort distance _townpos;
	_DistanceMult = 1 max (1+(_Distance/25000));
};

private _trade = player getvariable ["OT_trade",1];
private _discount = 1;
if(_trade > 1) then {
	_discount = 1 - (0.02 * (_trade - 1));
	
};
_cost = cost getVariable [_cls,[10,0,0,0]];

private _baseprice = _cost select 0;

if((OT_interactingWith getvariable ["factionrep",false]) && _cls iskindof "AllVehicles") exitwith {_baseprice*2*_trade*OT_standardMarkup};

if(_cls in OT_allVehicles) then {//Vehicles are recession proof
	_population = 1.13077 - (0.000153846 * _population);//0.9 min, 1.1 max
	_stability = 1.3 - (0.004 * _stability);//0.9 min, 1.1 max
	_DistanceMult = 1;
}else{
	if (!(_civ getvariable ["gundealer",false])) then {//Dealers prices should be lowered by bad stability and low pop
		_stability = 1.51282 - (0.00634061*_stability); //1.5 at 1, 1.25 at 50, 1 at 70, 0.9 at 100
		
		if(_cls isEqualTo "WAGE") then {
			_stability = 1;
			_DistanceMult = 1; 
		};
		
		_population = 5.80362 - (4.00324 * (_population^0.0268385));
		
		
		if(_cls == "WAGE" && _town != OT_nation) then {
			_population = 1;
		};
	}else{
		_stability = (0.0000529639*(_stability^2)) + (0.00272485*_stability) + 0.461098;//Expotenital curve 0.6 mult at 0 stab, 1 mult at 75, 1.25 mult at 100
		_population = (0.000893286*(_population^0.913758)) + 0.786871;// Expotenital curve 0.9 mult at 200 pop, 1 mult at 400, 1.5 mult at 1500
	};
};
if(_standing < -100) then {_standing = -100};
if(_standing >= 100000) then {_standing = 99999};
if(_standing isEqualTo 0) then {_standing = 1};
_standing = 1 - (_standing/500000);
_discount = (_discount * _standing);

_price = round(((_baseprice*2) * (_stability*_population*_DistanceMult)) * OT_standardMarkup);

if(_cls isEqualTo "FUEL") then {
	_price = _price - 9;
};

_price = round(_price * _discount);
2 max _price
