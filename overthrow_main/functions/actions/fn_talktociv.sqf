private _civ = _this;

OT_interactingWith = _civ;

private _town = (getpos player) call OT_fnc_nearestTown;
private _standing = [_town] call OT_fnc_support;
private _civprice = [_town,"CIV",_standing] call OT_fnc_getPrice;
private _influence = player getvariable "influence";
private _money = player getVariable ["money",0];

private _options = [];

if (side _civ isEqualTo west) exitWith {
	_options pushBack ["Cancel",{}];
	_options call OT_fnc_playerDecision;
};

//make sure any purchases come to me, not my vehicle
player setVariable ["OT_shopTarget","Self",false];

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
private _canGangJob = false;
private _isShop = false;

if !((_civ getvariable ["shop",[]]) isEqualTo []) then {_canSellDrugs = false;_canRecruit = false;_canBuy=true;_canSell=true;_isShop = true};
if (_civ getvariable ["carshop",false]) then {_canSellDrugs = true;_canRecruit = false;_canBuyVehicles=true};
if (_civ getvariable ["harbor",false]) then {_canSellDrugs = true;_canRecruit = false;_canBuyBoats=true};
if (_civ getvariable ["gundealer",false]) then {_canSellDrugs = false;_canRecruit = false;_canBuyGuns=true;_canIntel=false;_canTute =true};
if (_civ getvariable ["employee",false]) then {_canSellDrugs = false;_canRecruit = false;_canBuyGuns=false;_canIntel=false};
if (_civ getvariable ["notalk",false]) then {_canSellDrugs = false;_canRecruit = false;_canBuyGuns=false;_canIntel=false};
if (_civ getvariable ["factionrep",false]) then {_canSellDrugs = false;_canRecruit = false;_canBuyGuns=false;_canIntel=false;_canMission=true};
if (_civ getvariable ["crimleader",false]) then {_canSellDrugs = true;_canRecruit = false;_canBuyGuns=false;_canIntel=false;_canMission=false;_canGangJob=true};
if (_civ getvariable ["criminal",false]) then {_canSellDrugs = true;_canRecruit = false;_canBuyGuns=false;_canIntel=false;_canMission=false};

if (_civ call OT_fnc_hasOwner) then {_canRecruit = false;_canIntel = false;_canSellDrugs=false};

if !((_civ getvariable ["garrison",""]) isEqualTo "") then {_canRecruit = false;_canIntel = false;_canSellDrugs=false};
if !((_civ getvariable ["polgarrison",""]) isEqualTo "") then {_canRecruit = false;_canIntel = false;_canSellDrugs=false};

private _delivery = _civ getVariable ["OT_delivery",[]];
if((count _delivery) > 0) then {
	_delivery params ["_itemcls","_numitems"];
	_canRecruit = false;
	_canIntel = false;
	_canSellDrugs=false;
	_options pushBack [
		format["Deliver %1 x %2",_numitems,_itemcls call OT_fnc_weaponGetName],{
			params ["_civ","_itemcls","_numitems"];
			_stock = player call OT_fnc_unitStock;
			_found = false;
			{
				_x params ["_cls","_num"];
				if(_cls isEqualTo _itemcls && _num >= _numitems) exitWith {
					_found = true;
				};
			}foreach(_stock);
			if(_found) then {
				[player,_civ,["I have a delivery for you",selectRandom ["About time!","OK, thanks","Sweet, thanks"]],{
					params ["_civ","_itemcls","_numitems"];
					_count = 0;
					while {_count < _numitems} do {
						[player, _itemcls] call {
							params ["_unit", "_cls"];
							private _primwep = primaryweapon _unit;
							private _secwep =  handgunWeapon _unit;
							if ((_primwep isEqualTo _cls) || _secwep isEqualTo _cls) then {
								player removeWeaponGlobal _cls;
							}else{
								_unit removeItem _cls;
							};
						};
						_count = _count + 1;
					};
					_civ setVariable ["OT_deliveryDone",true,true];
					_civ setVariable ["OT_deliveredBy",player,true];
					_civ setVariable ["OT_delivery",[],true];
				},[_civ,_itemcls,_numitems]] spawn OT_fnc_doConversation;
			}else{
				"You do not have the required items" call OT_fnc_notifyMinor;
			};
		},
		[_civ,_itemcls,_numitems]
	];
};

