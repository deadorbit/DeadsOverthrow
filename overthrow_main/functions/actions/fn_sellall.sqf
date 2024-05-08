if (OT_selling) exitWith {};
OT_selling = true;

if (count _this == 1) then {

};

private _total = localNamespace getvariable ["OT_SELL_VALUE",-1];
localNamespace setVariable ["OT_SELL_VALUE",-1];

private _town = (getpos player) call OT_fnc_nearestTown;
private _s = [];

private _standing = ([_town] call OT_fnc_support);
private _idx = lbCurSel 1500;
private _sellcls = (lbData [1500,_idx]);

if(isNil "_sellcls" || {_sellcls isEqualTo ""}) exitWith {OT_selling = false};

private _target = player;
if((player getVariable ["OT_shopTarget","Self"]) isEqualTo "Vehicle") then {
	_target = vehicle player;
};

private _qty = 0;
private _amnt = 1;
private _val = 0;

{
	private _c = _x select 0;
	if(_c == _sellcls) exitWith {_qty = _x select 1};
}foreach(_target call OT_fnc_unitStock);

if (count _this == 1) then {
	if(_this select 0 == -1) then {
		_amnt = _qty;
	}else{
		_amnt = _this select 0;
		_price = [_town,_sellcls,_standing] call OT_fnc_getSellPrice;
		_total = _amnt * _price;
	};
}else{
	_amnt = parsenumber(ctrltext 2000);
};

if(_amnt <= 0) exitwith {
	ctrlsettext [2000,"1"];
	OT_selling = false;
};

if(_amnt > _qty) exitwith {
	ctrlsettext [2000,str(_qty)];
	OT_selling = false;
};

if(_total == -1) exitwith {
	OT_selling = false;
};

if((count _this > 0) && ((_this select 0) == -1)) then {//selling all automatically
	//calculate price
	_price = [_town,_sellcls,_standing] call OT_fnc_getSellPrice;
	_total = (_price*_amnt);
	_stability = server getVariable [format["stability%1",_town],50];
	private _subval = 0;
	private _count = _amnt;
	while{_count > 0} do {
		_subval = _subval + _price;
		_price = [_town,_sellcls,_standing,_stability] call OT_fnc_getSellPrice;
		_subval = ceil(15000/_price);
		if (_count > _subval) then {
			_val = _val + (_subval * _price);
			_count = _count - _subval;
			_stability = _stability + 1;
		}else{
			_val = _val + (_count * _price);
			_count = 0;
		};
	};
	_total = _val;
};

[_total] call OT_fnc_money;
if(_total > 100) then {[_town,round(_total / 100)] call OT_fnc_support};
private _stab = floor(_total/15000);
[_town,_stab] call OT_fnc_stability;

private _ocls = _sellcls;
_qty = _amnt;
if((player getVariable ["OT_shopTarget","Self"]) isEqualTo "Vehicle") then {
	private _noncontaineritems = ((weaponCargo _target) + (itemCargo _target) + (magazineCargo _target) + (backpackCargo _target)) call BIS_fnc_consolidateArray;
	private _ncqty = 0;
	{
		_x params ["_thiscls","_thisqty"];
		if(_thiscls isEqualTo _sellcls) exitWith {
			_ncqty = _thisqty;
			if(_ncqty > _qty) then {_ncqty = _qty};
		};
	}foreach(_noncontaineritems);
	if(_ncqty > 0) then {
		if !([_target, _sellcls, _ncqty] call CBA_fnc_removeItemCargo) then {
			if !([_target, _sellcls, _ncqty] call CBA_fnc_removeWeaponCargo) then {
				if !([_target, _sellcls, _ncqty] call CBA_fnc_removeMagazineCargo) then {
					if !([_target, _sellcls, _ncqty] call CBA_fnc_removeBackpackCargo) then {
					};
				};
			};
		};
	};
	_qty = _qty - _ncqty;
	if(_qty > 0) then {
		//still need to find more items in backpacks, uniforms etc
		{
			_x params ["_itemcls","_item"];
			{
				_x params ["_c","_q"];
				if(_qty == 0) exitwith {};
				if(_c isEqualTo _sellcls) exitWith {
					if(_q > _qty) then {_q = _qty};
					[_item, _sellcls, _q] call CBA_fnc_removeItemCargo;
					_qty = _qty - _q;
				};
			}foreach((itemCargo _item) call BIS_fnc_consolidateArray);
			if(_qty > 0) then {
				{
					_x params ["_c","_q"];
					if(_qty == 0) exitwith {};
					if(_c isEqualTo _sellcls) exitWith {
						if(_q > _qty) then {_q = _qty};
						[_item, _sellcls, _q] call CBA_fnc_removeWeaponCargo;
						_qty = _qty - _q;
					};
				}foreach((weaponCargo _item) call BIS_fnc_consolidateArray);
			};
			if(_qty > 0) then {
				{
					_x params ["_c","_q"];
					if(_qty == 0) exitwith {};
					if(_c isEqualTo _sellcls) exitWith {
						if(_q > _qty) then {_q = _qty};
						[_item, _sellcls, _q] call CBA_fnc_removeMagazineCargo;
						_qty = _qty - _q;
					};
				}foreach((magazineCargo _item) call BIS_fnc_consolidateArray);
			};
		}foreach(everyContainer _target);
	};
}else{
	for "_i" from 0 to (_qty - 1) do {
		if(OT_hasTFAR) then {
			private _c = _ocls splitString "_";
			if((_c select 0) == "tf") then {
				{
					if((_x find _ocls) isEqualTo 0) exitWith {_sellcls = _x};
				}foreach(items player);
			};
		};
	if !(_sellcls isEqualTo binocular _target) then { 
		_target removeItem _sellcls;
	}else{
		_target removeWeapon _sellcls;
		};
	};
};

lbClear 1500;
private _cat = player getVariable ["OT_shopTargetCategory",""];
[[_target,_cat] call OT_fnc_unitStock,_town,_standing,_s] call OT_fnc_sellDialog;

OT_selling = false;
