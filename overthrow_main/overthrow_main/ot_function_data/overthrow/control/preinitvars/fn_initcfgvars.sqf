//Detect data from configs and populate vars for easy accese
OT_boats = [
	["C_Scooter_Transport_01_F",500,1,0,1],
	["C_Boat_Civil_01_rescue_F",1000,1,1,1],
	["C_Boat_Transport_02_F",3000,1,0,1]
];
OT_helis = [
	["rhs_uh1h_idap",150000,0,45,10],
	["C_IDAP_Heli_Transport_02_F",250000,0,45,10]
];

private _allCfgWeapons = "(
	getNumber ( _x >> ""scope"" ) isEqualTo 2
	&& 
	{ getText ( _x >> ""simulation"" ) isEqualTo ""Weapon""}
	&&
	{getText (_x >> ""baseWeapon"") isEqualTo (configName _x)}
	&&
	({(configName _x) isKindOf ['RifleCore', (configFile >> 'CfgWeapons')]
	||
	(configName _x) isKindOf ['Pistol', (configFile >> 'CfgWeapons')]
	||
	(configName _x) isKindOf ['Launcher_Base_F', (configFile >> 'CfgWeapons')]})
)" configClasses (configFile >> "cfgWeapons");

private _allCfgAttachments = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { _t = getNumber ( _x >> ""ItemInfo"" >> ""type"" ); _t isEqualTo 301 || _t isEqualTo 302 || _t isEqualTo 101})
" configClasses ( configFile >> "cfgWeapons" );

private _allCfgDetonators = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { getNumber ( _x >> ""ace_explosives_Detonator"" ) isEqualTo 1})
" configClasses ( configFile >> "cfgWeapons" );

private _allCfgBackpacks = format
	["
		(configname _x) isKindOf [""bag_base"", configFile >> ""CfgVehicles""]
		&&
		(
			(count ([_x >> ""TransportWeapons""] call BIS_fnc_getCfgSubClasses) == 0)
			&&
			(count ([_x >> ""TransportItems""] call BIS_fnc_getCfgSubClasses) == 0)
			&&
			(count ([_x >> ""TransportMagazines""] call BIS_fnc_getCfgSubClasses) == 0)
		)
		&&
		(getNumber(_x >> ""scope"") == 2)
		&&
		((_x >> ""assembleInfo"") == configNull)
	"] 
configClasses ( configFile >> "CfgVehicles" );

//Protective Headgear
private _allCfgHelmets = format 
	["
		(
			((configName _x) isKindOf [""H_HelmetB"", configFile >> ""CfgWeapons""])
			||
			((configname _x) isKindOf [""HelmetBase"", configFile >> ""CfgWeapons""])
		)
		&&
		(getNumber ( _x >> ""scope"" ) isEqualTo 2)
		&&
		(getNumber(_x >> 'ItemInfo' >> 'HitpointsProtectionInfo' >> 'Head' >> 'armor') > 0.1)
	"] 
configClasses (configFile >> "CfgWeapons");

//Nonprotective headgear
private _allCfgHats = format 
	["
		(
			((configName _x) isKindOf [""H_HelmetB"", configFile >> ""CfgWeapons""])
			||
			((configname _x) isKindOf [""HelmetBase"", configFile >> ""CfgWeapons""])
		)
		&&
		(getNumber ( _x >> ""scope"" ) isEqualTo 2)
		&&
		(getNumber(_x >> 'ItemInfo' >> 'HitpointsProtectionInfo' >> 'Head' >> 'armor') isEqualTo 0)
	"] 
configClasses (configFile >> "CfgWeapons");

private _allCfgStaticWeaponsBags = "
    (getNumber(_x >> ""scope"") isEqualTo 2
    &&
    {(configName _x) isKindOf ""Weapon_Bag_Base""})
" configClasses ( configFile >> "CfgVehicles" );

private _allCfgMagazines = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2 )
" configClasses ( configFile >> "cfgMagazines" );

private _allCfgGrenades = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
	&&
	{getText(_x >> ""nameSound"") isEqualTo ""handgrenade""}
	&&
	{getNumber(_x >> ""type"") isEqualTo 256})
" configClasses (configFile >> "cfgMagazines");

private _allCfgPlaceableExplosives = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
	&&
	{getNumber(_x >> ""ace_explosives_Placeable"") isEqualTo 1})
" configClasses (configFile >> "cfgMagazines");

private _allCfgNVG = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { getNumber ( _x >> ""ItemInfo"" >> ""type"" ) isEqualTo 616})
" configClasses ( configFile >> "cfgWeapons" );

private _allContraband = ["OT_Ganja","OT_Blow"];

//Get Cfgs
private _allCfgOptics = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { getNumber ( _x >> ""ItemInfo"" >> ""optics"" ) isEqualTo 1})
" configClasses ( configFile >> "cfgWeapons" );

//Begin hashing

//public variable name, data
private _toHash = [
	["OT_allAttachments", _allCfgAttachments],
	["OT_allContraband", _allContraband],
	["OT_allDetonators", _allCfgDetonators],
	["OT_allGrenades", _allCfgGrenades],
	["OT_allMagazines", _allCfgMagazines],
	["OT_allHelmets", _allCfgHelmets],
	["OT_allHats", _allCfgHats],
	["OT_allNVG", _allCfgNVG],
	["OT_allOptics", _allCfgOptics],
	["OT_allPlaceableExplosives", _allCfgPlaceableExplosives],
	["OT_allBags", _allCfgBackpacks],
	["OT_allStaticBackpacks", _allCfgStaticWeaponsBags],
	["OT_allWeapons", _allCfgWeapons],
	["OT_allContraband", _allContraband]
];

{
	_x call DEDF_fnc_hashArrayGlobal;
	if (OT_debugMode) then {
		OT_DEBUG_allCfgData append (_x select 1);
	};
}foreach(_toHash);

