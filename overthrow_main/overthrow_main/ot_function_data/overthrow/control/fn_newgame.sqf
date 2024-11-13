closeDialog 0;
//Call mod initvar
[] call OT_fnc_initVarServer;
"Generating economy" remoteExec['OT_fnc_notifyStart',0,false];
[] spawn OT_fnc_initEconomy;
waitUntil {!isNil "OT_economyInitDone"};
server setVariable["StartupType","NEW",true];
