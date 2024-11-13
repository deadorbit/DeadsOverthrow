/*

illuminatingFlares.sqf
startFlares = 1; null = [<max distance>, <base delay>, <max added delay>, <base height>, <random added or subtracted height>, <color>, <speed (must be negative)>, <flareIntensity>, <flareRange>, <timeout>, <object pos>] execVM "illuminatingFlares.sqf";

A is the maximum distance each flare can spawn from the given position. The distance ranges from 0 meters to the number you supply.

B is the base number of seconds before a new flare can be spawned.

C is the maximum amount of more seconds randomly added to this delay.

D is the base height of each flare.

E is a maximum amount of meters that can be randomly added to or subtracted from the base height.

F is the color of the flare. Available colors are "WHITE", "RED", "GREEN", "YELLOW", or "IR". If you make this "RANDOM" each flare will be a random color.

G is the speed of the flare. Must be negative or flares will tend to freeze in the air.

H is the flare light intensity (If you set it too high, you will burn your eyes) 

I will change the illuminated area. (Dont set it too high because it will cause problems)

J Time in seconds after which the flares disappears. Value 0 for never ending flares.

K is the object the flares will be centered around. The player for example. 

null = [A, B, C, D, E, F, G, H, I, J, K] execVM "illuminatingFlares.sqf"
Standard example: startFlares = 1; null = [150, 10, 5, 250, 10, "WHITE", -10, 50, 300, 0, player] execVM "illuminatingFlares.sqf";
To stop the flares, replace 1 in startFlares = 1 with a different number. Example: startFlares = 0;
  
*/
 
// declare a few variables we need and make _sign randomly negative
_sign = 1;
_random = false;
if (floor random 10 > 4) then { _sign = -1 };
_flareArray = ["WHITE", "RED", "GREEN", "YELLOW", "IR"];
 
// organize our arguments
_flareDist = _this select 0;
_delay = _this select 1;
_delayRandom = _this select 2;
_flareHeight = _this select 3;
_flareHeightRandom = _this select 4;
_flareType = _this select 5;
_flareSpeed = _this select 6;
_flareIntensity = _this select 7;
_flareRange = _this select 8;
_timeout = _this select 9;
_flarePos = _this select 10;

// timeout
if (_timeout != 0) then {
	[_timeout] spawn {
		scriptName "fn_moduleEffectsSmoke_timeoutLoop";
		_timeout = _this select 0;

		sleep _timeout;
		startFlares = 0;
	};
};
 
// create loop for spawning flares
while { startFlares == 1 } do
{
        // check if random
        if (_flareType == "RANDOM") then { _flareType = _flareArray call BIS_fnc_selectRandom; _random = true };
        // assign flares
        switch (_flareType) do
        {
                case "WHITE":   { _flareType = "F_40mm_White" };
                case "RED":     { _flareType = "F_40mm_Red" };
                case "GREEN":   { _flareType = "F_40mm_Green" };
                case "YELLOW":  { _flareType = "F_40mm_Yellow" };
                //case "IR":      { _flareType = "F_40mm_CIR" };
        };

        // get a random spot around the target
        _pos = [_flarePos, random _flareDist, random 360] call BIS_fnc_relPos;
        _pos = [_pos select 0, _pos select 1, _flareHeight + (random _flareHeightRandom * _sign)];
        // make the flare at that spot
        _flare = _flareType createVehicle _pos;
        // set its speed
        _flare setVelocity [0, 0, _flareSpeed];
	
	sleep 3;
	_light = "#lightpoint" createVehicleLocal getPosVisual _flare;

	// Flare sounds
	_flare spawn {
		
		//The sound of the flare starting to burn
		playSound3D ["a3\missions_f_beta\data\sounds\Showcase_Night\flaregun_4.wss", _this, false, getPosVisual _this, 1, 1, 0];
	
		sleep 1;
	
		//The flare burning loop sound
		while { !isNull _this } do {
			_this say3D "SN_Flare_Loop";
			sleep 4;
		};
	
	}; 
	
	// light colors and ambient light colors for flares
	if(_flaretype == "F_40mm_White") then { _light setLightAmbient [0.7,0.7,0.8] };
	if(_flaretype == "F_40mm_Red") then { _light setLightAmbient [0.7,0.15,0.1] };
	if(_flaretype == "F_40mm_Green") then { _light setLightAmbient [0.2,0.7,0.2] };
	if(_flaretype == "F_40mm_Yellow") then { _light setLightAmbient [0.7,0.7,0] };

	if(_flaretype == "F_40mm_White") then { _light setLightColor [0.7,0.7,0.8] };
	if(_flaretype == "F_40mm_Red") then { _light setLightColor [0.7,0.15,0.1] };
	if(_flaretype == "F_40mm_Green") then { _light setLightColor [0.2,0.7,0.2] };
	if(_flaretype == "F_40mm_Yellow") then { _light setLightColor [0.7,0.7,0] };

	_light setLightUseFlare true;
	_light setLightFlareSize 10;
	_light setLightFlareMaxDistance 2000;

	flare_range = _flareRange;
	_light setLightAttenuation [/*start*/ flare_range, /*constant*/1, /*linear*/ 100, /*quadratic*/ 0, /*hardlimitstart*/50,/* hardlimitend*/flare_range-10];
	_light setLightDayLight true;

	flare_brightness = _flareIntensity;
	_inter_flare = 0;

	while {!isNull _flare /*_inter_flare<21*/} do {
		_int_mic = 0.05 + random 0.01;
		sleep _int_mic;
		_flare_brig = flare_brightness+random 10;
		_light setLightIntensity _flare_brig;
		_inter_flare = _inter_flare + _int_mic;
		_light setpos (getPosVisual _flare);
	};
 
		// delay plus random delay
        sleep (_delay + random _delayRandom);
        // reset random if it was there before
        if (_random) then { _flareType = "RANDOM" };

};