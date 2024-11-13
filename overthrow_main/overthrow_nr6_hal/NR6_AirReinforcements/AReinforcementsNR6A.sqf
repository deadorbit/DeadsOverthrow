// [Side, Spawning helipads/objects (Array), Starting aircraft (array), Amount of available Aircraft, Faction, Threshold (0 to 1), Leaders (array), Pool of available aircraft classnames if "custom" faction is chosen (array), Delay time between checks (seconds), code to execute on spawned groups (_this stands for squad leader), size of the flights that are spawned (array of numbers, will pick randomly a size from this array each spawn)] spawn NR6_fnc_AirReinforcements;

private 
    [
    "_side","_coreObj","_flight","_chosenFlight","_SpawnPads","_StartForces","_sidetick","_faction","_CurrentForces","_Pool","_Threshold","_Leaders","_SpawnRGroup","_CTR","_grp", "_GoodPads","_LiveForces","_CLiveForces","_CStartForces","_TickTime","_ExtraArgs"
    ];

_side = _this select 0;
_SpawnPads =  [];
_StartForces = [];
_coreObj = _this select 1;
_sidetick = _this select 2;
_faction = _this select 3;
_Threshold = _this select 4;
_Leaders = _this select 5;
_TickTime = _this select 7;
if ((count _this) >= 9) then {_ExtraArgs = _this select 8;};
_flight = [1];
if ((count _this) >= 10) then {_flight = _this select 9;};

if (isNil ("_TickTime")) then {_TickTime = 15};


{
    if (_x isKindOf "HeliH") then {_SpawnPads pushback _x};
    if ((_x isKindOf "Air") and not ((crew _x) isequalto [])) then {_StartForces pushback _x};
} forEach (synchronizedObjects _coreObj);

if (_StartForces isequalto []) then {_StartForces = [objNull]};
if (_SpawnPads isequalto []) then {_SpawnPads = [_coreObj]};



_LiveForces = _StartForces;

_CurrentForces = count _LiveForces;

_CStartForces = count _StartForces;


sleep 5;

if (isNil ("RydHQ_Included")) then {RydHQ_Included = []};
if (isNil ("RydHQB_Included")) then {RydHQB_Included = []};
if (isNil ("RydHQC_Included")) then {RydHQC_Included = []};
if (isNil ("RydHQD_Included")) then {RydHQD_Included = []};
if (isNil ("RydHQE_Included")) then {RydHQE_Included = []};
if (isNil ("RydHQF_Included")) then {RydHQF_Included = []};
if (isNil ("RydHQG_Included")) then {RydHQG_Included = []};
if (isNil ("RydHQH_Included")) then {RydHQH_Included = []};

if (isNil ("LeaderHQ")) then {LeaderHQ = objNull};
if (isNil ("LeaderHQB")) then {LeaderHQB = objNull};
if (isNil ("LeaderHQC")) then {LeaderHQC = objNull};
if (isNil ("LeaderHQD")) then {LeaderHQD = objNull};
if (isNil ("LeaderHQE")) then {LeaderHQE = objNull};
if (isNil ("LeaderHQF")) then {LeaderHQF = objNull};
if (isNil ("LeaderHQG")) then {LeaderHQG = objNull};
if (isNil ("LeaderHQH")) then {LeaderHQH = objNull};




if (_faction == "B") then {

    _Pool = 
        [
            "FIR_F16C",
            "FIR_F15C_Blank"
        
        ]
};

if (_faction == "O") then {

    _Pool = 
        [
            "rhs_mig29s_vvsc",
            "RHS_Su25SM_vvsc",
            "Su33_Protatype_PT_2"
        
        ]
};

if (_faction == "I") then {

    _Pool = 
        [
        
        ]
};

if (_faction == "custom") then {

    _Pool = _this select 6;
};


while {true} do 

    {

    _GoodPads = [];

    {
        if ((alive _x) or (_x getVariable ["HOT",false])) then {

            _GoodPads pushback _x;
            
        };
    
    } forEach _SpawnPads;

    _CLiveForces = _LiveForces;

    {
        if (!alive _x) then {_LiveForces = (_LiveForces - [_x])}
    } forEach _CLiveForces;

    _CurrentForces = count _LiveForces;


    if ((_CurrentForces) < (_Threshold*_CStartForces)) then 
        {
            _chosenFlight = (selectRandom _flight);

            if ((_sidetick > 0) and not (_GoodPads isequalto [])) then {

                private ["_grp"];

                _grp = [_GoodPads,_side,_Pool,_Leaders,_chosenFlight] call SpawnARGroupA;

                sleep 1;
                
                _sidetick = (_sidetick - _chosenFlight);
                {if not ((vehicle _x) in _LiveForces) then {_LiveForces pushback (vehicle _x)}} foreach (units _grp);

                if not (isNil "_ExtraArgs") then {(leader _grp) call compile _ExtraArgs};

                    
            };  
        };

    if (_sidetick <= 0) exitwith {};

    sleep _TickTime;
    };