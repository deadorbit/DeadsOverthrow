params ["_itemArmor", "_interactedItemArmor", "_interactedItemType", "_itemConditionType", "_armorIndex"];

private _totalArmorPercent 	= 0.0;
private _futureArmorPercent = 0.0;
private _itemBarFill 		= 0.0;
private _itemOverBarFill 	= 0.0;

if(isNil "OT_INV_armorBarUseRelative") then {
	OT_INV_armorBarUseRelative = false;
};
			
if (OT_INV_armorBarUseRelative) then {
	//Calculate how much this item contributes to the armor bar
	private _relativeArmor = (_itemArmor / (OT_INV_MAX_ARMOR select _armorIndex));
	_totalArmorPercent = _relativeArmor * 0.33;
	_itemBarFill = _relativeArmor;
	_itemOverBarFill = _itemBarFill;

	//Handle if this is the item being dragged/changed
	if (_interactedItemType isEqualTo _itemConditionType) then {
		private _relativeArmor = (_interactedItemArmor / (OT_INV_MAX_ARMOR select _armorIndex));
		_futureArmorPercent =  _relativeArmor * 0.33;
		_itemOverBarFill = _relativeArmor;
	}else{
		_futureArmorPercent = _totalArmorPercent;
	};
}else{
	//Calculate how much this item contributes to the armor bar
	_totalArmorPercent = (_itemArmor / (OT_INV_MAX_ARMOR select 3));
	_itemBarFill = _itemArmor / (OT_INV_MAX_ARMOR select _armorIndex);
	_itemOverBarFill = _itemBarFill;

	//Handle if this is the item being dragged/changed
	if (_interactedItemType isEqualTo _itemConditionType) then {
		_futureArmorPercent =  (_interactedItemArmor / (OT_INV_MAX_ARMOR select 3));
		_itemOverBarFill = (_interactedItemArmor / (OT_INV_MAX_ARMOR select _armorIndex));
	}else{
		_futureArmorPercent = _totalArmorPercent;
	};
};

[_totalArmorPercent, _futureArmorPercent, _itemBarFill, _itemOverBarFill]