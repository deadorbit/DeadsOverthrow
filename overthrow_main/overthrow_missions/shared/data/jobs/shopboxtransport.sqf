params ["_jobid","_jobparams"];
_jobparams params ["_gangid"];
private _gang = OT_civilians getVariable [format["gang%1",_gangid],[]];
private _civ = OT_interactingWith;

private _cat = _civ getVariable "OT_shopCategory";

private _startpos = getpos player;
private _starttown = _startpos call OT_fnc_nearestTown;
private _destination = [];
private _destinationName = nil;
private _boxcls = ["Land_PaperBox_01_small_stacked_F","Land_WaterBottle_01_stack_F","Land_FoodSacks_01_cargo_white_idap_F","Land_FoodSacks_01_cargo_brown_idap_F","Land_FoodSacks_01_large_white_idap_F","C_IDAP_supplyCrate_F"];
_boxcls = (selectrandom _boxcls);
private _possibletowns = [];
private _backuptowns = [];
private _shops = [];
private _shop = [];
//Find a destination
{
	private _townpos = server getvariable _x;
	private _shops = server getvariable format["activeshopsin%1",_x];
	if(((_startpos distance2d _townpos) > 9999) && ((count _shops) > 0) && ([_townpos,_startpos] call OT_fnc_regionIsConnected)) then {
		_possibletowns pushback _x;
	}else{
		if(((_startpos distance2d _townpos) > 5000) && ((count _shops) > 0) && ([_townpos,_startpos] call OT_fnc_regionIsConnected)) then {
			_backuptowns pushback _x;
		};
	};
}foreach([OT_allTowns,[],{random 100},"ASCEND"] call BIS_fnc_SortBy);

if(!(count _possibletowns == 0)) then {
	_destinationName = (selectrandom _possibletowns);
}else{
	if(!(count _backuptowns == 0)) then {
		_destinationName = (selectrandom _backuptowns);
	};
};

if(isnil{_destinationName}) exitwith {};

_shops = server getvariable format["activeshopsin%1",_destinationName];
_shop = (selectrandom _shops);
_destination = (_shop select 0);

_distance = floor(_startpos distance2D _destination);
_reward = floor((_distance * 0.7) + 2500);
_distance = [(_distance/1000),2] call BIS_fnc_cutDecimals;

_markerPos = _destination;
_params = [_jobid,_destination,_boxcls,_reward,_starttown];

//Build a mission description and title

private _description = format["I need someone to transport a pallet of goods to another store in %3 within 24 hours. Just unload the box infront of the store and drive off.</t><br/>
	<t size='0.7' align='center'>(The container requires 7 cargo space to fit inside a vehicle. The container is specially marked and cannot be replaced if lost.)<br/><br/>
	<t size='0.7' align='center'>Estimated Distance: ~%2Km</t><br/>
	<t size='0.9' align='center'>Reward: $%4, +25 Resistance Support, +4 Stability in %5",
	"",_distance,_destinationName,_reward,_starttown
];

private _title = format["Deliver container to %1 store in %2 for %3 store in %4",(_shop  select 1),_destinationName,_cat,_starttown];

//The data below is what is returned to the gun dealer/faction rep, _markerPos is where to put the mission marker, the code in {} brackets is the actual mission code, only run if the player accepts
[
    [_title,_description],
    _markerPos,
    {
        params ["_jobid","_destination","_boxcls","_reward","_starttown"];
		private _pos = [getpos player, 5, 50, 4, 0, 0, 0] call BIS_fnc_findSafePos;
		private _box = _boxcls createvehicle _pos;
		_box setvariable ["job",format["job%1",_jobid],true];
		[_box, 7] call ace_cargo_fnc_setSize;
		clearItemCargoGlobal _box;
		clearmagazinecargoglobal _box;
		clearweaponcargoglobal _box;
		clearbackpackcargoglobal _box;
		_box lockInventory true;
		_box allowdamage false;
		OT_TEST_VAR = _box;
		
		private _mk = createMarkerlocal[format["load%1",_jobid],getpos _box]; 
		_mk setMarkerTextLocal "Load Here"; 
		_mk setmarkertypelocal "hd_objective";
		_mk setmarkercolorlocal "ColorCiv";
		_box setvariable ["mkinfo",[_mk,player]];
		
		private _eh = ["ace_cargoLoaded",{
			params ["_item", "_vehicle"];
			private _mkinfo = (_item getvariable ["mkinfo",nil]);
			private _eh = _item getvariable ["eh",-1];
			if(!isnil{_mkinfo}) then {
				private _mk = _mkinfo select 0;
				private _player = _mkinfo select 1;
				deletemarkerlocal _mk;
				[_mk] remoteexec ["deletemarkerlocal",_player];
				_item setvariable ["mkinfo",nil];
				_item setvariable ["eh",nil];
			};
			["ace_cargoLoaded", _eh] call CBA_fnc_removeEventHandler;
		}] call CBA_fnc_addEventHandler;
		
		[_mk,_box] spawn {//backup function for removing marker
			private _mk = _this select 0;
			private _count = 0;
			sleep 10;
			while{(!isnil{_mk})} do {
				sleep 30;
				_count + 1;
				if(_count == 20 && (!isnil{_mk})) exitwith {
					deletemarkerlocal _mk;
					if(!isnil{_box}) then {
						_box setvariable ["mkinfo",nil];
					};
				};
			};
		};
		_box setvariable ["eh",_eh];
		systemchat "A marker with the location of the cargo has been added to your map.";
		_this pushback _box;
		
        true
    },
    {
        params ["_jobid","_destination","_boxcls","_reward","_starttown","_box"];
		(isnull(_box));
    },
    {
        //Success Check.. items were delivered
        params ["_jobid","_destination","_boxcls","_reward","_starttown","_box"];
		private _o = _destination nearObjects [_boxcls, 40];
		private _ret = false;
		if((count _o) > 0) then {
			private _obj = _o select 0;
			if(_obj getvariable ["job",""] isEqualTo (format["job%1",_jobid])) exitwith {
				_ret = true;	
			};
		};
		_ret
    },
    {
        params ["_jobid","_destination","_boxcls","_reward","_starttown","_box","_wassuccess"];

        //If mission was a success
        if(_wassuccess) then {
			deletevehicle _box;
			[_reward] call OT_fnc_money;
            [_starttown,25] call OT_fnc_support;
			[_starttown,4] call OT_fnc_stability;
        }else{
			private _support = [_starttown] call OT_fnc_support;
			_support = _support * 0.05;
			if(_support > 50) then {
				[_starttown,-_support] call OT_fnc_support;
			}else{
				[_starttown,-50] call OT_fnc_support;
				_support = 50;
			};
			format["Delivery Failed: -%1 Support",_support] remoteExec ["OT_fnc_notifyMinor",0,false];
        };
    },
    _params
];