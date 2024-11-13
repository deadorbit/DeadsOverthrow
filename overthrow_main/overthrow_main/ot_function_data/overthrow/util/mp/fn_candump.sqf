/* ----------------------------------------------------------------------------
Function: OT_fnc_canDump


Description:
    - Ensures multiplayer saftey for OT_fnc_dumpStuff, checks that the container isnt
	already being dumped into, and if it is, that the dumper still exists and is
	valid.
	
Parameters:
	- _object(Object)		default: objNull		Object to check for dumpability

Optional:
	-N/A

Example:
	[box] call OT_fnc_canDump; <- Will always be true if no one has ever dumped into the box before

Returns:
    - Boolean:	Whether or not the container is safe to dump items into
	
Notes:
	- AI can also dump into objects will the loot order, so this command is needed not just in MP

Author:
    deadorbit
---------------------------------------------------------------------------- */
params [["_object", objNull]];
if (_object isEqualTo objNull) exitWith {};

private _canDump = false;

private _dumpStatus = _object getVariable ["OT_dumpingData", [objNull, false, 0]]; //Data of who/if container is being dumped into

_dumpStatus =+ _dumpStatus; //Make sure not to accidently overwrite data
_dumpStatus params ["_dumper", "_isDumpingInto", "_dumpStarted"];

if (_isDumpingInto) then {//Check if contianer is being dumped into, to protect from race conditions
	if (_dumper isEqualTo objNull) then { //If this is the case, the dumper either left or was deleted while dumping... naughty (Todo: run this check on server whenever a player disconnects/unit dies)
		_canDump = true;
	}else{//The dumper is still a valid entity, time to run some checks
		switch (true) do {
			case(!alive _dumper) : {_canDump = true};//Dead dumpers tell no tales
			case((_dumper distance _object) > 10) : {_canDump = true}; //No long range dumping
			case((serverTime - _dumpStarted) > 60)  : {_canDump = true}; //They have been dumping for an inordinate amount of time
		};
	};
}else{
	_canDump = true; // No problems here
};

_canDump