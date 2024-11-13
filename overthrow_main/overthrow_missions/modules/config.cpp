class CfgPatches {
	class overthrow_missions_modules {
		author="deadorbit";
		name = "overthrow_missions_modules";
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
/*
class CfgVehicles {
	class Logic;
	class Module_F : Logic {
		class AttributesBase {
			class Default;
			class Edit;					// Default edit box (i.e. text input field)
			class Combo;				// Default combo box (i.e. drop-down menu)
			class Checkbox;				// Default checkbox (returned value is Boolean)
			class CheckboxNumber;		// Default checkbox (returned value is Number)
			class ModuleDescription;	// Module description
			class Units;				// Selection of units on which the module is applied
		};

		// Description base classes (for more information see below):
		class ModuleDescription {
			class AnyBrain;
		};
	};

	class OT_town_module : Module_F {
		scope = 2;							// Editor visibility; 2 will show it in the menu, 1 will hide it.
		displayName = "Overthrow Town";		// Name displayed in the menu
		category = "Effects";

		function = "TAG_fnc_moduleNuke";
		functionPriority = 1;				// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		isGlobal = 1;						// 0 for server only execution, 1 for global execution, 2 for persistent global execution
		isTriggerActivated = 0;				// 1 for module waiting until all synced triggers are activated
		isDisposable = 0;					// 1 if modules is to be disabled once it is activated (i.e. repeated trigger activation will not work)
		is3DEN = 0;							// 1 to run init function in Eden Editor as well
		
		class Attributes : AttributesBase {
			class TownTier : Combo {
				property = "OT_Town_TownTier";				// Unique property (use "<tag>_<moduleClass>_<attributeClass>" format to ensure that the name is unique)
				displayName = "Tier of town, how important it is in gameplay";			// Argument label
				tooltip = "How important it is in gameplay";	// Tooltip description
				typeName = "STRING";							// Value type, can be "NUMBER", "STRING" or "BOOL"
				defaultValue = "TOWN";							// Default attribute value.
				// Listbox items
				class Values {
					class TOWN {
						name = "Town";
						value = "Town";
					};
					class REGIONAL {
						name = "Regional Capital";
						value = "Regional";
					};
					class CAPITAL {
						name = "Nation Capital";
						value = "Capital"
					};
				};
			};
		};			
		
		// 3DEN Attributes Menu Options
		canSetArea = 1;						// Allows for setting the area values in the Attributes menu in 3DEN
		canSetAreaShape = 0;				// Allows for setting "Rectangle" or "Ellipse" in Attributes menu in 3DEN
		canSetAreaHeight = 0;				// Allows for setting height or Z value in Attributes menu in 3DEN
		class AttributeValues
		{
			// This section allows you to set the default values for the attributes menu in 3DEN
			size2[] = {300, 300};		// 3D size (x-axis radius, y-axis radius, z-axis radius)
			isRectangle = 0;				// Sets if the default shape should be a rectangle or ellipse
		};
	};
};
*/