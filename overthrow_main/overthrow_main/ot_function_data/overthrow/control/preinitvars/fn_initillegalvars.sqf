//Hash everything together
private _allDrugs = (keys OT_allContraband);
private _illegalBackpacks = call compile preprocessFileLineNumbers "overthrow_main\data\illegaldata\illegalbackpacks.sqf";
private _illegalVests = call compile preprocessFileLineNumbers "overthrow_main\data\illegaldata\illegalvests.sqf";
private _illegalHeadgear = call compile preprocessFileLineNumbers "overthrow_main\data\illegaldata\illegalheadgear.sqf";
private _legal = call compile preprocessFileLineNumbers "overthrow_main\data\illegaldata\illegalexceptions.sqf";
private _allIllegal = (_illegalHeadgear + _illegalVests + (keys OT_allStaticBackpacks) + (keys OT_allWeapons) + (keys OT_allMagazines) + (keys OT_allAttachments) + (keys OT_allDetonators) + (keys OT_allNVG) + _allDrugs) - _legal;

private _toHash = [
	["OT_allDrugs", _allDrugs],
	["OT_illegalGear", _illegalHeadgear + _illegalVests + _illegalBackpacks],
	["OT_legal", _legal],
	["OT_allIllegal", _allIllegal]
];

{
	_x call DEDF_fnc_hashArrayGlobal;
	if (OT_debugMode) then {
		OT_DEBUG_allCfgData append (_x select 1);
	};
}foreach(_toHash);