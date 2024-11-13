class CfgPatches {
	class overthrow_missions {
		author="deadorbit";
		name = "overthrow_missions";
		url="https://steamcommunity.com/sharedfiles/filedetails/?id=774201744";
		requiredAddons[]= {
			"cba_xeh",
			"ace_main",
			"overthrow_main"
		};
		requiredVersion = 0.01;
        version = 0.01;
		units[] = {};
		weapons[] = {};
	};
};

class CfgMissions {	
	class MPMissions {
		class DeadsOTRHSAltis {
			briefingName 	= 	"Dead's Overthrow: Altis";
			directory		=	"overthrow_missions\missions\DeadsOTAltis.Altis";
		};
		
		class DeadsOTRHSMalden {
			briefingName	= 	"Dead's Overthrow: Malden";
			directory		=	"overthrow_missions\missions\DeadsOTMalden.Malden";
		};
		
		class DeadsOTRHSTanoa {
			briefingName 	= 	"Dead's Overthrow: Tanoa";
			directory		=	"overthrow_missions\missions\DeadsOTTanoa.Tanoa";
		};
		
		class DeadsOTRHSEnoch {
			briefingName 	=	"Dead's Overthrow: Livonia";
			directory		=	"overthrow_missions\missions\DeadsOTEnoch.Enoch";
		};
		
		class DeadsOTRHSSafrouRamal {
			briefingName 	= 	"Dead's Overthrow: Sefrou-Ramal [WIP]";
			directory		=	"overthrow_missions\missions\DeadsOTSefrouRamal.SefrouRamal";
		};
		class DeadsOTRHSVR {
			briefingName 	= 	"Dead's Overthrow: VR [Debug Map]";
			directory		=	"overthrow_missions\missions\DeadsOTVR.VR";
		};
	};
};

class CfgMPGameTypes {
    class OT {
        name = "Overthrow";
        shortcut = "OT";
        id = 55;
        picture = "overthrow_missions\shared\data\ui\icon_gamemodeDOT_tiny_ca.paa";
        description = "Coop";
    };
};

class CfgWorlds {
	class CAWorld;
	class Tanoa : CAWorld {
		class Names {
			class RailwayDepot01 {
				name = "factory";
			};
		};
	};
};

#include "\overthrow_missions\components\missioncustomization_component.hpp"