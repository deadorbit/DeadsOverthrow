class CfgPatches {
	class ot_object_data {
		addonRootClass = "overthrow_main";
		
		name = "ot_object_data";
		requiredAddons[]= {
			"cba_xeh",
			"ace_main",
			"a3_characters_f",
			"rhssaf_c_troops",
			"rhs_c_a2port_car",
			"OT_cigs_deprecated",
			"ot_production_resources",
			"ot_weapons",
			"ot_vehicles",
			"ot_police_units_base"
		};
		requiredVersion = 0.01;
        version = 0.01;
		units[] = {};
		weapons[] = {};
	};
};

//Faction Data
#include "\overthrow_main\ot_object_data\components\factions_component.hpp"

class CfgVehicles {
	#include "\overthrow_main\ot_object_data\components\ACEInteractions_component.hpp"
	#include "\overthrow_main\ot_object_data\components\noUniformRestrictions_component.hpp"
};

//Object config data
#include "components\craftingData_component.hpp"
#include "components\weaponData_component.hpp"
#include "components\itemData_component.hpp"