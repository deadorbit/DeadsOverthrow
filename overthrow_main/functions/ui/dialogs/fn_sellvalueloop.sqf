disableSerialization;
private _town = (getpos player) call OT_fnc_nearestTown;
private _sellcls = "";
private _amnt = 1;
private _prevcls = "";
private _prevamnt = 0;
private _price = 0;
private _total = 0;
private _stability = server getVariable [format["stability%1",_town],50];
private _textctrl = (findDisplay 8000) displayCtrl 1201;
private _idx = lbCurSel 1500;
private _standing = [_town] call OT_fnc_support;
private _val = 0;

private _target = player;
if((player getVariable ["OT_shopTarget","Self"]) isEqualTo "Vehicle") then {
	_target = vehicle player;
};
localNamespace setVariable ["OT_SELL_VALUE",-1];
while{(!isnull findDisplay 8000)} do {
	_idx = lbCurSel 1500;
	if(_idx != -1) then {
		_sellcls = (lbData [1500,_idx]);
		if(isNil "_sellcls" || {_sellcls isEqualTo ""}) exitWith {OT_selling = false};
		_amnt = parsenumber(ctrltext 2000);
		if(_amnt <= 0) then {
			_amnt = 1;
		};
		if(!((_amnt == _prevamnt) && (_sellcls == _prevcls))) then {//The user hasnt changed the calculations, so no need to rerun them
			_price = [_town,_sellcls,_standing] call OT_fnc_getSellPrice;
			_total = (_price*_amnt);
			_stability = server getVariable [format["stability%1",_town],50];
			_val = 0;
			private _subval = 0;
			private _count = _amnt;
			while{_count > 0} do {
				_subval = _subval + _price;
				_price = [_town,_sellcls,_standing,_stability] call OT_fnc_getSellPrice;
				_subval = ceil(15000/_price);//The amount of items needed to cause a stability change
				if (_count > _subval) then {//value is greater than what would cause a stability change
					_val = _val + (_subval * _price);//add the value of just the amount goods not affected by the stability
					_count = _count - _subval;
					_stability = _stability + 1;//Raise the predicted stability
				}else{//Not enough goods remaining to cause a stability change, just add value of remaining goods
					_val = _val + (_count * _price);
					_count = 0;
				};
			};
			_total = _val;
			localNamespace setVariable ["OT_SELL_VALUE",_total];
			_textctrl ctrlSetStructuredText parseText format["<t size='1.2' align='left' valign = 'center' >Estimated Value:</t><t color='#66ff66' size='1.2'> $%1</t>",[_total,1,0,true] call CBA_fnc_formatNumber];
			_prevcls = _sellcls;
			_prevamnt = _amnt;
		};
	}else{
		_textctrl ctrlSetStructuredText parseText format[""];
	};
	sleep 0.2;
};

localNamespace setVariable ["OT_SELL_VALUE",-1];