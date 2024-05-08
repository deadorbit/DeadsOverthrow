closedialog 0;

private _idx = lbCurSel 1500;
private _data = lbData [1500,_idx];
private _price = lbValue [1500,_idx];
_data = call compile _data;

private _mode = _data select 0;
private _textures = _data select 1;
private _stock = player call OT_fnc_getSearchStock;
private _required = ["ACE_SpraypaintRed","ACE_SpraypaintBlue","ACE_SpraypaintBlack","ACE_SpraypaintGreen"];
private _has = false;


{
	_has = false;
	private _req = _x;
	{
		private _cls = _x select 0;
		private _amnt = _x select 1;
		if(_cls == _req) then {
			if (_amnt >= _price) exitwith {
				_has = true;
			};
		};
	}foreach(_stock);
	
	if(!(_has)) exitwith{};
	
}foreach(_required);

if(!(_has) && !(OT_AdminMode)) exitwith {"You do not have enough spraypaint" call OT_fnc_notifyMinor};

{
	private _count = 0;
	while{_count < _price} do {
		[player,_x] call CBA_fnc_removeitem;
		_count = _count + 1;
	};
}foreach(_required);

_count = 0;
if(_mode == 0) then {
	[OT_paintTarget,_textures] call BIS_fnc_setObjectTexture;
}else{
	_count = 0;
	private _topaint = ["camo","camo1","camo2","camo3","camo4","camo5","camo6","camo7","camo8","camo9","camo10","camo11","camo12","camo13","camo14","camo15","camo_1","camo_2","camo_3","camo_4","camo_5","camo_01","camo_02","camo_03","camo_04","camo_05","tex_01","tex_02","tex_03","tex_04","tex_05","tex_06","tex_07","tex_08","exterior","CamoSlat","CamoNet"];
	private _type = typeof OT_paintTarget;
	
	call {
		if(gettext(configFile >> "CfgVehicles" >> _type >> "author") isequalto "Ivory") exitwith {
			_topaint = ["camo1"];
		};
		if(_type iskindof "Kart_01_Base_F" || _type iskindof "Offroad_01_base_F") exitwith {
			_topaint = ["camo"];
		};
		if(_type iskindof "Quadbike_01_base_F" || _type iskindof "Van_02_base_F" || _type iskindof "RHS_Mi8_base" || _type iskindof "rhs_btr60_base" || _type iskindof "rhs_btr70_vmf") exitwith {
			_topaint = ["camo1"];
		};
		if(_type iskindof "Heli_Transport_02_base_F" || _type iskindof "rhs_uh1h_base") exitwith {
			_topaint = ["camo1","camo2","camo3"];
		};
		if(_type iskindof "rhs_zsutank_base") exitwith {
			_topaint = ["camo1","camo2","camo4"];
		};
		if(_type iskindof "Plane_Fighter_04_Base_F" || _type iskindof "Plane_Fighter_02_Base_F" || _type iskindof "rhsgref_BRDM2") exitwith {
			_topaint = ["camo_01","camo_02"];
		};
	};
	{
		OT_paintTarget setObjectTextureGlobal[_x,_textures]; 
	}foreach(_topaint);
};
playSound3D ["z\ace\addons\tagging\sounds\spray.ogg", player, false, (eyePos player), 5, 1, 15];