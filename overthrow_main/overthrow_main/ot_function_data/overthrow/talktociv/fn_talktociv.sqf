/* ----------------------------------------------------------------------------
Function: OT_fnc_talkToCiv

Description:
    - 	A function that handles player interactions with NPCs via UI.
	
	- 	Interactions are built from an array, _options, of arrays containing
	[_text,{_code},[_arguments]] where:
		_text is the structuredText that apperears on the dialog label
		_code is the directory to the sqf file called if the choice is made
		(optional) _arguments is an array of variables passed to _code when ran
			-if an array is not supplied, _text is used as an argument instead
	-	An execption is if the first item is just a string, then it fills the information panal

Parameters:
	- Unit (Presumably belonging to the CIV or EAST sides)

Optional:
	- N/A

Example:
	_unitBob call OT_fnc_talkToCiv;

Returns:
    - Nothing

Author:
    deadorbit
	ARMAZAC (presumably)
---------------------------------------------------------------------------- */
private _choiceDirectory = "\overthrow_main\ot_function_data\talktociv\choices";

//Who is the player talking to?
private _civ = _this;
OT_interactingWith = _civ;


//General useful variables
private _town = (getpos player) call OT_fnc_nearestTown;
private _standing = [_town] call OT_fnc_support;
private _civprice = [_town,"CIV",_standing] call OT_fnc_getPrice;
private _influence = player getvariable "influence";
private _money = player getVariable ["money",0];

//make sure any purchases come to me, not my vehicle
player setVariable ["OT_shopTarget","Self",false];

//General variables
private _canRecruit = true;
private _canBuy = false;
private _canBuyVehicles = false;
private _canBuyBoats = false;
private _canBuyGuns = false;
private _canSell = false;
private _canSellDrugs = true;
private _canIntel = true;
private _canMission = false;
private _canTute = false;
private _canGang = false;
private _isShop = false;

//General variables
private _choiceText = "";
private _choiceCode = "";
private _choiceArgs = [];
private _options = [];

//If the player somehow talks to a NATO goon, only show this
if (side _civ isEqualTo west) exitWith {
	_options pushBack ["Cancel",{}];
	_options call OT_fnc_playerDecision;
};

//Decipher who can do what with the player (this really should be improved)
if ((_civ getvariable ["shop",[]]) isNotEqualTo []) then {
	_canSellDrugs = false;
	_canRecruit = false;
	_canBuy=true;
	_canSell=true;
	_isShop = true
};

if (_civ getvariable ["carshop",false]) then {_canSellDrugs = false;_canRecruit = false;_canBuyVehicles=true};
if (_civ getvariable ["harbor",false]) then {_canSellDrugs = false;_canRecruit = false;_canBuyBoats=true};
if (_civ getvariable ["gundealer",false]) then {_canSellDrugs = false;_canRecruit = false;_canBuyGuns=true;_canIntel=false;_canTute =true};
if (_civ getvariable ["employee",false]) then {_canSellDrugs = false;_canRecruit = false;_canBuyGuns=false;_canIntel=false};
if (_civ getvariable ["notalk",false]) then {_canSellDrugs = false;_canRecruit = false;_canBuyGuns=false;_canIntel=false};

if (_civ getvariable ["factionrep",false]) then {
	_canSellDrugs 	= false;
	_canRecruit 	= false;
	_canBuyGuns		= false;
	_canIntel		= false;
	_canMission		= true
};
if (_civ getvariable ["crimleader",false]) then {
	_canSellDrugs 	= true;
	_canRecruit 	= false;
	_canBuyGuns		= false;
	_canIntel		= false;
	_canMission		= false;
	_canGang		= true;
};

if (_civ getvariable ["criminal",false]) then {_canSellDrugs = true;_canRecruit = false;_canBuyGuns=false;_canIntel=false;_canMission=false};
if (_civ call OT_fnc_hasOwner) then {_canRecruit = false;_canIntel = false;_canSellDrugs=false};
if !((_civ getvariable ["garrison",""]) isEqualTo "") then {_canRecruit = false;_canIntel = false;_canSellDrugs=false};
if !((_civ getvariable ["polgarrison",""]) isEqualTo "") then {_canRecruit = false;_canIntel = false;_canSellDrugs=false};


