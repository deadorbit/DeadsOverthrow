closeDialog 0;

private _faction = OT_interactingWith getvariable ["faction",""];
private _side = _faction call OT_fnc_SideFromFaction;
private _legit = server getVariable [format["legit%1",_side],0];
private _NeededScore = floor(_legit);
private _factionName = getText (configFile >> "cfgFactionClasses" >> _faction >> "displayName");
targetedLegitVehicle = objnull;


private _title = "Raising Legitimacy";
private _desc = format["Legitimacy represents how much a side can politicaly justify allowing the resistance to produce its technology. Legitimacy can be raised by constructing and selling vehicles of the current legitmacy score to their appropiate faction. This will raise the legitmacy score for all factions of its side. <br/><br/><t align='center' size='0.6'></t><br/>Inorder to raise the current legitmacy score, a %2 vehicle of with a legitmacy value of atleast %1 needs to be delivered.",_NeededScore,_factionName];

createDialog "OT_dialog_LegitInfo";
ctrlEnable [1600, false];

_target = [_faction,_NeededScore] call OT_fnc_factionVehicleCheck;

if !(_target isEqualTo "") then {
	targetedLegitVehicle = _target;
	private _displayName = getText (configFile >>  "CfgVehicles" >> (typeof _target) >> "displayName");
	private _cost = cost getVariable[(typeof _target),[100,0,0,0]];
	private _price = _cost select 0;
	
	ctrlEnable [1600, true];
	((findDisplay -20) displayCtrl 1600) ctrlSetTooltip format["Sell the nearby %1 for $%2, raising the score by 0.1",_displayName,[_price*4, 1, 0, true] call CBA_fnc_formatNumber];
};

_textctrl = (findDisplay -20) displayCtrl 1199;

_textctrl ctrlSetStructuredText parseText format["
    <t align='center' size='1.1'>%1</t><br/><br/>
    <t align='center' size='0.8'>%2</t><br/>
",_title,_desc];