if (_canRecruit) then {
	_options pushBack [
		format["Recruit Civilian (-$%1)",_civprice],OT_fnc_recruitCiv
	];
};

if (_canGangJob) then {
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
			
			_options pushback format["<t align='center' size='2'>%1</t><br/>
				<t align='center' size='0.6'>%6</t><br/>
				<br/>
				<t align='center' size='0.8'>Your Rep: %2</t><br/>
				<t size='0.6' align='center' >%3</t><br/>
				<t size='0.6' align='center' >%4</t><br/>
				<t size='0.6' align='center' >%5</t>",
				_name,_rep,_willAttackStatic,_willAttack,_willSell,_memberstxt];
				
			_options pushBack [format["Do you have any jobs for me?"], {
				OT_jobsOffered = [];
				private _civ = OT_interactingWith;
				private _time = _civ getvariable ["lastmission",-300];
				
				if((time < (_time + 300)) && !(OT_adminmode)) exitwith {
					private _talk = ["I'm still waiting on new client"];
					private _code = {};
					[_civ,player,_talk,_code,[]] call OT_fnc_doConversation;
				};
				_civ setvariable ["lastmission",time];
				call OT_fnc_requestJobGang;
			}];
			if(_rep < 40) then {
				_options pushBack [format["Buy"], {
					private _civ = OT_interactingWith;
					private _talk = ["No."];
					private _code = {};
					[_civ,player,_talk,_code,[]] call OT_fnc_doConversation;
					"You need +40 rep to buy from this gang" call OT_fnc_notifyMinor;
				}];
			}else{
				_options pushBack [format["Buy"], {
					call OT_fnc_buyGangDialog;
				}];
			};
			if(_rep < 100) then {
				_options pushBack [format["Do you want to join the resistance?"], {
					private _civ = OT_interactingWith;
					private _talk = ["Not a chance in Hell"];
					private _code = {};
					[_civ,player,_talk,_code,[]] call OT_fnc_doConversation;
					"You need +100 rep to recruit this gang" call OT_fnc_notifyMinor;
				}];
			};
			if(_rep >= 100) then {
				_options pushBack [format["Do you want to join the resistance?"], {
					params ["_gangid","_gang","_name"];
					private _talk = ["Do you want to join the resistance?"];
					private _civ = OT_interactingWith;
					private _town = _gang select 2;
					private _support = [_town] call OT_fnc_support;
					private _code = {};
					if(_support >= 100) then {
						_talk pushback format["We've heard good things about what you've been doing. I guess we're in"];
						_talk pushback "Good to have you on board";
						_code = {
							params ["_civ","","_gangid"];
							[_civ,_gangid,player] call OT_fnc_gangJoinResistance;
						};
					}else{
						_talk pushback format["I dunno, you've been a big help to us but support for your 'resistance' isnt great around here."];
						_code = {
							params ["_civ","_town","_gangid","_gang","_name"];
							_gangoptions = [];
							_gangoptions pushBack [
								"Offer $5000",{
									params ["_civ","_town","_gangid","_gang","_name"];
									private _cash = player getVariable ["money",0];
									if(_cash >= 5000) then {
										[
											player,
											_civ,
											["What if I gave you $5000?",format["Yeah, OK.",_name]],
											{
												params ["_civ","_gangid"];
												[_civ,_gangid,player] call OT_fnc_gangJoinResistance;
												[-5000] call OT_fnc_money;
											},
											[_civ,_gangid]
										] call OT_fnc_doConversation;
									}else{
										"You cannot afford that" call OT_fnc_notifyMinor;
									};
								},
								[_civ,_town,_gangid,_gang,_name]
							];

							_gangoptions pushBack ["Cancel",{}];
							_gangoptions call OT_fnc_playerDecision;
						}
					};
					[player,_civ,_talk,_code,[_civ,_town,_gangid,_gang,_name]] call OT_fnc_doConversation;
				},[_gangid,_gang,_name]];
			};
		};
	};
};

