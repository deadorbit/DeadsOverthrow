params [["_mode",""]];
if (_mode isEqualTo "") exitWith {hint "Something went wrong..."};//Assume Error

/*
	Script used to create and place a dummy weapon object
*/


private _inventoryWeapon = "";
private _holder = objNull;
private _itemCls = "";
private _fakeHolderCls = "Land_Antibiotic_F";


switch _mode do {
	case "Weapon": {
		private _playerWeapons = weaponsItems player;
		
		_itemCls = currentWeapon player;
		
		{
			if (_itemcls isEqualTo (_x select 0)) then {
				_inventoryWeapon = _x;
			};
		}forEach(_playerWeapons);

		if (_inventoryWeapon isEqualTo "") exitWith{};
		
		/*if (_itemCls isKindOf ["SMG_01_Base", configFile >> "CfgWeapons"] || _itemCls isKindOf ["Pistol", configFile >> "CfgWeapons"]) then {// Small Weapon
			_fakeHolderCls = "Land_Antibiotic_F";
		};
		
		if (_itemCls isKindOf "Launcher_Base_F") then {//Large Wepaon
			_fakeHolderCls = "Land_PortableLight_02_single_yellow_F";
		};*/
		
		player removeWeaponGlobal _itemcls;	
	};
	case "Helmet": {};
	case "Vest": {};
};

if (_itemCls isEqualTo "") exitWith {hint "WIP"};
//Curse you Bohemia and your awful collision boxes, beans can save the day anyways
private _fakeHolder = createVehicle [
	_fakeHolderCls,
	getPos player,
	[],
	0,
	"CAN_COLLIDE"
];

_fakeHolder hideObject true;
_fakeHolder enableSimulation true;

private _holder = createVehicle [
	"WeaponHolderSimulated_Scripted",
	getPos player,
	[],
	0,
	"CAN_COLLIDE"
];

_holder enableSimulation false;

_holder addWeaponWithAttachmentsCargoGlobal [_inventoryWeapon,1];
_holder setDamage 1;
_holder lockInventory true;
_holder enableSimulation false;
[_holder,_holder] call ACE_common_fnc_claim;

private _world = getPosWorld _holder;
private _bb = _holder call BIS_fnc_boundingBoxDimensions;
private _bb2 = _fakeholder call BIS_fnc_boundingBoxDimensions;
_fakeHolder setPosWorld [_world select 0, _world select 1, ((_world select 2) - ((_bb select 2)/2)) + ((_bb2 select 0)/2)];
[_holder, _fakeHolder] call BIS_fnc_attachToRelative;


OT_DISPLAYINGWEAPON = true;
OT_DISPLAYINGWEAPON_SUCCESS = false;
OT_DISPLAYWEAPON_YAW = 0;
OT_DISPLAYWEAPON_PITCH = 0;
OT_DISPLAYWEAPON_ROLL = 0;
OT_DISPLAYWEAPON_FACENORMAL = true;
OT_DISPLAYWEAPON_SURFACESNAP = true;
OT_DISPLAYWEAPON_DISTANCE = 2;

_holder enableSimulation true;

