class CfgFunctions
{
	#include "\overthrow_main\functions\AI\Vcom\cfgFunctions.hpp"
	//AI Driving Control (script version)
	#include "\overthrow_main\functions\aidrivingcontrol\cfgfunctions.hpp"
	class OT
	{
		class Base
		{
			file = "\overthrow_main\functions";
			class initVar {};
			class initOverthrow {};
			class initBaseVar {};
		};

        class Cleanup
		{
			file = "\overthrow_main\functions\cleanup";
			class cleanup {};
			class cleanDead {};
		};

		class Factions
		{
			file = "\overthrow_main\functions\factions";
			class factionNATO {};
			class factionGUER {};
			class factionCIV {};
			class factionCRIM {};
			class unitSeen {};
			class unitSeenNATO {};
			class unitSeenCRIM {};
			class unitSeenCIV {};
			class unitSeenPlayer {};
			class unitSeenAny {};
			class revealToNATO {};
			class revealToCRIM {};
			class revealToResistance {};
		};

		/* Persistent Save */
		class Save
		{
			file = "\overthrow_main\functions\save";
			class saveGame {};
			class loadGame {};
			class setOfflinePlayerAttribute {};
			class getOfflinePlayerAttribute {};
			class loadPlayerData {};
			class savePlayerData {};
			class autoSaveToggle {};
			class autoloadToggle {};
		};

		class sleep
		{
			file = "\overthrow_main\functions\sleep";
			class startSleeping {};
		};

		class admin
		{
			file = "\overthrow_main\functions\admin";
			class toggleZeus {};
		};

		class Loop
		{
			file = "\overthrow_main\functions\loop";
			class initActionLoop {};
			class addActionLoop {};
			class removeActionLoop {};
		};

		class Player
		{
			file = "\overthrow_main\functions\player";
			class initPlayerLocal {};
			class mapSystem {};
			class mapHandler {};
			class notificationLoop {};
			class townCheckLoop {};
			class perkSystem {};
			class setupPlayer {};
			class statsSystem {};
			class statsSystemLoop {};
			class wantedSystem {};
			class wantedLoop {};
			class unconsciousNoHelpPossible {};
			class playerIsOwner {};
			class playerIsGeneral {};
			class playerIsAtWarehouse {};
			class playerIsAtHardwareStore {};
			class playerIsAtStore {};
			class tutorial {};
			class influence {};
			class influenceSilent {};
			class rewardMoney {};
			class money {};
			class getPlayerHome {};
			class generalIsOnline {};
			class doConversation {};
			class givePlayerWaypoint {};
			class clearPlayerWaypoint {};
			class hasWeaponEquipped {};
			class carriesStaticWeapon {};
			class illegalInCar {};
			class illegalInInventory {};
			class detectedByReputation {};
			class detectedByReputationNATO {};
			class gangRep {};
			class RandomSearch {};
		};

		class Interaction
		{
			file = "\overthrow_main\functions\interaction";
			class mountAttached {};
			class initAttached {};
			class updateAttached {};
			class initObjectLocal {};
			class initStaticMGLocal {};
		};

		class Events
		{
			file = "\overthrow_main\functions\events";
			class deathHandler {};
			class buildingDamagedHandler {};
			class cargoLoadedHandler {};
			class explosivesPlacedHandler {};
			class playerConnectHandler {};
			class playerDisconnectHandler {};
			class refuelHandler {};
			class respawnHandler {};
			class keyHandler {};
			class taggedHandler {};
			class WheelRemovedHandler {};
			class EnemyDamagedHandler {};
			class QRFStartHandler {};
			class QRFEndHandler {};
			class onDeployStartHandler {};
			class GendarmPatrolChange {};
		};

		class UI
		{
			file = "\overthrow_main\functions\UI";
			class notifyMinor {};
			class notifyBig {};
			class notifyGood {};
			class notifyBad {};
			class notifySilent {};
			class notifyVehicle {};
			class playerDecision {};
			class choiceMade {};
			class notifyStart {};
			class progressBar {};
			class getAssignedKey {};
			class formatTime {};
			class notifyAndLog {};
			class dynamicText {};
			class topMessage {};
			class dialogFadeIn {};
		};

		class Dialogs
		{
			file = "\overthrow_main\functions\UI\dialogs";

