/*
Use the following to fetch town data automatically, or copy/paste to override/tweak

OT_townData = [];

{
    OT_townData pushback [getArray(_x >> "position"),getText(_x >> "name")];
}foreach("(getText(_x >> 'type') in ['NameCity','NameVillage','NameCityCapital'])" configClasses (configfile >> "CfgWorlds" >> "Malden" >> "Names"));
*/
OT_townData = [
    [[5679.02,5029.78,0],"Qaudane"],
	[[6874.57,3004.31,0],"Toughza"],
	[[7939.58,2856.27,0],"Tazzarine"],
	[[3556.1,4119.11,0],"M'Semrir"],
	[[4502.63,5037.32,0],"Quandale Dingle"]
	
];

OT_spawnTowns = ["Toughza"];
OT_capitals = ["Qaudane"]; //region capitals
OT_mainCapital = "Qaudane";
OT_sprawling = [];
OT_Ports = [[4715.6,122.304,0]];
