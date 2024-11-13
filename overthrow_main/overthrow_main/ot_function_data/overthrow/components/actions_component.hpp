//Functions called locally, or initaited by client actions, generally should cause something to happen
class Actions {
	file = DIRECTORY(\actions);

	/* Workshop */
	class workshopAdd {};

	/* Shop */
	class factionVehicleCheck {};

	/* Factory */
	class factoryQueueAdd {};
	class factoryQueueRemove {};
	class factoryQueueRemoveAll {};
	class factoryUpgrade {};
	class reverseEngineer {};

	/* Resistance Screen */
	class makeGeneral {};
	class transferFunds {};
	class hireEmployee {};
	class fireEmployee {};
	class setVehicleWaypoint {};
	class refillFortifyBudget {};

	/* Jobs */
	class setJobWaypoint {};
	class requestJobResistance {};
	class requestJobGang {};
	class requestJobShop {};
	class requestJobFaction {};

	/* Other */
	class craft {};
	class recruitSoldier {};
	class recruitSquad {};
	class addGarrison {};
	class addPolice {};
	class playSound {};
	class triggerBattle {};
	class startSleeping{};
};

//Vehicle or vehicle adjacent related
class Vehicles {
	file = DIRECTORY(\actions\vehicle);
	
	class claimDrone {};
	class lockVehicle {};
	class paint {};
	class recover {};
	class salvageWreck {};
	class unflipVehicle {};
	class unownVehicle {};
};

//Actions no longer used
class Deprecated {
	file = DIRECTORY(\actions\deprecated);
	
	class startSpliff {};
	class stopSpliff {};
	class smokeAnimation {};
	class smokePuffs {};
	class spliffAnimation{};
};

// Physical Object related
class objects {
	file = DIRECTORY(\actions\objects);
	
	class build {};
	class canPlace {};
	class displayItem {};
	class dropDisplayItem {};
	class place {};
};

// Functions related to general inventory management
class Inventory {
	file = DIRECTORY(\actions\inventory);
	
	class addItemMultiple {};
	class dumpStuff {};
	class takeStuff {};
	class storeAll {};
	class transferTo {};
	class transferFrom {};
	class transferHelper {};
	class transferLegit {};
	class takeLegit {};
	class takeFromCargoContainers{};
	class addBackpackContents {};
	class dumpStuffStep {};
};

// Functions activated from the main menu or otherwise
class MainMenu {
	file = DIRECTORY(\actions\mainmenu);
	
	class fastTravel{};
	class jukebox{};
	class leaseBuilding{};
	class manageArea{};
	class onnamedone{};
	class onnamekeydown{};
	class recruitciv{};
	class recruitspawnciv{};
	class sethome{};
};

// Functions dealing with the exchange of paper currency for goods and services, or the safe
class Money {
	file = DIRECTORY(\actions\money);
	
	class buy {};
	class buyBuilding{};
	class exportAll {};
	class giveFunds {};
	class import {};
	class money {};
	class rewardMoney {};
	class safePutMoney {};
	class safeSetPassword {};
	class safeTakeMoney {};
	class sell {};
	class sellAll {};
	class sellLegitVehicle {};
	class takeFunds {};
};

//Absolute power corrupts absolutely
class ResistanceManagement {
	file = DIRECTORY(\actions\resistancemanagement);
	
	class buyBusiness {};
	class buyExpand {};
	class decreaseTax {};
	class disbandBase {};
	class increaseTax {};
};

class InventoryArsenal {
	file = DIRECTORY(\actions\inventory\arsenal);
	
	class openArsenal {};
	class removeLoadout {};
	class restoreLoadout {};
	class saveLoadout {};
	class editLoadout {};
	class editPoliceLoadout {};
};