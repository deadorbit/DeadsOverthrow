private _vehs = 0; 
{ 
	if !(_x isKindOf "Thing") then { 
		_vehs = _vehs + 1
	} 
}foreach(vehicles);

_vehs