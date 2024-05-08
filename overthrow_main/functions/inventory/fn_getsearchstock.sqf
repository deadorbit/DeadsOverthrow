private ["_items","_myitems"];

private _items = [];
private _done = [];

private _myitems = [];
private _covert = false;

if(isplayer _this) then {
	if(_this getvariable ["OT_Covert",0] == 1) then {
		_covert = true;
	};
};

if(_this isKindOf "Man") then {
	_myitems = (items _this) + (magazines _this);
}else{
	_myitems = (itemCargo _this) + (weaponCargo _this) + (magazineCargo _this) + (backpackCargo _this);
	{
		_myitems = [_myitems,(items _this) + (magazines _this)] call BIS_fnc_arrayPushStack;
	}foreach(units _this);		
};
if !(isNil "_myitems") then {
	{
		if !(_x in _done) then {
			_done pushback _x;
			_items pushback [_x,1];
		}else {
			_cls = _x;
			{
				if((_x select 0) isEqualTo _cls) then {
					_x set [1,(_x select 1)+1];				
				};
			}foreach(_items);
		};
	}foreach(_myitems);
};

if(_covert) then {//Remove pistols and pistol mags from search inventoryu if player has appropirate skill
	private _temp =+ _items;
	{
		_cls = _x select 0;
		if(_cls iskindof ["Pistol", configFile >> "CfgWeapons"]) then {
			_idx = _items findif {(_x select 0) == _cls};
			_items deleteat _idx;
		}else{
			if(_cls iskindof ["30Rnd_9x21_Mag", configfile >> "CfgMagazines"] || _cls iskindof ["rhs_mag_9x19_17", configfile >> "CfgMagazines"] || _cls iskindof ["rhssaf_mag_15Rnd_9x19_FMJ", configfile >> "CfgMagazines"]) then {
				_idx = _items findif {(_x select 0) == _cls};
				_items deleteat _idx;
			};
		};
	}foreach(_temp); 
};

_items