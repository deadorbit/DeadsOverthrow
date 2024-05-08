_s = [];

{
    if((_x select 0) isEqualTo "Hardware") exitWith {
        {
		if(_x != "ACE_ropeBase") then {
				_s pushback [_x,-1];
			};
        }foreach(_x select 1);
    };
}foreach(OT_items);

private _sorted = [_s,[],{tolower((_x select 0) call OT_fnc_anythinggetname)},"ASCEND"] call BIS_fnc_SortBy;
player setVariable ["OT_shopTarget","Vehicle",false];

_town = (getpos player) call OT_fnc_nearestTown;
private _standing = [_town] call OT_fnc_support;

createDialog "OT_dialog_buy";
[_town,_standing,_s] call OT_fnc_buyDialog;