if (_canMission) then {
	_factionName = _civ getvariable ["factionrepname",""];
	_faction = _civ getvariable ["faction",""];
	private _standing = server getVariable [format["standing%1",_faction],0];
	private _side = _faction call OT_fnc_SideFromFaction;
	private _legit = server getVariable [format["legit%1",_side],0];
	_options pushback format["<t align='center' size='2'>%1</t><br/><br/><t align='center' size='0.8'>Current Standing: +%2<br/><br/><t align='center' size='0.8'>Current %3 Legitimacy: %4",_factionName,_standing,_side,[_legit, 1, 1] call CBA_fnc_formatNumber];

	_options pushBack [format["Do you have any jobs for me?"], {
		OT_jobsOffered = [];
		private _civ = OT_interactingWith;
		private _time = _civ getvariable ["lastmission",-300];
		
		if((time < (_time + 300)) && !(OT_adminmode)) exitwith {
			private _talk = ["I still don't have any new jobs, check back in a few minutes"];
			private _code = {};
			[_civ,player,_talk,_code,[]] call OT_fnc_doConversation;
		};
		
		_civ setvariable ["lastmission",time];
		call OT_fnc_requestJobFaction;
	}];

	_options pushBack [format["Buy Gear"], {
		private _civ = OT_interactingWith;
		_faction = _civ getvariable ["faction",""];
		private _standing = server getVariable [format["standing%1",_faction],0];
		private _tstanding = [_town] call OT_fnc_support;

		_gear = spawner getvariable[format["facweapons%1",_faction],[]];
		_s = [];
		{
			if (!(_x in OT_allExplosives || _x in OT_noCopyMags)) then {
				_s pushback [_x,-1];
			};
		}foreach(_gear);
		createDialog "OT_dialog_buy";
		private _discount = 1.2 - (0.4 * (_standing/200));
		if(_discount < 0.8) then {_discount = 0.8};
		
		[OT_nation,_tstanding,_s,_discount] call OT_fnc_buyDialog;
	}];
	_options pushBack [format["Buy Blueprints"], {
		private _civ = OT_interactingWith;
		_faction = _civ getvariable ["faction",""];
		_factionName = _civ getvariable ["factionrepname",""];
		private _standing = server getVariable [format["standing%1",_faction],0];

		_gear = spawner getvariable[format["facvehicles%1",_faction],[]];
		_s = [];
		_blueprints = server getVariable ["GEURblueprints",[]];
		
		
		private _side = _faction call OT_fnc_SideFromFaction;
		private _legit = server getVariable [format["legit%1",_side],0];
		private _factionName = getText (configFile >> "cfgFactionClasses" >> _faction >> "displayName");

		{
			if !(_x in _blueprints) then {
				_cost = cost getVariable[_x,[100,0,0,0]];
				_req = 0;
				_base = _cost select 0;
				if(_base > 1000) then {_req = 10};
				if(_base > 10000) then {_req = 20};
				if(_base > 60000) then {_req = 30};
				if(_base > 75000) then {_req = 40};
				if(_base > 125000) then {_req = 50};
				if(_base > 200000) then {_req = 60};
				if(_base > 500000) then {_req = 70};
				if(_base > 750000) then {_req = 80};
				if(_base > 1250000) then {_req = 90};
				if(_base > 2500000) then {_req = 95};
				_vehScore = [_x] call OT_fnc_getLegitScore;

				_s pushback [_x,-1,((_standing >= _req) && (_legit >= _vehScore)),format["+%1 standing to %2 required for this blueprint<br/>+%3 legitimacy required for this blueprint",_req,_factionName,[_vehscore, 1, 1] call CBA_fnc_formatNumber]];
			};
		}foreach(_gear);
		createDialog "OT_dialog_buy";
		[OT_nation,_tstanding,_s,5*_discount] call OT_fnc_buyDialog;
		
	}];
	
	_options pushBack [format["Lets talk about raising the Resistance's Legitimacy"], {
		call OT_fnc_LegitMenu;
	}];
};

