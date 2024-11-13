disableSerialization;

server setVariable ["generals",[getplayeruid player],true];

private _diff = server getVariable ["OT_difficulty",1];
private _ft = server getVariable ["OT_fastTravelType",1];
private _pm = server getVariable ["OT_popModifier",0];
private _tu = server getVariable ["OT_tutorial",2];
private _de = server getvariable ["OT_Despawn",2];

if(_diff isEqualTo 0) then {
    (findDisplay 8099) displayCtrl 1600 ctrlSetTextColor [0,0.8,0,1];
    (findDisplay 8099) displayCtrl 1601 ctrlSetTextColor [1,1,1,1];
    (findDisplay 8099) displayCtrl 1602 ctrlSetTextColor [1,1,1,1];
};
if(_diff isEqualTo 1) then {
    (findDisplay 8099) displayCtrl 1600 ctrlSetTextColor [1,1,1,1];
    (findDisplay 8099) displayCtrl 1601 ctrlSetTextColor [0,0.8,0,1];
    (findDisplay 8099) displayCtrl 1602 ctrlSetTextColor [1,1,1,1];
};
if(_diff isEqualTo 2) then {
    (findDisplay 8099) displayCtrl 1600 ctrlSetTextColor [1,1,1,1];
    (findDisplay 8099) displayCtrl 1601 ctrlSetTextColor [1,1,1,1];
    (findDisplay 8099) displayCtrl 1602 ctrlSetTextColor [0,0.8,0,1];
};

if(_ft isEqualTo 0) then {
    (findDisplay 8099) displayCtrl 1603 ctrlSetTextColor [0,0.8,0,1];
    (findDisplay 8099) displayCtrl 1604 ctrlSetTextColor [1,1,1,1];
    (findDisplay 8099) displayCtrl 1605 ctrlSetTextColor [1,1,1,1];
};
if(_ft isEqualTo 1) then {
    (findDisplay 8099) displayCtrl 1603 ctrlSetTextColor [1,1,1,1];
    (findDisplay 8099) displayCtrl 1604 ctrlSetTextColor [0,0.8,0,1];
    (findDisplay 8099) displayCtrl 1605 ctrlSetTextColor [1,1,1,1];
};
if(_ft isEqualTo 2) then {
    (findDisplay 8099) displayCtrl 1603 ctrlSetTextColor [1,1,1,1];
    (findDisplay 8099) displayCtrl 1604 ctrlSetTextColor [1,1,1,1];
    (findDisplay 8099) displayCtrl 1605 ctrlSetTextColor [0,0.8,0,1];
};

if(_pm isEqualTo 0) then {
    (findDisplay 8099) displayCtrl 1607 ctrlSetTextColor [0,0.8,0,1];
    (findDisplay 8099) displayCtrl 1608 ctrlSetTextColor [1,1,1,1];
    (findDisplay 8099) displayCtrl 1609 ctrlSetTextColor [1,1,1,1];
};
if(_pm isEqualTo 1) then {
    (findDisplay 8099) displayCtrl 1607 ctrlSetTextColor [1,1,1,1];
    (findDisplay 8099) displayCtrl 1608 ctrlSetTextColor [0,0.8,0,1];
    (findDisplay 8099) displayCtrl 1609 ctrlSetTextColor [1,1,1,1];
};
if(_pm isEqualTo 2) then {
    (findDisplay 8099) displayCtrl 1607 ctrlSetTextColor [1,1,1,1];
    (findDisplay 8099) displayCtrl 1608 ctrlSetTextColor [1,1,1,1];
    (findDisplay 8099) displayCtrl 1609 ctrlSetTextColor [0,0.8,0,1];
};

if(_tu isEqualTo 0) then {
    (findDisplay 8099) displayCtrl 1610 ctrlSetTextColor [0,0.8,0,1];
    (findDisplay 8099) displayCtrl 1611 ctrlSetTextColor [1,1,1,1];
    (findDisplay 8099) displayCtrl 1612 ctrlSetTextColor [1,1,1,1];
};
if(_tu isEqualTo 1) then {
    (findDisplay 8099) displayCtrl 1610 ctrlSetTextColor [1,1,1,1];
    (findDisplay 8099) displayCtrl 1611 ctrlSetTextColor [0,0.8,0,1];
    (findDisplay 8099) displayCtrl 1612 ctrlSetTextColor [1,1,1,1];
};
if(_tu isEqualTo 2) then {
    (findDisplay 8099) displayCtrl 1610 ctrlSetTextColor [1,1,1,1];
    (findDisplay 8099) displayCtrl 1611 ctrlSetTextColor [1,1,1,1];
    (findDisplay 8099) displayCtrl 1612 ctrlSetTextColor [0,0.8,0,1];
};

if(_de isequalto 0) then {
	(findDisplay 8099) displayCtrl 1613 ctrlSetTextColor [0,0.8,0,1];
    (findDisplay 8099) displayCtrl 1614 ctrlSetTextColor [1,1,1,1];
    (findDisplay 8099) displayCtrl 1615 ctrlSetTextColor [1,1,1,1];
};
if(_de isEqualTo 1) then {
    (findDisplay 8099) displayCtrl 1613 ctrlSetTextColor [1,1,1,1];
    (findDisplay 8099) displayCtrl 1614 ctrlSetTextColor [0,0.8,0,1];
    (findDisplay 8099) displayCtrl 1615 ctrlSetTextColor [1,1,1,1];
};
if(_de isEqualTo 2) then {
    (findDisplay 8099) displayCtrl 1613 ctrlSetTextColor [1,1,1,1];
    (findDisplay 8099) displayCtrl 1614 ctrlSetTextColor [1,1,1,1];
    (findDisplay 8099) displayCtrl 1615 ctrlSetTextColor [0,0.8,0,1];
};
