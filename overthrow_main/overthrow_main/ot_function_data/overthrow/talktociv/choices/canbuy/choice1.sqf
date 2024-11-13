private _civ = OT_interactingWith;
private _town = (getpos player) call OT_fnc_nearestTown;
private _abandoned = server getVariable ["NATOabandoned",[]];

if(_town in _abandoned || captive player) then {
	private _standing = [_town] call OT_fnc_support;
	private _fastbuy = true;
	_cat = _civ getVariable "OT_shopCategory";
	player setVariable ["OT_shopTarget","Self",false];

	createDialog "OT_dialog_buy";

	if(_cat isEqualTo "Clothing") then {
		[_town,_standing] call OT_fnc_buyClothesDialog;
	}else{
		_s = [];
		{
			if((_x select 0) isEqualTo _cat) exitWith {
				{
					_s pushback [_x,-1];
				}foreach(_x select 1);
			};
		}foreach(OT_items);

		if(_cat isEqualTo "Surplus") then {
			_fastbuy = false;
			{
				_s pushback [_x,-1];
			}foreach(OT_surplusStock);
		};

		[_town,_standing,_s,1,_fastbuy] call OT_fnc_buyDialog;
	};
}else{
	private _talk = ["I won't sell to criminals."];
	private _code = {};
	[
		_civ,
		player,
		_talk,
		_code,
		[]
	] call OT_fnc_doConversation;
};