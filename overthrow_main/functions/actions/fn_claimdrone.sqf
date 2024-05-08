private _target = cursortarget;
private _crew = crew _target;
if((count _crew) == 0) then {
	createvehiclecrew _target;
	[_target] joinsilent creategroup [independent,true];
}else{
	[_target] joinsilent creategroup [independent,true];
};
systemchat "Drone Claimed!";