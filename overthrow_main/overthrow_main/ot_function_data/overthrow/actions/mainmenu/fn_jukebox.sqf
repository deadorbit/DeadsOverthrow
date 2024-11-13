if(isnil("OT_JUKEBOXENABLED")) then {
	OT_JUKEBOXENABLED = false;
	OT_JUKEBOXRECORD = 0;//Used to prevent jukeboxes infighting if multiple are running
};
if (isnil{"OT_JUKEBOXENABLED"} || OT_JUKEBOXENABLED == FALSE) then {
	OT_JUKEBOXENABLED = TRUE;
	hint "Jukebox Enabled";
}else{
	OT_JUKEBOXENABLED = FALSE;
	hint "Jukebox Disabled";
};

if(OT_JUKEBOXENABLED == FALSE) then  {
	playmusic "";
}else{
	OT_JUKEBOXRECORD = OT_JUKEBOXRECORD + 1;
	[OT_JUKEBOXRECORD] spawn {
		private _prevsong = "";
		private _record = _this select 0;
		while{OT_JUKEBOXENABLED && _record == OT_JUKEBOXRECORD} do {
			private _fadelength = 10;
			private _song = [OT_MUSIC,OT_MUSIC_WEIGHTS] call BIS_fnc_selectrandomweighted;
			private _songs = []; 
			private _songlength = 0;
			while{_song isequalto _prevsong} do {
				sleep(0.25);
				_song = [OT_MUSIC,OT_MUSIC_WEIGHTS] call BIS_fnc_selectrandomweighted;
			};
			if(typename _song == "ARRAY") then {
				_songs =+ _song;
				_song = _song select 0;
				_songs deleteat 0;
			};
			_prevsong = _song;
			_songlength = getnumber(configFile >> "CfgMusic" >> _song >> "duration");
			if(!(_record == OT_JUKEBOXRECORD)) exitwith {};
			[_song, 0, 0] call BIS_fnc_playMusic;
			_fadelength fademusic 5;
			
			if(count _songs > 0) then {
				sleep(_songlength); _temparr =+ _songs;
				_temparr deleteat (count _songs - 1);
				{
					_song = _x;
					_songlength = getnumber(configFile >> "CfgMusic" >> _song >> "duration");
					if(!(_record == OT_JUKEBOXRECORD)) exitwith {};
					playmusic _song;
					sleep(_songlength);
			}foreach(_temparr);
				_song = _songs select (count _songs - 1);
				_songlength = getnumber(configFile >> "CfgMusic" >> _song >> "duration");
				if(!(_record == OT_JUKEBOXRECORD)) exitwith {};
				playmusic _song;
			};
			sleep(_songlength-_fadelength);
			_fadelength fademusic 0;
			sleep(_fadelength);
		};
	};
};