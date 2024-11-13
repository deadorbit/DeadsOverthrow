params [["_faction",""]];

private _vehCls = [];
private _vehConfigs = [];
private _returnvals = [];
private _uniform = "";

_vehConfigs = format[" 
	 (getText ( _x >> ""faction"" ) isEqualTo ""%1"")
	 &&
	 (configname _x iskindof ""CAManbase"")",_faction] configClasses ( configFile >> "cfgVehicles" );
	 
if(count _vehConfigs == 0) exitwith {_uniform};
{
	_vehCls pushbackunique (configname _x);
}foreach(_vehConfigs);

private _man = selectrandom _vehCls;
private _uniform = gettext(configFile >> "CfgVehicles" >> _man >> "uniformClass");
_uniform