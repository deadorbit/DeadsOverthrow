params ["_control",-1];
if (_control isEqualTo -1) exitWith{};

private _head	= _control;
private _titles	= [];
private _gui	= [];
private _found	= false;

while {typeName _head isEqualTo "CONTROL"} do {
	_head = ctrlParent _head;
};

private _titles = format ["getNumber(_x >> ""idd"") isEqualTo %1",ctrlIDD _head] configClasses (configFile >> "RscTitles");
if ((count _titles) isEqualTo 1) then {
	_found = true;
};

if(!_found) then {
	_gui = format ["getNumber(_x >> ""idd"") isEqualTo %1",ctrlIDD _head] configClasses (configFile);
	if ((count _gui) isEqualTo 1) then {
		_found = true;
	};
};

private _allCanidates = _titles + _gui;

if ((count _allCanidates) isEqualTo 0) exitWith {[0,0]};