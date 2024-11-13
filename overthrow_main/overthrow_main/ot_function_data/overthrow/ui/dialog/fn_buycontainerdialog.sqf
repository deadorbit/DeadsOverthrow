private _stock = [];

createDialog "OT_dialog_buy";
ctrlShow [2000, false];
ctrlenable [2000, false];

_textctrl = (findDisplay 8000) displayCtrl 1101;
_textctrl ctrlSetStructuredText parseText format["<t size='1.7' shadow='2' align='left' valign = 'middle'>%1 | %2</t>","Port","Port"];

_stock pushback ["OT_Land_Cargo10_grey_F",50000];

{
	_x params ["_cls","_price"];
	if !(isNil "_cls") then {
		private _txt = _cls;
		private _pic = "";
		if(_cls == "OT_Land_Cargo10_grey_F") then {
			_txt = "Standard Storage Container";
		};
		private _idx = lbAdd [1500,format["%1",_txt]];
		
		lbSetData [1500,_idx,_cls];
		lbSetValue [1500,_idx,_price];
		lbSetPicture [1500,_idx,_pic];
	};
}foreach(_stock);
