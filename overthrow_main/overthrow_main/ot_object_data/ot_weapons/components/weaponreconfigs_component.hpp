#define MAGWELL223 \
	magazines[] = {"OT_20Rnd_233Rem_mag","OT_30Rnd_233Rem_mag","rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red","rhs_mag_30Rnd_556x45_M855_Stanag","rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk262_Stanag","rhs_mag_30Rnd_556x45_M193_Stanag","rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red","rhs_mag_30Rnd_556x45_M200_Stanag"}; \
	magazineWell[] = {"OT_223Rem","STANAG_556x45","STANAG_556x45_Large","CBA_556x45_STANAG","CBA_556x45_STANAG_L","CBA_556x45_STANAG_XL","CBA_556x45_STANAG_2D","CBA_556x45_STANAG_2D_XL"}


class rhs_weap_m4_Base;
class rhs_weap_m4 : rhs_weap_m4_Base{
	class Burst;
	class fullAuto;
	class fullauto_medium;
	class Single;
	class Single_AI;
	class single_medium_optics1;
	class single_far_optics2;
};

class ot_rhs_weap_m4_le6920 : rhs_weap_m4 {
	displayName = "Colt LE6920";
	descriptionShort = "Police Carbine<br/>Caliber: 223Rem/5.56 NATO";
	baseWeapon = "ot_rhs_weap_m4_le6920";
	
	reloadTime = 0.13;
	modes[] = {"Single","Single_AI","single_medium_optics1","single_far_optics2"};
	MAGWELL223;
	class Single : Single {
		reloadTime = 0.13;
	};
	class Single_AI : Single_AI {
		reloadTime = 0.13;
	};
	class single_medium_optics1 : single_medium_optics1 {
		reloadTime = 0.13;
	};
	class single_far_optics2 : single_far_optics2 {
		reloadTime = 0.13;
	};
};

class rhs_weap_m4a1_blockII;
class rhs_weap_m4a1_blockII_bk : rhs_weap_m4a1_blockII {
	class Burst;
	class fullAuto;
	class fullauto_medium;
	class Single;
	class Single_AI;
	class single_medium_optics1;
	class single_far_optics2;
};

class ot_rhs_weap_m4_le6920T : rhs_weap_m4a1_blockII_bk {
	displayName = "Colt LE6920-T";
	descriptionShort = "Police Carbine<br/>Caliber: 223Rem/5.56 NATO";
	baseWeapon = "ot_rhs_weap_m4_le6920T";
	
	reloadTime = 0.13;
	modes[] = {"Single","Single_AI","single_medium_optics1","single_far_optics2"};
	MAGWELL223;
	class Single : Single {
		reloadTime = 0.13;
	};
	class Single_AI : Single_AI {
		reloadTime = 0.13;
	};
	class single_medium_optics1 : single_medium_optics1 {
		reloadTime = 0.13;
	};
	class single_far_optics2 : single_far_optics2 {
		reloadTime = 0.13;
	};
};

class arifle_SPAR_02_blk_F;
class ot_weap_mr556 : arifle_SPAR_02_blk_F {
	displayName = "MR556";
	descriptionShort = "Police Carbine<br/>Caliber: 5.56 NATO";
	baseWeapon = "ot_weap_mr556";
	
	modes[] = {"Single","single_medium_optics1","single_medium_optics2"};
};

class arifle_MXM_Black_F;
class ot_weap_mxp : arifle_MXM_Black_F {
	displayName = "MXP";
	descriptionShort = "Police Rifle<br/>Caliber: 5.56 NATO";
	modes[] = {"Single","single_medium_optics1","single_medium_optics2"};
};

class arifle_CTAR_blk_F;
class ot_weap_type97b : arifle_CTAR_blk_F {
	displayName = "Type97B";
	descriptionShort = "Police Rifle<br/>Caliber: 5.8x42mm";
	modes[] = {"Single","single_medium_optics1","single_medium_optics2"};
};

/*
	class sgun_HunterShotgun_01_sawedoff_base_F;
	class sgun_HunterShotgun_01_sawedoff_F : sgun_HunterShotgun_01_sawedoff_base_F {
		class WeaponSlotsInfo;
	};
	class OT_sgun_sawedoff_Pistol : sgun_HunterShotgun_01_sawedoff_F {
		displayName = "Kozlize Pistol";
		descriptionShort = "Shotgun<br/>Caliber: 12g";
		baseWeapon = "OT_sgun_sawedoff_Pistol";
		reloadAction = "GestureReloadPistol";
		type = 2;
		handAnim[] = {};
		recoil = "recoil_pistol_acpc2";
		
		class WeaponSlotsInfo {
			holsterScale = 0;
		};
	};
*/

//Civ nightvision, just normal night vision but heavier
class NVGoggles_OPFOR;
class ACE_NVG_Gen1 : NVGoggles_OPFOR {
	class ItemInfo;
};
class ot_ace_civ_nvg : ACE_NVG_Gen1 {
	descriptionShort = "Night Vision Goggles<br/>Will not spite NATO, heavier than normal.";
	displayName = "Civilian NV Goggles (Gen1, Black)";
	class ItemInfo {
		mass = 35;
	};
};

class NVGoggles;
class ACE_NVG_Gen1_Brown : NVGoggles {
	class ItemInfo;
};
class ot_ace_civ_nvg_brown : ACE_NVG_Gen1_Brown {
	descriptionShort = "Night Vision Goggles<br/>Will not spite NATO, heavier than normal.";
	displayName = "Civilian NV Goggles (Gen1, Brown)";
	class ItemInfo {
		mass = 35;
	};
};

class NVGoggles_INDEP;
class ACE_NVG_Gen1_Green : NVGoggles_INDEP {
	class ItemInfo;
};
class ot_ace_civ_nvg_green : ACE_NVG_Gen1_Green {
	descriptionShort = "Night Vision Goggles<br/>Will not spite NATO, heavier than normal.";
	displayName = "Civilian NV Goggles (Gen1, Green)";
	class ItemInfo {
		mass = 35;
	};
};