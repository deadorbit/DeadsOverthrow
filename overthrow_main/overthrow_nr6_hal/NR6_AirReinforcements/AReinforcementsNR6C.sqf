// [Side, Spawning helipads/objects (array), Starting aircraft (array), Availabe empty aircraft (array), Threshold (0 to 1), Leaders (aray), Delay time between checks (seconds), code to execute on spawned groups (_this stands for squad leader)] spawn NR6_fnc_AirReinforcementsB;

private 
    [
    "_side","_coreObj","_SpawnPads","_sideForces","_sidetick","_faction","_CurrentForces","_Pool","_Threshold","_Leaders","_SpawnRGroup","_CTR","_grp", "_GoodPads","_LiveForces","_CLiveForces","_CStartForces","_TickTime","_GoodsideForces","_ExtraArgs"
    ];

_side = _this select 0;
_StartForces = [];
_sideForces = [];
_coreObj = _this select 1;
_Threshold = _this select 2;
_Leaders = _this select 3;
_TickTime = _this select 4;
if ((count _this) >= 6) then {_ExtraArgs = _this select 5};

if (isNil ("_TickTime")) then {_TickTime = 15};

{
    if ((_x isKindOf "Air") and ((crew _x) isequalto [])) then {_sideForces pushback _x};
    if ((_x isKindOf "Air") and not ((crew _x) isequalto [])) then {_StartForces pushback _x};
} forEach (synchronizedObjects _coreObj);

if (_StartForces isequalto []) then {_StartForces = [objNull]};


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


{

    [_side,_x,_Leaders] call SpawnARVicC;
    
} forEach _sideForces;


while {true} do 

    {

    _GoodsideForces = [];

    {
        _crewUnits = (units (_x getvariable ["Air_ReinforcementsNR6_Crew",grpNull]));
        _crewCount = count _crewUnits;
        _crewSize = (_x getvariable ["Air_ReinforcementsNR6_CrewSize",0]);

        if ((alive _x) and not (({not (_x in _crewUnits)} count (crew _x)) > 0) and (_crewCount >= _crewSize) and ((damage _x) < 0.4) and not (_x getvariable ["Air_ReinforcementsNR6_Taken",false])) then {

            _GoodsideForces pushBack _x;
            
        };
    
    } forEach _sideForces;


    _CLiveForces = _LiveForces;

    {
        if ( not (alive _x) or not (canMove _x)) then {_LiveForces = (_LiveForces - [_x])}
    } forEach _CLiveForces;

    _CurrentForces = count _LiveForces;

    testfor = _GoodsideForces;


    if ((_CurrentForces) < (_Threshold*_CStartForces)) then 
        {
            if ( not (_GoodsideForces isequalto [])) then {

                private ["_selectedAircraft"];

                _selectedAircraft = [_side,_GoodsideForces,_Leaders] call SpawnARGroupC;

                sleep 1;
                
                _LiveForces pushback _selectedAircraft;

                if not (isNil "_ExtraArgs") then {(leader (_selectedAircraft getvariable ["Air_ReinforcementsNR6_Crew",grpNull])) call compile _ExtraArgs};

                    
            };  
        };

    if (_GoodsideForces isequalto []) exitwith {};

    sleep _TickTime;
    };