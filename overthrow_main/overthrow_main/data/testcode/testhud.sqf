//(_cls in OT_allWeapons + OT_allMagazines + OT_illegalHeadgear + OT_illegalVests + OT_allStaticBackpacks + OT_allOptics+OT_allExplosives+OT_alldrugs) && !(_cls in OT_legal))


[player] call OT_fnc_wantedloop;
OT_searchchance = 0;
OT_capitals = [];
OT_townData = [];
OT_mainCapital = "";
player setCaptive true;

[] call OT_fnc_statsSystem;