private _categorize = {
    params ["_c","_cat"];
    private _done = false;
    {
        if((_x select 0) isEqualTo _cat) exitWith {
            (_x select 1) pushBackUnique _c;
            _done = true;
        };
    }foreach(OT_items);
    if !(_done) then {
        OT_items pushback [_cat,[_c]];
    };
};

private _getprice = {
    params ["_x","_primaryCategory"];
    private _cls = configName _x;
    private _mass = getNumber ( _x >> "ItemInfo" >> "mass" );

    private _name = getText (_x >> "displayName");
    private _price = round(_mass * 1.5);
    private _steel = 0;
    private _wood = 0;
    private _plastic = 0;
    private _steel = ceil(_mass * 0.2);
    if(_mass isEqualTo 1) then {
        _steel = 0.1;
    };
    if(_primaryCategory isEqualTo "Pharmacy") then {
        _steel = 0;
        _plastic = ceil(_mass * 0.2);
        if(_mass isEqualTo 1) then {
            _plastic = 0.1;
        };
        private _res = [_name,_mass] call {
            params ["_name", "_mass"];
            _price = _mass * 4;
            if(_cls find "blood" > -1) exitWith {
                _price = round(_price * 1.3);
            };
            if(_cls find "saline" > -1) exitWith {
                _price = round(_price * 0.3);
            };
            if(_cls find "IV_250" > -1) exitWith {
                _price = round(_price * 0.5);
            };
            if(_cls find "IV_500" > -1) exitWith {
                _price = round(_price * 1.5);
            };
            if(_cls find "fieldDressing" > -1) exitWith {
                _price = 1;
            };
            if(_cls find "epinephrine" > -1) exitWith {
                _price = 30;
                _plastic = 0;
            };
            if(_cls find "bodybag" > -1) exitWith {
                _price = 2;
                _plastic = 0.1;
            };
        };
    };
    if(_primaryCategory isEqualTo "Electronics") then {
        _steel = 0;
        _plastic = ceil(_mass * 0.2);
        _price = _mass * 4;
        private _factor = [_name] call {
            params ["_name"];
            if(_cls find "altimeter" > -1) exitWith {3};
            if(_cls find "DAGR" > -1) exitWith {7};
            if(_cls find "GPS" > -1) exitWith {1.5};
            if(_cls find "_dagr" > -1) exitWith {2};
            1
        };
        _price = round (_price * _factor);
    };
    if(_primaryCategory isEqualTo "Hardware") then {
        _price = _mass;
    };
    private _cls = configName _x;
    if(_cls isEqualTo "ToolKit") then {
        _price = 80;
    };
    [_price,_wood,_steel,_plastic];
};

{
    private _cls = configName _x;
    private _name = getText (_x >> "displayName");
    private _desc = getText (_x >> "descriptionShort");

    private _categorized = false;
    private _primaryCategory = "";
    {
        _x params ["_category","_types"];
        {
            if((_cls find _x > -1) || (_name find _x > -1) || (_desc find _x > -1)) exitWith {
                [_cls,_category] call _categorize;
                _categorized = true;
                if(_category != "General") then {
                    _primaryCategory = _category;
                };
                {
                    private _c = configName _x;
                    [_c,_category] call _categorize;

                    private _craftable = getNumber ( _x >> "ot_craftable" );

                    if(_craftable > 0) then {
                        private _recipe = call compileFinal getText (_x >> "ot_craftRecipe");
                        private _qty = getNumber ( _x >> "ot_craftQuantity" );
                        OT_craftableItems pushback [configName _x,_recipe,_qty];
                    };

                    if(isServer && isNil {cost getVariable _c}) then {
                        cost setVariable [_c,[_x,_primaryCategory] call _getprice,true];
                    };
                }foreach(format ["inheritsFrom _x isEqualTo (configFile >> ""CfgWeapons"" >> ""%1"")",_cls] configClasses ( configFile >> "CfgWeapons" ));
            };
        }foreach(_types);
    }foreach(OT_itemCategoryDefinitions);

    if(isServer && isNil {cost getVariable _c}) then {
        cost setVariable [_cls,[_x,_primaryCategory] call _getprice,true];
    };

    if(_categorized) then {
        OT_allItems pushback _cls;
    };
}foreach("(inheritsFrom _x in [configFile >> ""CfgWeapons"" >> ""Binocular"",configFile >> ""CfgWeapons"" >> ""ItemCore"",configFile >> ""CfgWeapons"" >> ""ACE_ItemCore""])" configClasses ( configFile >> "CfgWeapons" ));

private _general = (OT_items select 0) select 1;
_general append OT_ForcedItemsGeneral;
private _electronics = (OT_items select 1) select 1;
_electronics append OT_ForcedItemsElectronics;
private _surplus = (OT_items select 2) select 1;
_surplus append OT_ForcedItemsSurplus;
private _hardware = (OT_items select 3) select 1;
_hardware append OT_ForcedItemsHardware;

OT_allItems append OT_ForcedItemsGeneral;
OT_allItems append OT_ForcedItemsElectronics;
OT_allItems append OT_ForcedItemsSurplus;
OT_allItems append OT_ForcedItemsHardware;

//add Bags
/*
{
    private _cls = configName _x;
    if ((_cls find "_Base") isEqualTo -1) then {
        [_cls,"Surplus"] call _categorize;
    };
}foreach("_parents = ([_x,true] call BIS_fnc_returnParents); 'Bag_Base' in _parents && !('Weapon_Bag_Base' in _parents) && (count (_x >> 'TransportItems') isEqualTo 0) && (count (_x >> 'MagazineItems') isEqualTo 0)" configClasses ( configFile >> "CfgVehicles" ));
*/

