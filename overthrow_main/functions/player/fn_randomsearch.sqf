private _unit = player;

if(!((_unit getVariable ["BeingSearched",""]) isEqualTo "")) exitwith {};

private _town = (getpos _unit) call OT_fnc_nearesttown;
private _prob = OT_searchChance;
private _nearest = 999;


if (_town in OT_capitals || _town isequalto OT_mainCapital) then {
	_prob = _prob * 2;
};

{
	private _dist = leader _x distance _unit;
	if(side _x == west && _dist <= 50 && (vehicle leader _x) isequalto (leader _x)) then {
		_nearest = _dist;
	};
}foreach(allgroups);

if(_nearest > 50) exitwith{};

if(_nearest <= 8) then {//They are right next to someone, suspisous
	_prob = _prob * 2;
};

if ((round(random 100)) <= _prob) then {
	private _foundillegal = _unit call OT_fnc_IllegalInInventory; //Don't waste time searching an innocent player
	if (_foundillegal) then {
		[_unit] spawn OT_fnc_NATOsearch;
	};
};
