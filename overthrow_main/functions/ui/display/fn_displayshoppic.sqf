disableSerialization;
params ["_ctrl","_index"];

private _cls = _ctrl lbData _index;
private _price = _ctrl lbValue _index;

private _pic = "";
private _txt = "";
private _desc = "";
if(_price > -1) then {
    ctrlEnable [1600,true];
    private _res = [_cls] call {
		params ["_cls"];
        if(_cls == "Set_HMG") exitWith {
			[
				getText(configFile >> "cfgVehicles" >> "C_Quadbike_01_F" >> "editorPreview"),
            	"A Quad-bike containing the backpacks required to set up a Static HMG",
            	"Quad Bike w/ HMG Backpacks"
			]
        };
		if(_cls == "Set_SPG") exitWith {
			[
				getText(configFile >> "cfgVehicles" >> "C_Quadbike_01_F" >> "editorPreview"),
            	"A Quad-bike containing the backpacks required to set up a recoiless self-propelled anti-tank gun.",
            	"Quad Bike w/ SPG Backpacks"
			]
        };
		if(_cls == "EasyMG") exitWith {
			[
				getText(configFile >> "cfgVehicles" >> "I_C_Offroad_02_LMG_F" >> "editorPreview"),
            	"A Jeep Wrangler with an FN Minimi attached to a turret on its back.",
            	"Jeep w/ LMG"
			]
        };
		if(_cls == "IEDDrone") exitWith {
			[
				getText(configFile >> "cfgVehicles" >> "I_G_UAV_02_IED_lxWS" >> "editorPreview"),
            	"A UAV that has been modified to store and drop bombs. Additional bombs can be crafted.",
            	"IED Drone"
			]
        };
    	if(_cls isKindOf ["Default",configFile >> "CfgMagazines"]) exitWith {
    		[
				_cls call OT_fnc_magazineGetPic,
    			_cls call OT_fnc_magazineGetDescription,
    			_cls call OT_fnc_magazineGetName
			]
    	};
    	if(isClass (configFile >> "CfgGlasses" >> _cls)) exitWith {
    		[
				gettext(configFile >> "CfgGlasses" >> _cls >> "picture"),
				nil,
    			gettext(configFile >> "CfgGlasses" >> _cls >> "displayName")
			]
    	};
		if(_cls isequalto "OT_Land_Cargo10_grey_F") exitwith {
			private _storage = getNumber(configFile >> "CfgVehicles" >> "OT_Land_Cargo10_grey_F" >> "maximumLoad");
			private _size = getNumber(configFile >> "CfgVehicles" >> "OT_Land_Cargo10_grey_F" >> "ace_cargo_size");
			[
				getText(configFile >> "cfgVehicles" >> "OT_Land_Cargo10_grey_F" >> "editorPreview"),
				(format[
					"Useful for transporting a large amount of materials to businesses. Inventory can be viewed through an ACE interaction. Fill by bringing near port and press Y to interact with.<br/>
					Storage Space: %1u<br/>
					Size: %2",
					_storage,
					_size
				]),
				"Standard Storage Container"
			]
		};
        if(_cls isKindOf "Man") exitWith {
            private _soldier = _cls call OT_fnc_getSoldier;
            private _bought = _soldier select 5;
    		private _price = _soldier select 0;

            _text = "";
            {
                _x params ["_cls","_qty"];
                private _name = _cls call OT_fnc_anythingGetName;
                private _cost = (([OT_nation,_cls,30] call OT_fnc_getPrice) * _qty);
                _text = format["%1%2 x %3 = $%4<br/>",_text,_qty,_name,[_cost, 1, 0, true] call CBA_fnc_formatNumber];
            }foreach(_bought);

            if(_text isEqualTo "") then {
                _text = "All items required for this unit are available in the warehouse";
            }else{
                _text = format["These items are not in the warehouse and must be purchased:<br/>%1",_text];
            };

    		[
				nil,
    			_text,
				_cls call OT_fnc_vehicleGetName,
				_price
			]
    	};
    	if ((isClass (configFile >> "CfgVehicles" >> _cls)) && !(_cls isKindOf "Bag_Base")) exitWith {
			if(!(OT_interactingWith getvariable ["factionrep",false])) then {
				private _hp = round(getnumber(configFile >> "CfgVehicles" >> _cls >> "enginePower") * 1.34102209);
				private _rpm = round((60/(2*pi)) * getnumber(configFile >> "CfgVehicles" >> _cls >> "maxOmega"));
				private _kph = round(getnumber(configFile >> "CfgVehicles" >> _cls >> "maxSpeed"));
				private _lod = round(getnumber(configFile >> "CfgVehicles" >> _cls >> "maximumLoad"));
				private _ald = round(getnumber(configFile >> "CfgVehicles" >> _cls >> "ace_cargo_space"));
				private _trn = [_cls, true] call BIS_fnc_crewCount;
				if(isnil{_ald}) then {
					_ald = 0;
				};
				[
					getText(configFile >> "cfgVehicles" >> _cls >> "editorPreview"),
					(format["Top Speed: %4kph<br/>Engine Power: %2hp@%3rpm<br/>Inventory Space: %5u | %6 Cargo | Seats: %7 </t><br/><t align='center' size='0.6'>%1</t>",
						[getText(configFile >> "cfgVehicles" >> _cls >> "Library" >> "libTextDesc"),"Gets you from A to B, not guaranteed to stay upright."] select (_cls == "C_Quadbike_01_F" || _cls == "I_G_Quadbike_01_F"),
						_hp,
						_rpm,
						_kph,
						_lod,
						_ald,
						_trn
					]),
					_cls call OT_fnc_vehicleGetName
				]
			}else{
				private _cost = cost getVariable[_cls,[]];
				_cost params ["_base","_wood","_steel",["_plastic",0]];
				[
					getText(configFile >> "cfgVehicles" >> _cls >> "editorPreview"),
					(format["<t align='center' size='0.6'>Material Cost:<br/>Wood: %2<br/>Steel: %3<br/>Plastic:%4<br/><br/>%1</t>",
						[getText(configFile >> "cfgVehicles" >> _cls >> "Library" >> "libTextDesc"),"Gets you from A to B, not guaranteed to stay upright."] select (_cls == "C_Quadbike_01_F"),
						_wood,
						_steel,
						_plastic
					]),
					_cls call OT_fnc_vehicleGetName
				]
			};
		};
    	if(_cls isKindOf "Bag_Base") exitWith {
    		[
				_cls call OT_fnc_vehicleGetPic,
				_cls call OT_fnc_vehicleGetDescription,
				_cls call OT_fnc_vehicleGetName
			]
    	};
    	if(_cls isKindOf ["Default",configFile >> "CfgWeapons"]) exitWith {
    		[
				_cls call OT_fnc_weaponGetPic,
    			(format["%1<br/>%2<t align='center' size='0.8'>%3</t>", (getText(configFile >> "CfgWeapons" >> _cls >> "descriptionShort")), (_cls call OT_fnc_magazineGetDescription),gettext(configFile >> "CfgWeapons" >> _cls >> "Library" >> "libTextDesc") call OT_fnc_escapeXML]),
    			(_cls call OT_fnc_weaponGetName) call OT_fnc_escapeXML
			]
    	};
    	if(_cls in OT_allSquads) exitWith {
            private _squad = _cls call OT_fnc_getSquad;
            _price = _squad param [0,0];
            ctrlEnable [1601,false];

			[
				nil,
    			"Will recruit this squad into your High-Command bar, accessible with ctrl-space.",
				_cls,
				_price
			]
    	};
    };
	_pic = _res param [0, ""];
	_desc = _res param [1, ""];
	_txt = _res param [2, ""];
	_price = _res param [3, _price];
}else{
    ctrlEnable [1600,false];
    _desc = _cls;
    _txt = "Not Available";
    _price = "";
};
if(!isNil "_pic" && { !(_pic isEqualTo "") }) then {
	ctrlSetText [1200,_pic];
};

if(_cls in OT_allExplosives) then {
    _cost = cost getVariable _cls;
    _chems = server getVariable ["reschems",0];
    _desc = format["Required: %1 x chemicals (%2 available)<br/>%3",_cost select 3,_chems,_desc];
};

if(_price isEqualType 0) then {
    _price = "$" + ([_price, 1, 0, true] call CBA_fnc_formatNumber);
}else{
    _price = "";
};

_textctrl = (findDisplay 8000) displayCtrl 3000; 
_textctrl = _textctrl controlsGroupCtrl 1201;

_textctrl ctrlSetStructuredText parseText format["
	<t align='center' size='1.5'>%1</t><br/>
	<t align='center' size='1.2'>%3</t><br/>
	<t align='center' size='0.8'>%2</t>
",_txt,_desc,_price];
