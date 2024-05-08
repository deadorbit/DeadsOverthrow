params ["_cls","_num","_town"];
if(isnil{_town}) exitwith {};

private _townwarehouse = warehouse getvariable [_town,nil];
if(isnil{_townwarehouse}) then {
	warehouse setvariable [_town,[]];
	_townwarehouse = warehouse getvariable _town;
};
private _idx = _townwarehouse findif {(_x select 0) isEqualTo _cls};
if(_idx == -1) exitwith {false};

private _d = _townwarehouse select _idx;
private _cls = _d select 0;
private _amnt = _d select 1;
if(_num > _amnt) then {_num = _amnt};

private _newamnt = _amnt - _num;
if(_newamnt == 0) exitwith {
	_townwarehouse deleteat _idx;
	warehouse setvariable [_town,_townwarehouse,true];
	true
};
_d set [1, _newamnt];
warehouse setvariable [_town,_townwarehouse,true];

true