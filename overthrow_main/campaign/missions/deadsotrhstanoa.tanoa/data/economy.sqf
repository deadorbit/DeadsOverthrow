OT_economicData = [
    [[7270.84,8391.29,0],"Diesel Power Plant"],
    [[8939.47,6627.97,0],"Unmarked Sweatshop","OT_Plastic","OT_MP","OT_CE"],
    [[9456.82,7552.04,0],"Lami Orchard","OT_BE","OT_Wood"],
    [[8389.24,10229.8,0],"Tanoa Sugar Company","OT_BE","OT_Sugarcane","OT_Sugar"],
    [[11761.2,6949.91,0],"Sidmor's Sawmill","OT_BE","OT_Wood","OT_Lumber"],
    [[5511.58,11888.2,0],"Saint Julien Synthetic Materials","OT_BE","OT_NVC","OT_Plastic"],
    [[8878.1,11889.1,0],"Galili Orchard","OT_BE","OT_Wood"],
    [[8526.85,12467.3,0],"Roadhouse"],
    [[11921.1,10206.5,0],"Red Spring Surface Mine","OT_BE","OT_Ore"],
    [[12383,14135.3,0],"Ravi-ta Island Resort"],
    [[4687.63,3590.75,0],"Katkoula Deep Fermentation Plant","OT_NVC","OT_Fertilizer"],
    [[8026.38,8946.16,0],"Lifou Sugar Plantations","","OT_Sugarcane"],
    [[5550.8,3928.31,0],"Tattoo's Natural Sugars","OT_BE","OT_Sugarcane","OT_Sugar"],
    [[852.771,7632.717,0],"Tavu Clinic"],
	[[10110.7,5026,0],"Bayside Lumberyard","OT_BE","OT_Wood","OT_Lumber"],
	[[5266.41,10028.9,0],"New Georgetown Steel Refinery","OT_NVC","OT_Ore","OT_Steel"],
	[[5957.44,10506.1,0],"Georgetown Furniture Assembly","OT_MP","OT_Lumber","OT_Furniture"],
	[[9627.29,9962.83,0],"Granny's Machinery","OT_Steel","OT_MP","OT_MP"]
];

if (isNil "OT_BusinessLevel") then {
	OT_BusinessLevel = [
		["Diesel Power Plant",1,[false]],
		["Unmarked Sweatshop",1,[false]],
		["Lami Orchard",1,[false]],
		["Tanoa Sugar Company",1,[false]],
		["Sidmor's Sawmill",1,[false]],
		["Saint Julien Synthetic Materials",1,[false]],
		["Galili Orchard",1,[false]],
		["Roadhouse",1,[false]],
		["Red Spring Surface Mine",1,[false]],
		["Ravi-ta Island Resort",1,[false]],
		["Katkoula Deep Fermentation Plant",1,[false]],
		["Lifou Sugar Plantations",1,[false]],
		["Saioko Orchard",1,[false]],
		["Tattoo's Natural Sugars",1,[false]],
		["Tavu Clinic",1,[false]],
		["Bayside Lumberyard",1,[false]],
		["New Georgetown Steel Refinery",1,[false]],
		["Georgetown Furniture Assembly",1,[false]],
		["Granny's Machinery",1,[false]]
	];
};


OT_factoryPos = [4226.49,8370.82,0];
OT_factoryVehicleSpawn = [4265.64,8400.65,0];
OT_factoryVehicleDir = 67;

if (isNil "OT_factoryLevel") then {
	OT_factoryLevel = 0;
};

OT_connectedRegions = [
    ["island_1","island_2"],
    ["island_2","island_1"],
    ["island_3","island_4"],
    ["island_4","island_3"]
];
