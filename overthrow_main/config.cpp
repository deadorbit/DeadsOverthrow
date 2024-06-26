#include "BIS_AddonInfo.hpp"
#include "script_mod.hpp"
#include "headers\config_macros.hpp"

class CfgPatches
{
	class OT_Overthrow_Main
	{
		author="Gerhart; Edited by deadorbit";
		name=COMPONENT_NAME;
		url="https://steamcommunity.com/sharedfiles/filedetails/?id=774201744";
		requiredAddons[]=
		{
			"cba_ui",
			"cba_xeh",
			"cba_jr",
			"ace_main",
			"ace_medical",
			"a3_ui_f",
			"a3_characters_f",
			"A3_Map_Tanoabuka"
		};
		requiredVersion=REQUIRED_VERSION;
        VERSION_CONFIG;
		units[] = {"OT_GanjaItem","OT_BlowItem","OT_C_Truck_recovery","OT_C_T_LSV","OT_C_T_LSV2"};
		weapons[] = {"OT_Ganja","OT_Blow"};
	};
};

/*class CfgMainMenuSpotlight
{
	class Overthrow
	{
		text = "Overthrow"; // Text displayed on the square button, converted to upper-case
		textIsQuote = 1; // 1 to add quotation marks around the text
		picture = "\overthrow_main\campaign\overthrow_spotlight.jpg"; // Square picture, ideally 512x512
		video = "\a3\Ui_f\Video\spotlight_1_Apex.ogv"; // Video played on mouse hover
		action = "ctrlactivate ((ctrlparent (_this select 0)) displayctrl 101);";
		actionText = $STR_A3_RscDisplayMain_Spotlight_Play; // Text displayed in top left corner of on-hover white frame
		condition = "true"; // Condition for showing the spotlight
	};
	class ApexProtocol
	{
		condition = "false";
	};
	class Bootcamp
	{
		condition = "false";
	};
	class Orange_Campaign
	{
		condition = "false";
	};
	class Orange_CampaignGerman
	{
		condition = "false";
	};
	class Orange_Showcase_IDAP
	{
		condition = "false";
	};
	class Orange_Showcase_LoW
	{
		condition = "false";
	};
	class Showcase_TankDestroyers
	{
		condition = "false";
	};
	class Tacops_Campaign_01
	{
		condition = "false";
	};
	class Tacops_Campaign_02
	{
		condition = "false";
	};
	class Tacops_Campaign_03
	{
		condition = "false";
	};
	class Tanks_Campaign_01
	{
		condition = "false";
	};

};*/

class CfgMissions
{
	class Campaigns
	{
		class Overthrow
		{
			directory = "overthrow_main\campaign";
		};
	};
	
	class Missions
	{
		
	};
	class MPMissions
	{
		class DeadsOTRHSTanoa
		{
			directory="overthrow_main\campaign\missions\DeadsOTRHSTanoa.Tanoa";
		};
		class DeadsOTRHSAltis
		{
			directory="overthrow_main\campaign\missions\DeadsOTRHSAltis.Altis";
		};
		class DeadsOTRHSMalden
		{
			directory="overthrow_main\campaign\missions\DeadsOTRHSMalden.Malden";
		};
		class DeadsOTRHSEnoch
		{
			directory="overthrow_main\campaign\missions\DeadsOTRHSEnoch.Enoch";
		};
		class DeadsOTRHSSafrouRamal
		{
			directory="overthrow_main\campaign\missions\DeadsOTRHSSefrouRamal.SefrouRamal";
		};
	};
};

class CfgWorlds
{
	class CAWorld;
	class Tanoa : CAWorld
	{
		class Names
		{
			class RailwayDepot01 {
				name = "factory";
			};
		};
	};
};


