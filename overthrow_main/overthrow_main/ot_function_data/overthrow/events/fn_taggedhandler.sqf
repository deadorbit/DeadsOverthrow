params ["_tag","_texture","_object","_unit"];

if(_unit call OT_fnc_unitSeenNATO) then {
    _unit setCaptive false;
    _unit call OT_fnc_revealToNATO;
};
private _town = (getpos _object) call OT_fnc_nearestTown;
private _tags = (server getVariable [format["tagsin%1",_town],[]]);
private _numtags = count _tags;
private _pos = (getpos _tag);

if(_town in (server getVariable ["NATOabandoned",[]]) || _numtags >= 15) exitwith{"There are too many tags in this town already" call OT_fnc_notifyMinor};

private _tooclose = _tags findIf {(_pos distance _x <= 5)};
if(_tooclose != -1) exitwith{"This tag is too close to an existing tag" call OT_fnc_notifyMinor};
 
if((_numtags mod 2) == 0) then {
	[_town,-1] call OT_fnc_stability;
	[_town,2] call OT_fnc_support;
};

_tags pushback _pos;
server setVariable [format["tagsin%1",_town],_tags,true];
spawner setVariable [format["lasttagin%1",_town],_unit,true];
