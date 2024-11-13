#define DIRECTORY(var1) \overthrow_main\ot_function_data\aidrivingcontrol##var1

class CfgPatches {
	class ot_function_aidrivingcontrol {
		author="deadorbit";
		name = "ot_function_aidrivingcontrol";
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
	class AIDC
	{
		class AI_Driving_Control
		{
			tag = "AI_Driving_Control";
			class init
			{
				file = DIRECTORY(\functions\fn_init.sqf);
			};
			class main
			{
				file = DIRECTORY(\functions\fn_main.sqf);
			};
			class vehiclesAround
			{
				file = DIRECTORY(\functions\fn_vehiclesaround.sqf);
			};
			class vehiclesSort
			{
				file = DIRECTORY(\functions\fn_vehiclessort.sqf);
			};
			class zeus
			{
				file = DIRECTORY(\functions\fn_zeus.sqf);
			};
		};
	};	
};

class CfgRemoteExec{
	class Functions {
		mode = 2;
		jip = 1;
		class AIDC_fnc_init {
			allowedTargets = 0;
			jip = 0;
		};
	};
};