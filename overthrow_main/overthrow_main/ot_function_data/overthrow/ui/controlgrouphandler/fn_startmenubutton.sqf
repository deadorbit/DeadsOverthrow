params [["_ctrl", controlNull], ["_isFocus", false]];

private _idc = ctrlIDC _ctrl;
private _img = OT_LABEL_MODERN_VMENU_BUTTON_NORMAL;

if (_idc isEqualTo -1) exitWith {};

if (_isFocus) then {
	_img = OT_LABEL_MODERN_VMENU_BUTTON_ACTIVE;
}else{
	//Change to deselect color
	_ctrl ctrlSetTextColor [1,1,1,0.4];
};

private _ctrlGroup = ctrlParentControlsGroup _ctrl;
private _displayParent = ctrlParent _ctrlGroup;
//Control with background image's idc is equal to the text control's idc * 10
private _ctrlBackgroundImage = _displayParent displayCtrl (_idc * 10);
diag_log format["Selected %1, setting background label %2 img to %3", _idc, _img, _idc*10];

_ctrlBackgroundImage ctrlSetText _img;