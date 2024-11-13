closedialog 0;
createDialog "OT_dialog_char";
openMap false;

disableSerialization;

private _fitness = player getVariable ["OT_fitness",1];
private _ctrl = (findDisplay 8003) displayCtrl 1100;
_ctrl ctrlSetStructuredText parseText format["<t size=""2"">Fitness</t><br/><t size=""1.1"">Level %1</t><br/><t size=""0.7"">Increases the distance you can sprint</t>",_fitness];
_ctrl = (findDisplay 8003) displayCtrl 1600;
_ctrl ctrlSetTooltip "Currently nonfunctional.";

private _trade = player getVariable ["OT_trade",1];
_ctrl = (findDisplay 8003) displayCtrl 1101;
_ctrl ctrlSetStructuredText parseText format["<t size=""2"">Trade</t><br/><t size=""1.1"">Level %1</t><br/><t size=""0.7"">Ability to negotiate better purchasing prices</t>",_trade];
_ctrl = (findDisplay 8003) displayCtrl 1601;
_ctrl ctrlSetTooltip "2% discount per level on buying price from most stores.";

private _stealth = player getVariable ["OT_stealth",1];
_ctrl = (findDisplay 8003) displayCtrl 1102;
_ctrl ctrlSetStructuredText parseText format["<t size=""2"">Stealth</t><br/><t size=""1.1"">Level %1</t><br/><t size=""0.7"">Increased chance of bypassing a NATO search</t>",_stealth];
_ctrl = (findDisplay 8003) displayCtrl 1602;
_ctrl ctrlSetTooltip "+15% chance to bypass search per level";

private _resilience = player getVariable ["OT_resilience",1];
_ctrl = (findDisplay 8003) displayCtrl 1103;
_ctrl ctrlSetStructuredText parseText format["<t size=""2"">Resilience</t><br/><t size=""1.1"">Level %1</t><br/><t size=""0.7"">Increase amount of pain you can endure before falling unconscious</t>",_resilience];
_ctrl = (findDisplay 8003) displayCtrl 1603;
_ctrl ctrlSetTooltip "25% increased amount of pain needed to cause player to fall unconscious.";

private _covert = player getVariable ["OT_covert",0];
_ctrl = (findDisplay 8003) displayCtrl 1104;
if(_covert == 0) then {
	_ctrl ctrlSetStructuredText parseText format["<t size=""2"">Covert Carry</t><br/><t size=""1.1"">Unowned</t><br/><t size=""0.7"">Nato will not detect tertiary weapons during any kind of search. Nato will not become aggresive just for having a weapon in your tertiary slot.</t>"];
}else{
	_ctrl ctrlSetStructuredText parseText format["<t size=""2"">Covert Carry</t><br/><t size=""1.1"">Owned</t><br/><t size=""0.7"">Nato will not detect tertiary weapons during any kind of search. Nato will not become aggresive just for having a weapon in your tertiary slot.</t>"];
};
_ctrl = (findDisplay 8003) displayCtrl 1604;
_ctrl ctrlSetTooltip "Tertiary weapons mainly include pistols. Wielding the weapon will cause NATO to react as normal.";

getPerkPrice = {
	private _perk = _this select 0;
	private _fitness = player getVariable [format["OT_%1",_perk],0];
	private _price = 10;
	if(_perk == "covert") exitwith {
		100
	};
	if(_fitness isEqualTo 2) then {
		_price = 100;
	};
	if(_fitness isEqualTo 3) then {
		_price = 1000;
	};
	if(_fitness isEqualTo 4) then {
		_price = 5000;
	};
	_price;
};

private _price = ["fitness"] call getPerkPrice;
ctrlSetText [1600,format["Increase Level (-%1 Influence)",_price]];

_price = ["trade"] call getPerkPrice;
ctrlSetText [1601,format["Increase Level (-%1 Influence)",_price]];

_price = ["stealth"] call getPerkPrice;
ctrlSetText [1602,format["Increase Level (-%1 Influence)",_price]];

