//Add and save uniform
player forceAddUniform (selectRandom OT_clothes_locals);
player setVariable ["uniform",_clothes,true];
private _money = 100;
private _diff = server getVariable ["OT_difficulty",1];
if(_diff isEqualTo 0) then {
	_money = 1000;
};
if(_diff isEqualTo 2) then {
	_money = 10;
};

player setVariable ["money",_money,true];
[player,getplayeruid player] call OT_fnc_setOwner;

_town = server getVariable "spawntown";
if(OT_randomSpawnTown) then {
	_town = OT_spawnTowns call BIS_fnc_selectRandom;
};

_house = _town call OT_fnc_getPlayerHome;

diag_log format["Local: created %1's house is: %1", player, _house];
_housepos = getpos _house;

//Put a light on at home
_light = "#lightpoint" createVehicle [_housepos select 0,_housepos select 1,(_housepos select 2)+2.2];
_light setLightBrightness 0.11;
_light setLightAmbient[.9, .9, .6];
_light setLightColor[.5, .5, .4];

//Free quad
_pos = _housepos findEmptyPosition [5,100,"C_Quadbike_01_F"];

if (count _pos > 0) then {
	private _vehCls = OT_vehType_starterCar;
	private _veh = _vehCls createVehicle _pos;
	
	[_veh, getPlayerUID player] call OT_fnc_setOwner;
	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	player reveal _veh;
};

[_house,getplayeruid player] call OT_fnc_setOwner;
player setVariable ["home",_housepos,true];

_furniture = (_house call OT_fnc_spawnTemplate) select 0;
private _bag = selectRandom ["rhs_sidor"];
private _cosmetic = selectRandom (OT_allFacewear + OT_allGlasses);

{
	if(typeof _x isEqualTo OT_item_Storage) then {
		_x addBackpackCargoGlobal [_bag, 1];
		_x addItemCargoGlobal [_cosmetic, 1];
		//_x addItemCargoGlobal ["ToolKit", 1];
		_x addItemCargoGlobal ["ACE_Flashlight_Maglite_ML300L", 1];
		_x addItemCargoGlobal ["ACRE_PRC343", 1];
		_x addItemCargoGlobal ["Medikit", 1];
		private _tutmode = server getvariable ["ot_tutorial",2];
		if (_tutmode == 1) then {
			_x addWeaponCargoGlobal [OT_item_BasicGun,1];
			_x addMagazineCargoGlobal [OT_item_BasicAmmo,5];
			_x addItemCargoGlobal ["OT_Ganja",1];
		};
	};
	[_x,getplayeruid player] call OT_fnc_setOwner;
}foreach(_furniture);
player setVariable ["owned",[[_house] call OT_fnc_getBuildID],true];

if(_tutmode == 2) then {
	createDialog "OT_dialog_tute";
	player setVariable ["OT_tute",true,true];
	player setVariable ["OT_tute_trigger",false,true];
}else{
	player setVariable ["OT_tutesDone",["NATO","Economy","Drugs"]];
};
