//Seperate script to offload some calculations from map handler so they don't have to be ran every frame
//These are what get passed to the maphandler to be drawn
OT_MAP_DRAWBUILDINGS = [];
OT_MAP_DRAWFACTIONS = [];
OT_MAP_DRAWSTORES = [];

OT_MAP_MAPASSISTANT_HANDLER = [
	{
		player sideChat format ["every frame! _this: %1", _this];
	}, 
	5
] call CBA_fnc_addPerFrameHandler;