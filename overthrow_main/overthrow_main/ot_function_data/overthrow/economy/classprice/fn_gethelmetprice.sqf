private _name = configName _x;
private _cost = 20 + (getNumber(configFile >> "CfgWeapons" >> _name >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") * 30);
if(_cost > 20) then {
	OT_allHelmets pushback _name;
}else{
	OT_allHats pushback _name;
};
if(isServer && isNil {cost getVariable _name}) then {
	cost setVariable [_name,[_cost,0,1,0],true];
};