//Check if it is an overthrow mission
if !(isNil "bigboss" || OT_debugMode) exitWith {};

if (OT_debugMode) then {
	OT_DEBUG_allCfgData = [];
};

[] call OT_fnc_initCfgVars;
[] call OT_fnc_initIllegalVars;
[] call OT_fnc_initInvalidVars;
[] call OT_fnc_initImageVars;
[] call OT_fnc_initShopStockVars;

if (OT_debugMode) then {
	OT_DEBUG_allCfgData arrayIntersect OT_DEBUG_allCfgData;
};