//Should be exec on server
params ["_cls","_num","_town"];
if(isnil{_town}) exitwith {};

private _townwarehouse = warehouse getvariable [_town,nil];
if(isnil{_townwarehouse}) then {
	warehouse setvariable [_town,[],true];
	_townwarehouse = warehouse getvariable _town;
};
 _itm = _townwarehouse findif {(_x select 0) isEqualTo _cls};
if(_itm == -1) then {
	_townwarehouse pushback [_cls,_num];
}else{
	 _d = _townwarehouse select _itm;
	_d set [1, (_d select 1) + _num];
};
warehouse setvariable [_town,_townwarehouse,true];