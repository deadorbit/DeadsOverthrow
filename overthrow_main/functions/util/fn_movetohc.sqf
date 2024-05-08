if (!isServer) exitWith{};
if(!isMultiplayer) exitWith{};
if(!HCEnabled) exitWith{};

waitUntil{time > 2};

_unit = _this select 0;
_HC = _this select 1;

if(isNull _HC) exitWith{};

_HCID = owner _HC;
_unitGroup = group _unit;

//{_x setOwner _HCid;}forEach(units _unitGroup);

_unitGroup setGroupOwner _HCid;