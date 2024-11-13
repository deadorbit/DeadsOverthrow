OT_DeadBodyLootPool_Main = [];
OT_DeadBodyLootPool_Police = []; //Additional Roll for a common item

OT_killedLootDropMutex = false;

//["Item", "Probability"]
/*
	Rarity:
	5 = Common (64%)
	4 = Uncommon (20%)
	3 = Rare (10%)
	2 = Ultra Rare (5%)
	1 = Legendary (1%)
*/
private _common = [
	//Medical Loot
	"ACE_quikclot",
	"ACE_EarPlugs",
	"ACE_morphine",
	"ACE_personalAidKit",
	"ACE_tourniquet",
	"ACE_splint",
	"ACE_bodybag",
	["ACE_painkillers", 10],
	"ACE_salineIV_250",
	"ACE_salineIV_500",
	"FirstAidKit",
	//Electronic Loot
	"ItemRadio",
	"ACE_Altimeter",
	"ACE_flashlight_mx991",
	"ACE_flashlight_ksf1",
	//Junk/Misc loot
	"ACE_Banana",
	"ACE_PlottingBoard",
	"ACE_MapTools",
	"ACE_Can_Franta",
	"ACE_WaterBottle",
	"itemMap",
	"ItemWatch",
	"ItemCompass",
	//Tool loot
	"ACE_wirecutter",
	"ACE_spraypaintblue",
	"ACE_Clacker",
	"rhsusf_bino_m24_ARD",
	//Explosives
	["rhsusf_m112_mag", 1],
	["APERSTripMine_Wire_Mag", 1],
	//Grenades
	["Chemlight_blue", 1],
	["Chemlight_green", 1],
	["Chemlight_red", 1],
	["SmokeShellBlue", 1],
	["SmokeShell", 1],
	["ACE_HandFlare_Red", 1],
	["B_IR_Grenade", 1],
	["rhs_grenade_m15_mag", 1]
];

private _uncommon = [
	//Medical Loot
	"ACE_surgicalKit",
	"ACE_salineIV",
	"ACE_bloodIV_250",
	"ACE_plasmaIV_250",
	"Medikit",
	//Tool loot
	"ACE_EntrenchingTool",
	"ACE_M26_Clacker",
	//Electronic Loot
	"ACE_Cellphone",
	"ACE_UAVBattery",
	"ItemGPS",
	"ACE_microDAGR",
	"ACE_Flashlight_XL50",
	//Explosives
	["APERSBoundingMine_Range_Mag",1],
	["SatchelCharge_Remote_Mag", 1],
	["SLAMDirectionalMine_Wire_Mag", 1]
];

private _rare = [
	//Medical Loot
	"ACE_bloodIV_500",
	"ACE_plasmaIV_500",
	//Tool Loot
	"ACE_Fortify",
	//Electronic Loot
	"ACE_Kestrel4500",
	"ACE_DAGR",
	"ACE_ATragMX",
	"ToolKit",
	//Explosives
	["ATMine_Range_Mag", 1]
];

private _ultrarare = [
	//Medical Loot
	"ACE_bloodIV",
	"ACE_plasmaIV",
	//Electronics
	"ACE_HuntIR_monitor",
	"Rangefinder",
	"ACE_Yardage450"
];

private _legendary = [
	//Misc
	"OT_NatoData"
];

private _totalLoot = count (_common + _uncommon + _rare + _ultrarare + _legendary);
private _baseProbs = [64, 20, 10, 5, 1]; //Should add up to 100

{
	private _lootPool = _x;
	private _prob = (_baseProbs select _forEachIndex);
	
	{
		private _item = _x;
		OT_DeadBodyLootPool_Main pushback _item;
		OT_DeadBodyLootPool_Main pushback _prob;
	}foreach(_lootPool);
}foreach([_common, _uncommon, _rare, _ultrarare]);

//Loot pool for police corpses
private _policeCommon = [
	//Medical Items
	["ACE_painkillers", 10],
	"FirstAidKit",
	"ACE_elasticBandage",
	"ACE_fieldDressing",
	"ACE_packingBandage",
	"ACE_EarPlugs",
	"ACE_quikclot",
	"ACE_salineIV_250",
	"ACE_bodyBag_blue",
	//Electronic loot
	"ItemRadio",
	//Tools
	"ACE_Flashlight_Maglite_ML300L",
	"binocular",
	//Junk
	"ACE_Can_Spirit",
	"ACE_CableTie",
	"ACE_WaterBottle",
	"ACE_Banana",
	"ItemWatch",
	"ItemCompass",
	//Grenades
	["SmokeShellBlue", 1],
	["Chemlight_blue", 1],
	["rhs_mag_m7a3_cs", 1],
	["ACE_M84", 1]
];

private _policeUncommon = [
	//Electronics
	"ACE_Cellphone",
	"ItemGPS",
	"ACE_Altimeter",
	//Tool loot
	"ACE_wirecutter",
	"ACE_spraypaintblue",
	//Misc
	"OT_Blow",
	"OT_Ganja",
	//Explosives
	["ACE_FlareTripMine_Mag", 1],
	//Grenades
	["rhs_mag_an_m14_th3", 1],
	["ACE_CTS9", 1]
];

private _policeRare = [
	"Medikit",
	"ACE_bloodIV_250",
	["rhs_ec200_mag", 1]
];

_baseProbs = [75, 20, 5];

{
	private _lootPool = _x;
	private _prob = (_baseProbs select _forEachIndex);
	
	{
		private _item = _x;
		OT_DeadBodyLootPool_Police pushback _item;
		OT_DeadBodyLootPool_Police pushback _prob;
	}foreach(_lootPool);
}foreach([_policeCommon, _policeUncommon, _policeRare]);