//Functions designed to simpify commonly preformed tasks
class Util {
	file = DIRECTORY(\util);
	
	class dateStamp {};
	class escapeXML {};
	class eventHandlerSafeRemove {};
	class exportPrices {};
	class findReplace {};
	class flatempty {};
	class formatOverlayedString {};
	class getOwner {};
	class getOwnerUnit {};
	class hasOwner {};
	class numVehs {};
	class preloadAroundObject {};
	class removeLocalPFEH {};
	class setOwner {};
	class sideFromFaction {};
	class sortBy {};
	class sortByInplace {};
	class spawnTemplate {};
	class uniformFromFaction {};
	class unitStock {};
	class vehicleCanMove {};
};

class UtilMP {
	file = DIRECTORY(\util\mp);
	
	class canDump {};
	class moveToHC {};
	class playerMID {};
};

class UtilLogging {
	file = DIRECTORY(\util\logging);
	
	class debugLog {};
	class logLoop {};
	class logToProfile {};
};

class UtilItems {
	file = DIRECTORY(\util\items);
	
	class isIllegal {};
	class isIllegalWeapon {};
};