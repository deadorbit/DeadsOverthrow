#define DIRECTORY(var1) \overthrow_main\ot_function_data\overthrow##var1

class CfgPatches {
	class ot_function_overthrow {
		author="deadorbit";
		name = "ot_function_overthrow";
		url="https://steamcommunity.com/sharedfiles/filedetails/?id=774201744";
		requiredAddons[] = {
			"cba_xeh",
			"ace_main",
			"deads_F_main"
		};
		requiredVersion = 0.01;
        version = 0.01;
		units[] = {};
		weapons[] = {};
	};
};

class CfgFunctions {
	class OT {
		#include "components\actions_component.hpp"
		#include "components\admin_component.hpp"
		#include "components\ai_component.hpp"
		#include "components\cba_component.hpp"
		#include "components\cleanup_component.hpp"
		#include "components\config_component.hpp"
		#include "components\control_component.hpp"
		#include "components\economy_component.hpp"
		#include "components\factions_component.hpp"
		#include "components\loop_component.hpp"
		#include "components\player_component.hpp"
		#include "components\preinit_component.hpp"
		#include "components\talktociv_component.hpp"
		#include "components\ui_component.hpp"
		#include "components\util_component.hpp"

		class Interaction
		{
			file = DIRECTORY(\interaction);
			
			class mountAttached {};
			class initAttached {};
			class updateAttached {};
			class initObjectLocal {};
			class initStaticMGLocal {};
		};

		class Events
		{
			file = DIRECTORY(\events);
			
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
			class ACEArsenalClosed {};
			class ACEArsenalOpened {};
			class ACEArsenalLeftPanalFilled {};
			class ACEArsenalLeftLBSelChanged {};
		};


		/*
		* Locations, positions etc.
		*/
		class Geography
		{
			file = DIRECTORY(\geography);
			
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
			file = DIRECTORY(\virtualization);
			
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
			file = DIRECTORY(\virtualization\spawners);

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
		* The warehouse
		*/
		class Warehouse
		{
			file = DIRECTORY(\warehouse);
			
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
			class warehousetake {};
			class dumpintowarehouse{};
		};

		class Buildings
		{
			file = DIRECTORY(\buildings);
			
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

		/*
		* Mod integration
		*/
		class Integration
		{
			file = DIRECTORY(\integration);
			
			class advancedTowingInit {};
			class detectItems {};
		};
	};

	class SHK_pos {
		class Functions {
			file = DIRECTORY(\geography\SHK_pos);

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
};

//OT-CBA XEHs
class Extended_Killed_EventHandlers {
	class CAManBase {
		class overthrow_shared_killed {
			killed  = "";
			serverKilled  = "_this call OT_fnc_killedLootScript";
			clientKilled  = "";
		};
	};
};

class Extended_PreInit_EventHandlers {
    class overthrow_main_CBASettings {
        init = "call compile preprocessFileLineNumbers '\overthrow_main\ot_function_data\overthrow\cba\cbaaddonsettings.sqf'";
    };
};