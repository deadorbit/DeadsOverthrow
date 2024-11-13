#define DIRECTORY(var1) \overthrow_main\ot_function_data\Vcom##var1

class CfgPatches {
	class ot_function_vcom {
		author="deadorbit";
		name = "ot_function_vcom";
		url="https://steamcommunity.com/sharedfiles/filedetails/?id=774201744";
		requiredAddons[]= {
			"cba_xeh",
			"ace_main"
		};
		requiredVersion = 0.01;
        version = 0.01;
		units[] = {};
		weapons[] = {};
	};
};

class CfgFunctions {
	class VCOM {
		tag = "VCM";
		
		class FSM {
			file = DIRECTORY(\FSMS);
			
			class SQUADBEH {
				ext = ".fsm";
			};
		};
		
		class Functions {
			file = DIRECTORY(\Functions\VCM_Functions);
			
			class ActRearm {};
			class AIHit {};
			class ArmStatics {};
			class ArtyCall {};
			class ArtyManage {};
			class BoxNrst {};
			class CheckArty {};
			class Classname {};
			class ClearBuilding {};
			class ClstEmy {};
			class ClstObj {};
			class ClstWarn {};
			class EmptyStatic {};
			class EnemyArray {};
			class FindCover {};
			class FlankMove {};
			class ForceMove {};
			class FriendlyArray {};
			class FrmChnge {};
			class Garrison {};
			class GarrisonLight {};
			class HasMine {};
			class HealSelf {};
			class HearingAids {};
			class Heights {};
			class IRCHECK {};
			class KitChk {};
			class KnowAbout {};
			class MedicalHandler {};
			class MedicHeal {};
			class MineMonitor {};
			class MinePlant {};
			class PackStatic {};
			class RearmSelf {};
			class RMedics {};
			class RStatics {};
			class SatchelPlant {};
			class SquadExc {};
			class WyptChk {};	
			class vehiclecommandeer {};
			class VehicleCheck {};
			class VehicleMove {};
			class IsTransport {};
			class isFlatEmpty {};
			class CBASettings {};
		};		
	};
};