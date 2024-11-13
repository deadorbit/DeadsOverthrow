//[objective position(pos array),objective radius (number),friendly side (side),enemy side (side),name of location for notification (string),add name of location in marker too (boolean)] call fnc_NR6_SiteMarker;

private ["_objPos","_objradius","_BluforType","_OpforType","_IndepType","_campName","_trg1","_mrk","_mrkName","_mrkSize","_westTroops","_eastTroops","_indepTroops","_ownership"];

_objPos = _this select 0;
_objradius = _this select 1;
_BluforType = _this select 2;
_OpforType = _this select 3;
_IndepType = _this select 4;
_campName = _this select 5;
_mrkName = false;
_mrkSize = 1;
if ((count _this) > 6) then {_mrkName = _this select 6};
if ((count _this) > 7) then {_mrkSize = _this select 7};

_mrk = createMarker [_campName,_objPos];
_mrk setMarkerShape "ICON";
if (_mrkName) then {_mrk setMarkerText _campName};
_mrk setMarkerType  "Empty";
_mrk setMarkerSize [_mrkSize,_mrkSize];

_trg1 = createTrigger ["EmptyDetector", _objPos, true];
_trg1 setTriggerArea [_objradius, _objradius, 0, false];
_trg1 setTriggerActivation [ "ANY", "PRESENT", true];

_ownership = "NONE";
 
while {true} do { 
 
	sleep 5; 
 
	_westTroops = west countSide (list _trg1); 
	_eastTroops = east countSide (list _trg1); 
	_indepTroops = resistance countSide (list _trg1); 
  
	if ((_eastTroops < _westTroops) and (_westTroops > _indepTroops) and not (_ownership == "BLUFOR")) then { 
    
		[_campName,_BluforType] call NR6_SiteFMarkB; 
		_mrk setMarkerType  "b_installation";
		_ownership = "BLUFOR";

	}; 
 
	if ((_westTroops < _eastTroops) and (_eastTroops > _indepTroops) and not (_ownership == "OPFOR")) then { 
    
		[_campName,_OpforType] call NR6_SiteFMarkO; 
		_mrk setMarkerType  "o_installation";
		_ownership = "OPFOR";
	}; 
 
	if ((_eastTroops < _indepTroops) and (_indepTroops > _westTroops) and not (_ownership == "INDEP")) then { 
    
		[_campName,_IndepType] call NR6_SiteFMarkI; 
		_mrk setMarkerType  "n_installation";
		_ownership = "INDEP";
	}; 
}; 
