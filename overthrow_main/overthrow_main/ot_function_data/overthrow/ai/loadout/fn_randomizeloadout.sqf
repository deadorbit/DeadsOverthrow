params [
    "_loadout",
    ["_rifles", OT_NATO_AllAR],
    ["_glRifles", OT_NATO_AllGL],
    ["_machineGuns", OT_NATO_AllMG],
    ["_sniperRifles", OT_NATO_AllSR],
    ["_launchers", OT_NATO_AllAT],
    ["_handguns", OT_NATO_AllPistols],
	["_optic", false],
	//Needed for units with config specified loadouts
	["_unitCls", ""],
	["_ignoreLauncher", false]
];

//helper functions
private _removeMagazines = {
    params ["_newloadout", "_forcls"];
    private _hasVest = count(_newloadout select 4) > 0;
    private _hasBackpack = count(_newloadout select 5) > 0;
    private _magazines = getArray (configFile >> "CfgWeapons" >> _forcls >> "magazines");
    {
        if !(_x isEqualTo "this") then {
            _magazines = _magazines + getArray (configFile >> "CfgWeapons" >> _forcls >> _x >> "magazines")
        };
    }foreach(getArray (configFile >> "CfgWeapons" >> _forcls >> "muzzles"));
    //from uniform
    private _items = (_newloadout select 3) select 1;
    {
        _x params ["_cls","_num"];
        if(_cls in _magazines) then {_x set [1,0]};
    }foreach(_items);

    //from vest
    if(_hasVest) then {
        _items = (_newloadout select 4) select 1;
        {
            _x params ["_cls","_num"];
            if(_cls in _magazines) then {_x set [1,0]};
        }foreach(_items);
    };

    if(_hasBackpack) then {
        //from backpack
        _items = (_newloadout select 5) select 1;
        {
            _x params ["_cls","_num"];
            if(_cls in _magazines) then {_x set [1,0]};
        }foreach(_items);
    };
};

private _magfix = {
//Prevents weapons being given unusable magazines
	params[["_wpn", ""],["_mag", ""]];
	private _hash = [];
	
	_hash = (OT_convertPrimMagazines getOrDefault [_wpn, []]);
	if (_hash isNotEqualTo []) exitWith {selectRandom _hash};
	
	_hash = (OT_convertPrimMagazines getOrDefault [_mag, []]);
	if (_hash isNotEqualTo []) exitWith {selectRandom _hash};
	
	_mag
};


private _newloadout = +_loadout; //clone the loadout

//get some basic info about the loadout
//private _hasVest = count(_newloadout select 4) > 0;
//Check that vest can hold items
private _vest = (_newloadout select 4) select 0;
private _hasVest = ([_vest] call DEDF_fnc_canHoldItems);
private _hasBackpack = count(_newloadout select 5) > 0;
private _hasPrimary = count(_newloadout select 0) > 0;
private _hasLauncher = count(_newloadout select 1) > 0;
private _hasHandgun = count(_newloadout select 2) > 0;