			class mainMenu {};
			class buyDialog {};
			class paintDialog {};
			class sellDialog {};
			class buyDialogVehicle {};
			class sellDialogVehicle {};
			class workshopDialog {};
			class policeDialog {};
			class warehouseDialog {};
			class inputDialog {};
			class importDialog {};
			class recruitDialog {};
			class buyClothesDialog {};
			class buyVehicleDialog {};
			class gunDealerDialog {};
			class factoryDialog {};
			class factoryUpgradeDialog {};
			class garrisonDialog {};
			class newGameDialog {};
			class optionsDialog {};
			class resistanceDialog {};
			class manageHCDialog {};
			class reverseEngineerDialog {};
			class vehicleDialog {};
			class mapInfoDialog {};
			class characterSheetDialog {};
			class manageRecruitsDialog {};
			class loadoutDialog {};
			class buyHardwareDialog {};
			class sellHardwareDialog {};
			class jobsDialog {};
			class craftDialog {};
			class uploadData {};
			class logisticsDialog {};	
			class buyBusinessDialog {};
			class LegitMenu {};
			class buygangdialog {};
			class sellvalueloop {};
			class containerdialog {};
			class buycontainerdialog {};
			class containerlogisticdialog {};
			class townlogisticdialog {};
		};

		class Display
		{
			file = "\overthrow_main\functions\UI\display";
			class displayShopPic {};
			class displayPaintPic {};
			class displayWarehousePic {};
			class showMemberInfo {};
			class showBusinessInfo {};
			class refreshEmployees {};
			class displayJobDetails {};
			class displayCraftItem {};
			class factoryRefresh {};
			class displayLogisticDetails {};
			class displayselldata {};
		};

		/*
		* User actions
		*/
		class Actions
		{
			file = "\overthrow_main\functions\actions";

			class newGame {};

			/* Main Menu */
			class salvageWreck {};
			class buyBuilding {};
			class buyBusiness {};
			class buyExpand {};
			class jukebox {};
			class manageArea {};
			class fastTravel {};
			class talkToCiv {};
			class recruitCiv {};
			class recruitSpawnCiv {};
			class leaseBuilding {};
			class place {};
			class onNameDone {};
			class onNameKeyDown {};
			class setHome {};
			class build {};

			/* Options */
			class increaseTax {};
			class decreaseTax {};

			/* Vehicle */
			class transferTo {};
			class transferFrom {};
			class transferHelper {};
			class transferLegit {};
			class takeLegit {};
			class warehouseTake {};
			class recover {};
			class storeAll {};
			class UnownVehicle {};

			/* Port */
			class exportAll {};
			class import {};

			/* Workshop */
			class workshopAdd {};

			/* Shop */
			class buy {};
			class paint {};
			class sell {};
			class sellAll {};
			class factionVehicleCheck {};

			/* Factory */
			class factoryQueueAdd {};
			class factoryQueueRemove {};
			class factoryQueueRemoveAll {};
			class factoryUpgrade {};

			/* Resistance Screen */
			class makeGeneral {};
			class giveFunds {};
			class takeFunds {};
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

			/* Safe */
			class safePutMoney {};
			class safeTakeMoney {};
			class safeSetPassword {};

			/* Ammobox */
			class removeLoadout {};
			class restoreLoadout {};
			class saveLoadout {};
			class dumpStuff {};
			class dumpIntoWarehouse {};
			class takeStuff {};
			class openArsenal {};

			/* Other */
			class craft {};
			class recruitSoldier {};
			class recruitSquad {};
			class editLoadout {};
			class editPoliceLoadout {};
			class addGarrison {};
			class addPolice {};
			class lockVehicle {};
			class reverseEngineer {};
			class playSound {};
            class canPlace {};
			class vehicleCanMove {};
			class unflipVehicle {};
			class triggerBattle {};
			class sellBase {};
			class addItemMultiple {};
			class ClaimDrone {};

		};

		class SelfActions
    	{
        	file = "\overthrow_main\functions\actions\self";
			/* Spliffs */
			class startSpliff {};
			class stopSpliff {};
			class smokeAnimation {};
			class smokePuffs {};
		};

		/*
		* Locations, positions etc.
		*/
		class Geography
		{
			file = "\overthrow_main\functions\geography";
			class getRandomBuilding {};
			class nearestBase {};
			class nearestCheckpoint {};
			class nearestComms {};
			class nearestLocation {};
			class nearestMobster {};
			class nearestObjective {};
			class nearestObjAndFob {};
			class nearestObjectiveNoComms {};
			class nearestPositionRegion {};
			class nearestTown {};
			class nearestPort {};
			class getRegion {};
			class townsInRegion {};
			class regionIsConnected {};
			class getAO {};
			class getBuildId {};
			class weatherSystem {};
			class getRandomRoadPosition {};
			class isRadarInRange {};
			class positionIsAtWarehouse {};
		};