if (_canBuy) then {
	_options pushBack [
		"Buy",{
			private _civ = OT_interactingWith;
			private _town = (getpos player) call OT_fnc_nearestTown;
			private _abandoned = server getVariable ["NATOabandoned",[]];
			if(_town in _abandoned || captive player) then {
				private _standing = [_town] call OT_fnc_support;
				private _fastbuy = true;
				_cat = _civ getVariable "OT_shopCategory";
				player setVariable ["OT_shopTarget","Self",false];

				createDialog "OT_dialog_buy";

				if(_cat isEqualTo "Clothing") then {
					[_town,_standing] call OT_fnc_buyClothesDialog;
				}else{
					_s = [];
					{
						if((_x select 0) isEqualTo _cat) exitWith {
							{
								_s pushback [_x,-1];
							}foreach(_x select 1);
						};
					}foreach(OT_items);

					if(_cat isEqualTo "Surplus") then {
						_fastbuy = false;
						{
							_s pushback [_x,-1];
						}foreach(OT_allBackpacks);
					};

					[_town,_standing,_s,1,_fastbuy] call OT_fnc_buyDialog;
					};
			}else{
				private _talk = ["I won't sell to criminals."];
				private _code = {};
				[
					_civ,
					player,
					_talk,
					_code,
					[]
				] call OT_fnc_doConversation;
			};
		}
	];
};

if (_canTute) then {
	//gun dealer
	_options pushBack [format["Do you have any jobs for me?"], {
		OT_jobsOffered = [];
		private _civ = OT_interactingWith;
		private _time = _civ getvariable ["lastmission",-300];
		
		if((time < (_time + 300)) && !(OT_adminmode)) exitwith {
			private _talk = ["I still don't have any new jobs, check back in a few minutes"];
			private _code = {};
			[_civ,player,_talk,_code,[]] call OT_fnc_doConversation;
		};
		
		_civ setvariable ["lastmission",time];
		call OT_fnc_requestJobResistance;
	}];
	_options pushBack [
		"Do you know any gangs nearby?",{
			private _civ = OT_interactingWith;
			private _town = (getpos player) call OT_fnc_nearestTown;
			private _talk = ["Do you know any gangs nearby?"];
			//find nearest gang
			private _gangid = -1;
			private _gang = [];
			private _name = "";
			private _revealed = server getVariable ["revealedGangs",[]];
			{
				_x params ["_pos","_name"];
				private _gangs = OT_civilians getVariable [format["gangs%1",_name],[]];
				private _found = false;
		        if(count _gangs > 0) then {
					if !((_gangs select 0) in _revealed) then {
						_gangid = _gangs select 0;
						_found = true
					};
				};
				if(_found) exitWith {};
			}foreach([OT_townData,[],{(_x select 0) distance2D player},"ASCEND",{((_x select 0) distance2D player) < 3000}] call BIS_fnc_SortBy);

			private _code = {

			};

			if(_gangid > -1) then {
				_gang = OT_civilians getVariable [format["gang%1",_gangid],[]];
				_name = _gang select 8;
				private _support = [_town] call OT_fnc_support;
				if(_support > 50) then {
					_talk pushback format["I know of a gang called %1, I'll mark their camp on your map, maybe they'll have some jobs for you",_name];
					_talk pushback "Thanks!";
					_talk pushback "Anything for the resistance";
					_code = {
						params ["_town","_gangid","_gang"];
						private _town = (getpos player) call OT_fnc_nearestTown;
                        _mrkid = format["gang%1",_town];
                        _mrk = createMarker [_mrkid, _gang select 4];
                        _mrkid setMarkerType "ot_Camp";
                        _mrkid setMarkerColor "colorOPFOR";
						private _revealed = server getVariable ["revealedGangs",[]];
                        _revealed pushback _gangid;
						server setVariable ["revealedGangs",_revealed,true];
					};
				}else{
					_talk pushback format["I do, but I doubt they'd like it if I told you where they were",_name];
					_code = {
						params ["_town","_gangid","_gang","_name"];
						_gangoptions = [];
						_gangoptions pushBack [
							"Offer $500",{
								params ["_town","_gangid","_gang","_name"];
								private _civ = OT_interactingWith;
								private _cash = player getVariable ["money",0];
								if(_cash >= 500) then {
									[
										player,
										_civ,
										["What if I gave you $500?",format["Yeah, OK. I know of a gang called %1, I'll mark their camp on your map, maybe they'll have some jobs for you",_name]],
										{
											params ["_town","_gangid","_gang","_name"];
											private _town = (getpos player) call OT_fnc_nearestTown;
											[-500] call OT_fnc_money;
											_mrkid = format["gang%1",_town];
					                        _mrk = createMarker [_mrkid, _gang select 4];
					                        _mrkid setMarkerType "ot_Camp";
					                        _mrkid setMarkerColor "colorOPFOR";
											private _revealed = server getVariable ["revealedGangs",[]];
					                        _revealed pushback _gangid;
											server setVariable ["revealedGangs",_revealed,true];
										},
										[_town,_gangid,_gang,_name]
									] call OT_fnc_doConversation;
								}else{
									"You cannot afford that" call OT_fnc_notifyMinor;
								};
							},
							[_town,_gangid,_gang,_name]
						];

						_gangoptions pushBack ["Cancel",{}];
						_gangoptions call OT_fnc_playerDecision;
					}
				};
			}else{
				_talk pushback "Sorry, but I don't know about any gangs near here";
				_code = {};
			};

			[
				player,
				_civ,
				_talk,
				_code,
				[_town,_gangid,_gang,_name]
			] call OT_fnc_doConversation;
		}
	];

	_done = player getVariable ["OT_tutesDone",[]];
	if !("NATO" in _done) then {
		_options pushBack [
			"So, about those NATO soldiers...",{
				private _civ = OT_interactingWith;
				[
					player,
					_civ,
					[
						"So, about those NATO soldiers...",
						"Yes! I will gladly pay you $250 to get them off my back",
						"Alright I'll see what I can do"
					],
					(OT_tutorialMissions select 0)
				] call OT_fnc_doConversation;
			}
		];
	};
	if !("Drugs" in _done) then {
		_options pushBack [
			"You sell Ganja right?",{
				private _civ = OT_interactingWith;
				[
					player,
					_civ,
					[
						"You sell Ganja right?",
						"I sure do, wanna blaze it?",
						"Not right now, I need some cash first",
						"Oh OK, sell it to the civilians then"
					],
					(OT_tutorialMissions select 1)
				] call OT_fnc_doConversation;
			}
		];
	};
	if !("Economy" in _done) then {
		_options pushBack [
			"So how can I make money legally?",{
				private _civ = OT_interactingWith;
				[
					player,
					_civ,
					[
						"How can I make some legal money?",
						"Legal money? Where's the fun in that. I guess you could try selling to stores or leasing houses.",
						"Thanks."
					],
					(OT_tutorialMissions select 2)
				] call OT_fnc_doConversation;
			}
		];
	};
};

