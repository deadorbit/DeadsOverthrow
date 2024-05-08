params[["_faction",""],["_veh",""]];
_faction = "gm_fc_gc_bgs";

private _data = {
	private _cls = _this;
	//GM classes
	if(_cls iskindof "gm_t55am2b_base") exitwith {[_cls,[525000,0,350,30]]};
	if(_cls iskindof "gm_t55am2_base") exitwith {[_cls,[500000,0,350,25]]};
	if(_cls iskindof "gm_t55ak_base") exitwith {[_cls,[350000,0,350,25]]};
	if(_cls iskindof "gm_t55a_base") exitwith {[_cls,[300000,0,325,20]]};
	if(_cls iskindof "gm_t55_base") exitwith {[_cls,[250000,0,300,20]]};
	if(_cls iskindof "gm_pt76b_base") exitwith {[_cls,[150000,5,125,5]]};
	if(_cls iskindof "gm_2s1_base") exitwith {[_cls,[2000000,0,250,50]]};
	if(_cls iskindof "gm_2p16_base") exitwith {[_cls,[1000000,0,250,50]]};
	if(_cls iskindof "gm_ural375d_mlrs_base") exitwith {[_cls,[1500000,10,250,50]]};
	if(_cls iskindof "gm_zsu234_base") exitwith {[_cls,[400000,0,400,25]]};
	if(_cls iskindof "gm_brdm2_base") exitwith {[_cls,[35000,5,75,5]]};
	if(_cls iskindof "gm_bmp1_base") exitwith {[_cls,[60000,0,250,10]]};
	if(_cls iskindof "gm_ot64a_base") exitwith {[_cls,[40000,5,75,10]]};
	if(_cls iskindof "gm_ural4320_reammo_base") exitwith {[_cls,[115000,5,30,5]]};
	if(_cls iskindof "gm_ural375d_refuel_base") exitwith {[_cls,[115000,5,30,5]]};
	if(_cls iskindof "gm_ural4320_base") exitwith {[_cls,[100000,5,30,5]]};
	if(_cls iskindof "gm_mi2_base") exitwith {[_cls,[250000,0,45,15]]};
	if(_cls iskindof "gm_uaz469_base") exitwith {[_cls,[20000,5,25,0]]};
	if(_cls iskindof "gm_ural375d_base") exitwith {[_cls,[100000,5,25,0]]};
	if(_cls iskindof "gm_uaz469_armed_base") exitwith {[_cls,[25000,5,25,5]]};
	if(_cls iskindof "gm_btr60pa_dshkm_base") exitwith {[_cls,[40000,5,80,10]]};
	if(_cls iskindof "gm_btr60pb_base") exitwith {[_cls,[45000,5,80,10]]};
	if(_cls iskindof "gm_btr60_base") exitwith {[_cls,[45000,0,50,5]]};
	if(_cls iskindof "gm_p601_base") exitwith {[_cls,[5000,1,5,5]]};
	if(_cls iskindof "gm_l410_base") exitwith {[_cls,[125000,20,50,40]]};

	if(_cls iskindof "rhs_bmd1") exitwith {[_cls,[55000,0,100,5]]};
	if(_cls iskindof "rhs_bmd1p") exitwith {[_cls,[80000,0,100,15]]};
	if(_cls iskindof "rhs_bmd2_base") exitwith {[_cls,[125000,0,300,15]]};
	if(_cls iskindof "B_AFV_Wheeled_01_up_cannon_F") exitwith {[_cls,[200000,0,300,35]]};
	if(_cls iskindof "B_Truck_01_fuel_F") exitwith {[_cls,[95000,10,30,0]]};
	if(_cls iskindof "B_Truck_01_Repair_F") exitwith {[_cls,[95000,10,30,0]]};
	if(_cls iskindof "B_APC_Tracked_01_AA_F") exitwith {[_cls,[500000,0,400,25]]};
	if(_cls iskindof "Plane_Fighter_03_base_F") exitwith {[_cls,[1500000,0,500,100]]};
	if(_cls iskindof "APC_Wheeled_01_mortar_base_lxWS") exitwith {[_cls,[400000,0,400,50]]};
	if(_cls iskindof "APC_Wheeled_01_atgm_base_lxWS") exitwith {[_cls,[350000,0,250,25]]};
	if(_cls iskindof "APC_Wheeled_01_command_base_lxWS") exitwith {[_cls,[100000,0,100,5]]};
	if(_cls iskindof "Quadbike_01_base_F") exitwith {[_cls,[500,0,3,0]]};
	if(_cls iskindof "UK3CB_M60a1") exitwith {[_cls,[500000,0,400,25]]};
	if(_cls iskindof "UK3CB_FV4201") exitwith {[_cls,[550000,5,400,25]]};
	if(_cls iskindof "UK3CB_M60a3") exitwith {[_cls,[550000,5,400,25]]};
	if(_cls iskindof "Plane_CAS_01_base_F") exitwith {[_cls,[2750000,0,500,150]]};
	if(_cls iskindof "rhs_mig29s_base") exitwith {[_cls,[2000000,0,500,100]]};
	if(_cls iskindof "Plane_Fighter_01_Base_F") exitwith {[_cls,[2000000,0,500,100]]};
	if(_cls iskindof "O_APC_Tracked_02_30mm_lxWS") exitwith {[_cls,[400000,0,250,25]]};
	if(_cls iskindof "AFV_Wheeled_01_base_F") exitwith {[_cls,[145000,0,300,15]]};
	if(_cls iskindof "rhs_a3t72tank_base") exitwith {[_cls,[450000,0,500,20]]};
	if(_cls iskindof "UAV_02_Base_lxWS") exitwith {[_cls,[7500,1,5,0]]};
	if(_cls iskindof "UAV_06_base_F") exitwith {[_cls,[2000,1,2,0]]};
	if(_cls iskindof "UGV_02_Base_F") exitwith {[_cls,[2000,1,2,0]]};
	if(_cls iskindof "APC_Wheeled_02_unarmed_base_lxws") exitwith {[_cls,[30000,0,200,5]]};
	if(_cls iskindof "rhs_bmp2e_vdv") exitwith {[_cls,[110000,0,300,15]]};
	if(_cls iskindof "AT_01_base_F") exitwith {[_cls,[200000,1,0,1]]};
	if(_cls iskindof "O_APC_Tracked_02_AA_F") exitwith {[_cls,[600000,0,400,25]]};
	if(_cls iskindof "O_APC_Tracked_02_cannon_F") exitwith {[_cls,[300000,0,250,20]]};
	if(_cls iskindof "B_APC_Tracked_01_base_F") exitwith {[_cls,[350000,0,300,20]]};
	if(_cls iskindof "B_APC_Wheeled_01_base_F") exitwith {[_cls,[250000,0,200,15]]};
	if(_cls iskindof "UK3CB_M939_Zu23") exitwith {[_cls,[60000,50,200,10]]};
	if(_cls iskindof "UK3CB_SUV_Armoured_Base") exitwith {[_cls,[30000,2,25,2]]};
	if(_cls iskindof "rhs_pts_base") exitwith {[_cls,[100000,0,50,5]]};
	if(_cls iskindof "rhs_2s1tank_base") exitwith {[_cls,[2000000,0,250,50]]};
	if(_cls iskindof "rhsusf_m1025_w_m2") exitwith {[_cls,[300000,0,40,2]]};
	if(_cls iskindof "rhsusf_M1151_GPK_PKM_base") exitwith {[_cls,[300000,0,40,2]]};
	if(_cls iskindof "APC_Wheeled_02_hmg_base_lxws") exitwith {[_cls,[40000,0,250,5]]};
	if(_cls iskindof "Truck_02_aa_base_lxWS") exitwith {[_cls,[60000,50,200,10]]};
	if(_cls iskindof "StaticGrenadeLauncher") exitwith {[_cls,[55000,1,0,1]]};
	if(_cls iskindof "StaticMGWeapon") exitwith {[_cls,[36000,1,0,1]]};
	if(_cls iskindof "StaticMortar") exitwith {[_cls,[250000,1,0,1]]};
	if(_cls iskindof "rhs_D30_base") exitwith {[_cls,[300000,2,25,2]]};
	if(_cls iskindof "rhs_btr60_base") exitwith {[_cls,[25000,0,20,5]]};
	if(_cls iskindof "rhs_btr70_vmf") exitwith {[_cls,[30000,0,30,5]]};
	if(_cls iskindof "rhsusf_m113_usarmy_unarmed") exitwith {[_cls,[30000,0,25,5]]};
	if(_cls iskindof "rhsusf_m113_usarmy_M2_90") exitwith {[_cls,[40000,0,35,5]]};
	if(_cls iskindof "rhsusf_m113_usarmy_MK19") exitwith {[_cls,[45000,0,35,5]]};
	if(_cls iskindof "Heli_Transport_03_base_F") exitwith {[_cls,[750000,0,110,5]]};
	if(_cls iskindof "Heli_Transport_02_base_F") exitwith {[_cls,[200000,20,350,25]]};
	if(_cls iskindof "Boat_Armed_01_base_F") exitwith {[_cls,[200000,0,200,20]]};
	if(_cls iskindof "UAV_02_base_F") exitwith {[_cls,[150000,0,150,50]]};
	if(_cls iskindof "UAV_05_Base_F") exitwith {[_cls,[500000,0,150,100]]};
	if(_cls iskindof "UAV_01_base_F") exitwith {[_cls,[1000,1,2,0]]};
	if(_cls iskindof "RHS_Ural_Fuel_MSV_01") exitwith {[_cls,[60000,2,25,5]]};
	if(_cls iskindof "UK3CB_M939_Guntruck") exitwith {[_cls,[60000,2,25,2]]};
	if(_cls iskindof "UK3CB_M939_Reammo") exitwith {[_cls,[60000,2,25,2]]};
	if(_cls iskindof "UK3CB_M939_Refuel") exitwith {[_cls,[60000,2,25,2]]};
	if(_cls iskindof "Van_01_fuel_base_F") exitwith {[_cls,[40000,2,25,2]]};
	if(_cls iskindof "Van_01_transport_base_F") exitwith {[_cls,[20000,2,25,2]]};
	if(_cls iskindof "Truck_02_fuel_base_F") exitwith {[_cls,[70000,2,25,2]]};
	if(_cls iskindof "Offroad_01_armor_AT_lxWS") exitwith {[_cls,[25000,5,50,0]]};
	if(_cls iskindof "Offroad_01_armor_armed_lxWS") exitwith {[_cls,[25000,5,50,0]]};
	if(_cls iskindof "Offroad_01_armor_base_lxWS") exitwith {[_cls,[20000,5,30,0]]};
	if(_cls iskindof "MRAP_01_gmg_base_F") exitwith {[_cls,[35000,5,30,0]]};
	if(_cls iskindof "MRAP_01_hmg_base_F") exitwith {[_cls,[35000,5,30,0]]};
	if(_cls iskindof "MRAP_01_base_F") exitwith {[_cls,[25000,5,30,0]]};
	if(_cls iskindof "UK3CB_GAZ_Vodnik_Cannon") exitwith {[_cls,[50000,0,45,5]]};
	if(_cls iskindof "UK3CB_AAF_I_GAZ_Vodnik_KVPT") exitwith {[_cls,[35000,0,30,5]]};
	if(_cls iskindof "UK3CB_GAZ_Vodnik_PKT") exitwith {[_cls,[35000,0,30,5]]};
	if(_cls iskindof "UK3CB_GAZ_Vodnik_Base") exitwith {[_cls,[30000,0,30,5]]};
	if(_cls iskindof "LSV_01_unarmed_base_F") exitwith {[_cls,[20000,5,30,0]]};
	if(_cls iskindof "LSV_01_base_F") exitwith {[_cls,[25000,5,50,0]]};
	if(_cls iskindof "Offroad_01_AT_base_F") exitwith {[_cls,[20000,5,30,0]]};
	if(_cls iskindof "Offroad_01_armed_base_F") exitwith {[_cls,[20000,5,30,0]]};
	if(_cls iskindof "UGV_01_base_F") exitwith {[_cls,[20000,5,30,0]]};
	if(_cls iskindof "UK3CB_MTLB_Zu23") exitwith {[_cls,[80000,0,50,5]]};
	if(_cls iskindof "RHS_Ural_Zu23_Base") exitwith {[_cls,[80000,0,50,5]]};
	if(_cls iskindof "Truck_02_MRL_base_F") exitwith {[_cls,[1750000,0,250,50]]};
	if(_cls iskindof "rhsusf_hmmwe_base") exitwith {[_cls,[50000,0,40,2]]};
	if(_cls iskindof "UK3CB_SUV_Armed_Base") exitwith {[_cls,[50000,0,40,2]]};
	if(_cls iskindof "UK3CB_Pickup_M2") exitwith {[_cls,[20000,5,30,0]]};
	if(_cls iskindof "UK3CB_LandRover_SF_AGS30") exitwith {[_cls,[30000,5,30,5]]};
	if(_cls iskindof "UK3CB_LandRover_SF_M2") exitwith {[_cls,[30000,5,30,5]]};
	if(_cls iskindof "UK3CB_LandRover_M2") exitwith {[_cls,[25000,5,30,5]]};
	if(_cls iskindof "UK3CB_LandRover_AGS301`") exitwith {[_cls,[25000,5,30,5]]};
	if(_cls iskindof "UK3CB_LandRover_SPG9") exitwith {[_cls,[25000,5,30,5]]};
	if(_cls iskindof "UK3CB_LandRover_Base") exitwith {[_cls,[20000,5,30,0]]};
	if(_cls iskindof "rhsusf_m1151_base") exitwith {[_cls,[50000,0,40,2]]};
	if(_cls iskindof "MBT_01_arty_base_F") exitwith {[_cls,[2100000,0,250,50]]};
	if(_cls iskindof "MBT_01_mlrs_base_F") exitwith {[_cls,[2750000,0,300,75]]};
	if(_cls iskindof "rhs_kraz255_base") exitwith {[_cls,[30000,2,25,2]]};
	if(_cls iskindof "MBT_02_base_F") exitwith {[_cls,[2000000,0,600,50]]};
	if(_cls iskindof "RHS_Mi8_base") exitwith {[_cls,[300000,5,75,0]]};
	if(_cls iskindof "Heli_Attack_02_base_F") exitwith {[_cls,[2528000,0,80,5]]};
	if(_cls iskindof "RHS_Ural_Base") exitwith {[_cls,[30000,2,25,2]]};
	if(_cls iskindof "RHS_BM21_MSV_01") exitwith {[_cls,[1500000,0,250,50]]};
	if(_cls iskindof "rhs_gaz66_ammo_base") exitwith {[_cls,[50000,2,25,2]]};
	if(_cls iskindof "rhs_gaz66_zu23_base") exitwith {[_cls,[80000,0,50,5]]};
	if(_cls iskindof "rhs_gaz66_vmf") exitwith {[_cls,[30000,2,25,2]]};
	if(_cls iskindof "rhs_zil131_base") exitwith {[_cls,[30000,2,25,2]]};
	if(_cls iskindof "UK3CB_M939_Base") exitwith {[_cls,[30000,2,25,2]]};
	if(_cls iskindof "RHS_su25_base") exitwith {[_cls,[1700000,50,500,25]]};
	if(_cls iskindof "rhs_zsutank_base") exitwith {[_cls,[400000,0,400,25]]};
	if(_cls iskindof "rhs_bmp1tank_base") exitwith {[_cls,[60000,0,250,10]]};
	if(_cls iskindof "UK3CB_MTLB_PKT") exitwith {[_cls,[25000,0,20,5]]};
	if(_cls iskindof "Truck_01_base_F") exitwith {[_cls,[50000,10,30,0]]};
	if(_cls iskindof "rhs_uh1h_hidf_gunship") exitwith {[_cls,[250000,0,45,15]]};
	if(_cls iskindof "rhs_uh1h_hidf") exitwith {[_cls,[175000,0,45,15]]};
	if(_cls iskindof "Offroad_01_base_F") exitwith {[_cls,[15000,0,15,2]]};
	if(_cls iskindof "Truck_02_base_F") exitwith {[_cls,[30000,2,25,2]]};
	if(_cls iskindof "UK3CB_UH1H_BASE") exitwith {[_cls,[150000,0,45,10]]};
	if(_cls iskindof "B_MBT_01_TUSK_F") exitwith {[_cls,[2200000,0,400,35]]};
	if(_cls iskindof "B_MBT_01_cannon_F") exitwith {[_cls,[2000000,0,400,35]]};
	if(_cls iskindof "Rubber_duck_base_F") exitwith {[_cls,[7000,5,5,5]]};
	if(_cls iskindof "Heli_Transport_01_base_F") exitwith {[_cls,[350000,0,65,15]]};
	if(_cls iskindof "Heli_Light_01_armed_base_F") exitwith {[_cls,[300000,0,50,15]]};
	if(_cls iskindof "Heli_Light_01_base_F") exitwith {[_cls,[200000,0,30,15]]};
	if(_cls iskindof "Heli_Attack_01_base_F") exitwith {[_cls,[2528000,0,80,5]]};
	if(_cls iskindof "MBT_03_base_F") exitwith {[_cls,[1850000,0,550,100]]};
	if(_cls iskindof "VTOL_01_base_F") exitwith {[_cls,[950000,0,400,50]]};
	if(_cls iskindof "UK3CB_Cessna_T41_Armed_Base") exitwith {[_cls,[200000,5,100,10]]};
	if(_cls iskindof "UK3CB_Cessna_T41_Base") exitwith {[_cls,[110000,0,105,10]]};
	if(_cls iskindof "UAV_03_base_F") exitwith {[_cls,[125000,0,125,50]]};
	if(_cls iskindof "rhsgref_BRDM2UM") exitwith {[_cls,[15000,0,35,5]]};
	if(_cls iskindof "rhsgref_BRDM2_ATGM") exitwith {[_cls,[100000,0,75,5]]};
	if(_cls iskindof "rhsgref_BRDM2") exitwith {[_cls,[30000,0,35,5]]};
	
	systemchat format["Warning: no values found for %1",_cls];
	[_cls,[-1,-1,-1,-1]]
};



private _vehCls = [];
private _vehConfigs = [];
private _returnvals = [];
if(_faction != "") then {
	_vehConfigs = format["
		 (getText ( _x >> ""faction"" ) isEqualTo ""%1"")
		 &&
		 !(configname _x iskindof ""CAManbase"")",_faction] configClasses ( configFile >> "cfgVehicles" );

	/*private _vestconfig = format["
		 (getText ( _x >> ""dlc"" ) isEqualTo ""%1"")
		 &&
		 (getText ( _x >> ""_generalMacro"") isEqualTo ""H_HelmetB"")",_faction] configClasses ( configFile >> "CfgWeapons" );
	*/

	{
		private _cls = configname _x;
		if(_cls iskindof "allvehicles" && !(_cls iskindof "StaticWeapon") && !(_cls iskindof "gm_staticWeapon_base")) then {
			_vehCls pushbackunique _cls;
		};
	}foreach(_vehConfigs);

	{
		private _append = _x call _data;
		_returnvals pushback _append;
	}foreach(_vehCls);

	[_returnvals,[],{((_x select 1) select 0)}] call BIS_fnc_sortby;
}else{
	_veh call _data;
};