		/*
		* The spawner
		*/
		class Virtualization
		{
			file = "\overthrow_main\functions\virtualization";
			class initVirtualization {};
			class runVirtualization {};
			class spawn {};
			class despawn {};
			class inSpawnDistance {};
			class registerSpawner {};
			class deregisterSpawner {};
			class updateSpawnerPosition {};
			class resetSpawn {};
		};

		class Spawners
		{
			file = "\overthrow_main\functions\virtualization\spawners";

			class spawnAmbientVehicles {};
			class spawnBoatDealers {};
			class spawnBusinessEmployees {};
			class spawnCarDealers {};
			class spawnCivilians {};
			class spawnFactionRep {};
			class spawnGendarmerie {};
			class spawnGunDealer {};
			class spawnNATOCheckpoint {};
			class spawnNATOObjective {};
			class spawnPolice {};
			class spawnShops {};
		};

		/*
		* The economy, its in shambles
		*/
		class Economy
		{
			file = "\overthrow_main\functions\economy";
			class initEconomy {};
			class initEconomyLoad {};
			class setupTownEconomy {};
			class support {};
			class getPrice {};
			class getSellPrice {};
			class getDrugPrice {};
			class nearestRealEstate {};
			class getRealEstateData {};
			class getBusinessData {};
			class getBusinessPrice {};
			class getTaxIncome {};
			class resistanceFunds {};
			class incomeSystem {};
			class propagandaSystem {};
			class stability {};
			class getControlledPopulation {};
			class getLegitScore {};
			class sellLegitVehicle {};
			class townFlagUpdater {};
			class getAGMAmount {};
		};

		/*
		* Inventory transfer and manegement
		*/
		class Inventory
		{
			file = "\overthrow_main\functions\inventory";
			class takeFromCargoContainers {};
			class hasFromCargoContainers {};
			class anythingGetName {};
			class weaponGetName {};
			class magazineGetName {};
			class vehicleGetName {};
			class glassesGetName {};
			class weaponGetPic {};
			class magazineGetPic {};
			class vehicleGetPic {};
			class glassesGetPic {};
			class magazineGetDescription {};
			class vehicleGetDescription {};
			class getSearchStock {};
		};

		/*
		* The warehouse
		*/
		class Warehouse
		{
			file = "\overthrow_main\functions\warehouse";
			class addToWarehouse {};
			class removeFromWarehouse {};
			class findHelmetInWarehouse {};
			class findScopeInWarehouse {};
			class findWeaponInWarehouse {};
			class findVestInWarehouse {};
			class verifyLoadoutFromWarehouse {};
			class applyLoadoutFromWarehouse {};
			class qtyInWarehouse {};
			class isInWarehouse {};
		};

		/*
		* AI and recruits
		*/
		class AI
		{
			file = "\overthrow_main\functions\AI";
			class createSoldier {};
			class getSoldier {};
			class getSquad {};
			class parachuteAll {};
			class NATOsearch {};
			class createSquad {};
			class experience {};
			class dangerCaused {};
			class randomizeLoadout {};
			class getRandomLoadout {};
			class PoliceRemoveObj {};
		};

		/*
		* AI orders
		*/
		class Orders
		{
			file = "\overthrow_main\functions\AI\orders";
			class orderLoot {};
			class orderOpenInventory {};
			class orderOpenArsenal {};
			class orderRevivePlayer {};
			class squadAssignVehicle {};
			class squadGetIn {};
			class squadGetOut {};
			class squadGetInMyVehicle {};
			class orderStopAndFace {};
			class landAndCleanupHelicopter {};
		};

		/*
		* NPCs
		*/
		class NPC
		{
			file = "\overthrow_main\functions\AI\NPC";
			class randomLocalIdentity {};
			class applyIdentity {};
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
			class initMilitaryVeh {};
			class initMilitaryPatrol {};
			class initMobBoss {};
			class initMobster {};
			class initNATOCheckpoint {};
			class initPolice {};
			class initPolicePatrol {};
			class initPriest {};
			class initShopkeeper {};
			class initSniper {};
			class initRecruit {};
		};

		/*
		* Math.. how does it work?
		*/
		class Math
		{
			file = "\overthrow_main\functions\math";
			class rotationMatrix {};
			class matrixMultiply {};
			class matrixRotate {};
		};

		/*
		* NATO
		*/
		class NATO
		{
			file = "\overthrow_main\functions\factions\NATO";
			class initNATO {};

