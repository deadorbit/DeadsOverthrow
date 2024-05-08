if !(AllowAirD) exitWith{};
	deleteMarker "PossibleAirdropLocation";
	
	private _airdroped = true;
	private _AirdropCounter = 0;
	private _randomPos = [nil, ["ground"]] call BIS_fnc_randomPos;
	private _effects = false;

	//Figure out a good place to drop the cargo thats not in a town and preferable in a forest (to add some difficulty in finding it)
	private _randomDes = [nil, ["water"]] call BIS_fnc_randomPos;
	private _radius = 5000; 
	private _exp = "(0.5 - trees) * (2 - sea) * (1 - houses) * (0.5 - hills) * (2 - coast)"; 
	private _prec = 50;
	private _bestplace = selectBestPlaces [_randomDes,_radius,_exp,_prec,1]; 
	private _spot = _bestplace select 0; 

	private _pos = _spot select 0; 
	//Add some randomness to the marker
	private _radius = 150; 
	private _exp = "(randomGen 1 - forest + trees) * (1 - sea) * (1 - houses)"; 
	private _prec = 50;
	private _bestplace = selectBestPlaces [_pos,_radius,_exp,_prec,1]; 
	private _spot = _bestplace select 0;

	private _MarkerLoc = _spot select 0;

	private _marker = createMarker ["PossibleAirdropLocation", _MarkerLoc];  
	_marker setMarkerShape "Ellipse";  
	_marker setMarkerSize [250, 250];   
	_marker setMarkerColor "ColorCivilian";

	_pos = [_pos select 0,_pos select 1, 0];
	_cargo = createVehicle ["C_IDAP_CargoNet_01_supplies_F",[0,0,0]];
	_cargo setposATL _pos;
			
	//Play a radio message to alert players
	_gridPos = mapGridPosition _randomDes;
	[[_gridPos], {systemChat format ["Attention all humanitarian groups on the island, An IDAP helicoptor is set to airdrop supplies at grid %1, OVER.",(_this select 0)]}] remoteExec ["call", 0];
				
	//Now heres were we add some cool loot
	clearItemCargo _cargo;
	clearWeaponCargo _cargo;
	clearMagazineCargo _cargo;
	clearBackpackCargo _cargo;
	_cargo addItemCargoGlobal ["FirstAidKit", (random [15,20,25])];
	_cargo addItemCargoGlobal ["Medikit", (random [1,2,3])];
	_cargo addItemCargoGlobal ["ACE_PersonalAidKit", (random [2,4,10])];
	_cargo addItemCargoGlobal ["Toolkit", (random [1,1,3])];
	_cargo addItemCargoGlobal ["ItemRadio", (random [3,5,10])];
	_cargo addItemCargoGlobal ["ItemWatch", (random [3,5,10])];
	_cargo addItemCargoGlobal ["ItemCompass", (random [3,5,10])];
	_cargo addItemCargoGlobal ["ItemGPS", (random [3,5,10])];
	private _chance = random 100;
	if(_chance <= 33) then {
	//Drones
	_cargo addbackpackCargoGlobal ["C_IDAP_UAV_06_antimine_backpack_F",1]; 
	_cargo addbackpackCargoGlobal ["C_IDAP_UAV_06_backpack_F",round(random[2,2,3])];
	_cargo additemCargoGlobal ["C_UavTerminal",round(random[2,3,5])];
	_cargo additemCargoGlobal ["ACE_UAVBattery",round(random[1,5,8])];
	}else{
		if(_chance <= 66) then {
			//Mine clearing
			_cargo additemCargoGlobal ["V_EOD_IDAP_blue_F",round(random[1,2,3])];
			_cargo additemCargoGlobal ["V_Press_F",round(random[1,2,3])];
			_cargo additemCargoGlobal ["H_PASGT_neckprot_blue_press_F",round(random[1,2,3])];
			_cargo additemCargoGlobal ["ACE_elasticBandage",round(random[10,15,20])];
			_cargo additemCargoGlobal ["ACE_packingBandage",round(random[10,15,20])];
			_cargo additemCargoGlobal ["MineDetector",round(random[1,2,3])];
			_cargo additemCargoGlobal ["ACE_salineIV_500",round(random[4,5,8])];
			_cargo addItemCargoGlobal ["Toolkit",1];
		}else{
			//nothing
		};
	};
	
_airdroped = true;
while{_airdroped} do {
	sleep(20);
	if  (speed _cargo < 5) then {
		if  (!_effects) then {
		
			private _players = call Bis_Fnc_listplayers;
			_players = [_players,[getpos _cargo],{_input0 distance _x}] call BIS_fnc_sortby;
			
			if((getpos _cargo) distance (getpos (_players select 0))  < 250) then {//There is a player nearby
				_Chemlight_1 = "Chemlight_red" createVehicle (position _cargo);
				_Chemlight_1 attachTo [_cargo, [0,0.5,-0.4]];
				_Chemlight_2 = "Chemlight_red" createVehicle (position _cargo);
				_Chemlight_2 attachTo [_cargo, [0,-0.5,-0.4]];
				_Smoke = "SmokeShellRed" createVehicle (position _cargo);
				_Smoke attachTo [_cargo, [0,0,0.5]];
				_effects = true;
			};
		}else{
			//Check if its emptey
			private _loot = getItemCargo _cargo;
			if (isnil {_cargo} || _loot select 0 isEqualTo []) then {
				_AirdropCounter = 100
			};
		};
	if (_AirdropCounter >= 100) then {
		//They had long enough to claim it
		if (!isnil{_cargo}) then {deleteVehicle _cargo};
		_airdroped = false;
		OT_Airdropped = false;
	};
	_AirdropCounter = _AirdropCounter + 1;
	};
};