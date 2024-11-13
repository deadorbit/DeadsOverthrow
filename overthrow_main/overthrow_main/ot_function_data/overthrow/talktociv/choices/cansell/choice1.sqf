private _civ = OT_interactingWith;
private _town = (getpos player) call OT_fnc_nearestTown;
private _standing = [_town] call OT_fnc_support;

_cat = _civ getVariable "OT_shopCategory";
_categorystock = [player,_cat] call OT_fnc_unitStock;

player setVariable ["OT_shopTarget","Self",false];
player setVariable ["OT_shopTargetCategory",_cat,false];

createDialog "OT_dialog_sell";
localNamespace setVariable ["OT_SELL_VALUE",-1];
[] spawn OT_fnc_sellvalueloop;
[_categorystock,_town,_standing] call OT_fnc_sellDialog;