if(isnull finddisplay 8001) then {
	createDialog "OT_dialog_logistics";
};
lbClear 1500;
ctrlShow [1602, false];
ctrlshow [2001,true];
ctrlshow [1103,true];
ctrlshow [1102,true];

private _checked = uinamespace getvariable ["OT_LOGISTICSCHECKED",nil];
private _condition = {(false)};
if(isnil{_checked}) then {
	_checked = false;
};

if(_checked) then {
	_condition = {
		params["_veh","_cls"];
		(((_veh call OT_fnc_hasOwner) && (_veh call OT_fnc_playerIsOwner) && !(_veh getvariable["stolen",false])) && ((_cls isKindOf "LandVehicle") || (_cls isKindOf "Air") || (_cls isKindOf "Ship")))
	};
}else{
	_condition = {
		params["_veh","_cls"];
		((_veh call OT_fnc_hasOwner) && ((_cls isKindOf "LandVehicle") || (_cls isKindOf "Air") || (_cls isKindOf "Ship")))
	};
};

private _ctrl = (findDisplay 8001) displayCtrl 1101;
_ctrl ctrlSetStructuredText parseText format["<t size='1.7' shadow='2' align='left' valign = 'middle'>Logistics</t>"];
_ctrl = (findDisplay 8001) displayCtrl 1103;
_ctrl ctrlSetStructuredText parseText format["<t size='1.7' shadow='2' align='left' valign = 'middle'>- Owned Vehicles Only</t>"];

_ctrl = displayctrl 2001;
_ctrl cbSetChecked _checked;
_ctrl ctrlAddEventHandler ["CheckedChanged", "[_this select 0, _this select 1] spawn 
	{
		private _bool = cbchecked (_this select 0);
		uinamespace setvariable ['OT_LOGISTICSCHECKED',_bool];
		call OT_fnc_logisticsdialog
	}
"];

_ctrl = finddisplay 8001;
_ctrl displayAddEventHandler ["Unload", "[] call 
	{
			private _ctrl = displayctrl 2001;
			_ctrl ctrlRemoveAllEventHandlers 'CheckedChanged';
	}
"];
{
    private _veh = _x;
    private _cls = typeof _veh;
    if([_veh,_cls] call _condition) then {
        private _name = _cls call OT_fnc_vehicleGetName;
        private _pic = _cls call OT_fnc_vehicleGetPic;
        private _dis = round(_veh distance player);
        private _t = "m";
        if(_dis > 999) then {
            _dis = (_dis / 1000) toFixed 1;
            _t = "km";
        };

        _idx = lbAdd [1500,format["%1 (%2%3)",_name,_dis,_t]];
        lbSetPicture [1500,_idx,_pic];
        lbSetData [1500,_idx,_veh call BIS_fnc_netId];
        private _color = [0.9,0.9,0.9,1];

        private _totalAmmo = 0;
        private _turrets = "!((configName _x) select [0,5] == ""Cargo"") && !((count getArray (_x >> ""magazines"")) isEqualTo 0)" configClasses (configfile >> "CfgVehicles" >> _cls >> "Turrets");
        private _hasAmmo = (count _turrets) > 0;
        {
            _x params ["_ammocls","_num"];
            _totalAmmo = _totalAmmo + _num;
        }foreach(magazinesAmmo _veh);

        private _lowFuel = (fuel _veh) < 0.2;

        if !(_veh call OT_fnc_vehicleCanMove) then {
            //red
            _color = [0.9,0.4,0.4,1];
        }else{
            if ((_hasAmmo && _totalAmmo isEqualTo 0) || _lowFuel) then {
                //yellow
                _color = [0.85,0.85,0,1];
            };
        };

        lbSetColor [1500,_idx,_color];
		if (((_veh call OT_fnc_getOwner) == (getplayeruid player)) || (call OT_fnc_playerIsGeneral)) then {
			ctrlShow [1602, true];
		};
    };
}foreach([vehicles,[],{_x distance player},"ASCEND"] call BIS_fnc_SortBy);
