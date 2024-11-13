class CfgPatches {
	class ot_ui_data {
		addonRootClass = "overthrow_main";
		
		name = "ot_ui_data";
		requiredAddons[]= {
			"cba_xeh",
			"ace_main",
			"ot_fonts",
			"deads_F_main"
		};
		requiredVersion = 0.01;
        version = 0.01;
		units[] = {};
		weapons[] = {};
	};
};

#include "components\image_component.hpp"
#include "components\acetagging_component.hpp"
#include "components\uidialog_component.hpp"
#include "components\marker_component.hpp"