if (_canBuyBoats) then {
	_options pushBack [
		"Buy Boat",{
			createDialog "OT_dialog_buy";
			{
				private _civ = OT_interactingWith;
				_cls = _x select 0;
				private _town = (getpos player) call OT_fnc_nearestTown;
				private _standing = [_town] call OT_fnc_support;

				_price = [_town,_cls,_standing] call OT_fnc_getPrice;
				if("fuel depot" in (server getVariable "OT_NATOabandoned")) then {
					_price = round(_price * 0.5);
				};
				_idx = lbAdd [1500,format["%1",_cls call OT_fnc_vehicleGetName]];
				lbSetPicture [1500,_idx,_cls call OT_fnc_vehicleGetPic];
				lbSetData [1500,_idx,_cls];
				lbSetValue [1500,_idx,_price];
			}foreach(OT_boats);
		}
	];
	_options pushBack [
		"Ferry Service",{
			"Where do you want to go?" call OT_fnc_notifyMinor;
			_ferryoptions = [];
			{
				private _p = markerPos(_x);
				private _t = _p call OT_fnc_nearestTown;
				private _dist = (player distance _p);
				private _cost = floor(_dist * 0.005);
				private _go = {
					_this spawn {
						private _destpos = _this;
						player setVariable ["OT_ferryDestination",_destpos,false];
						private _desttown = _destpos call OT_fnc_nearestTown;
						private _pos = (getpos player) findEmptyPosition [10,100,OT_vehType_ferry];
						if (count _pos isEqualTo 0) exitWith {
							"Not enough space, please clear an area nearby" call OT_fnc_notifyMinor;
						};
						private _cost = floor((player distance _destpos) * 0.005);
						player setVariable ["OT_ferryCost",_cost,false];
						_money = player getVariable ["money",0];
						if(_money < _cost) then {
							"You cannot afford that!" call OT_fnc_notifyMinor
						}else{
							[-_cost] call OT_fnc_money;
							_veh = OT_vehType_ferry createVehicle _pos;

							clearWeaponCargoGlobal _veh;
							clearMagazineCargoGlobal _veh;
							clearBackpackCargoGlobal _veh;
							clearItemCargoGlobal _veh;

							private _dir = 0;
							while {!(surfaceIsWater ([_pos,800,_dir] call BIS_fnc_relPos)) && _dir < 360} do {
								_dir = _dir + 45;
							};

							_veh setDir _dir;
							player reveal _veh;
							createVehicleCrew _veh;
							_veh lockDriver true;
							private _driver = driver _veh;
							player moveInCargo _veh;

							_driver globalchat format["Departing for %1 in 10 seconds",_desttown];

							sleep 5;
							_driver globalchat format["Departing for %1 in 5 seconds",_desttown];
							sleep 5;

							private _g = group (driver _veh);
							private _wp = _g addWaypoint [_destpos,50];
							_wp setWaypointType "MOVE";
							_wp setWaypointSpeed "NORMAL";

							_veh addEventHandler ["GetOut", {
								params ["_vehicle","_position","_unit"];
								_unit setVariable ["OT_ferryDestination",[],false];
							}];

							systemChat format["Departing for %1, press Y to skip (-$%2)",_desttown,_cost];

							waitUntil {
								!alive player
								|| !alive _veh
								|| !alive _driver
								|| (vehicle player isEqualTo player)
								|| (player distance _destpos < 80)
							};

							if(vehicle player isEqualTo _veh && alive _driver) then {
								_driver globalchat format["We've arrived in %1, enjoy your stay",_desttown];
							};
							sleep 15;
							if(vehicle player isEqualTo _veh && alive _driver) then {
								moveOut player;
								_driver globalchat "Alright, bye";
							};
							if(random 100 > 90) then {
								[player] spawn OT_fnc_NATOsearch;
							};
							if(!alive _driver) exitWith{};
							_timeout = time + 800;

							_wp = _g addWaypoint [_pos,0];
							_wp setWaypointType "MOVE";
							_wp setWaypointSpeed "NORMAL";

							waitUntil {_veh distance _pos < 100 || time > _timeout};
							if(!alive _driver) exitWith{};

							deleteVehicle _driver;
							deleteVehicle _veh;
						};
					};
				};
				if(_dist > 1000) then {
					_ferryoptions pushback [format["%1 (-$%2)",_t,_cost],_go,_p];
				};
			}foreach(OT_ferryDestinations);
			_ferryoptions call OT_fnc_playerDecision;
		}
	];
};

