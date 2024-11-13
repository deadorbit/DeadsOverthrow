private _name = configName _x;
private _m = getNumber(_x >> "mass");
if(_name isKindOf ["Default",configFile >> "CfgMagazines"] && (_name != "NLAW_F") && !(_name isKindOf ["VehicleMagazine",configFile >> "CfgMagazines"])) then {
	private _cost = round(_m * 4);
	private _desc = getText(_x >> "descriptionShort");
	if((_desc find ".408") > -1) then {
		_cost = _cost * 4;
	};
	private _exp = false;
	private _steel = 0.1;
	private _plastic = 0;
	if(getNumber(_x >> "ace_explosives_Placeable") == 1) then {
		_exp = true;
	};
	if((_desc find "Smoke") > -1) then {
		_cost = round(_m * 0.5);
	}else{
		if((_desc find "Grenade") > -1) then {
			_cost = round(_m * 2);
			_exp = true;
		};
	};
	if((_desc find "Flare") > -1 || (_desc find "flare") > -1) then {
		_cost = round(_m * 0.6);
		_exp = false;
	};

	if(_name isEqualTo OT_ammo_50cal) then {_cost = 500};

	if(_exp) then {
		_steel = 0;
		_plastic = round(_m * 0.5);
		_allExplosives pushback _name;
		OT_explosives pushback [_name,_cost,0,_steel,_plastic];
	}else{
		_allMagazines pushback _name;
	};
	if(isServer && isNil {cost getVariable _name}) then {
		cost setVariable [_name,[_cost,0,_steel,_plastic],true];
	};
};