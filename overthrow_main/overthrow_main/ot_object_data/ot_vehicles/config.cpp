class CfgPatches {
	class ot_vehicles {
		addonRootClass = "overthrow_main";
		
		name = "ot_vehicles";
		requiredAddons[]= {
			"cba_xeh",
			"ace_main",
			"rhs_main",
			"rhsusf_main",
			"rhsgref_main",
			"rhssaf_main",
			"ot_weapons",
			"ot_kamazrecoverer",
			"rhs_c_a2port_car"
		};
		requiredVersion = 0.01;
        version = 0.01;
		units[] = {"OT_C_T_LSV", "OT_C_T_LSV2", "OT_C_rhsgref_nat_uaz", "OT_C_Ural", "OT_Land_Cargo10_grey_F"};
		weapons[] = {};
	};
};

class CfgVehicles {
	#include "..\shared\basicDefines_A3.hpp"
	#include "components\vehicleReconfigs_component.hpp"
};