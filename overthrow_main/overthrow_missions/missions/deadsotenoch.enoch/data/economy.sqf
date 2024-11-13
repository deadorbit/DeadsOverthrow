OT_economicData = [
    [[11556.2,7074.01,0],"Power Plant"],
    [[1662.92,3688.21,0],"Polana Advanced Sawmill","OT_Lumber","OT_MP","OT_Furniture"],
    [[2558.82,5523.93,0],"Topolin Fertilizer Farm","OT_NVC","OT_Fertilizer"],
    [[1352.23,8005,0],"Topolin Berry Farm","","OT_Grapes"],
    [[1223.91,8923.21,0],"Topolin Quarry","OT_BE","OT_Ore"],
    [[5210.57,5668.39,0],"Huta Lumberyard","OT_Wood","OT_Lumber"],
    [[11000.3,9026.56,0],"Sitnik Plastics","OT_NVC","OT_BE","OT_Plastic"],
    [[11336.9,9461.08,0],"Sitnik ER"],
    [[1956.49,6677.26,0],"Campfire Brewery","OT_BE","OT_Grapes","OT_Wine"],
    [[11586.7,387.777,0],"Dolnik Metalurgy","OT_NVC","OT_Ore","OT_Steel"],
    [[10975.2,1939.36,0],"Livonia Loggers","OT_BE","OT_Wood"],
	[[10684.9,11123.5,0],"Grabin Industrial Sector","OT_Steel","OT_MP","OT_MP"],
	[[1559.5,7539.65,0],"Topolin Consumer Goods Co.","OT_MP","OT_Plastic","OT_CE"],
    [[4534.43,4715.82,0],"Huta Loggers","OT_BE","OT_Wood"]
];

if (isNil "OT_BusinessLevel") then {
	OT_BusinessLevel = [
		["Power Plant",1,[false]],
		["Polana Advanced Sawmill",1,[false]],
		["Topolin Fertilizer Farm",1,[false]],
		["Topolin Berry Farm",1,[false]],
		["Topolin Quarry",1,[false]],
		["Huta Lumberyard",1,[false]],
		["Sitnik Plastics",1,[false]],
		["Sitnik ER",1,[false]],
		["Campfire Brewery",1,[false]],
		["Dolnik Metalurgy",1,[false]],
		["Livonia Loggers",1,[false]],
		["Grabin Industrial Sector",1,[false]],
		["Topolin Consumer Goods Co.",1,[false]],
		["Huta Loggers",1,[false]]
	];
};

OT_factoryPos = [7343.56,2838.22,0];
OT_factoryVehicleSpawn = [7350.82,2841.75,0];
OT_factoryVehicleDir = 67;

if (isNil "OT_factoryLevel") then {
	OT_factoryLevel = 0;
};

OT_connectedRegions = [];
