//Sorts all backpacks by maxload and formats the results in the console
private _output = "";
private _newline = "
";
private _sort = {
	getNumber(_x >> 'maximumLoad')
};

private _bags = configProperties [(configFile >> "cfgVehicles"), "(configName _x) isKindOf 'Bag_Base' && (getNumber(_x >> 'scope') > 0)"];
private _sorted = [_bags, [], _sort, "ASCEND"] call BIS_fnc_sortBy;

{
	private _load = getNumber (_x >> 'maximumLoad');
	private _name = configName _x;
	
	_output = _output + format["%1 : %2",_name, _load] + _newline;
}foreach(_sorted);

_output