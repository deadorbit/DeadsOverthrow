/*
 * Overthrow
 *
 * Player Init
 *
 */
 
[format["%1 has connected.", player], "STARTUP_LOCAL"] call OT_fnc_debugLog;

["OT_LoadingBlackOut", false, 0] call BIS_fnc_blackOut;
//Ensure blackout finishes
uiSleep 0.5;
 
if !(isClass (configFile >> "CfgPatches" >> "overthrow_main")) exitWith {
	[
		format ["<t size='0.5' color='#000000'>Overthrow addon not detected, you must add @Overthrow to your -mod commandline. (Skill Issue)</t>",_this],
		0,
		0.2,
		30,
		0,
		0,
		2
	] spawn BIS_fnc_dynamicText;
};

[
	{!(isNil "OT_varInitDone")},
	{
		[format["%1's has finished waiting on inital vars.", player], "STARTUP_LOCAL"] call OT_fnc_debugLog;
		
		//Create data store
		OT_local_PFEH = createHashMap;
		OT_local_KCH = createHashMap;
		
		//Make host a general
		if(isServer) then {
			if(isNil {server getVariable "generals"}) then {
				server setVariable ["generals",[getplayeruid player], true]
			};
		};
		
		//Create and link high command
		private _highCommandModule = (createGroup sideLogic) createUnit ["HighCommand",[0,0,0],[],0,"NONE"];
		_highCommandModule synchronizeObjectsAdd [player];
		missionNameSpace setVariable [format["%1_hc_module",getPlayerUID player],_highCommandModule,true];
		
		//Wipe inventory of unit the player has controlled
		removeAllWeapons player;
		removeAllAssignedItems player;
		removeGoggles player;
		removeBackpack player;
		removeHeadgear player;
		removeVest player;
		player linkItem "ItemMap";
		[format["Cleared %1's inventory.", player], "STARTUP_LOCAL"] call OT_fnc_debugLog;
		
		[0] call OT_fnc_initPlayerLocal;
	},
	[]
] call CBA_fnc_waitUntilAndExecute;
