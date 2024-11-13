
//Pos, Name, Input 1, Input 2, Output
OT_economicData = [
    [[8211.58,10929.5,0],"Edessa Solar Energy Plant"],
    [[4228.01,15059.8,0],"Magos Power Plant"],
    [[17092.5,11294.6,0],"Pyrgos Mines","OT_BE","OT_Ore"],
    [[12146.1,8418.28,0],"Vikos Wood Brothers","OT_BE","OT_Wood"],
    [[17139.3,13050.5,0],"Pyrgos Plantation","","OT_Grapes"],
	[[14476.5,20275.5,0],"Altis Olivery","","OT_Olives"],
    [[18123.6,13022.5,0],"Elise's Vineyard","OT_Grapes","OT_Wine"],
    [[14305.6,18883.7,0],"Athira Technological Institute","OT_Plastic","OT_MP","OT_CE"],
    [[7449.35,21559.5,0],"Aristi Wind Farm"],
    [[9978.95,10212.9,0],"Altis Fertilizer Plant","OT_NVC","OT_Fertilizer"],
    [[6129.49,10565.1,0],"Edoris Mining Co.","OT_BE","OT_Ore"],
    [[3997.72,17565.9,0],"Kira Pinewood Orchard","OT_BE","OT_Wood"],
    [[5399.11,14494.3,0],"Altis Mineral Refinery","OT_BE","OT_NVC","OT_Plastic"],
    [[25418.5,20339.1,0],"Sofia Power Plant"],
    [[3739.4,12994.6,0],"Kavala Medical Center"],
    [[4211.91,12830.4,0],"KV Lumberyard","OT_BE","OT_Wood","OT_Lumber"],
	[[16566.2,12778.4,0],"Pyrgos Metal Foundry","OT_Ore","OT_NVC","OT_Steel"],
	[[8961.35,15510.2,0],"AD Mechanical Assembly","OT_Steel","OT_MP","OT_MP"],
	[[15424,15907.3,0],"Altis Areonautical Plant","OT_MP","OT_CE","OT_AircraftPart"]
];

if (isNil "OT_BusinessLevel") then {
	OT_BusinessLevel = [
		["Edessa Solar Energy Plant",1,false],
		["Magos Power Plant",1,false],
		["Pyrgos Mines",1,false],
		["Vikos Wood Brothers",1,false],
		["Altis Olivery",1,false],
		["Pyrgos Plantation",1,false],
		["Elise's Vineyard",1,false],
		["Athira Technological Institute",1,false],
		["Aristi Wind Farm",1,false],
		["Altis Fertilizer Plant",1,false],
		["Edoris Mining Co.",1,false],
		["Kira Pinewood Orchard",1,false],
		["Altis Mineral Refinery",1,false],
		["Sofia Power Plant",1,false],
		["Kavala Medical Center",1,false],
		["KV Lumberyard",1,false],
		["Pyrgos Metal Foundry",1,false],
		["AD Mechanical Assembly",1,false],
		["Kea's Furniture Factory",1,false]
	];
};

OT_factoryPos = [6201.09,16257.1,0];
OT_factoryVehicleSpawn = [6183.15,16269.7,0];
OT_factoryVehicleDir = 67;

if (isNil "OT_factoryLevel") then {
	OT_factoryLevel = 0;
};

OT_connectedRegions = [

];