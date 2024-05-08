private _pos = _this;
private _type = "";

private _search = OT_economicData + OT_objectiveData + OT_townData + OT_commsData + OT_airportData + OT_AllMapFac;

private _closest = ([_search,[],{(_x select 0) distance _pos},"ASCEND"] call BIS_fnc_SortBy) select 0;

if (_closest in OT_AllMapFac) then {
	if (((_closest select 0) distance2D _pos) < 20) then {
		_type = "Faction";
	}else{
		private _search = OT_economicData + OT_objectiveData + OT_townData + OT_commsData + OT_airportData;
		_closest = ([_search,[],{(_x select 0) distance _pos},"ASCEND"] call BIS_fnc_SortBy) select 1;
	};
};

if (_type isEqualTo "") then {
		_type = _closest call {
		if(_this in OT_economicData) exitWith {"Business"};
		if(_this in OT_townData) exitWith {"Town"};
		if(_this in OT_commsData) exitWith {"Radio Tower"};
		if(_this in OT_airportData) exitWith {"Airport"};
		"Objective"
	};
};

[_closest select 1,_type,_closest]
