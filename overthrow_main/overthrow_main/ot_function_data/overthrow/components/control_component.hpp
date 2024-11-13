//Functions that control the flow the game I.e on start up
class Control {
	file = DIRECTORY(\control);
	
	class initBaseVar {};
	class initOverthrow {};
	class initVarServer {};
	class initNato {};
	class newGame {};
	class initPrices {};
};
//Functions used to save or load data from the profile namespace
class Save {
	file = DIRECTORY(\control\save);
	
	class autoSaveToggle {};
	class autoloadToggle {};
	class getOfflinePlayerAttribute {};
	class loadGame {};
	class loadPlayerData {};
	class saveGame {};
	class savePlayerData {};
	class setOfflinePlayerAttribute {};
};

//Functions used when a player joins the game
class initPlayer {
	file = DIRECTORY(\control\initplayer);
	
	class initJukeBox {};
	class initNewPlayer {};
	class initPlayerEventHandlers {};
	class initPlayerLocal {};
	class setupPlayer {};
	class initPlayerLocalObjects {};
};

class preInitVars {
	file = DIRECTORY(\control\preinitvars);

	class preInitVars {
		preinit = 1;
	};
	
	class initCfgVars {};
	class initCraftingVars {};
	class initIllegalVars {};
	class initImageVars {};
	class initInvalidVars {};
	class initShopStockVars {};
};