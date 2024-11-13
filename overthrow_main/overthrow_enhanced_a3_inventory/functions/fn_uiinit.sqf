/*
    Epoch Enhanced Arma3 Inventory - Init

    Author: Aaron Clark - EpochMod.com

    Licence:
    Arma Public License Share Alike (APL-SA) - https://www.bistudio.com/community/licenses/arma-public-license-share-alike

    Github:
    https://github.com/EpochModTeam/Enhanced-Arma3-Inventory
*/
player addEventHandler ["InventoryOpened", {
    ["init",_this] spawn OT_INV_fnc_uiMain;
}];
player addEventHandler ["Put",{
	uiNamespace setVariable ["OT_INV_interactedItem",[]];
    ["refresh"] call OT_INV_fnc_uiMain;
}];
player addEventHandler ["Take",{
	uiNamespace setVariable ["OT_INV_interactedItem",[]];
    ["refresh"] call OT_INV_fnc_uiMain;
}];
