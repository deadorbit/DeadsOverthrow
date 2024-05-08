private _town = (getpos player) call OT_fnc_nearestTown;
private _pop = server getVariable [format["population%1",_town],500];

private _stock = server getVariable format["gunstock%1",_town];
if(isNil "_stock") then {
	private _gunmin = 1;
	
	switch (true) do {
		case (_pop <= 200): {_gunmin = 2};
		case (_pop > 200 && _pop < 500): {_gunmin = 4};
		case (_pop > 500 && _pop < 1000): {_gunmin = 6};
		case (_pop > 1000): {_gunmin = 8};
	};
	private _numguns = round(random 3)+_gunmin;
	private _numOptics = round(random 3) + floor(_gunmin/2);
	private _numMuzzle = 1 max floor(_numOptics/2);
	private _withMuzzle = [];//Guns that have atleast one muzzle attachment
	private _count = 0;
	_stock = [[OT_item_BasicGun,0],[OT_item_BasicAmmo,0]];
	_stock pushback ["Set_HMG",0];
	_stock pushback ["ace_csw_100Rnd_127x99_mag",0];
	_stock pushback ["Set_SPG",0];
	_stock pushback ["ace_compat_rhs_afrf3_mag_OG9V",0];
	_stock pushback ["ace_compat_rhs_afrf3_mag_PG9V",0];
	_stock pushback ["EasyMG",0];
	_stock pushback ["I_UavTerminal",0];
	if(OT_hasWS) then {
		_stock pushback ["I_G_UAV_02_IED_backpack_lxWS",0];
		_stock pushback ["I_Tura_UAV_02_IED_backpack_lxWS",0];
	};
	_stock pushback ["I_G_Quadbike_01_F",0];

	{
		// name price
		_stock pushBack [_x,0];
	}foreach(OT_allStaticBackpacks);

	private _tostock = [];
	while {_count < _numguns} do {
		private _type = selectRandom OT_allWeapons;
		if !(_type in _tostock) then {

			_tostock pushBack [_type,0];
			_count = _count + 1;

			_stock pushBack [_type,0];

			private _base = [_type] call BIS_fnc_baseWeapon;
			private _magazines = getArray (configFile >> "CfgWeapons" >> _base >> "magazines");
			/*if (count(configFile >> "CfgWeapons" >> _type >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems") > 0) then {
					_withMuzzle pushBack _type;
			};*/
			_stock pushBack [selectRandom _magazines,0];
		};
	};
	
	_count = 0;
	while {_count < _numOptics} do {
		private _type = selectRandom OT_allOptics;
		if !(_type in _tostock) then {
				_count = _count + 1;

				_stock pushBack [_type,0];
				_tostock pushBack [_type,0];
		};
	};
	/*if(_numMuzzle > count(_withMuzzle)) then {_numMuzzle = count(_withMuzzle)};
	_count = 0;
	while {_count < _numMuzzle} do {
		private _cls = _withMuzzle call BIS_fnc_selectrandom;
		private _itm = (configFile >> "CfgWeapons" >> _type >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems") call BIS_fnc_selectrandom;
		_itm = configname _itm;
		systemchat _itm;
		_count = _count + 1;
	};
	
	{
		// name, price
		_stock pushBack [_x, 0];
	}foreach(OT_allOptics);*/

	{
		_stock pushBack [_x,_price];
	}foreach(OT_allDrugs);

	server setVariable [format["gunstock%1",_town],_stock,true];
};

createDialog "OT_dialog_buy";
ctrlShow [2000, false];
ctrlenable [2000, false];

private _civ = OT_interactingWith;
private _name = name _civ;

_textctrl = (findDisplay 8000) displayCtrl 1101;
_textctrl ctrlSetStructuredText parseText format["<t size='1.7' shadow='2' align='left' valign = 'middle'>%1 | %2</t>",_name,"Gun Dealer"];

{
	_x params ["_cls","_price"];
	if !(isNil "_cls" || _cls in OT_noCopyMags) then {
		private _txt = _cls;
		private _pic = "";

		[_cls] call {
			params ["_cls"];
			if(_cls == "Set_HMG") exitWith {
				_txt = "Quadbike w/ HMG Backpacks";
				_pic = "I_G_Quadbike_01_F" call OT_fnc_magazineGetPic;
			};
			if(_cls == "Set_SPG") exitWith {
				_txt = "Quadbike w/ SPG Backpacks";
				_pic = "I_G_Quadbike_01_F" call OT_fnc_magazineGetPic;
			};
			if(_cls == "EasyMG") exitWith {
				_txt = "Jeep w/ LMG";
				_pic = "I_C_Offroad_02_LMG_F" call OT_fnc_magazineGetPic;
			};
			/*if(_cls == "IEDDrone") exitWith {
				_txt = "IED Drone";
				_pic = "I_G_UAV_02_IED_lxWS" call OT_fnc_magazineGetPic;
			};*/
			if(_cls isKindOf ["Default",configFile >> "CfgMagazines"]) exitWith {
				_txt = format["--- %1",_cls call OT_fnc_magazineGetName];
				_pic = _cls call OT_fnc_magazineGetPic;
			};
			if(_cls in OT_allStaticBackpacks) exitWith {
				_txt = format["--- %1",_cls call OT_fnc_vehicleGetName];
				_pic = _cls call OT_fnc_vehicleGetPic;
			};
			if(_cls isKindOf "Land" || _cls isKindOF "All") exitWith {
				_txt = format["%1",_cls call OT_fnc_vehicleGetName];
				_pic = _cls call OT_fnc_vehicleGetPic;
			};
			_txt = _cls call OT_fnc_weaponGetName;
			_pic = _cls call OT_fnc_weaponGetPic;
		};
		if(_cls in OT_allDrugs) then {
			_price = [OT_nation,_cls] call OT_fnc_getDrugPrice;
		}else{
			if(_cls in OT_allOptics) then {//Is Optic
				_price = ([_town,_cls] call OT_fnc_getPrice) * OT_dealerUpcharge * OT_dealerOpticFee * OT_standardMarkup;
			}else{
				if(_cls isKindOf ["Default",configFile >> "CfgMagazines"]) then {//Is Magazine
					_price = ([_town,_cls] call OT_fnc_getPrice) * OT_dealerUpcharge * OT_dealerMagFee * OT_standardMarkup;	
				}else{
					_price = ([_town,_cls] call OT_fnc_getPrice) * OT_dealerUpcharge * OT_standardMarkup;
				};
			};
		};
		private _idx = lbAdd [1500,format["%1",_txt]];
		lbSetData [1500,_idx,_cls];
		lbSetValue [1500,_idx,_price];
		lbSetPicture [1500,_idx,_pic];
	};
}foreach(_stock);
