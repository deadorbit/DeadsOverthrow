private _allFactions = "
    ( getNumber ( _x >> ""side"" ) < 3 )
" configClasses ( configFile >> "cfgFactionClasses" );


{
	private _name = configName _x;
	private _title = getText (configFile >> "cfgFactionClasses" >> _name >> "displayName");
	private _side = getNumber (configFile >> "cfgFactionClasses" >> _name >> "side");
	private _flag = getText (configFile >> "cfgFactionClasses" >> _name >> "flag");
	private _numblueprints = 0;
	
	if !(_side isEqualTo 1) then {continue};
	
	//Get vehicles && weapons
	private _vehicles = [];
	private _weapons = [];
	private _blacklist = ["Throw","Put","NLAW_F","rhs_weap_aks74u","rhs_weap_m79","rhs_weap_mk18_KAC"];

	private _all = format["(getNumber( _x >> ""scope"" ) isEqualTo 2 ) && (getText( _x >> ""faction"" ) isEqualTo '%1')",_name] configClasses ( configFile >> "cfgVehicles" );
	private _auth = gettext(configFile >> "CfgVehicles" >> (configname (_all select 0)) >> "author");
	if(!isnil{_auth}) then {
		if(_auth isequalto "www.3commandobrigade.com")  then {
			if
			(
				!(
					_name == "UK3CB_AAF_I" ||
					_name == "UK3CB_ADA_I" ||
					_name == "UK3CB_ADM_I" ||
					_name == "UK3CB_ARD_I" ||
					_name == "UK3CB_CHD_I" ||
					_name == "UK3CB_FIA_I" ||
					_name == "UK3CB_GAF_I" ||
					_name == "UK3CB_ION_I_Urban" ||
					_name == "UK3CB_KRG_I" ||
					_name == "UK3CB_KDF_O" ||
					_name == "UK3CB_LDF_I" ||
					_name == "UK3CB_LSM_O" ||
					_name == "UK3CB_NAP_I"
				) ||
				_name == "UK3CB_NFA_I" ||
				_name == "UK3CB_TKA_I" ||
				_name == "UK3CB_ADE_O" ||
				_name == "UK3CB_CW_SOV_O_EARLY" ||
				_name == "UK3CB_MEE_O"
			) exitwith {};
		};
	};
	{
		private _cls = configName _x;
		if(_cls isKindOf "CAManBase") then {
			//Get weapons;
			{
				private _base = [_x] call BIS_fnc_baseWeapon;
				if !(_base in _blacklist) then {
					private _muzzleEffect = getText (configFile >> "CfgWeapons" >> _base >> "muzzleEffect");
					if !(_x in _weapons) then {_weapons pushback _base};
					//Get ammo
					{
						if (!(_x in _blacklist || _x in _allExplosives || _x in _noCopyMags)) then {
							_weapons pushbackUnique _x
						};
					}foreach(getArray(configFile >> "CfgWeapons" >> _base >> "magazines"));
				};
			}foreach(getArray(configFile >> "CfgVehicles" >> _cls >> "weapons"));
		}else{
			//It's a vehicle
			if !(_cls isKindOf "Bag_Base" || _cls isKindOf "StaticWeapon") then {
				if(_cls isKindOf "LandVehicle" || _cls isKindOf "Air" || _cls isKindOf "Ship") then {
					_vehicles pushback _cls;
					_numblueprints = _numblueprints + 1;
				};
			};
		};
	}foreach(_all);
	_weapons = (_weapons arrayIntersect _weapons); //remove duplicates

	if(isServer) then {
		spawner setVariable [format["facweapons%1",_name],_weapons,true];
		spawner setVariable [format["facvehicles%1",_name],_vehicles,true];
	};
	if(_side > -1 && _numblueprints > 0) then {
		OT_allFactions pushback [_name,_title,_side,_flag];
	};
}foreach(_allFactions);