			class NATOQRF {};
			class NATOGroundForces {};
			class NATOGroundReinforcements {};
			class CTRGalt {};
			class CTRGSupport {};
			class NATOAirSupport {};
			class NATOGroundSupport {};
			class NATOTankSupport {};
			class NATOSeaSupport {};
			class NATOScrambleJet {};
			class NATOAPCInsertion {};
			class NATOScrambleHelicopter {};
			class NATOGroundPatrol {};
			class NATOAirPatrol {};
			class NATOAPCBrigade {};
			class NATOArtySupport {};
			class NATOCreateArtyBase {};

			class NATOResponseObjective {};
			class NATOResponseTown {};
			class NATOCounterTown {};
			class NATOCounterObjective {};

			class NATOSupportSniper {};
			class NATOSupportRecon {};
			class NATOConvoy {};
			class NATODeployFOB {};
			class NATOMissionDeployFOB {};
			class NATOMissionReconDestroy {};
			class NATOSetExplosives {};
			class NATOupgradeFOB {};
			class NATOsendGendarmerie {};
			class NATOreportThreat {};
			class NATOGetAttackVectors {};
			
			class illuminatingFlares {};//By
		};

		class NATOAI
		{
			file = "\overthrow_main\functions\factions\NATO\AI";
			class NATODrone {};
			class NATOMortar {};
		};

		class CRIM
		{
			file = "\overthrow_main\functions\factions\CRIM";
			class CRIMLoop {};
			class formOrJoinGang {};
			class formGang {};
			class addToGang {};
			class gangJoinResistance {};
			class gangLevelUp {};
		};

		class GUER
		{
			file = "\overthrow_main\functions\factions\GUER";
			class jobSystem {};
			class assignJob {};
			class acceptJob {};
			class denyJob {};
			class startJob {};
			class jobLoop {};
			class JammingLoop {};
			class GUERLoop {};
		};
		
		class CIV
		{
			file = "\overthrow_main\functions\factions\CIV";
			class createDrop {};
			class despawnDeadWithTime{};
		};


		class Buildings
		{
			file = "\overthrow_main\functions\buildings";
			class initBuilding {};
			class initObservationPost {};
			class initPoliceStation {};
			class initWorkshop {};
			class initTrainingCamp {};
			class initWarehouse {};
			class initRadar {};
			class initJammer {};
			class initHouse {};
		};

        class Util
		{
			file = "\overthrow_main\functions\util";
			class addBackpackContents {};
			class getOwner {};
			class getOwnerUnit {};
      		class hasOwner {};
			class setOwner {};
			class unitStock {};
      		class spawnTemplate {};
			class sortBy {};
			class sortByInplace {};
			class findReplace {};
			class exportPrices {};
			class datestamp {};
			class logVerbose {};
			class EventHandlerSafeRemove {};
			class MoveToHC {};
			class flatempty {};
			class NumVehs {};
			class SideFromFaction {};
			class escapeXML {};
			class playerMID {};
			class UniformFromFaction {};
		};

		/*
		* Mod integration
		*/
		class Integration
		{
			file = "\overthrow_main\functions\integration";
			class advancedTowingInit {};
			class detectItems {};
		};
	};

	class SHK_pos {
		class Functions {
			file="\overthrow_main\functions\geography\SHK_pos";

			class findClosestPosition {};
			class getMarkerCorners {};
			class getMarkerShape {};
			class getPos {};
			class getPosFromCircle {};
			class getPosFromEllipse {};
			class getPosFromRectangle {};
			class getPosFromSquare {};
			class isBlacklisted {};
			class isInCircle {};
			class isInEllipse {};
			class isInRectangle {};
			class isSamePosition {};
			class rotatePosition {};

			class getPosWrapper {};
			class getPosMarkerWrapper {};
			class pos {};
		};
	};

    class lambs_danger{
		//lambs danger fsm
		class functions
		{
            file = "\overthrow_main\functions\Lambs_functions";
            class assault{};
            class assaultBuilding{};
            //class assaultCQB;
            class checkBody{};
            class coward{};
            class debugDangerType{};
            class debugMarkerColor{};
            class dotMarker{};
            class gesture{};
            class hideInside{};
            class immediateAction{};
            class immediateActionEH{};
			      class indoor{};
            class leaderArtillery{};
            class leaderAssess{};
            class leaderBuildings{};
            class leaderCQC{};
            class leaderHide{};
            class leaderManoeuvre{};
            class leaderMode{};
            class leaderModeUpdate{};
            class nearBuildings{};
            class panic{};
            class react{};
            class shareInformation{};
            class shareInformationRange{};
            class suppress{};
            class vehicleAssault{};
            class vehicleJink{};
            class vehicleRotate{};
            class vehicleSuppress{};
            class zoneMarker{};
            class zettings {preinit = 1;};
        };
    };

