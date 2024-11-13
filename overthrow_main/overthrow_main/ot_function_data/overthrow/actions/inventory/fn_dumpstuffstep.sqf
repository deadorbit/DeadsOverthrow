/* ----------------------------------------------------------------------------
Function: OT_fnc_dumpStuffStep


Description:
    - Transfers item from _from container to _dest container, while preforming neccessary
	saftey checks.
	
Parameters:
	- _unit(Object)				default: objNull	Unit to check for and take items from if they exist
	- _dest(Array)				default: ["", 0]	destination container to attempt to place items into
	- _batchSize(Integer)		default: 20			Amount of items to transfer per frame
	- _items(Array)				default: []			Items to transfer from _unit to _dest
	- _magazines(Array)			default: []			Magazines in format [className, ammo] to transfer
	- _weapons(Array)			default: []			Weapons in UnitLoadout Array format to transfer
	- _containers(Array)		default: []			Containers (Uniforms, Vests, Backpacks) to transfer, transfered last
	- _unitItems(Array)			default: []			Array of equipped unit items (headgear, linked items, ect) to transfer
	- _unitWeapons(Array)		default: []			Array of current equipped weapons to transfer
	

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
params [["_unit", objNull], ["_dest", objNull], ["_batchSize", 40], ["_dropItems", false], ["_keepEquipped", OT_dumpKeepEquipped], ["_curDepth", 1], ["_finishedItems", false], ["_finishedMagazines", false], ["_finishedWeapons", false], ["_finishedEquipment", false], ["_full", false], ["_failures", []], ["_dropped", []]];

if (_curDepth > 25) exitWith {
	_unit setVariable ["OT_dumpflag", 1];
	_dest setVariable ["OT_dumpingData", [objNull, false, 0], true];
};

private _i = _batchSize;
private _mainContainers = [(uniformContainer _unit), (vestContainer _unit), (backpackContainer _unit)];

if (!_finishedItems) then {
	{
		if(_i <= 0) then {break};
		
		private _container = _x;
		{
			if(_i <= 0) then {break};
			
			private _item = _x;
			
			switch (true) do {
				case ([_item] call DEDF_fnc_isWeapon) 	: 	{continue}; //Backup incase weapon wasnt removed
				case ([_item] call DEDF_fnc_isMagazine) : 	{continue};
			};
			
			private _return = [_dest, _container, _item, "", _dropItems] call DEDF_fnc_safeTransferAny;
			_return params ["_success", "_wasFull"];
			
			if(!_success) then {
				if(_wasFull) then {
					_full = true;
					if (_dropItems) then {
						_dropped pushBack _item;
					};
				}else{
					_failures pushBack _item;
				};
				continue
			};
			
			_i = _i - 1;
		}foreach(itemCargo _container + backpackCargo _container);
	}foreach(_mainContainers);
	if (_i > 0) then {
		_finishedItems = true;
	};
};

if (!_finishedMagazines) then {
	{
		if(_i <= 0) then {break};
		
		private _container = _x;
		{
			if(_i <= 0) then {break};
			private _item = _x;
			
			private _return = [_dest, _container, _item] call DEDF_fnc_safeTransferAny;
			_return params ["_success", "_wasFull"];
			
			if(!_success) then {
				if(_wasFull) then {
					_full = true;
					if (_dropItems) then {
						_dropped pushBack _item;
					};
				}else{
					_failures pushBack _item;
				};
				continue
			};
			
			_i = _i - 1;
		}foreach(magazinesAmmoCargo _container);
	}foreach(_mainContainers);
	
	if (_i > 0) then {
		_finishedMagazines = true;
	};
};


if (!_finishedWeapons) then {
	{
		if(_i <= 0) then {break};
		
		private _container = _x;
		{
			if(_i <= 0) then {break};
			
			private _weaponData =+ _x;
			_x params ["_wpn", "_supressor", "_pointer", "_optic", "_primMag", "_secMag", "_bipod"];
			if ([_container, _x, 1] call DEDF_fnc_removeExactWeaponCargo) then {
		
				//Remove attachments
				{
					private _item = _x;
						
					if (_item isEqualTo "") then {continue};
						
					if ([_dest, _item] call CBA_fnc_canAddItem) then {
						private _idx = _weaponData find _item;
								
						_weaponData set [_idx, ""];
						[_dest, _item, 1, false] call CBA_fnc_addItemCargo;
					}else{
						_full = true;
					};
				}foreach([_supressor, _pointer, _optic, _bipod]);
				
				//Remove magazines
				
				
				{
					if (_x isEqualTo []) then {continue};
					
					private _mag = _x;
					_mag params ["_item", "_ammo"];
					
					if ([_dest, _item] call CBA_fnc_canAddItem) then {
						private _idx = _weaponData find [_item, _ammo];
						
						_weaponData set [_idx, []];
						if !(OT_invalidMags getOrDefault [_item, false]) then {
							_dest addMagazineAmmoCargo [_item, 1, _ammo];
						};
					}else{
						_full = true;
					};
				}foreach([_primMag, _secMag]);
				
				//Update or remove weapon
				private _baseWpn = [_wpn] call DEDF_fnc_nonPresetWeapon;
				_weaponData set [0, _baseWpn];
				
				if ([_dest, _wpn] call CBA_fnc_canAddItem) then {
					_dest addWeaponWithAttachmentsCargoGlobal [_weaponData, 1];
				}else{
					//Readd weapon to unit
					if !(_dropItems) then {
						[_unit, _weaponData] call DEDF_fnc_unitAddWeaponItemCargo;
					}else{
						_dropped pushBack _weaponData;
					};
					_full = true;
					continue
				};
				
			}else{
				continue
			};
			
			_i = _i - 1;
		}foreach(weaponsItemsCargo _container);
	}foreach(_mainContainers);
	
	if (_i > 0) then {
		_finishedWeapons = true;
	};
};

if (!(_finishedEquipment || _keepEquipped)) then {
	private _equipment = [_unit] call DEDF_fnc_unitEquippedItems;
	_equipment params ["_items", "_weapons"];
	
	//Equipped items
	{
		if (_i <= 0) then {break};
		if (_x isEqualTo "") then {continue};
		
		private _item = _x;
		private _success = false;
		
		//Attempting to transfer a container which may still have items would not end so well
		if (([_item] call DEDF_fnc_isContainer) && _full) then {
			if (_dropItems) then {
				_dropped pushBack _item;
			};
			continue
		};
		
		//Equipment flag signifies its a linked item, not in inventory
		([_dest, _unit, _item, "EQUIPMENT"] call DEDF_fnc_safeTransferAny) params ["_success", "_wasFull"];
		
		if (!_success) then {
			if(_wasFull) then {
				if (_dropItems) then {
					_dropped pushBack _item;
				};
				_full = true;
			}else{
				_failures pushBack _item;
			};
			continue
		};
		
		_i = _i - 1;
	}forEach(_items);
	if (_i <= 0) exitWith {};
	
	//Eqiupped Weapons
	private _result = [false, false];
	
	_result = [_dest, _unit, "", "PRIMARY"] call DEDF_fnc_safeTransferAny;
	_result params ["_success", "_wasFull"];
	if(_success) then {
		_i = _i - 1;
	}else{
		if(_wasFull) then {
			if (_dropItems) then {
				_dropped pushBack ([_unit, primaryWeapon _unit] call DEDF_fnc_unitEquippedWeaponItems);
				_unit removeWeapon (primaryWeapon _unit);
			};
			_full = true;
		};
	};
	if (_i <= 0) exitWith {};
	
	//Secondary Weapon
	_result = [_dest, _unit, "", "SECONDARY"] call DEDF_fnc_safeTransferAny;
	_result params ["_success", "_wasFull"];
	if(_success) then {
		_i = _i - 1;
	}else{
		if(_wasFull) then {
			if (_dropItems) then {
				_dropped pushBack ([_unit, secondaryWeapon _unit] call OT_fnc_unitEquippedWeaponItems);
				_unit removeWeapon (secondaryWeapon _unit);
			};
			_full = true;
		};
	};
	if (_i <= 0) exitWith {};
	
	//handgun Weapon
	_result = [_dest, _unit, "", "HANDGUN"] call DEDF_fnc_safeTransferAny;
	_result params ["_success", "_wasFull"];
	if(_success) then {
		_i = _i - 1;
	}else{
		if(_wasFull) then {
			if (_dropItems) then {
				_dropped pushBack ([_unit, handgunWeapon _unit] call OT_fnc_unitEquippedWeaponItems);
				_unit removeWeapon (handgunWeapon _unit);
			};
			_full = true;
		};
	};
	if (_i <= 0) exitWith {};
	
	if (_i > 0) then {
		_finishedEquipment = true;
	};
	
	//binocular
	_result = [_dest, _unit, "", "BINOCULAR"] call DEDF_fnc_safeTransferAny;
	_result params ["_success", "_wasFull"];
	if(_success) then {
		_i = _i - 1;
	}else{
		if(_wasFull) then {
			if (_dropItems) then {
				_dropped pushBack ([_unit, binocular _unit] call OT_fnc_unitEquippedWeaponItems);
				_unit removeWeapon (binocular _unit);
			};
			_full = true;
		};
	};
	if (_i <= 0) exitWith {};
	
	if (_i > 0) then {
		_finishedEquipment = true;
	};
};

//We are out of stuff to stuff
if (_i > 0) then {
	if (_full) then {
		if (_dropItems) then {
			systemChat format["This container is full. %1 remaining items have been dropped somewhere nearby (you were warned.)", (count _dropped)];
			[(format["%1 items have been dropped around %2 @ %3", _dropped, _dest, (getpos _dest)]), "INFO"] call OT_fnc_debugLog;
			[getpos _dest, _dropped] call DEDF_fnc_createSimpleGroundItems;
		}else{
			systemChat "This container is full, remaining items have been retained. Remove some items or try dumping into a differnt container."
		};
	};
	if (count _failures > 0) then {
		[(format["Encountered untransferable items: %1 in %2 @ %3",_failures, _dest, (getpos _dest)]), "WARNING"] call OT_fnc_debugLog;
		systemChat format["%1 items failed to be validated and transfered properly (most likely due to an improper configuration.) They have been dropped near the container.", count _failures];
	};
	
	_unit setVariable ["OT_dumpflag", _full];
	_dest setVariable ["OT_dumpingData", [objNull, false, 0], true];
	
	[format["%1 has finished dumping into %2 at %3",_unit, _dest, (getpos _dest)]] call OT_fnc_debugLog;
}else{
	//Recursivly call the function
	[
		{_this call OT_fnc_dumpStuffStep},
		[_unit, _dest, _batchSize, _dropItems, _keepEquipped, _curDepth + 1, _finishedItems, _finishedMagazines, _finishedWeapons, _finishedEquipment, _full, _failures, _dropped]
	] call CBA_fnc_execNextFrame;
}; 