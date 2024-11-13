params ["_veh"];

private _returnVal = 0;
if ((_veh isKindOf "rhs_mig29s_base") ||
	 (_veh isKindOf "RHS_su25_base") ||
	 (_veh isKindOf "RHS_T50_base") ||
	 (_veh isKindOf "RHS_TU95MS_base") ||
	 (_veh isKindOf "Heli_Attack_02_base_F") ||
	 (_veh isKindOf "Plane_Fighter_03_base_F") ||
	 (_veh isKindOf "Plane_CAS_02_base_F") ||
	 (_veh isKindOf "RHS_Mi24_base") ||
	 (_veh isKindOf "rhs_t14_base") ||
	 (_veh isKindOf "Plane_Fighter_02_Base_F") ||
	 (_veh isKindOf "Plane_Fighter_04_Base_F") ||
	 (_veh isKindOf "OTR21_Base") ||
	 (_veh isKindOf "VTOL_02_base_F")
) then {							
	_returnVal = 5;
} else {
	if (
		(_veh isKindOf "rhs_tank_base") ||
		(_veh isKindOf "RHS_Mi8_base") ||
		(_veh isKindOf "Heli_Light_02_base_F") ||
		(_veh isKindOf "rhs_a3spruttank_base") ||
		(_veh isKindOf "rhs_a3t72tank_base") ||
		(_veh isKindOf "rhs_t14_base") ||
		(_veh isKindOf "MBT_04_base_F") ||
		(_veh isKindOf "MBT_02_base_F") ||
		(_veh isKindOf "MBT_03_base_F") ||
		(_veh isKindOf "UAV_02_base_F") ||
		(_veh isKindOf "Heli_Transport_02_base_F") ||
		(_veh isKindOf "Heli_Transport_04_base_F") ||
		(_veh isKindOf "Heli_light_03_base_F") ||
		(_veh isKindOf "UAV_04_base_F") ||
		(_veh isKindOf "gm_zsu234_base")
	) then {									
		_returnVal = 4;
	} else {
		if (
			(_veh isKindOf "rhs_bmp_base") || 
			(_veh isKindOf "rhs_bmd_base") || 
			(_veh isKindOf "APC_Tracked_03_base_F") || 
			(_veh isKindOf "APC_Wheeled_03_base_F") || 
			(_veh isKindOf "APC_Wheeled_02_base_F") || 
			(_veh isKindOf "APC_Tracked_02_base_F") || 
			(_veh isKindOf "rhs_zsutank_base") || 
			(_veh isKindOf "rhs_2s1tank_base") || 
			(_veh isKindOf "rhs_2s3tank_base") ||
			(_veh isKindOf "gm_bmp1_base") ||
			(_veh iskindof "gm_tracked_Artillery_base") ||
			(_veh iskindof "gm_mi2_base") ||
			(_veh iskindof "gm_t55_base")
		) then {
			_returnVal = 3;
		} else {
			if (
				(_veh isKindOf "MRAP_02_base_F") ||
				(_veh isKindOf "MRAP_03_base_F") ||
				(_veh isKindOf "rhs_btr_base") ||
				(_veh isKindOf "rhsgref_BRDM2") ||
				(_veh isKindOf "LT_01_base_F") ||
				(_veh isKindOf "UGV_01_rcws_base_F") ||
				(_veh isKindOf "Boat_Armed_01_base_F") ||
				(_veh isKindOf "gm_brdm2_base") ||
				(_veh isKindOf "gm_btr60_base") ||
				(_veh isKindOf "gm_ot64_base") ||
				(_veh isKindOf "gm_pt76_base")
			) then {
				_returnVal = 2;
			} else {
				if (
					(_veh isKindOf "RHS_UAZ_DShKM_Base") ||
					(_veh isKindOf "RHS_UAZ_AGS30_Base") ||
					(_veh isKindOf "rhsgref_BRDM2") ||
					(_veh isKindOf "Offroad_01_armed_base_F") ||
					(_veh isKindOf "Offroad_01_AT_base_F") ||
					(_veh isKindOf "RHS_Ural_Zu23_Base") ||
					(_veh isKindOf "rhs_gaz66_zu23_base") || 
					(_veh isKindOf "LSV_02_AT_base_F") ||
					(_veh isKindOf "RHS_BM21_MSV_01") ||
					(_veh isKindOf "Truck_02_MRL_base_F") ||
					(_veh iskindof "gm_ural375d_mlrs_base") ||
					(_veh iskindof "gm_uaz469_armed_base")
				) then {
					_returnVal = 1;
				};
			};
		};
	};
};

_returnVal
