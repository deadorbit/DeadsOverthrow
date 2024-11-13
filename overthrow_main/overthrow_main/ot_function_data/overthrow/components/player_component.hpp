//Informs about the state of the player, or handles interactions local only to a single player (Map, skills, dialog, ect.)
class Player {
	file = DIRECTORY(\player);
	
	class carriesStaticWeapon {};
	class clearPlayerWaypoint {};
	class detectedByReputation {};
	class detectedByReputationNATO {};
	class doConversation {};
	class gangRep {};
	class generalIsOnline {};
	class getPlayerHome {};
	class getsearchstock{};
	class givePlayerWaypoint {};
	class hasFromCargoContainers {};
	class influence {};
	class influenceSilent {};
	class mapHandler {};
	class mapSystem {};
	class notificationLoop {};
	class perkSystem {};
	class playerIsAtHardwareStore {};
	class playerIsAtStore {};
	class playerIsGeneral {};
	class playerIsOwner {};
	class randomSearch {};
	class townCheckLoop {};
	class tutorial {};
	class unconsciousNoHelpPossible {};
};

class PlayerWanted {
	file = DIRECTORY(\player\wanted);
	
	class illegalInCar {};
	class illegalInInventory {};
	class hasWeaponEquipped {};
	class wantedLoop {};
	class wantedSystem {};
	class playerGearStatus {};
	class playerSeenStatus {};
	class isPlayerVisible {};
};