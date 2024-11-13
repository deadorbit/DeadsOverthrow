//LEADERS SECTION
if (isServer) then {
    
RydHQ_Debug = false;
RydHQB_Debug = false;
RydHQC_Debug = false;
RydHQD_Debug = false;

RydHQ_ChatDebug = true;

RydHQ_SubAll = false;
RydHQB_SubAll = false;
RydHQC_SubAll = false;
RydHQD_SubAll = false;

NR6_SiteMarkNotif = false;

RydHQ_SubSynchro = true;
RydHQB_SubSynchro = true;
RydHQC_SubSynchro = true;
RydHQD_SubSynchro = true;

RydHQ_Rush = false;
RydHQB_Rush = false;
RydHQC_Rush = false;
RydHQD_Rush = false;

RydHQ_CargoFind = 1;   
RydHQB_CargoFind = 1;
RydHQC_CargoFind = 1;   
RydHQD_CargoFind = 1;

RydHQ_LZ = false;

RydxHQ_AIChatDensity = 10000;
RydHQ_HQChat = true;

RydHQ_Front = false;
RydHQB_Front = false;
RydHQC_Front = false;
RydHQD_Front = false;

RydHQ_MAtt = true;  
RydHQB_MAtt = true;
RydHQC_MAtt = true;  
RydHQD_MAtt = true;

RydHQ_Personality = "GENIUS";
RydHQB_Personality = "GENIUS";
RydHQC_Personality = "BRUTE";
RydHQD_Personality = "BRUTE"; 

RydHQ_Wait = 15; 

RydHQ_ObjHoldTime = 1;
RydHQB_ObjHoldTime = 1;  
RydHQD_ObjHoldTime = 1;   
RydHQC_ObjHoldTime = 1;  

RydHQ_AirDist = 400000;   
RydHQB_AirDist = 400000; 
RydHQC_AirDist = 400000;   
RydHQD_AirDist = 400000; 

RydART_Safe = 200;

RydHQ_IdleOrd = true;
RydHQB_IdleOrd = true;
RydHQC_IdleOrd = true;
RydHQD_IdleOrd = true;

RydHQ_ResetTime = 150; 
RydHQB_ResetTime = 150;
RydHQC_ResetTime = 150; 
RydHQD_ResetTime = 150;

RydHQ_KnowTL = false;

RydHQ_PathFinding = 0;


RydxHQ_MARatio = [0.40,0.30,0.25,-1];

RydHQ_AttackReserve = 0.2;
RydHQ_ReconReserve = 0.2;

RydHQ_ExInfo = true;
RydHQB_ExInfo = true;
RydHQC_ExInfo = true;
RydHQD_ExInfo = true;

RydHQ_Berserk = false;
RydHQB_Berserk = false;
RydHQC_Berserk = false;
RydHQD_Berserk = false;

RydHQ_Actions = true;

RydHQ_InfoMarkers = true;
RydxHQ_InfoMarkersID = false;

RydHQ_BBAOObj = 2;
RydHQC_BBAOObj = 2;

RydHQ_CRDefRes = 0.5;
RydHQB_CRDefRes = 0.5;
RydHQC_CRDefRes = 0.5;
RydHQD_CRDefRes = 0.5;


RydHQ_NoRec = 10000;
RydHQB_NoRec = 10000;
RydHQC_NoRec = 10000;
RydHQD_NoRec = 10000;

RydHQ_RapidCapt = 0;
RydHQB_RapidCapt = 0;
RydHQC_RapidCapt = 0;
RydHQD_RapidCapt = 0;


RydxHQ_ReconCargo = true;

//BIG BOSS SECTION

RydxHQ_GarrisonV2 = true;

RydxHQ_NoRestPlayers = true;
RydxHQ_NoCargoPlayers = true;

//RHQ SECTION

RHQ_Art = ["cup_b_m119_us","cup_b_m270_he_usa","lop_tka_static_d30","rhs_m119_d","rhs_m119_wd","rhs_2b14_82mm_vmf","rhs_2b14_82mm_msv","rhs_2b14_82mm_vdv","rhs_d30_vmf","rhs_d30_msv","rhs_d30_vdv","rhs_2s3_tv","rhsusf_m109d_usarmy","rhsusf_m109_usarmy","rhs_m252_d","rhs_m252_wd","rhs_bm21_msv_01","rhs_bm21_chdkz","rhs_bm21_vdv_01","rhs_bm21_vv_01","rhs_bm21_vmf_01","rhsusf_m142_usarmy_wd","rhsusf_m142_usarmy_d"];

RydHQ_Add_OtherArty = [
    [["cup_b_m270_he_usa","cup_b_m119_us"],["CUP_12Rnd_MLRS_HE","CUP_12Rnd_MLRS_HE","CUP_12Rnd_MLRS_HE","",""]],
    [["rhs_m119_d","rhs_m119_wd"],["RHS_mag_m1_he_12","RHS_mag_m1_he_12","RHS_mag_m1_he_12","rhs_mag_m60a2_smoke_4","rhs_mag_m314_ilum_4"]],
    [["lop_tka_static_d30"],["rhs_mag_of462_10","rhs_mag_of462_10","rhs_mag_of462_10","",""]],
    [["rhs_2b14_82mm_vmf","rhs_2b14_82mm_msv","rhs_2b14_82mm_vdv"],["rhs_mag_3vo18_10","rhs_mag_3vo18_10","rhs_mag_3vo18_10","rhs_mag_d832du_10","rhs_mag_3vs25m_10"]],
    [["rhs_d30_vmf","rhs_d30_msv","rhs_d30_vdv"],["rhs_mag_3of56_10","rhs_mag_3of69m_2","rhs_mag_3of56_10","rhs_mag_d462_2","rhs_mag_s463_2"]],
    [["rhs_2s3_tv"],["rhs_mag_HE_2a33","rhs_mag_LASER_2a33","rhs_mag_WP_2a33","rhs_mag_SMOKE_2a33","rhs_mag_ILLUM_2a33"]],
    [["rhsusf_m109d_usarmy","rhsusf_m109_usarmy"],["rhs_mag_155mm_m795_28","rhs_mag_155mm_m712_2","rhs_mag_155mm_m864_3","rhs_mag_155mm_m825a1_2","rhs_mag_155mm_485_2"]],
    [["rhs_m252_d","rhs_m252_wd"],["rhs_12Rnd_m821_HE","rhs_12Rnd_m821_HE","rhs_12Rnd_m821_HE","",""]],
    [["rhs_bm21_msv_01","rhs_bm21_chdkz","rhs_bm21_vdv_01","rhs_bm21_vv_01","rhs_bm21_vmf_01"],["RHS_mag_40Rnd_122mm_rockets","RHS_mag_40Rnd_122mm_rockets","RHS_mag_40Rnd_122mm_rockets","",""]],
    [["rhsusf_m142_usarmy_wd","rhsusf_m142_usarmy_d"],["rhs_ammo_m26a1_rocket","rhs_ammo_m26a1_rocket","rhs_ammo_m26a1_rocket","",""]],
    [["B_Ship_MRLS_01_F"],["magazine_Missiles_Cruise_01_x18","magazine_Missiles_Cruise_01_x18","magazine_Missiles_Cruise_01_Cluster_x18","",""]]
    ];

};

nul = [] execVM "overthrow_nr6_hal\RydHQInit.sqf"; 

if (isServer) then {[1500,0,false,2000,3000,2000,false,false,false] spawm NR6_fnc_ZBEInit};