//add craftable magazines
{
    private _cls = configName _x;
    private _recipe = call compileFinal getText (_x >> "ot_craftRecipe");
    private _qty = getNumber ( _x >> "ot_craftQuantity" );
    OT_craftableItems pushback [_cls,_recipe,_qty];
}foreach("getNumber (_x >> ""ot_craftable"") isEqualTo 1" configClasses ( configFile >> "CfgMagazines" ));

//add craftable weapons
{
    private _cls = configName _x;
	private _recipe = call compileFinal getText (_x >> "ot_craftRecipe");
	private _qty = getNumber ( _x >> "ot_craftQuantity" );
	OT_craftableItems pushback [_cls,_recipe,_qty];
}foreach("getNumber (_x >> ""ot_craftable"") isEqualTo 1" configClasses ( configFile >> "CfgWeapons" ));

OT_craftableItems pushBack ["rhs_mine_stockmine43_2m_mag",[["HandGrenade",1],["ACE_packingBandage",1]],1];
OT_craftableItems pushBack ["rhsusf_m112x4_mag",[["DemoCharge_Remote_Mag",4],["ACE_packingBandage",1]],1];
OT_craftableItems pushBack ["rhs_ec400_mag",[["OT_NVC",1],["OT_Fertilizer",1],["Uniform_Base",1]],5];
OT_craftableItems pushBack ["rhs_charge_tnt_x2_mag",[["rhs_ec400_mag",3],["ACE_packingBandage",1]],1];
OT_craftableItems pushBack ["rhs_charge_M2tet_x2_mag",[["rhs_ec400_mag",7],["Uniform_Base",1]],1];
OT_craftableItems pushBack ["ACE_Fortify",[["ToolKit",1],["OT_Wood",1]],1];
OT_craftableItems pushBack ["ACE_Tripod",[["ToolKit",1],["OT_Steel",1]],1];
OT_craftableItems pushBack ["ACE_Clacker",[["ToolKit",1]],1];
OT_craftableItems pushBack ["ACE_DefusalKit",[["ToolKit",1]],1];
OT_craftableItems pushBack ["ACE_packingBandage",[["ACE_fieldDressing",5]],1];
OT_craftableItems pushBack ["rhs_acc_1p78",[["Binocular",2],["ToolKit",1],["SmokeShell",4]],1];
OT_craftableItems pushBack ["muzzle_snds_L",[["Uniform_Base",1],["ACE_packingBandage",3],["toolkit",1]],1];
OT_craftableItems pushBack ["muzzle_snds_acp",[["Uniform_Base",1],["ACE_packingBandage",5],["toolkit",1]],1];
OT_craftableItems pushBack ["rhsgref_8Rnd_762x63_M2B_M1rifle",[["OT_nvc",1],["Uniform_Base",1],["SmokeShell",1]],10];
OT_craftableItems pushBack ["rhs_weap_m38",[["OT_wood",3],["OT_ore",1],["ToolKit",1]],1];
OT_craftableItems pushBack ["rhsgref_5Rnd_762x54_m38",[["OT_nvc",1],["Uniform_Base",1],["SmokeShell",1]],20];
OT_craftableItems pushBack ["rhs_weap_m1garand_sa43",[["OT_wood",2],["OT_ore",2],["ToolKit",1]],1];
OT_craftableItems pushBack ["rhsgref_8Rnd_762x63_M2B_M1rifle",[["OT_nvc",1],["Uniform_Base",1],["SmokeShell",1]],10];

if (OT_hasWS) then {
	OT_craftableItems pushBack ["arifle_Galat_worn_lxWS",[["OT_wood",2],["OT_ore",2],["ToolKit",1]],1];
	OT_craftableItems pushBack ["30Rnd_762x39_Mag_worn_lxWS",[["OT_nvc",1],["Uniform_Base",1],["SmokeShell",1]],3];
	OT_craftableItems pushBack ["arifle_SLR_GL_lxWS",[["OT_wood",1],["OT_ore",3],["ToolKit",1]],1];
	OT_craftableItems pushBack ["20Rnd_762x51_slr_lxWS",[["OT_nvc",1],["Uniform_Base",1],["SmokeShell",1]],5];
	OT_craftableItems pushBack ["1Rnd_40mm_HE_lxWS",[["HandGrenade",3],["SmokeShell",1]],2];
	OT_craftableItems pushBack ["1Rnd_50mm_Smoke_lxWS",[["SmokeShell",4]],2];
	OT_craftableItems pushBack ["1Rnd_58mm_AT_lxWS",[["HandGrenade",4],["SmokeShell",1]],1];
	OT_craftableItems pushBack ["B_shield_backpack_lxWS",[["OT_Steel",1],["ToolKit",1]],1];
	OT_craftableItems pushBack ["I_shield_backpack_lxWS",[["OT_Steel",1],["ToolKit",1]],1];
};
if (OT_hasNI) then {
	OT_craftableItems pushBack ["hlc_optic_VOMZ3d",[["Binocular",2],["SmokeShell",4]],1];
	OT_craftableItems pushBack ["HLC_Panel_Under_Ladder_L_Pride",[["SmokeShell",10]],1];
	OT_craftableItems pushBack ["HLC_ISOPOD",[["SmokeShell",25]],1];
};