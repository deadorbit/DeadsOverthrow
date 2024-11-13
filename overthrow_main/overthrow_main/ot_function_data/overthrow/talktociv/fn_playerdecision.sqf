closedialog 0;
openMap false;
createDialog "OT_dialog_choose";

if (!isPiPEnabled) then {
	ctrlShow[((findDisplay 8002) displayCtrl 1096),true];
}else{
	ctrlShow[((findDisplay 8002) displayCtrl 1096),false];
};

disableSerialization;
private _listbox = (findDisplay 8002) displayCtrl 1500;
lbclear _listbox;

private _cameraTarget = OT_interactingWith;

if((_this select 0) isEqualType "") then {
	private _ctrl = (findDisplay 8002) displayCtrl 1088;
	_ctrl ctrlSetStructuredText parseText (_this select 0);
	_this deleteAt 0;
}else{
	ctrlShow [1088,false];
};

OT_choices = _this;

{
	private _text = _x select 0;
	private _index = lbAdd [_listbox, _text];
}foreach(OT_choices);