[_fakeHolder, _itemCls] spawn {
	params ["_holder","_itemcls"];

	[format [
		"<t size='1' color='#eeeeee'>Weapon Mounting Mode</t>
		<br/> <t size='0.8' color='#eeeeee'>%1</t>
		<br/><t size='0.6' color='#eeeeee'>Once placed, look at and press Y to retrieve</t><br/>
		<br/><br/><t size='0.5' color='#bbbbbb'>7, 9 = ROLL
		<br/><t size='0.5' color='#bbbbbb'>8, 5 = PITCH
		<br/><t size='0.5' color='#bbbbbb'>4, 6 = YAW
		<br/><t size='0.5' color='#bbbbbb'>+, - = Distance from player
		<br/><t size='0.5' color='#bbbbbb'>+SHIFT = Fast Rotate
		<br/><t size='0.5' color='#bbbbbb'>ALT = Toggle Surface Snapping
		<br/><t size='0.5' color='#bbbbbb'>CTRL = Toggle Face Normal
		<br/><t size='0.5' color='#bbbbbb'>BACKSPACE = Reset Rotation
		<br/>Enter = Done
		<br/>Esc = Cancel (drops as normal item)</t>",
		(_itemcls call OT_fnc_weaponGetName)
	], [safeZoneX + (0.8 * safeZoneW), (0.2 * safeZoneW)], 0.5, 20, 0, 0, 2] call OT_fnc_dynamicText;

	private _keymap = [
		[
			28,
			{
				"[] params "
			}
		]
	
	];
	private _keyhandler = {
		params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];
		private _intercepted = false;
		private _factor = 1;
		if (_shift) then {_factor = 5};
		
		switch _key do {
			case 28: {//ENTER
				OT_DISPLAYINGWEAPON_SUCCESS = true;
				_intercepted = true;
			};
			case 56: {//ALT
				OT_DISPLAYWEAPON_SURFACESNAP = !OT_DISPLAYWEAPON_SURFACESNAP;
				SystemChat format["Surface Snap: %1",OT_DISPLAYWEAPON_SURFACESNAP];
				_intercepted = true;
			};
			case 29: {//CTRL
				OT_DISPLAYWEAPON_FACENORMAL = !OT_DISPLAYWEAPON_FACENORMAL;
				SystemChat format["Face Normal: %1",OT_DISPLAYWEAPON_FACENORMAL];
				_intercepted = true;
			};
			case 71: {//7
				OT_DISPLAYWEAPON_ROLL = OT_DISPLAYWEAPON_ROLL - (1 * _factor);
				if (OT_DISPLAYWEAPON_ROLL < 0) then {OT_DISPLAYWEAPON_ROLL = 360};
				_intercepted = true;
			};
			case 73: {//9
				OT_DISPLAYWEAPON_ROLL = OT_DISPLAYWEAPON_ROLL + (1 * _factor);
				if (OT_DISPLAYWEAPON_ROLL > 360) then {OT_DISPLAYWEAPON_ROLL = 0};
				_intercepted = true;
			};
			case 72: {//8
				OT_DISPLAYWEAPON_PITCH = OT_DISPLAYWEAPON_PITCH + (1 * _factor);
				_intercepted = true;
			};
			case 76: {//5
				OT_DISPLAYWEAPON_PITCH = OT_DISPLAYWEAPON_PITCH - (1 * _factor);
				_intercepted = true;
			};
			case 75: {//4
				OT_DISPLAYWEAPON_YAW = OT_DISPLAYWEAPON_YAW + (1 * _factor);
				if (OT_DISPLAYWEAPON_YAW > 360) then {OT_DISPLAYWEAPON_YAW = 0};
				_intercepted = true;
			};
			case 77: {//6
				OT_DISPLAYWEAPON_YAW = OT_DISPLAYWEAPON_YAW - (1 * _factor);
				if (OT_DISPLAYWEAPON_YAW < 0) then {OT_DISPLAYWEAPON_YAW = 360};
				_intercepted = true;
			};
			case 78: {//+
				OT_DISPLAYWEAPON_DISTANCE = OT_DISPLAYWEAPON_DISTANCE + (0.1 * _factor);
				if (OT_DISPLAYWEAPON_DISTANCE > 5) then {
					OT_DISPLAYWEAPON_DISTANCE = 5;
					SystemChat "Max Distance Reached";
				};
				_intercepted = true;
			};
			case 74: {//-
				OT_DISPLAYWEAPON_DISTANCE = OT_DISPLAYWEAPON_DISTANCE - (0.1 * _factor);
				if (OT_DISPLAYWEAPON_DISTANCE < 0.25) then {
					OT_DISPLAYWEAPON_DISTANCE = 0.25;
					SystemChat "Minimum Distance Reached";
				};
				_intercepted = true;
			};
			case 14: {//Backspace
				OT_DISPLAYWEAPON_YAW = 0;
				OT_DISPLAYWEAPON_PITCH = 0;
				OT_DISPLAYWEAPON_ROLL = 0;
				_intercepted = true;
			};
		};
		_intercepted
	};

	private _handlerId = (findDisplay 46) displayAddEventHandler ["KeyDown",_keyhandler];
	
	private _initalDir = vectorDirVisual _holder;
	private _initalUp = vectorUpVisual _holder;

	while {OT_DISPLAYINGWEAPON && !OT_DISPLAYINGWEAPON_SUCCESS && alive player && vehicle player isEqualTo player} do {
		sleep (1/diag_fps);
		
		//Calculate a line from the players eyes going in the direction they are looking
		private _visionLine = [OT_DISPLAYWEAPON_DISTANCE] call DEDF_fnc_PlayerVisionLine;
		private _playerdir = VectorDirVisual player;
		//Search through intersected objects for the first valid object, then return the surface intersected
		private _closestSurface = [_visionLine select 0, _visionLine select 1,["WeaponHolderSimulated_Scripted","CAManBase"]] call DEDF_fnc_findSurfaceIntersection;
		
		//If there is a surface along the line, and SurfaceSnapping is enabled
		if (((count _closestSurface) isEqualTo 0) || !OT_DISPLAYWEAPON_SURFACESNAP) then {
			//If there is no surface, place it at the end of the line, and just set the direction to what it was originally
			_holder setPos (ASLToAGL (_visionLine select 1));
			//If there is no surface, just set the direction to what it was originally
			_holder setVectorDir _initalDir;
			_holder setVectorUp _initalUp; 
		}else{
			//Get data of the intersected surface
			private _intersectPoint = _closestSurface select 0;
			private _surfaceNormal = _closestSurface select 1;
			private _intersectedObject = _closestSurface select 2;
			//Set the object to the point intersected, and set it to its orignal directoin
			_holder setPos (ASLToAGL _intersectPoint);
			_holder setVectorUp _initalUp;
			_holder setVectorDir _initalDir;
			
			//If FaceNormal is enabled 
			if (OT_DISPLAYWEAPON_FACENORMAL) then {
			
				//Set the item to objects direction, and point in the direction of the walls normal
				_holder setVectorUp _surfaceNormal;
				_holder setVectorDir ([_visionLine select 0, _visionLine select 1, _surfaceNormal] call DEDF_fnc_projectVectorFromSurface);
			};
		};
			//Rotate the object relative to direction set
			_holder setVectorDirAndUp ([[vectorDir _holder, vectorUp _holder], OT_DISPLAYWEAPON_YAW, OT_DISPLAYWEAPON_PITCH, OT_DISPLAYWEAPON_ROLL] call BIS_fnc_transformVectorDirAndUp);
	};
	
	OT_DISPLAYINGWEAPON = false;
	
	if (OT_DISPLAYINGWEAPON_SUCCESS) then {
		systemChat "Success";
	}else{
		systemChat "BAD"; 
	};
	
	(findDisplay 46) displayRemoveEventHandler ["KeyDown",_handlerId];
	
	OT_DISPLAYINGWEAPON = nil;
	OT_DISPLAYINGWEAPON_SUCCESS = nil;
	OT_DISPLAYWEAPON_YAW = nil;
	OT_DISPLAYWEAPON_PITCH = nil;
	OT_DISPLAYWEAPON_ROLL = nil;
	OT_DISPLAYWEAPON_FACENORMAL = nil;
	OT_DISPLAYWEAPON_SURFACESNAP = nil;
	OT_DISPLAYWEAPON_DISTANCE = nil;
	_holder enableSimulation true;
};