params [
    "_loadout",
    ["_rifles",OT_allBLURifles],
    ["_glRifles",OT_allBLUGLRifles],
    ["_machineGuns",OT_allBLUMachineGuns],
    ["_sniperRifles",OT_allBLUSniperRifles],
    ["_launchers",OT_allBLULaunchers],
    ["_handguns",OT_allBLUPistols],
	["_optic",false],
	["_muzzle",false]
];

//helper functions
private _removeMagazines = {
    params ["_newloadout","_forcls"];
    private _hasVest = count(_newloadout select 4) > 0;
    private _hasBackpack = count(_newloadout select 5) > 0;
    private _magazines = getArray (configFile >> "CfgWeapons" >> _forcls >> "magazines");
    {
        if !(_x isEqualTo "this") then {
            _magazines = _magazines + getArray (configFile >> "CfgWeapons" >> _forcls >> _x >> "magazines")
        };
    }foreach(getArray (configFile >> "CfgWeapons" >> _forcls >> "muzzles"));
    //from uniform
    private _items = (_newloadout select 3) select 1;
    {
        _x params ["_cls","_num"];
        if(_cls in _magazines) then {_x set [1,0]};
    }foreach(_items);

    //from vest
    if(_hasVest) then {
        _items = (_newloadout select 4) select 1;
        {
            _x params ["_cls","_num"];
            if(_cls in _magazines) then {_x set [1,0]};
        }foreach(_items);
    };

    if(_hasBackpack) then {
        //from backpack
        _items = (_newloadout select 5) select 1;
        {
            _x params ["_cls","_num"];
            if(_cls in _magazines) then {_x set [1,0]};
        }foreach(_items);
    };
};

_wepfix = {
//If certain mods with the same weapon are enabled, try to only generate one for simplicity
};

_magfix = {
//Prevents weapons being given unusable magazines
	params[["_wpn",""],["_mag",""]];
	if (_wpn == "gm_m16a1_blk") exitwith {["gm_20Rnd_556x45mm_B_T_M196_stanag_gry","gm_20Rnd_556x45mm_B_M193_stanag_gry"] call BIS_fnc_SelectRandom};
	if (_wpn == "sp_fwa_enfield_l42_walnut" || _wpn == "sp_fwa_enfield_l8_walnut") exitwith {["sp_fwa_10Rnd_762_L42","sp_fwa_10Rnd_762_L42_Tracer"] call BIS_fnc_SelectRandom};
	if (_wpn == "UK3CB_M16A1_LSW") exitwith {"rhs_mag_100Rnd_556x45_M855_cmag_mixed"};
	if (_wpn == "rhs_weap_vhsd2" || _wpn == "rhs_weap_vhsd2_ct15x" || _wpn == "rhs_weap_vhsd2_bg" || _wpn == "rhs_weap_vhsd2_bg_ct15x" || _wpn == "rhs_weap_vhsk2") exitwith {["rhsgref_30rnd_556x45_vhs2","rhsgref_30rnd_556x45_vhs2_t","rhssaf_30rnd_556x45_TDIM_G36","rhssaf_30rnd_556x45_MDIM_G36"] call BIS_fnc_SelectRandom};
	if (_wpn == "hlc_rifle_SG550Sniper") exitWith {"hlc_30Rnd_556x45_EPR_sg550"};
	if (_wpn == "sp_fwa_smg_thompson_m1928a1") exitwith {"sp_fwa_50Rnd_45acp_thompson_m1a1_Ball"};
	if (_wpn == "sp_fwa_smg_mk5sterling" || _wpn == "sp_fwa_smg_mk6sterling" || _wpn == "sp_fwa_smg_mk7a8sterling_stock_beech") exitwith {["sp_fwa_32Rnd_9x19_L2A3_Sterling_Tracer","sp_fwa_32Rnd_9x19_L2A3_Sterling_Ball","sp_fwa_32Rnd_9x19_L2A3_Sterling"] call BIS_fnc_SelectRandom};
	if (_wpn == "hlc_rifle_augsrcarb_t") exitwith {"hlc_30Rnd_556x45_B_AUG"};
	if (_wpn == "hlc_rifle_vendimus") exitwith {"hlc_30rnd_300BLK_PMAG_T"};
	if (_wpn == "hlc_wp_m16A1" || _wpn == "UK3CB_M16A1") exitwith {["rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red","rhs_mag_20Rnd_556x45_Mk262_Stanag"] call BIS_fnc_SelectRandom};
	if (_wpn == "hlc_rifle_MG36") exitwith {"hlc_100rnd_556x45_M_G36"};
	if (_wpn == "arifle_SPAR_02_snd_F") exitwith {["rhs_mag_100Rnd_556x45_M855A1_cmag_mixed","150Rnd_556x45_Drum_Sand_Mag_Tracer_F"] call BIS_fnc_SelectRandom};
	if (_wpn == "arifle_MX_SW_F") exitwith {["100Rnd_65x39_caseless_mag","100Rnd_65x39_caseless_mag_Tracer"] call BIS_fnc_SelectRandom};
	if (_wpn == "hlc_rifle_G36C" || _wpn == "rhs_weap_g36c") exitwith {
		if(OT_hasNI) then {
			["hlc_30rnd_556x45_Tracers_G36","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_S_G36"] call BIS_fnc_SelectRandom;
		}else{
			["rhssaf_30rnd_556x45_EPR_G36","rhssaf_30rnd_556x45_Tracers_G36","rhssaf_30rnd_556x45_SPR_G36","rhssaf_30rnd_556x45_SOST_G36"] call BIS_fnc_SelectRandom;
		};
	};
	if (_wpn == "rhs_weap_M590_8RD") exitwith {"rhsusf_8Rnd_00buck"};
	if (_wpn == "rhs_weap_savz61") exitwith {"rhsgref_20rnd_765x17_vz61"};
	if (_wpn == "sgun_Mp153_classic_F") exitwith {"4Rnd_12Gauge_Pellets"};
	if (_wpn == "arifle_Velko_lxWS") exitwith {"35Rnd_556x45_Velko_reload_tracer_green_lxWS"};
	if (_mag == "rhs_mag_30Rnd_556x45_M200_Stanag") exitwith {"rhs_mag_30Rnd_556x45_M855_Stanag"};
	if (_mag == "rhs_mag_20Rnd_556x45_M200_Stanag") exitwith {"rhs_mag_30Rnd_556x45_M855_Stanag"};
	if (_mag == "rhsusf_100Rnd_762x51_m82_blank") exitwith {"rhsusf_100Rnd_762x51_m62_tracer"};
	if (_mag == "rhsusf_50Rnd_762x51_m82_blank") exitwith {"rhsusf_50Rnd_762x51_m62_tracer"};
	if (_mag == "rhs_mag_fold_stock") exitwith {"rhs_30Rnd_762x39mm_bakelite"};
	if (_mag == "") exitwith {"rhs_mag_M781_Practice"};
	_mag
};


