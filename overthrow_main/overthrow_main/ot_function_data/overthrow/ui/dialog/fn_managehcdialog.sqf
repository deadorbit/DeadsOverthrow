closedialog 0;
createDialog "OT_dialog_recruits";
openMap false;



ctrlEnable [1600,false];


refreshRecruits = {
	lbClear 1500;
	_t = 1;
	{
		_idx = lbadd [1500,format["%1. %2",_t,groupId _x]];
		lbSetValue [1500,_idx,_t];
		_t = _t + 1;
	}foreach(hcAllGroups player);
};

recruitSelected = {
	ctrlEnable [1600,true];
	_recruit = (hcAllGroups player) select (lbValue[1500,lbCurSel 1500]-1);
	disableSerialization;
	_ctrl = (findDisplay 8004) displayCtrl 1100;
	_ctrl ctrlSetStructuredText parseText format["
		<t align='center' size='1.3'>%1</t><br/><br/>
		<t align='left' size='0.7'>Location: %2</t><br/>
		<t align='left' size='0.7'>Leader: %3</t><br/>
		<t align='left' size='0.7'>Soldiers: %4</t>"
		,GroupId _recruit,(getpos(leader _recruit)) call BIS_fnc_locationDescription,name(leader _recruit),count (units _recruit)];
};

dismissRecruit = {
	_recruit = (hcAllGroups player) select (lbValue[1500,lbCurSel 1500]-1);
	{
		deletevehicle _x;
	}foreach(units _recruit);
	deleteGroup _recruit
	ctrlEnable [1600,false];
	[] call refreshRecruits;
	disableSerialization;
	_ctrl = (findDisplay 8004) displayCtrl 1100;
	_ctrl ctrlSetStructuredText parseText "";
};

[] call refreshRecruits;
