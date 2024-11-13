params ["_civ","_itemcls","_numitems"];
_stock = player call OT_fnc_unitStock;
_found = false;
{
	_x params ["_cls","_num"];
	if(_cls isEqualTo _itemcls && _num >= _numitems) exitWith {
		_found = true;
	};
}foreach(_stock);
if(_found) then {
	[player,_civ,["I have a delivery for you",selectRandom ["About time!","OK, thanks","Sweet, thanks"]],{
		params ["_civ","_itemcls","_numitems"];
		_count = 0;
		while {_count < _numitems} do {
			[player, _itemcls] call {
				params ["_unit", "_cls"];
				private _primwep = primaryweapon _unit;
				private _secwep =  handgunWeapon _unit;
				if ((_primwep isEqualTo _cls) || _secwep isEqualTo _cls) then {
					player removeWeaponGlobal _cls;
				}else{
					_unit removeItem _cls;
				};
			};
			_count = _count + 1;
		};
		_civ setVariable ["OT_deliveryDone",true,true];
		_civ setVariable ["OT_deliveredBy",player,true];
		_civ setVariable ["OT_delivery",[],true];
	},[_civ,_itemcls,_numitems]] spawn OT_fnc_doConversation;
}else{
	"You do not have the required items" call OT_fnc_notifyMinor;
};