private _newloadout = +_loadout; //clone the loadout

//get some basic info about the loadout
private _hasVest = count(_newloadout select 4) > 0;
private _hasBackpack = count(_newloadout select 5) > 0;
private _hasPrimary = count(_newloadout select 0) > 0;
private _hasLauncher = count(_newloadout select 1) > 0;
private _hasHandgun = count(_newloadout select 2) > 0;

//replace primary weapon
if(_hasPrimary) then {
    private _primaryWpn = (_loadout select 0) select 0;
    private _base = [_primaryWpn] call BIS_fnc_baseWeapon;

    //remove magazines for primary weapon
    [_newloadout,_primaryWpn] call _removeMagazines;
	
	//replace primary weapon
	//First check the weapons designated to that catagory of unit
	private _wpn = _base call {
		if(_this in _rifles) exitWith {selectRandom _rifles};
        if(_this in _glRifles) exitWith {selectRandom _glRifles};
        if(_this in _sniperRifles) exitWith {selectRandom _sniperRifles};
        if(_this in _machineGuns) exitWith {selectRandom _machineGuns};
        ""
    };
	
    // if current weapon not found in specific class, check more generically
	if(_wpn == "") then {
		_wpn = _base call {
			if(_this in OT_ALL_NATOAR) exitWith {selectRandom _rifles};
			if(_this in OT_ALL_NATOGL) exitWith {selectRandom _glRifles};
			if(_this in OT_ALL_NATOSR) exitWith {selectRandom _sniperRifles};
			if(_this in OT_ALL_NATOMG) exitWith {selectRandom _machineGuns};
			selectRandom _rifles;
		};
	};

    (_newloadout select 0) set [0,_wpn];
	
	//propiartary scopes are fun
	if(_wpn isequalto "hlc_rifle_SG550Sniper") then {
		private _primary = _newloadout select 0;
		_primary set [3,"hlc_optic_FNSTANAG4X_550"];
	};
	if(_wpn isequalto "gm_c7a1_oli") then {
		private _primary = _newloadout select 0;
		_primary set [3,"gm_c79a1_oli"];
	};
	if(_wpn isequalto "gm_msg90a1_blk") then {
		private _primary = _newloadout select 0;
		_primary set [3,"gm_zf10x42_stanaghk_blk"];
	};
	if(_wpn isequalto "gm_psg1_blk") then {
		private _primary = _newloadout select 0;
		_primary set [3,"gm_zf6x42_psg1_stanag_blk"];
	};
	if(_wpn isequalto "gm_gvm95_blk") then {
		private _primary = _newloadout select 0;
		_primary set [3,"gm_c79a1_blk"];
	};
	if(_wpn isequalto "gm_g11k2_blk") then {
		private _primary = _newloadout select 0;
		_primary set [3,"gm_g11_lps_prism11mm_blk"];
	};
    _magazines = getArray (configFile >> "CfgWeapons" >> _wpn >> "magazines");

    _mag = "";
    {
        _scope = getNumber (configFile >> "CfgMagazines" >> _x >> "scope");
        if(_scope > 1) exitWith {_mag = _x};
    }foreach([_magazines,[],{random 100},"ASCEND"] call BIS_fnc_sortBy);

	_mag = [_wpn,_mag] call _magfix;
    private _count = getNumber(configFile >> "CfgMagazines" >> _mag >> "count");
    (_newloadout select 0) set [4,[_mag,_count]];
	

    //add mags to vest
    if(_hasVest) then {
        ((_newloadout select 4) select 1) pushBack [_mag,6,_count];
    };

    //get secondary mags (grenade rounds etc)
	if !(_wpn == "rhs_weap_M590_8RD") then {
		_secondmags = [];
		
		{
			if !(_x isEqualTo "this") then {
				_secondmags = _secondmags + getArray (configFile >> "CfgWeapons" >> _wpn >> _x >> "magazines")
			};
		}foreach(getArray (configFile >> "CfgWeapons" >> _wpn >> "muzzles"));
		if((count _secondmags) > 0) then {
			if(_hasBackpack) then {
				//add all of them to backpack
				{
					private _count = getNumber(configFile >> "CfgMagazines" >> _x >> "count");
					((_newloadout select 5) select 1) pushBack [_x,4,_count];
				}foreach(_secondmags);
			}else{
				//add the first one to vest
				if(_hasVest) then {
					_mag = _secondmags select 0;
					private _count = getNumber(configFile >> "CfgMagazines" >> _mag >> "count");
					((_newloadout select 4) select 1) pushBack [_mag,6,_count];
				};
			};
		};
	};
	if(_optic) then {
		if((random 10) <= 3) then {
			private _optics = [_wpn, "optic"] call CBA_fnc_compatibleItems;
			if(count _optics > 0) then {
				(_newloadout select 0) set [3, selectrandom _optics];
			};
		};
	};
};