//Perhaps consider changing to use preloaded configs like missions system
private _delivery = _civ getVariable ["OT_delivery",[]];
if((count _delivery) > 0) then {
	_delivery params ["_itemcls","_numitems"];
	_canRecruit = false;
	_canIntel = false;
	_canSellDrugs=false;
	
	_choiceText = format["Deliver %1 x %2",_numitems,_itemcls call OT_fnc_weaponGetName];
	_choiceCode = _choiceDirectory + "\candelivery\choice1.sqf";
	_choiceArgs = [_civ,_itemcls,_numitems];
	_choice = [_choiceText,_choiceCode,_choiceArgs];
	_options pushBack _choice;
};


if (_canRecruit) then {
	_choiceText = format["Recruit Civilian (-$%1)",_civprice];
	_choiceCode = _choiceDirectory + "\canrecruit\choice1.sqf";
	_choice = [_choiceText,_choiceCode];
	_options pushBack _choice;
};

if (_canGang) then {
	private _gangid = _civ getVariable ["OT_gangid",-1];
	if(_gangid > -1) then {
		_gang = OT_civilians getVariable [format["gang%1",_gangid],[]];
		if(count _gang > 0) then {
			private _name = _gang select 8;
			private _gangmembers = _gang select 0;
			private _memberstxt = "";
			if(isnil{_gangmembers}) then {
				_gangmembers = 1;
			}else{
				_gangmembers = count _gangmembers + 1;
			};
			private _rep = player getVariable [format["gangrep%1",_gangid],0];
			
			if(_gangmembers == 1) then {
				_memberstxt = format["%1 Member.",_gangmembers];
			}else{
				_memberstxt = format["%1 Members.",_gangmembers];
			};
			private _willAttackStatic = format["This gang <t color = '#ff0000'>WILL</t> attack you for wearing a static weapon bag."];
			if (_rep >= 10) then {
				_willAttackStatic = format["This gang <t color = '#00ff00'>WONT</t> attack you for wearing a static weapon bag."];
			};
			private _willAttack = format["This gang <t color = '#ff0000'>WILL</t> attack you if armed."];
			if (_rep >= 30) then {
				_willAttack = format["This gang <t color = '#00ff00'>WONT</t> attack you if armed."];
			};
			private _willSell = format["This gang <t color = '#00ff00'>WILL</t> sell to you."];
			if (_rep < 40) then {
				_willSell = format["This gang <t color = '#ff0000'>WONT</t> sell to you."];
			};
			
			_options pushback format[
				"<t align='center' size='2'>%1</t><br/>
				<t align='center' size='0.6'>%6</t><br/>
				<br/>
				<t align='center' size='0.8'>Your Rep: %2</t><br/>
				<t size='0.6' align='center' >%3</t><br/>
				<t size='0.6' align='center' >%4</t><br/>
				<t size='0.6' align='center' >%5</t>",
				_name,_rep,_willAttackStatic,_willAttack,_willSell,_memberstxt
			];
			
			_choiceText = "Do you have any jobs for me?";
			_choiceCode = _choiceDirectory + "\cangang\choice1.sqf";
			_choice = [_choiceText, _choiceCode];
			_options pushBack _choice;
			
			_choiceText = "Buy Equipment";
			if(_rep < 40) then {
				_choiceCode = _choiceDirectory + "\cangang\choice2a.sqf";
			}else{
				_choiceCode = _choiceDirectory + "\cangang\choice2b.sqf";
			};
			_choice = [_choiceText, _choiceCode];
			_options pushBack _choice;
			
			_choiceText = "Do you want to join the resistance?";
			if(_rep < 100) then {
				_choiceCode = _choiceDirectory + "\cangang\choice3a.sqf";
				_choice = [_choiceText,_choiceCode];
			}else{
				_choiceCode = _choiceDirectory + "\cangang\choice3b.sqf";
				_choiceArgs = [_gangid, _gang, _name];
				_choice = [_choiceText, _choiceCode, _choiceArgs];
			};
			_options pushBack _choice;
		};
	};
};

