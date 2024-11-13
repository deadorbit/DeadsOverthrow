OT_drugSelling = _this select 0;
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