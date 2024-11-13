_recruits = server getVariable ["recruits",[]];
_newrecruits = [];
{
	_owner = _x select 0;
	_name = _x select 1;
	_civ = _x select 2;
	_rank = _x select 3;
	_loadout = _x select 4;
	_type = _x select 5;
	_xp = _x select 6;
	if(_owner isEqualTo (getplayeruid player)) then {
		if(typename _civ isEqualTo "ARRAY") then {
			_pos = _civ findEmptyPosition [5,20,_type];
			_civ =  group player createUnit [_type,_pos,[],0,"NONE"];
			[_civ,getplayeruid player] call OT_fnc_setOwner;
			_civ setVariable ["OT_xp",_xp,true];
			_civ setVariable ["NOAI",true,true];
			_civ setRank _rank;
			if(_rank isEqualTo "PRIVATE") then {_civ setSkill 0.2 + (random 0.3)};
			if(_rank isEqualTo "CORPORAL") then {_civ setSkill 0.3 + (random 0.3)};
			if(_rank isEqualTo "SERGEANT") then {_civ setSkill 0.4 + (random 0.3)};
			if(_rank isEqualTo "LIEUTENANT") then {_civ setSkill 0.6 + (random 0.3)};
			if(_rank isEqualTo "CAPTAIN") then {_civ setSkill 0.7 + (random 0.3)};
			if(_rank isEqualTo "MAJOR") then {_civ setSkill 0.8 + (random 0.2)};
			[_civ, (OT_faces_local call BIS_fnc_selectRandom)] remoteExecCall ["setFace", 0, _civ];
			[_civ, (OT_voices_local call BIS_fnc_selectRandom)] remoteExecCall ["setSpeaker", 0, _civ];
			_civ setUnitLoadout _loadout;
			_civ spawn OT_fnc_wantedSystem;
			_civ setName _name;
			_civ setVariable ["OT_spawntrack",true,true];

			[_civ] joinSilent nil;
			[_civ] joinSilent (group player);

			commandStop _civ;
		}else{
			if(_civ call OT_fnc_playerIsOwner) then {
				[_civ] joinSilent (group player);
			};
		};
	};
	_newrecruits pushback [_owner,_name,_civ,_rank,_loadout,_type];
}foreach (_recruits);

server setVariable ["recruits",_newrecruits,true];

private _squads = server getVariable ["squads",[]];
private _newsquads = [];
private _ownedSquadTotal = 1;

{
	_x params ["_owner","_cls","_group","_units"];
	if(_owner isEqualTo (getplayeruid player)) then {
		if(typename _group != "GROUP") then {
			_name = _cls;
			if(count _x > 4) then {
				_name = _x select 4;
			}else{
				{
					if((_x select 0) isEqualTo _cls) then {
						_name = _x select 2;
					};
				}foreach(OT_Squadables);
			};
			_group = creategroup resistance;
			_group setGroupIdGlobal [_name];
			{
				_x params ["_type","_pos","_loadout"];
				_civ = _group createUnit [_type,_pos,[],0,"NONE"];
				_civ setSkill 0.5 + (random 0.4);
				_civ setUnitLoadout _loadout;
				[_civ, (OT_faces_local call BIS_fnc_selectRandom)] remoteExecCall ["setFace", 0, _civ];
				[_civ, (OT_voices_local call BIS_fnc_selectRandom)] remoteExecCall ["setSpeaker", 0, _civ];
				_civ setVariable ["OT_spawntrack",true,true];
			}foreach(_units);
		};
		player hcSetGroup [_group,groupId _group,"teamgreen"];
		_ownedSquads = _ownedSquads + 1;
	};
	_newsquads pushback [_owner,_cls,_group,[]];
}foreach (_squads);

player setVariable ["OT_squadcount",_ownedSquads,true];
server setVariable ["squads",_newsquads,true];