_price = ["resilience"] call getPerkPrice;
ctrlSetText [1603,format["Increase Level (-%1 Influence)",_price]];

_price = ["covert"] call getPerkPrice;
ctrlSetText [1604,format["Buy Perk (-%1 Influence)",_price]];

if(_fitness isEqualTo 5) then {
	ctrlShow [1600,false];
};

if(_trade isEqualTo 5) then {
	ctrlShow [1601,false];
};

if(_stealth isEqualTo 5) then {
	ctrlShow [1602,false];
};

if(_resilience isEqualTo 5) then {
	ctrlShow [1603,false];
};
if(_covert isEqualTo 1) then {
	ctrlShow [1604,false];
};

buyPerk = {
	_perk = _this select 0;
	disableSerialization;
	private _fitness = player getVariable [format["OT_%1",_perk],1];
	if(_perk == "Covert") then {
		 _fitness = player getVariable [format["OT_%1",_perk],0];
	};
	
	private _price = [_perk] call getPerkPrice;
	private _inf = player getVariable ["influence",0];

	if(_inf < _price) exitWith {"You do not have enough influence" call OT_fnc_notifyMinor};

	_fitness = _fitness + 1;
	player setVariable [format["OT_%1",_perk],_fitness,true];
	_idc = 1600;
	_idcc = 1100;
	if(_perk isEqualTo "trade") then {_idc = 1601;_idcc = 1101};
	if(_perk isEqualTo "stealth") then {_idc = 1602;_idcc = 1102};
	if(_perk isEqualTo "Resilience") then {_idc = 1603;_idcc = 1103};
	if(_perk isEqualTo "Covert") then {_idc = 1604;_idcc = 1104};

	if(_fitness isEqualTo 5) then {
		ctrlEnable [_idc,false];
	};
	if(_perk == "Covert" && _fitness == 1) then {
		ctrlEnable [_idc,false];
		ctrlShow [_idc,false];
	};
	player setVariable ["influence",_inf - _price,true];

	private _ctrl = (findDisplay 8003) displayCtrl _idcc;
	_txt = format["<t size=""2"">Fitness</t><br/><t size=""1.1"">Level %1</t><br/><t size=""0.7"">Increases the distance you can sprint</t>",_fitness];
	if(_perk isEqualTo "trade") then {
		_txt = format["<t size=""2"">Trade</t><br/><t size=""1.1"">Level %1</t><br/><t size=""0.7"">Ability to negotiate better purchasing prices</t>",_fitness];
	};
	if(_perk isEqualTo "stealth") then {
		_txt = format["<t size=""2"">Stealth</t><br/><t size=""1.1"">Level %1</t><br/><t size=""0.7"">Less chance of people recognizing you or finding illegal items</t>",_fitness];
	};
	if(_perk isEqualTo "Resilience") then {
		_txt = format["<t size=""2"">Resilience</t><br/><t size=""1.1"">Level %1</t><br/><t size=""0.7"">Increase amount of pain you can endure before falling unconscious</t>",_fitness];
	};
	if(_perk isEqualTo "Covert") then {
		if(_fitness == 0) then {
			_txt = format["<t size=""2"">Covert Carry</t><br/><t size=""1.1"">Unowned</t><br/><t size=""0.7"">Nato will not detect tertiary weapons during any kind of search. Nato will not become aggresive just for having a weapon in your tertiary slot.</t>"];
		}else{
			_txt = format["<t size=""2"">Covert Carry</t><br/><t size=""1.1"">Owned</t><br/><t size=""0.7"">Nato will not detect tertiary weapons during any kind of search. Nato will not become aggresive just for having a weapon in your tertiary slot.</t>"];
		};
	};

	_ctrl ctrlSetStructuredText parseText _txt;
	_price = [_perk] call getPerkPrice;
	ctrlSetText [_idc,format["Increase Level (-%1 Influence)",_price]];

	if(_fitness isEqualTo 5) then {
		ctrlShow [_idc,false];
	};
	
};
