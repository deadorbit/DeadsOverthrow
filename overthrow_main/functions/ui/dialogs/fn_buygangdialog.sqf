private _stock = [];

createDialog "OT_dialog_buy";
ctrlShow [2000, false];
ctrlenable [2000, false];

private _civ = OT_interactingWith;
private _name = name _civ;
private _gangid = _civ getVariable ["OT_gangid",-1];

_textctrl = (findDisplay 8000) displayCtrl 1101;
_textctrl ctrlSetStructuredText parseText format["<t size='1.7' shadow='2' align='left' valign = 'middle'>%1 | %2</t>",_name,"Gang Leader"];

private _gang = OT_civilians getVariable format["gang%1",_gangid];
private _loadout = _gang select 5;
private _gangGun = (_loadout select 0) select 0;
private _gangMag = ((_loadout select 0) select 4) select 0;
private _gangPistol = (_loadout select 2) select 0;
private _gangPistolMag = ((_loadout select 2) select 4) select 0;
private _gangUniform = ((_loadout select 3) select 0);
private _gangVest = _gang select 3;
private _level = _gang select 7;
private _gangdiscount = 0.8;


_stock pushback [_gangGun,0];
_stock pushback [_gangMag,0];
_stock pushback [_gangPistol,0];
_stock pushback [_gangPistolMag,0];
_stock pushback [_gangUniform,0];
_stock pushback [_gangVest,0];
_stock pushback ["FirstAidKit",0];
if(_level >= 2) then {
	_ganglauncher = _gang select 9;
	_gangdiscount = 0.7;
	_stock pushback ["ace_csw_50Rnd_127x108_mag",0];
	_stock pushback [_ganglauncher,0];
	_stock pushback ["rhs_rpg_6b2",0];
};

{
	_x params ["_cls","_price"];
	if !(isNil "_cls") then {
		private _txt = _cls;
		private _pic = "";

		[_cls] call {
			params ["_cls"];
			if(_cls == "Set_HMG") exitWith {
				_txt = "Quadbike w/ HMG Backpacks";
				_pic = "C_Quadbike_01_F" call OT_fnc_magazineGetPic;
			};
			if(_cls == "EasyMG") exitWith {
				_txt = "Jeep w/ LMG";
				_pic = "I_C_Offroad_02_LMG_F" call OT_fnc_magazineGetPic;
			};
			if(_cls == "IEDDrone") exitWith {
				_txt = "IED Drone";
				_pic = "I_G_UAV_02_IED_lxWS" call OT_fnc_magazineGetPic;
			};
			if(_cls isKindOf ["Default",configFile >> "CfgMagazines"]) exitWith {
				_txt = format["--- %1",_cls call OT_fnc_magazineGetName];
				_pic = _cls call OT_fnc_magazineGetPic;
			};
			if(_cls in OT_allStaticBackpacks) exitWith {
				_txt = format["--- %1",_cls call OT_fnc_vehicleGetName];
				_pic = _cls call OT_fnc_vehicleGetPic;
			};
			if(_cls isKindOf "Land") exitWith {
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
				_price = ([_town,_cls] call OT_fnc_getPrice) * OT_standardMarkup * _gangdiscount;
			}else{
				if(_cls isKindOf ["Default",configFile >> "CfgMagazines"]) then {//Is Magazine
					_price = ([OT_Nation,_cls] call OT_fnc_getPrice)  * OT_standardMarkup * _gangdiscount;
				}else{
					_price = ([OT_Nation,_cls] call OT_fnc_getPrice) * OT_standardMarkup * _gangdiscount;
				};
			};
		};
		private _idx = lbAdd [1500,format["%1",_txt]];
		lbSetData [1500,_idx,_cls];
		lbSetValue [1500,_idx,_price];
		lbSetPicture [1500,_idx,_pic];
	};
}foreach(_stock);