if (_canMission) then {
	_factionName = _civ getvariable ["factionrepname",""];
	_faction = _civ getvariable ["faction",""];
	private _standing = server getVariable [format["standing%1",_faction],0];
	private _side = _faction call OT_fnc_SideFromFaction;
	private _legit = server getVariable [format["legit%1",_side],0];
	
	_options pushback format[
		"<t align='center' size='2'>%1</t><br/><br/><t align='center' size='0.8'>Current Standing: +%2<br/><br/><t align='center' size='0.8'>Current %3 Legitimacy: %4",
		_factionName, _standing, _side, ([_legit, 1, 1] call CBA_fnc_formatNumber)
	];

	_choiceText = "Do you have any jobs for me?";
	_choiceCode = _choiceDirectory + "\canmission\choice1.sqf";
	_options pushBack [_choiceText, _choiceCode];

	_choiceText = "Buy Gear";
	_choiceCode = _choiceDirectory + "\canmission\choice2.sqf";
	_options pushBack [_choiceText, _choiceCode];
	
	_choiceText = "Buy Blueprints";
	_choiceCode = _choiceDirectory + "\canmission\choice3.sqf";
	_options pushBack [_choiceText, _choiceCode];
	
	_choiceText = "Lets talk about raising the Resistance's Legitimacy";
	_choiceCode = _choiceDirectory + "\canmission\choice4.sqf";
	_options pushBack [_choiceText, _choiceCode];
};

if (_canBuy) then {
	_choiceText = "Buy";
	_choiceCode = _choiceDirectory + "\canbuy\choice1.sqf";
	_options pushBack [_choiceText, _choiceCode];
};

if (_canTute) then {
	private _done = player getVariable ["OT_tutesDone",[]];

	_choiceText = "Do you have any jobs for me?";
	_choiceCode = _choiceDirectory + "\cantute\choice1.sqf";
	_options pushBack [_choiceText, _choiceCode];
	
	_choiceText = "Do you know any gangs nearby?";
	_choiceCode = _choiceDirectory + "\cantute\choice2.sqf";
	_options pushBack [_choiceText, _choiceCode];

	if !("NATO" in _done) then {
		_choiceText = "So, about those NATO soldiers...";
		_choiceCode = _choiceDirectory + "\cantute\choice3.sqf";
		_options pushBack [_choiceText, _choiceCode];
	};
	if !("Drugs" in _done) then {
		_choiceText = "You sell Ganja right?";
		_choiceCode = _choiceDirectory + "\cantute\choice4.sqf";
		_options pushBack [_choiceText, _choiceCode];
	};
	if !("Economy" in _done) then {
		_choiceText = "So how can I make money legally?";
		_choiceCode = _choiceDirectory + "\cantute\choice5.sqf";
		_options pushBack [_choiceText, _choiceCode];
	};
};

if (_canBuyBoats) then {
	_choiceText = "Buy Boats";
	_choiceCode = _choiceDirectory + "\canbuyboats\choice1.sqf";
	_options pushBack [_choiceText, _choiceCode];
	
	_choiceText = "Ferry Service";
	_choiceCode = _choiceDirectory + "\canbuyboats\choice2.sqf";
	_options pushBack [_choiceText, _choiceCode];
};

if (_canBuyVehicles) then {
	_choiceText = "Buy Land Vehicles";
	_choiceCode = _choiceDirectory + "\canbuyvehicles\choice1.sqf";
	_options pushBack [_choiceText, _choiceCode];
};

if (_canBuyGuns) then {
	_choiceText = "Buy Equipment";
	_choiceCode = _choiceDirectory + "\canbuyguns\choice1.sqf";
	_options pushBack [_choiceText, _choiceCode];
};

if (_canSell) then {
	_choiceText = "Sell Items";
	_choiceCode = _choiceDirectory + "\cansell\choice1.sqf";
	_options pushBack [_choiceText, _choiceCode];
};

if (_isShop) then {
	_choiceText = "Do you have any jobs for me?";
	_choiceCode = _choiceDirectory + "\isshop\choice1.sqf";
	_options pushBack [_choiceText, _choiceCode];
};

OT_drugSelling = "";
OT_drugQty = 0;

if (_canSellDrugs) then {
	{
		_drugcls = _x;
		if(((items player) find _x) > -1 && !(_civ getVariable["OT_askedDrugs",false])) then {
			_drugname = _x call OT_fnc_weaponGetName;
			
			_choiceText = format["Sell %1", _drugname];
			_choiceCode = _choiceDirectory + "\canSellDrugs\choice1.sqf";
			_choiceArgs = [_drugcls];
			_options pushBack [_choiceText, _choiceCode, _choiceArgs];
		};
	}foreach(keys OT_allDrugs);
};

_options pushBack ["Cancel",{}];

_options call OT_fnc_playerDecision;
