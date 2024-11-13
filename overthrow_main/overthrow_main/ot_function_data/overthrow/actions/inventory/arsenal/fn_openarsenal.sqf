params ["_target","_unit",["_ammobox",false]];

private _initalLoadOut = getUnitLoadout _unit;

if(_ammobox isEqualTo false) then {
    _ammobox = _target;
};

private _weapons = [];
private _magazines = [];
private _items = [];
private _backpacks = [];

private _closed = -1;

private _missing = [];

//If player is not targetting a vehicle (aka warehouse)
if(_target isEqualType "") then {
    [_unit,true] call OT_fnc_dumpIntoWarehouse;
    //_unit linkItem "ItemMap";

	private _town = _unit call OT_fnc_nearestTown;
	private _townwarehouse = warehouse getvariable [_town,nil];
	if(isnil{_townwarehouse}) then {
		warehouse setvariable [_town,[]];
		_townwarehouse = warehouse getvariable _town;
	};

	private _itemVars = +_townwarehouse;
	{
		_items pushback (_x select 0);
	}foreach(_itemVars);

    _closed = ["ace_arsenal_displayClosed", {
        _thisArgs params ["_unit"];
        _unit call OT_fnc_verifyLoadoutFromWarehouse;

        [_thisType, _thisId] call CBA_fnc_removeEventHandler;
    },[_unit]] call CBA_fnc_addEventHandlerArgs;
	
	//Finally set up the box
	[_ammobox, true, false] call ace_arsenal_fnc_removeVirtualItems;
	[_ammobox, _weapons + _magazines + _items + _backpacks, false] call ace_arsenal_fnc_addVirtualItems;
	[_ammobox, _unit] call ace_arsenal_fnc_openBox;
	
}else{
	//Add player items to ammobox
	private _startLoadout = getUnitLoadout _unit;
	private _params = [_target, _unit, _startLoadout];
	
	//Code to call after unit has finished dumping items
	private _code = {
		params ["_target", "_unit", "_startLoadout"];
		private _params = [_target, _unit, _startLoadout];
		
		private _distance = (getpos _target) distance (getpos _target);
		if (!alive _unit || (_distance > 10)) exitWith {};
		
		private _virtualInventory =  (keys([_target] call DEDF_fnc_uniqueContainerItems)) - OT_arsenalIgnore;
			
		//Handler to reequip the units items, cause apperently this annoys people
		_params call OT_fnc_ACEArsenalOpened;
		private _lpfHandle = [_target] call OT_fnc_ACEArsenalLeftPanalFilled;
		//Handler that removes items from ammobox when player leaves
		[_target, _unit, _lpfHandle] call OT_fnc_ACEArsenalClosed;
		//TODO: add handler for player disconnection
		
		//Finally set up the box
		[_target, true, false] call ace_arsenal_fnc_removeVirtualItems;
		[_target, _virtualInventory, false] call ace_arsenal_fnc_addVirtualItems;
		
		//Debug
		diag_log format["Box Contents After Dump: %1", _virtualInventory];
		
		diag_log format["Unit Loadout Before: %1", _startLoadout];
		_unit setUnitLoadout _startLoadout;
		[_target, _unit] call ace_arsenal_fnc_openBox;
	};
	
	if (_unit isEqualTo player) then {
		systemChat "Dumping Inventory First...";
	};
	[_unit, _target, true, false, false] call OT_fnc_dumpStuff;
	
	//Wait until dumping has finished
	[
		{
			params ["_target", "_unit", "_startLoadout"];
			private _return = false;
			private _distance = (getpos _unit) distance (getpos _target);
			private _dumpInProgress = (_unit getVariable ["OT_dumpflag",false] isEqualTo 0);
			
			if !(_unit isEqualTo player) then {
				_return = ((!_dumpInProgress) || !(alive _unit) || (_distance > 10));
			}else{
				private _dumpTimerEnabled = (_unit getVariable ["OT_delaying", false]);
				_return = (((!_dumpInProgress)  || !(alive _unit) || (_distance > 10)) && !(_dumpTimerEnabled));
			};
			
			_return
		},
		_code,
		_params
	] call CBA_fnc_waitUntilAndExecute;
};
