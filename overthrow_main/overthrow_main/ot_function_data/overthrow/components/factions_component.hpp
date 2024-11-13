class Factions {
	file = DIRECTORY(\factions);
	
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

class NATO {
	file = DIRECTORY(\factions\NATO);
	
	//class initNATO {}; moved to control

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
	
	class illuminatingFlares {};
};

class NATOAI {
	file = DIRECTORY(\factions\NATO\AI);
	
	class NATODrone {};
	class NATOMortar {};
};

class CRIM {
	file = DIRECTORY(\factions\CRIM);
	
	class addToGang {};
	class CRIMLoop {};
	class formGang {};
	class formOrJoinGang {};
	class gangJoinResistance {};
	class gangLevelUp {};
};

class GUER {
	file = DIRECTORY(\factions\GUER);

	class GUERLoop {};
	class JammingLoop {};
};

class JobSystem {
	file = DIRECTORY(\factions\GUER\jobsystem);
	
	class acceptJob {};
	class assignJob {};
	class denyJob {};
	class jobLoop {};
	class jobSystem {};
	class spawnjob {};
	class startJob {};
};

class CIV {
	file = DIRECTORY(\factions\CIV);
	
	class createDrop {};
	class despawnDeadWithTime{};
};