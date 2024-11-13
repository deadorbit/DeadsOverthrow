//Generic Jobs used by all missions
class MedicalSupplies {
    target = "Town";
    repeatable = 1;
    condition = "params['_inSpawnDistance','_stability'];_inSpawnDistance && _stability < 50";
    script = "\overthrow_missions\shared\data\jobs\medicalsupplies.sqf";
    chance = 20;
    expires = 24;
    requestable = 0;
};
class Tagging {
    target = "Town";
    repeatable = 0;
    condition = "params['','','_town'];!(_town in (server getVariable ['NATOabandoned',[]])) && ((server getVariable [format['tagsin%1',_town],0]) <= 14)";
    script = "\overthrow_missions\shared\data\jobs\tagging.sqf";
    chance = 25;
    expires = 6;
    requestable = 1;
};
class KillNATO {
    target = "Town";
    repeatable = 0;
    condition = "params['', '', '_town']; !(_town in (server getVariable ['NATOabandoned', []]))";
    script = "\overthrow_missions\shared\data\jobs\kill.sqf";
    chance = 100;
    expires = 2;
    requestable = 1;
};
class Informant {
    target = "Global";
    repeatable = 1;
    condition = "params['_numAbandoned'];_numAbandoned > 0";
    script = "\overthrow_missions\shared\data\jobs\informant.sqf";
    chance = 5;
    expires = 24;
    requestable = 0;
};
class FactionWeapons {
    target = "Faction";
    repeatable = 1;
    condition = "params['_inSpawnDistance','_standing'];_inSpawnDistance";
    script = "\overthrow_missions\shared\data\jobs\factionweapons.sqf";
    chance = 10;
    expires = 24;
    requestable = 0;
};
class Fugitive {
    target = "Faction";
    repeatable = 1;
    condition = "params['_inSpawnDistance','_standing'];_inSpawnDistance";
    script = "\overthrow_missions\shared\data\jobs\fugitive.sqf";
    chance = 5;
    expires = 24;
    requestable = 1;
};
class CaptureTown {
    target = "Faction";
    repeatable = 0;
    condition = "params['_inSpawnDistance', '', '_town', '', '_population'];_inSpawnDistance && (_population > 100) && !(_town in (server getVariable ['NATOabandoned',[]]))";
    script = "\overthrow_missions\shared\data\jobs\captureTown.sqf";
    chance = 50;
    expires = 0;
    requestable = 0;
};
class TransportOperative {
    target = "Faction";
    repeatable = 1;
    condition = "true";
    script = "\overthrow_missions\shared\data\jobs\transportvip.sqf";
    chance = 100;
    expires = 12;
    requestable = 1;
};
class ReconBase {
    target = "Base";
    repeatable = 0;
    condition = "params['_inSpawnDistance', '_name'];!(_name in (server getVariable ['NATOabandoned',[]])) && (server getVariable [format[""garrison%1"",_name],0]) > 0 && !(_name in (server getVariable ['ReconnedBases',[]]))";
    script = "\overthrow_missions\shared\data\jobs\reconBase.sqf";
    chance = 20;
    expires = 0;
    requestable = 1;
};   
class HVT {
    target = "HVT";
    repeatable = 1;
    condition = "params['_inSpawnDistance', '_name'];!(_name in (server getVariable ['NATOabandoned',[]])) && _inSpawnDistance";
    script = "\overthrow_missions\shared\data\jobs\hvt.sqf";
    chance = 5;
    expires = 0;
    requestable = 0;
};
class NATOmission {
    target = "NATOmission";
    repeatable = 0;
    condition = "true";
    script = "\overthrow_missions\shared\data\jobs\natomissions.sqf";
    chance = 25;
    expires = 0;
    requestable = 0;
};
class GangDrugRun {
    target = "Gang";
    repeatable = 1;
    condition = "true";
    script = "\overthrow_missions\shared\data\jobs\gangdrugrun.sqf";
    chance = 100;
    expires = 8;
    requestable = 1;
};
class GangWeaponRun {
    target = "Gang";
    repeatable = 1;
    condition = "true";
    script = "\overthrow_missions\shared\data\jobs\gangweaponrun.sqf";
    chance = 100;
    expires = 12;
    requestable = 1;
};
class ShopDelivery {
    target = "Shop";
    repeatable = 1;
    condition = "true";
    script = "\overthrow_missions\shared\data\jobs\shopdelivery.sqf";
    chance = 100;
    expires = 16;
    requestable = 1;
};

//New Jobs
class DrugCar {
    target = "Town";
    repeatable = 1;
    condition = "params['','','_town'];(_town in (server getVariable ['NATOabandoned',[]]))";
    script = "\overthrow_missions\shared\data\jobs\DrugCar.sqf";
    chance = 5;
    expires = 12;
    requestable = 1;
};

class Revolution {
    target = "Town";
    repeatable = 1;
    condition = "params['','','_town'];(_town in (server getVariable ['NATOabandoned',[]]))";
    script = "\overthrow_missions\shared\data\jobs\Revolution.sqf";
    chance = 5;
    expires = 12;
    requestable = 1;
};

class Chaos {
    target = "Town";
    repeatable = 0;
    condition = "params['','','_town'];!(_town in (server getVariable ['NATOabandoned',[]]))";
    script = "\overthrow_missions\shared\data\jobs\chaos.sqf";
    chance = 25;
    expires = 6;
    requestable = 1;
};

class ShopBoxTransport {
    target = "Shop";
    repeatable = 1;
    condition = "true";
    script = "\overthrow_missions\shared\data\jobs\shopboxtransport.sqf";
    chance = 100;
    expires = 24;
    requestable = 1;
};