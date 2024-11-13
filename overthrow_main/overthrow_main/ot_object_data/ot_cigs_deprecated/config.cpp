////////////////////////////////////////////////////////////////////
//DeRap: config.bin
//Produced from mikero's Dos Tools Dll version 9.45
//https://mikero.bytex.digital/Downloads
//'now' is Sun Jun 09 22:50:09 2024 : 'file' last modified on Sun Jun 09 18:46:27 2024
////////////////////////////////////////////////////////////////////

#define _ARMA_

class CfgPatches
{
	class OT_cigs_deprecated
	{
		author = "OT Community";
		version = 1.0;
		requiredAddons[] = {"ace_goggles"};
		units[] = {};
		weapons[] = {};
	};
};
class CfgGlasses
{
	class None;
	class murshun_cigs_cig0: None
	{
		author = "Rebel / Facel";
		mass = 0.02;
		displayName = "Spliff";
		model = "\overthrow_main\ot_object_data\ot_cigs_deprecated\cig0.p3d";
		picture = "\overthrow_main\ot_object_data\ot_cigs_deprecated\ui\gear_cig0_x_ca";
		identityTypes[] = {};
		ot_shopignore = 1;
	};
	class murshun_cigs_cig1: murshun_cigs_cig0
	{
		author = "Rebel / Facel";
		displayName = "Spliff (Stage 1)";
		model = "\overthrow_main\ot_object_data\ot_cigs_deprecated\cig1.p3d";
		picture = "\overthrow_main\ot_object_data\ot_cigs_deprecated\ui\gear_cig1_x_ca";
	};
	class murshun_cigs_cig2: murshun_cigs_cig0
	{
		author = "Rebel / Facel";
		displayName = "Spliff (Stage 2)";
		model = "\overthrow_main\ot_object_data\ot_cigs_deprecated\cig2.p3d";
		picture = "\overthrow_main\ot_object_data\ot_cigs_deprecated\ui\gear_cig2_x_ca";
	};
	class murshun_cigs_cig3: murshun_cigs_cig0
	{
		author = "Rebel / Facel";
		displayName = "Spliff (Stage 3)";
		model = "\overthrow_main\ot_object_data\ot_cigs_deprecated\cig3.p3d";
		picture = "\overthrow_main\ot_object_data\ot_cigs_deprecated\ui\gear_cig3_x_ca";
	};
	class murshun_cigs_cig4: murshun_cigs_cig0
	{
		author = "Rebel / Facel";
		displayName = "Spliff (Stage 4)";
		model = "\overthrow_main\ot_object_data\ot_cigs_deprecated\cig4.p3d";
		picture = "\overthrow_main\ot_object_data\ot_cigs_deprecated\ui\gear_cig4_x_ca";
	};
};
class CfgSounds
{
	sounds[] = {};
	class ot_unwrap
	{
		sound[] = {"\overthrow_main\ot_object_data\ot_cigs_deprecated\data\sounds\murshun_cigs_unwrap.ogg",2,1,15};
		titles[] = {};
	};
	class murshun_cigs_matches_01
	{
		sound[] = {"\overthrow_main\ot_object_data\ot_cigs_deprecated\data\sounds\murshun_cigs_matches_01.ogg",2,1,15};
		titles[] = {};
	};
	class murshun_cigs_lighter_01
	{
		sound[] = {"\overthrow_main\ot_object_data\ot_cigs_deprecated\data\sounds\murshun_cigs_lighter_01.ogg",2,1,15};
		titles[] = {};
	};
};
