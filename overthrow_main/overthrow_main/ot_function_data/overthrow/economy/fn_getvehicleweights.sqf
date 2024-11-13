private _mostExpensive = -1e20;
{
	private _cls = _x;
	private _cost = (cost getVariable _cls);
	
	if (isNil{_cost}) then {continue};
	
	_cost params ["_price", "", "", ""];
	if(_price > _mostExpensive) then {
		_mostExpensive = _price;
	};
}foreach(OT_vehTypes_civ);

{
	private _cls = _x;
	private _cost = cost getVariable _cls;
	if(isNil{_cost}) then {
		OT_vehWeights_civ pushback 0;
	}else{
		_cost params ["_price", "", "", ""];
		OT_vehWeights_civ pushback (1 - (_price /_mostExpensive)+0.1);//This will make whatever is the most expensive car very rare
	};
}foreach(OT_vehTypes_civ);