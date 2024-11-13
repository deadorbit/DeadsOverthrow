params [["_wpn", "rhs_weap_m4a1"], ["_isSR", false]];
private _returnOptic = "";

//Check if wpn has assigned scopes to force
private _hash = (OT_proprietaryScopes getOrDefault [_wpn, []]);
if (_hash isNotEqualTo []) exitWith {
	_returnOptic = selectRandom _hash;
	
	_returnOptic
};

private _compatibleOptics = compatibleItems [_wpn, "CowsSlot"];
private _possibleOptics =+ OT_NATO_WepLowOptics;
if (_isSR) then {
	_possibleOptics = OT_NATO_WepHighOptics;
};
_possibleOptics arrayIntersect _compatibleOptics;
//If no matching optics are found
if ((count _possibleOptics) < 1) exitWith {_returnOptic};

_returnOptic = (selectRandom _possibleOptics);

_returnOptic