//replace primary weapon
if(_hasPrimary) then {
	private _primarySlot = (_loadout select 0);
    private _primaryWpn = _primarySlot select 0;
	private _currentOptic = (_primarySlot select 3);
	private _hasOptic = (_currentOptic isNotEqualTo "");
    private _base = [_primaryWpn] call BIS_fnc_baseWeapon;

    //remove magazines for primary weapon
    [_newloadout, _primaryWpn] call _removeMagazines;
	
	//replace primary weapon by catagory
	private _isSR = false;
	private _isMG = false;
	private _wpn = "";
	switch (true) do {
		case(_base in _rifles) : {_wpn = selectRandom _rifles};
		case(_base in _glRifles) : {_wpn = selectRandom _glRifles};
		case(_base in _sniperRifles) : {_wpn = selectRandom _sniperRifles; _isSR = true};
		case(_base in _machineGuns) : {_wpn = selectRandom _machineGuns; _isMG = true};
		case(_base in OT_NATO_AllAR) : {_wpn = selectRandom _rifles};
		case(_base in OT_NATO_AllGL) : {_wpn = selectRandom _glRifles};
		case(_base in OT_NATO_AllSR) : {_wpn = selectRandom _sniperRifles; _isSR = true};
		case(_base in OT_NATO_AllMG) : {_wpn = selectRandom _machineGuns; _isMG = true};
	};
	(_newloadout select 0) set [0, _wpn];

    private _magazines = getArray (configFile >> "CfgWeapons" >> _wpn >> "magazines");
    private _mag = "";
    {
        _scope = getNumber (configFile >> "CfgMagazines" >> _x >> "scope");
        if(_scope > 1) exitWith {_mag = _x};
    }foreach([_magazines, [], {random 100}, "ASCEND"] call BIS_fnc_sortBy);

	_mag = [_wpn,_mag] call _magfix;
    private _count = getNumber(configFile >> "CfgMagazines" >> _mag >> "count");
    (_newloadout select 0) set [4,[_mag,_count]];
	
	private _numMags = 6;
	if (_wpn in ["sgun_HunterShotgun_01_F", "OT_sgun_sawedoff_Pistol"]) then {
		_numMags = 10;
	};
	
    //add mags to vest
    if(_hasVest) then {
        ((_newloadout select 4) select 1) pushBack [_mag, _numMags, _count];
    }else{
		//Add to uniform
		((_newloadout select 3) select 1) pushBack [_mag, _numMags, _count];
	};

    //get secondary mags (ugl, etc)
	private _secondmags = [];
	{
		if !(_x isEqualTo "this") then {
			_secondmags = _secondmags + getArray (configFile >> "CfgWeapons" >> _wpn >> _x >> "magazines")
		};
	}foreach(getArray (configFile >> "CfgWeapons" >> _wpn >> "muzzles"));
	
	if((count _secondmags) > 0) then {
		if(_hasBackpack) then {
			//add all of them to backpack
			{
				private _count = getNumber(configFile >> "CfgMagazines" >> _x >> "count");
				((_newloadout select 5) select 1) pushBack [_x,4,_count];
			}foreach(_secondmags);
		}else{
			//add the first one to vest
			if(_hasVest) then {
				_mag = _secondmags select 0;
				private _count = getNumber(configFile >> "CfgMagazines" >> _mag >> "count");
				((_newloadout select 4) select 1) pushBack [_mag,6,_count];
			};
		};
	};
	
	//Remove current optic
	(_newloadout select 0) set [3, ""];
	
	//Ensure snipers always have optics
	private _doOptic = false;
	switch (true) do {
		case (_isSR) : {_doOptic = true};
		case (_optic && _hasOptic) : {_doOptic = true};
		case (_optic && ((random 10) > 3)) : {_doOptic = true};
	};
	
	if (_doOptic) then {
		private _newOptic = [_wpn, _isSR] call OT_fnc_randomNATOScope;
		(_newloadout select 0) set [3, _newOptic];
	};
};

//replace secondary weapon (launcher)
if(_hasLauncher && !_ignoreLauncher) then {
	private _wpn = selectRandom _launchers;
	private _magazines = getArray (configFile >> "CfgWeapons" >> _wpn >> "magazines");
	private _mag = [_wpn, (_magazines select 0)] call _magfix;
	private _count = getNumber(configFile >> "CfgMagazines" >> _mag >> "count");
	private _scope = getNumber(configFile >> "CfgMagazines" >> _mag >> "scope");
	
	[_newloadout,(_newloadout select 1) select 0] call _removeMagazines;
	(_newloadout select 1) set [0,_wpn];
	(_newloadout select 1) set [4,[_mag,_count]];

	if(_hasBackpack) then {
		if(_scope < 2) then {
			//single-use launcher, remove backpack
			_newloadout set [5,[]];
		}else{
			(_newloadout select 5) set [1,[]]; //Clear backpack
			//add more primary mags
			((_newloadout select 5) select 1) pushBack [_mag,2,_count];

			//add 2 other random ones
			private _c = 0;
			{
				if(_foreachIndex > 0) then {
					private _count = getNumber(configFile >> "CfgMagazines" >> _x >> "count");
					((_newloadout select 5) select 1) pushBack [_x,1,_count];
					_c = _c + 1;
				};
				if(_c isEqualTo 2) exitWith {};
			}foreach([_magazines,[],{random 100},"ASCEND"] call BIS_fnc_sortBy);
		};
	};
};

//replace handgun
if(_hasHandgun) then {
    [_newloadout,((_newloadout select 2) select 0)] call _removeMagazines;
    _wpn = selectRandom _handguns;
    (_newloadout select 2) set [0,_wpn];
    //we always want the primary mag
    _magazines = getArray (configFile >> "CfgWeapons" >> _wpn >> "magazines");
    _mag = _magazines select 0;
	_mag = [_wpn,_mag] call _magfix;
    private _count = getNumber(configFile >> "CfgMagazines" >> _mag >> "count");
    (_newloadout select 2) set [4,[_mag,_count]];
	
	private _magCount = 2;
	if !(_hasPrimary) then {
		//Add extra mags
		_magCount = 5;
	};
    //Add mags to vest
    if(_hasVest) then {
        ((_newloadout select 4) select 1) pushBack [_mag, _magCount, _count];
    }else{
		//Add to uniform
		((_newloadout select 3) select 1) pushBack [_mag, _magCount, _count];
	};
};

//Add additional backpack items from config data
if (_unitCls isNotEqualTo "") then {
	private _configOf = (configFile >> "CfgVehicles" >> _unitCls);
	private _backpackContents = (_configOf >> "ot_backpackCargo");
	if (_backpackContents isNotEqualTo configNull) then {
		_backpackContents = parseSimpleArray([_backpackContents] call BIS_fnc_getCfgData);
		((_newloadout select 5) select 1) append _backpackContents;
	};
};

_newloadout
