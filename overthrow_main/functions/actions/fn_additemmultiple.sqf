params [["_cls",""],["_amnt",1]];

private _count = 0;
while {_count < _amnt} do {
	player additem _cls;
	_count = _count + 1;
};