//Functions related to the spawning, control, and logic of AI squads and units
class AI {
	file = DIRECTORY(\AI);
	
	class createSoldier {};
	class createSquad {};
	class dangerCaused {};
	class experience {};
	class getSoldier {};
	class getSquad {};
	class NATOsearch {};
	class parachuteAll {};
	class policeRemoveObj {};
};

//Orders players/scripts can give to AI
class Orders {
	file = DIRECTORY(\AI\orders);
	
	class landAndCleanupHelicopter {};
	class orderLoot {};
	class orderOpenArsenal {};
	class orderOpenInventory {};
	class orderRevivePlayer {};
	class orderStopAndFace {};
	class squadAssignVehicle {};
	class squadGetIn {};
	class squadGetInMyVehicle {};
	class squadGetOut {};
};

//AI spawning logic for ai created via spawner loop
class NPC {
	file = DIRECTORY(\AI\NPC);
	
	class applyIdentity {};
	class getNPCIcon {};
	class randomLocalIdentity {};
};

class NPCInit {
	file = DIRECTORY(\AI\NPC\init);
	
	class initCarDealer {};
	class initCivilian {};
	class initCivilianGroup {};
	class initCriminal {};
	class initCriminalGroup {};
	class initCrimLeader {};
	class initCrimLeaderCommandCheck {};
	class initGendarm {};
	class initGendarmPatrol {};
	class initGunDealer {};
	class initHarbor {};
	class initMilitary {};
	class initMilitaryPatrol {};
	class initMilitaryVeh {};
	class initMobBoss {};
	class initMobster {};
	class initNATOCheckpoint {};
	class initPolice {};
	class initPolicePatrol {};
	class initPriest {};
	class initRecruit {};
	class initShopkeeper {};
	class initSniper {};
};

//Functions for deciphering BIS loadout array
class AILoadout {
	file = DIRECTORY(\AI\Loadout);
	
	class getRandomLoadout {};
	class randomizeLoadout {};
	class randomNATOScope {};
};