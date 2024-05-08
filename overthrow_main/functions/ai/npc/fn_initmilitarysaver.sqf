//Function checks to make sure vehicle is still alive a few seconds after spawning, if not attempt to respawn it.
params ["_unit",objnull];

sleep(round(random 10));

_unit allowdamage true;

sleep(10);

if((not canmove _unit) || (_unit damage == 1) || getposATL _unit (select 2) > 2 || getposATL _unit (select 2) < -2 || (speed _unit > 120)) then {//dumbfuck detector
	
};