if (_canBuyVehicles) then {
	_options pushBack [
		"Buy Vehicles",OT_fnc_buyVehicleDialog
	];
};

if (_canBuyGuns) then {
	_options pushBack [
		"Buy",OT_fnc_gunDealerDialog
	];
};

if (_canSell) then {
	_options pushBack [
		"Sell",{
			private _civ = OT_interactingWith;
			private _town = (getpos player) call OT_fnc_nearestTown;
			private _standing = [_town] call OT_fnc_support;

			_cat = _civ getVariable "OT_shopCategory";
			_categorystock = [player,_cat] call OT_fnc_unitStock;

			player setVariable ["OT_shopTarget","Self",false];
			player setVariable ["OT_shopTargetCategory",_cat,false];

			createDialog "OT_dialog_sell";
			localNamespace setVariable ["OT_SELL_VALUE",-1];
			[] spawn OT_fnc_sellvalueloop;
			[_categorystock,_town,_standing] call OT_fnc_sellDialog;
		}
	];
};

if (_isShop) then {
	_options pushBack [format["Do you have any jobs for me?"], {
		OT_jobsOffered = [];
		private _civ = OT_interactingWith;
		private _time = _civ getvariable ["lastmission",-300];
		if((time < (_time + 300)) && !(OT_adminmode)) exitwith {
			private _talk = ["I still don't have any new jobs, check back in a few minutes"];
			private _code = {};
			[_civ,player,_talk,_code,[]] call OT_fnc_doConversation;
		};
		private _town = (getpos player) call OT_fnc_nearestTown;
		private _standing = [_town] call OT_fnc_support;
		if(_standing < 0) then {
			format["Resistance Support in this town is too low (%1)",_support] call OT_fnc_notifyMinor;
		}else{
			private _id = player call OT_fnc_playerMID;
			_civ setvariable ["lastmission",time];
			call OT_fnc_requestJobShop;
		};
	}]
};

