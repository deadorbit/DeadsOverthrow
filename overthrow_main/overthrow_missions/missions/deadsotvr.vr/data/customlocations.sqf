/*
	Used whenever a player joins to create map markers for custom location
	(Otherwise map markers are baked in)
	FORMAT:
		[Location Name, MarkerType, markerPos2D, location sizeX, location SizeY]
*/

OT_customLocations = [
	["PoorVille", "NameVillage", [1035, 972], 200, 200]
];

private _loc = createLocation ["NameVillage", [1035.12,971.732], 350, 150];
_loc setText "Poorville";