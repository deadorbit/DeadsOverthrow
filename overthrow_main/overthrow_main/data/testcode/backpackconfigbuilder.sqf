//Price parameters
private _basecost = 20; //Minimum price of vest
private _spaceMult = 2; //Multiplier per space value to cost of vest
private _legalMult = 1; //multiplier to cost of LEGAL vests
private _weightMult = 0.1; //Multiplier to how much mass REDUCES the price of a vest

private _calcPrice = {
	params ["_we"];
};

//Resource Parameters, Note: Backpacks are only made of cloth
private _priceToResource = 0.01; //How much does $1 convert to the given resource?
private _minResource = 0.1; //What is the minimum amount of a material a vest can be made of?
private _maxResource = 2.0; //What is the maximum amount of resource needed to produce 1 vest?


//Most backpacks are probabaly legal, but some (like RHS RPG bag) should be illegal for logical reasons
private _illegalBackpackExecptions = [];


private _newline = "
";

/*Base class of illegal vests
	It is highly likely there are some helmets in here
*/
private _illegalVests = [
	"rhs_6b23",
	"rhs_6b2",
	"rhs_6b23",
	"rhs_6b26",
	"rhs_6b28",
	"rhs_6sh117_rifleman",
	"rhs_6sh46",
	"rhs_6sh92",
	"rhssaf_balistic_vest_base",
	"rhsusf_iotv_ocp_base",
	"V_CarrierRigKBT_01_base_F",
	"V_DeckCrew_base_F",
	"V_TacVest_camo",
	"V_TacVestCamo_khk",
	"V_TacVestIR_blk",
	"V_PlateCarrierIA1_dgtl",
	"V_PlateCarrier1_blk",
	"V_PlateCarrier1_rgr",
	"V_PlateCarrier3_rgr",
	"V_PlateCarrierGL_rgr",
	"V_PlateCarrierSpec_rgr",
	"V_TacVest_khk",
	"V_TacVest_blk_POLICE",
	"eo_platecarrier_1",
	"eo_platecarrier_2",
	"eo_platecarrier_3",
	"eo_platecarrier_4",
	"eo_platecarrier_5",
	"eo_deckvest_1",
	"eo_deckvest_2",
	"eo_ravenvest_1"
];

//Pray any of the mods don't use weird base classes
private _allbags = format
	["
		(configname _x) isKindOf [""bag_base"", configFile >> ""CfgVehicles""]
		&&
		(
			(count ([_x >> ""TransportWeapons""] call BIS_fnc_getCfgSubClasses) == 0)
			&&
			(count ([_x >> ""TransportItems""] call BIS_fnc_getCfgSubClasses) == 0)
			&&
			(count ([_x >> ""TransportMagazines""] call BIS_fnc_getCfgSubClasses) == 0)
		)
		&&
		(getNumber(_x >> ""scope"") > 0)
		&&
		((_x >> ""assembleInfo"") == configNull)
	"] 
configClasses ( configFile >> "CfgVehicles" );


private _output = "";
private _warning = "";
private _debug = "";

private _totalConfigs = 0;
private _averageCost = 0; //Average cost of all armor should be around 100-200
private _maxCost = 0;
private _minCost = 9999;
private _resourceCost = [0,0,0,0];
private _buildPrice = true; //Will return built list of prices formated for pricedata hash

private _makeOTVestCfg = {
	params ["_class", "_price", "_isIllegal"];
	
	_price params ["_bc", "_wc", "_sc", "_cc"];
	private _return = "";
	private _newline = "
	";
	
	if (_isIllegal) then {
		_return = format["OT_ILLEGAL_ITEM(%1, %2, %3, %4, %5)",_class, _bc, _wc, _sc, _cc] + _newline;
	}else{
		_return = format["OT_LEGAL_ITEM(%1, %2, %3, %4, %5)",_class, _bc, _wc, _sc, _cc] + _newline;
	};
	
	_return
};

{
	private _cls = configname _x;
	private _config = _x;
	private _price = 0;
	private _totalArmor = 0.0;
	private _idx = OT_priceData findIf {(_x select 0) isEqualTo _cls};
	private _allHitPoints = (_config >> "ItemInfo" >> "HitPointsProtectionInfo") call BIS_fnc_getCfgSubClasses;
	private _numHitPoints = count _allHitPoints;
	private _weight = (_config >> "ItemInfo" >> "mass") call BIS_fnc_getCfgData;
	private _inventorySpace = (_config >> "ItemInfo" >> "containerClass") call BIS_fnc_getCfgData;
	private _inventoryValue = 99999;
	
	if (!isNil "_inventorySpace" && (typeName _inventorySpace isEqualTo "STRING")) then {
		_inventoryValue = (configFile >> "CfgVehicles" >> _inventorySpace >> "maximumLoad") call BIS_fnc_getCfgData;
	};
	
	private _isillegal = ((_illegalVests findIf {_cls isKindOf [_x, configFile >> "CfgWeapons"]}) > -1);
	if (_isillegal && _cls in _legalVestsExeptions) then {
		_isillegal = false;
	};
	
	{
		private _hitpoint = (_config >> "ItemInfo" >> "HitPointsProtectionInfo" >> _x);
		private _protectionValue = (_hitpoint >> "armor") call BIS_fnc_getCfgData;
		if (!isNil "_protectionValue" && (typeName _protectionValue isEqualTo "SCALAR")) then {
			_totalArmor = _totalArmor + _protectionValue;
		};
	}foreach(_allHitPoints);
	
	if(!(_cls in _vestsNoWarning)) then {
		if ((_totalArmor > 10) && !(_isillegal)) then {
			_warning = _warning + format["Warning: Strange LEGAL vest %1",_cls] + _newline;
		}else{
			if((_totalArmor isEqualTo 0) && _isillegal) then {
				_warning = _warning + format["Warning: Strange ILLEGAL vest %1",_cls] + _newline;
			};
		};
	};
	
	_price = round((((_totalArmor * (_armorMult + (_numHitPoints * _numHitPointsMult))) + (_inventoryValue * _spaceMult) - (_weight * _weightMult)) max _basecost) * _legalMult);
	if (_buildCfg) then {
		_output = _output + ([_cls, _price, _isIllegal] call _makeOTVestCfg);
	}else{
		_output = _output + format[
			"Vest: %1 
			Armor: %2
			Weight: %3
			Space: %4
			Price: %5
			isIllegal: %6",
			_cls,
			_totalArmor,
			_weight,
			_inventoryValue,
			_price,
			_isillegal
		] + _newline;
		
		if (_price > _maxCost) then {
			_maxCost = _price;
		}else{
			if (_price < _minCost) then {
				_minCost = _price;
			};
		};
		
		_averageCost = _averageCost + _price;
		_totalConfigs = _totalConfigs + 1;
	};
}foreach(_allvests);

_output