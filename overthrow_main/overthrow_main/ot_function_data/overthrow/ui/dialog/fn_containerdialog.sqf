createdialog "OT_dialog_container";
ctrlenable[1602,false];
ctrlenable[1603,false];
ctrlenable[1604,false];
if(!(count (player nearObjects [OT_portBuilding,30]) isEqualTo 0)) then {
	ctrlenable[1604,true];
};