class ACE_Tags {
	class OT_goHome {
		displayName = "NATO Go Home";
		requiredItem = "ACE_SpraypaintBlack";
		textures[] = {"\overthrow_main\ui\tags\gohome.paa"};
		icon = "\z\ace\addons\tagging\UI\icons\iconTaggingBlack.paa";
	};
	class OT_overthrow {
		displayName = "you are";
		requiredItem = "ACE_SpraypaintBlack";
		textures[] = {"\overthrow_main\ui\tags\youare.paa"};
		icon = "\z\ace\addons\tagging\UI\icons\iconTaggingBlack.paa";
	};
	class OT_fuckNATO {
		displayName = "Fuck NATO";
		requiredItem = "ACE_SpraypaintBlack";
		textures[] = {"\overthrow_main\ui\tags\fucknato.paa"};
		icon = "\z\ace\addons\tagging\UI\icons\iconTaggingBlack.paa";
	};
	class OT_join {
		displayName = "Join";
		requiredItem = "ACE_SpraypaintBlack";
		textures[] = {"\overthrow_main\ui\tags\join.paa"};
		icon = "\z\ace\addons\tagging\UI\icons\iconTaggingBlack.paa";
	};
	class OT_Live {
		displayName = "Live";
		requiredItem = "ACE_SpraypaintBlack";
		textures[] = {"\overthrow_main\ui\tags\Live.paa"};
		icon = "\z\ace\addons\tagging\UI\icons\iconTaggingBlack.paa";
	};
	class OT_stand {
		displayName = "stand";
		requiredItem = "ACE_SpraypaintBlack";
		textures[] = {"\overthrow_main\ui\tags\stand.paa"};
		icon = "\z\ace\addons\tagging\UI\icons\iconTaggingBlack.paa";
	};
	class OT_papagee {
		displayName = "papagee";
		requiredItem = "ACE_SpraypaintBlack";
		textures[] = {"\overthrow_main\ui\tags\papagee.paa"};
		icon = "\z\ace\addons\tagging\UI\icons\iconTaggingBlack.paa";
	};
	class OT_spill {
		displayName = "spill";
		requiredItem = "ACE_SpraypaintBlack";
		textures[] = {"\overthrow_main\ui\tags\spill.paa"};
		icon = "\z\ace\addons\tagging\UI\icons\iconTaggingBlack.paa";
	};
	class OT_heynato {
		displayName = "hey Nato";
		requiredItem = "ACE_SpraypaintBlack";
		textures[] = {"\overthrow_main\ui\tags\heynato.paa"};
		icon = "\z\ace\addons\tagging\UI\icons\iconTaggingBlack.paa";
	};
	class OT_inmy {
		displayName = "in my";
		requiredItem = "ACE_SpraypaintBlack";
		textures[] = {"\overthrow_main\ui\tags\inmy.paa"};
		icon = "\z\ace\addons\tagging\UI\icons\iconTaggingBlack.paa";
	};
	class OT_comply {
		displayName = "comply";
		requiredItem = "ACE_SpraypaintBlack";
		textures[] = {"\overthrow_main\ui\tags\comply.paa"};
		icon = "\z\ace\addons\tagging\UI\icons\iconTaggingBlack.paa";
	};
	class OT_rebel {
		displayName = "rebel";
		requiredItem = "ACE_SpraypaintRed";
		textures[] = {"\overthrow_main\ui\tags\rebel.paa"};
		icon = "\z\ace\addons\tagging\UI\icons\iconTaggingRed.paa";
	};
	class OT_schizo {
		displayName = "schizo";
		requiredItem = "ACE_SpraypaintBlue";
		textures[] = {"\overthrow_main\ui\tags\schizo.paa"};
		icon = "\z\ace\addons\tagging\UI\icons\iconTaggingBlue.paa";
	};
};

#include "CfgMarkers.hpp"
#include "CfgGlasses.hpp"
#include "CfgSounds.hpp"
#include "CfgSettings.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgFunctions.hpp"
#include "CfgMagazines.hpp"
#include "missions\CfgOverthrowMissions.hpp"

#include "ui\dialogs\defines.hpp"
#include "ui\dialogs\stats.hpp"
#include "ui\dialogs\shop.hpp"
#include "ui\dialogs\sleep.hpp"
#include "ui\dialogs\main.hpp"
#include "ui\dialogs\place.hpp"
#include "ui\dialogs\build.hpp"
#include "ui\dialogs\recruits.hpp"
#include "ui\dialogs\resistance.hpp"
#include "ui\dialogs\factory.hpp"
#include "ui\dialogs\business.hpp"
#include "ui\overrides.hpp"
