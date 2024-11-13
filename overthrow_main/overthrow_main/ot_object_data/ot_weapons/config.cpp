class CfgPatches {
	class ot_weapons {
		author="deadorbit";
		name = "ot_weapons";
		url="https://steamcommunity.com/sharedfiles/filedetails/?id=774201744";
		requiredAddons[]= {
			"cba_xeh",
			"ace_main",
			"ace_ballistics",
			"rhs_main",
			"rhsusf_main",
			"rhsgref_main",
			"rhssaf_main",
			"rhsusf_c_weapons"
		};
		requiredVersion = 0.01;
        version = 0.01;
		units[] = {};
		weapons[] = {"ot_rhs_weap_m4_le6920", "ot_rhs_weap_m4_le6920T"};
	};
};

#include "components\CfgAmmo_component.hpp"
#include "components\CfgMagazines_component.hpp"
#include "components\CfgMagazineWells_component.hpp"

class CfgWeapons {
	#include "..\shared\basicDefines_A3.hpp"
	#include "components\weaponReconfigs_component.hpp"
};