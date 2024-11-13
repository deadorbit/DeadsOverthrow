/* ----------------------------------------------------------------------------
Function: OT_fnc_dumpStuff


Description:
    - Transfers unit inventory into container inventory, deleting the orignal items.
	Optionally can be set to stop adding items when the target container is full,
	or to drop the items around the target container. Additoinally the command is
	MP safe, and should prevent race conditions and will return false if multiple
	units try to dump at the same time.
	
Parameters:
	- _containers(Object)			default: objNull	Container inventory to search, or array of containers to search
	- _magazine(Array)				default: ["", 0]	Classname and ammo count of magazine to remove

Optional:
	-N/A

Example:
	[player, cargonet1, false, false] call OT_fnc_dumpStuff;

Returns:
    - Boolean:	Weather or not all items were dumped into the container.
	
Notes:
	- N/A

Author:
    deadorbit
---------------------------------------------------------------------------- */
params [["_unit", objNull], ["_dest", objNull], ["_dropItems", false], ["_keepEquipped", OT_dumpKeepEquipped], ["_noAnim", false], ["_dumpInstant", false], ["_customText", ""], ["_debugMode", false]];

private _full = false;
private _isTruck = ((typeof _dest) isEqualTo "OT_C_Truck_recovery");
private _isAmmoBox = (_dest isKindOf "CargoNet_01_base_F");
private _isPlayer = (_unit isEqualTo player);
private _dumpData = [_unit, true, serverTime];
private _inventoryItems = [uniqueUnitItems _unit] call DEDF_fnc_sumKeys;

//Arma Update made it so setUnitLoudout dosnt work if weapon switching animation is occuring
if ((currentWeapon _unit != "" || isSwitchingWeapon _unit) && (vehicle _unit == _unit)) exitWith {
	"You must holster your weapon first, [0] key by default." call OT_fnc_notifyMinor;
};

//Check that player does have items to dump
if (_inventoryItems isEqualTo 0) exitWith {
	_unit setVariable ["OT_dumpflag", 1];
	if(_isPlayer) then {
		systemChat "No items found to dump";
		_unit setVariable ["OT_delaying",false];
	};
	
	false
};

_unit setVariable ["OT_dumpflag", 0]; //Flag to synchronize when dumping is finished. 0 for in-progress, 2 for all items dumped, 1 for no/partial dumpage

if !([_dest] call OT_fnc_canDump) exitWith {
	if (_isPlayer) then {
		systemChat "Someone else is dumping into this ammobox, try again later.";
	};
	_unit setVariable ["OT_dumpflag", 1];
	
	false
};

if !(_isTruck) then {
	_unit setVariable ["OT_dumpflag", 0];
	_dest setVariable ["OT_dumpingData", _dumpData, true];
};

if (_isPlayer && !_noAnim) then {
	if ((vehicle _unit) isNotEqualTo _unit) exitWith {}; //Dont play the anim if they are in a vehicle... somehow
	[_unit] call DEDF_fnc_lockUnitInventory;
	_unit setVariable ["OT_delaying",true];
	private _text = format["Dumping %1 Items...", _inventoryItems];
	private _minTime = 3;
	private _maxTime = 12;
	private _progressTime = round(linearConversion [20, 120, _inventoryItems, _minTime, _maxTime, true]);
	[
		_text, 
		_progressTime,
		{
			[player, "PutDown"] call DEDF_fnc_playActionSafe; 
			alive player;
		},
		{player setVariable ["OT_delaying",false]; [player] call DEDF_fnc_unlockUnitInventory},
		{},
		[],
		true,
		true,
		false
	] call CBA_fnc_progressBar;
};


if (_isPlayer && _dropItems && _isAmmoBox && !(_dest canAdd "RHS_SPG9_Gun_Bag")) then {
	systemchat "Warning: This ammobox is almost full, forcing any more items inside via the arsenal may result in them being placed on the ground and their (eventual) deletion. Consider using a differnt box."
};

[format["%1 is dumping into %2 at %3. Num Items: %4",_unit, _dest, (getpos _dest), _inventoryItems], "INFO"] call OT_fnc_debugLog;

private _batchSize = 20;
switch (true) do {
	case(_dumpInstant) 	: {_batchSize = 99999};
	case(diag_fps > 40) : {_batchSize = 60};
	case(diag_fps > 30) : {_batchSize = 40};
	case(diag_fps < 20) : {_batchSize = 10};
};

[_unit, _dest, _batchSize, _dropItems, _keepEquipped] call OT_fnc_dumpStuffStep;

if (_debugMode) then {
	private _containerInv = count([_dest] call DEDF_fnc_containerInventory);
	private _newInv = [uniqueUnitItems _unit] call DEDF_fnc_sumKeys;
	private _debugText = format["Original Item count: %1. After Unit Item count: %2. Items in container: %3",_inventoryItems, _newInv, _containerInv];
	diag_log _debugText;
};

true