//replace secondary weapon (launcher)
if(_hasLauncher) then {
    [_newloadout,(_newloadout select 1) select 0] call _removeMagazines;
    _wpn = selectRandom _launchers;
    //we always want the primary mag
    (_newloadout select 1) set [0,_wpn];
    _magazines = getArray (configFile >> "CfgWeapons" >> _wpn >> "magazines");
    _mag = _magazines select 0;
	_mag = [_wpn,_mag] call _magfix;
    private _count = getNumber(configFile >> "CfgMagazines" >> _mag >> "count");
    private _scope = getNumber(configFile >> "CfgMagazines" >> _mag >> "scope");
    (_newloadout select 1) set [4,[_mag,_count]];

    if(_hasBackpack) then {
        if(_scope < 2) then {
            //single-use launcher, remove backpack
            _newloadout set [5,[]];
        }else{
            (_newloadout select 5) set [1,[]]; //Clear backpack
            //add more primary mags
            ((_newloadout select 5) select 1) pushBack [_mag,2,_count];

            //add 2 other random ones
            private _c = 0;
            {
                if(_foreachIndex > 0) then {
                    private _count = getNumber(configFile >> "CfgMagazines" >> _x >> "count");
                    ((_newloadout select 5) select 1) pushBack [_x,1,_count];
                    _c = _c + 1;
                };
                if(_c isEqualTo 2) exitWith {};
            }foreach([_magazines,[],{random 100},"ASCEND"] call BIS_fnc_sortBy);
        };
    };
};

//replace handgun
if(_hasHandgun) then {
    [_newloadout,((_newloadout select 2) select 0)] call _removeMagazines;
    _wpn = selectRandom _handguns;
    (_newloadout select 2) set [0,_wpn];
    //we always want the primary mag
    _magazines = getArray (configFile >> "CfgWeapons" >> _wpn >> "magazines");
    _mag = _magazines select 0;
	_mag = [_wpn,_mag] call _magfix;
    private _count = getNumber(configFile >> "CfgMagazines" >> _mag >> "count");
    (_newloadout select 2) set [4,[_mag,_count]];
    //add 2 mags to vest
    if(_hasVest) then {
        ((_newloadout select 4) select 1) pushBack [_mag,2,_count];
    };
};

_newloadout
