SimulatedObjects = [];
private _newArr = [];
while {true} do{
	_newArr = [];
	{
		if(!(isnull _x)) then {
			_newArr pushbackunique _x;
		}
	}foreach(SimulatedObjects);
	SimulatedObjects = [];
	{
		_x enableDynamicSimulation false;
	}foreach(_newArr);
	SimulatedObjects = SimulatedObjects + _newArr;
	sleep 1;
};