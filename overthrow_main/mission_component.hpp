/* Included at top of mission's description.ext for default Overthrow settings
 * #include "\overthrow_main\mission_component.hpp"
 *
 * Override values after if required
 */
#include "\overthrow_main\script_component.hpp"

author=QUOTE(MOD_AUTHOR);
OnLoadMission="Those who make peaceful revolution impossible will make violent revolution inevitable. - JFK, 1962";

onLoadMissionTime = 1;
allowSubordinatesTakeWeapons = 1;

joinUnassigned = 1;
briefing = 0;

class Header
{
	gameType = Coop;
	minPlayers = 1;
	maxPlayers = 12;
};

allowFunctionsLog = 0;
enableDebugConsole = 1;

respawn = "BASE";
respawnDelay = 5;
respawnVehicleDelay = 120;
respawnDialog = 0;
aiKills = 0;
disabledAI = 1;
saving = 0;
showCompass = 1;
showRadio = 1;
showGPS = 1;
showMap = 1;
showBinocular = 1;
showNotepad = 1;
showWatch = 1;
debriefing = 0;

//Disable ACE blood (just too much of it in a heavy game)
class Params {
	class ot_start_autoload {
		title = "Autoload a save or start a new game";
		values[] = {0, 1};
		texts[] = {"No", "Yes"};
		default = 0;
	};
	class ot_start_difficulty {
		title = "Game difficulty (Only with autoload)";
		values[] = {0, 1, 2};
		texts[] = {"Easy", "Normal", "Hard"};
		default = 1;
	};
	class ot_start_fasttravel {
		title = "Fast Travel (Only with autoload)";
		values[] = {0, 1, 2};
		texts[] = {"Open", "Restricted", "Disabled"};
		default = 1;
	};
	class ot_start_popModifier {
		title = "Population Modifer (Only with autoload)";
		values[] = {0, 1, 2};
		texts[] = {"Low", "Medium", "High"};
		default = 0;
	};
	class ot_start_tutorial {
		title = "Tutorial Rules (Only with autoload)";
		values[] = {0, 1, 2};
		texts[] = {"Skip", "Skip, Items", "Allow"};
		default = 2;
	};
	class ot_showplayermarkers {
		title = "Show Player Markers on HUD";
		values[] = {1,0};
		texts[] = {"Yes", "No"};
		default = 1;
	};
	class ot_showenemygroup {
		title = "Show known enemy groups on map";
		values[] = {1,0};
		texts[] = {"Yes", "No"};
		default = 1;
	};
	/*class ace_medical_level {
        title = "ACE Medical Level";
        ACE_setting = 1;
        values[] = {1, 2};
        texts[] = {"Basic", "Advanced"};
        default = 1;
    };*/
    class ace_medical_blood_enabledFor {
        title = "ACE Blood";
        ACE_setting = 1;
        values[] = {0, 1, 2};
        texts[] = {"None", "Players Only", "All"};
        default = 1;
    };
	class ot_armedres {
        title = "Count Unarmed Resistance Members Towards QRF Missions.(Strongly suggest against.)";
        values[] = {0, 1};
        texts[] = {"Yes", "No"};
        default = 1;
    };
	class headlessClient
	{
		title = "Headless Client";
		texts[] = {"Disabled","Enabled"};
		values[] = {0, 1};
		default = 0;
		isGlobal = 1;
	};
	class IDAPAirdrops
	{
		title = "Random IDAP Airdrops";
		texts[] = {"Disabled","Enabled"};
		values[] = {0, 1};
		default = 1;
		isGlobal = 1;
	};
	class IncreasedPlayerDamage
	{
		title = "Increased Damage Threshold (Survivability) for Players";
		values[] = {1,2,4};
		texts[] = {1x,2x,4x};
		default = 1;
		isGlobal = 1;
	};
	class AutoDespawnBodies
	{
		title = "Auto-despawn body time (Minutes, only with autoload)";
		values[] = {0,1,2};
		texts[] = {"Never","15","60"};
		default = 2;
		isGlobal = 1;
	};
};