	class lambs_wp {
        class functionsAI {
            file = "overthrow_main\functions\lambs_dangerWP\ai";
            class taskArtillery;
            class taskArtilleryRegister;
            class taskAttack;
            class taskCamp;
            class taskCQB;
            class taskCreep;
            class taskGarrison;
            class taskHunt;
            class taskPatrol;
            class taskRush;
        };
    };

	class LAMBS_DangerAI {
		displayName = "Advanced AI [LAMBS]";
        class LAMBS_Danger_Attack {
            displayName = "0 TASK ATTACK [Enters buildings]";
            displayNameDebug = "LAMBS_Danger_Attack";
            file = "overthrow_main\functions\lambs_dangerWP\ai\fn_taskAttack.sqf";	// SQF file
            icon = "\a3\3DEN\Data\CfgWaypoints\SeekAndDestroy_ca.paa";
			tooltip = "Units assault position and check buildings around waypoint out to WP completion radius (default 25m)";
        };
        class LAMBS_Danger_Garrison {
            displayName = "1 TASK GARRISON";
            displayNameDebug = "LAMBS_Danger_Garrison";
            file = "overthrow_main\functions\lambs_dangerWP\ai\fn_taskGarrison.sqf";	// SQF file
            icon = "\a3\3DEN\Data\CfgWaypoints\Guard_ca.paa";
			tooltip = "Garrisons units in buildings around waypoint out to WP completion radius (default 50m)";
        };
        class LAMBS_Danger_Patrol {
            displayName = "2 TASK PATROL";
            displayNameDebug = "LAMBS_Danger_Patrol";
            file = "overthrow_main\functions\lambs_dangerWP\ai\fn_taskPatrol.sqf";	// SQF file
            icon = "\a3\3DEN\Data\CfgWaypoints\Loiter_ca.paa";
			tooltip = "Randomised patrol within WP completion radius (Default 200m)";
        };
        class LAMBS_Danger_Rush {
            displayName = "3 TASK RUSH";
            displayNameDebug = "LAMBS_Danger_Rush";
            file = "overthrow_main\functions\lambs_dangerWP\ai\fn_taskRush.sqf";	// SQF file
            icon = "\a3\3DEN\Data\CfgWaypoints\Sentry_ca.paa";
			tooltip = "Rushes players within WP completion radius (Default 1000m)\nOnly targets players!";
        };
        class LAMBS_Danger_Hunt {
            displayName = "4 TASK HUNT";
            displayNameDebug = "LAMBS_Danger_Hunt";
            file = "overthrow_main\functions\lambs_dangerWP\ai\fn_taskHunt.sqf";	// SQF file
            icon = "\a3\3DEN\Data\CfgWaypoints\Sentry_ca.paa";
			tooltip = "Hunts players within WP completion radius (Default 1000m)\nOnly targets players!";
        };
        class LAMBS_Danger_Creep {
            displayName = "5 TASK CREEP";
            displayNameDebug = "LAMBS_Danger_Creep";
            file = "overthrow_main\functions\lambs_dangerWP\ai\fn_taskCreep.sqf";	// SQF file
            icon = "\a3\3DEN\Data\CfgWaypoints\Sentry_ca.paa";
			tooltip = "Stalks players within WP completion radius (Default 1000m)\nOnly targets players!";
        };
        class LAMBS_Danger_CQB {
            displayName = "6 TASK CQB [Experimental]";
            displayNameDebug = "LAMBS_Danger_CQB";
            file = "overthrow_main\functions\lambs_dangerWP\ai\fn_taskCQB.sqf";	// SQF file
            icon = "\a3\3DEN\Data\CfgWaypoints\SeekAndDestroy_ca.paa";
			tooltip = "Clears buildings around the waypoint out to WP completion radius (Default 50m)";
        };
        class LAMBS_Danger_Artillery {
            displayName = "9 REGISTER ARTILLERY";
            displayNameDebug = "LAMBS_Register_Artillery";
            file = "overthrow_main\functions\lambs_dangerWP\ai\fn_taskArtilleryRegister.sqf";	// SQF file
            icon = "\a3\3DEN\Data\CfgWaypoints\Scripted_ca.paa";
			tooltip = "Registers artillery for dynamic use";
        };
    };
};