OT_drugSelling = "";
OT_drugQty = 0;

if (_canSellDrugs) then {
	{
		_drugcls = _x;
		if(((items player) find _x) > -1 && !(_civ getVariable["OT_askedDrugs",false])) then {

			_drugname = _x call OT_fnc_weaponGetName;
			_options pushBack [format ["Sell %1",_drugname],{
				OT_drugSelling = _this;
				_drugcls = _this;
				_drugname = _drugcls call OT_fnc_weaponGetName;
				if(((items player) find _drugcls) isEqualTo -1) exitWith {};
				_num = 0;
				{
					if(_x select 0 isEqualTo _drugcls) exitWith {_num = _x select 1};
				}foreach(player call OT_fnc_unitStock);
				OT_drugQty = _num;

				private _town = (getpos player) call OT_fnc_nearestTown;
				private _price = [_town,_drugcls] call OT_fnc_getDrugPrice;
				private _civ = OT_interactingWith;
				_civ setVariable["OT_askedDrugs",true,true];


				player globalchat (
					format [selectRandom [
							"Would you like to buy some %1?",
							"Wanna buy some %1?",
							"Hey, want some %1?",
							"You wanna buy some %1?",
							"Pssst! %1?",
							"Hey you looking for any %1?"
						],
						_drugname
					]);

				if(side _civ isEqualTo civilian) then {
					_price = round(_price * 1.2);
					if(player call OT_fnc_unitSeenNATO) then {
						[player] remoteExec ["OT_fnc_NATOsearch",2,false];
					}else{
						if((random 100) > 68) then {
							[_civ,player,["How much?",format["$%1",_price],"OK"],
							{
								private _drugSell = _this select 0;
								[
									round(
										([(getpos player) call OT_fnc_nearestTown,_drugSell] call OT_fnc_getDrugPrice)*1.2
									)
								] call OT_fnc_money;
								player removeItem _drugSell;
								OT_interactingWith addItem _drugSell;
								OT_interactingWith setVariable ["OT_Talking",false,true];
								private _town = (getpos player) call OT_fnc_nearestTown;
								if((random 100 > 50) && !isNil "_town") then {
									[_town,-1] call OT_fnc_stability;
								};
								if(random 100 > 80) then {
									1 call OT_fnc_influence;
								};
							}, [OT_drugSelling]] call OT_fnc_doConversation;
						}else{
							[_civ,player,["No, thank you"],{OT_interactingWith setVariable ["OT_Talking",false,true];}] call OT_fnc_doConversation;
						};
					};
				}else{
					_price = [OT_nation,_drugcls] call OT_fnc_getDrugPrice;
					if(player call OT_fnc_unitSeenNATO) then {
						[player] remoteExec ["OT_fnc_NATOsearch",2,false];
					}else{
						if((random 100) > 5) then {
							[
								_civ,
								player,
								[format["OK I'll give you $%1 for each",_price],"OK"],
								{
									[([OT_nation,OT_drugSelling] call OT_fnc_getDrugPrice) * OT_drugQty] call OT_fnc_money;
									for "_t" from 1 to OT_drugQty do {
										player removeItem OT_drugSelling
									};
									OT_interactingWith setVariable ["OT_Talking",false,true];
								}
							] call OT_fnc_doConversation;
							[_town,-OT_drugQty] call OT_fnc_stability;
						}else{
							[_civ,player,["No, go away!"],{OT_interactingWith setVariable ["OT_Talking",false,true];player setCaptive false;}] call OT_fnc_doConversation;
							if(player call OT_fnc_unitSeenCRIM) then {
								hint "You are dealing on enemy turf";
								player setCaptive false;
							};
						};
					};
				};
			},_drugcls];
		};
	}foreach(OT_allDrugs);
};

_options pushBack ["Cancel",{}];

_options call OT_fnc_playerDecision;
