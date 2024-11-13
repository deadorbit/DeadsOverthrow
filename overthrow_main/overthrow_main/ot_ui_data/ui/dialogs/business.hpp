////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by joshh, v1.063, #Kyxudi)
////////////////////////////////////////////////////////
class OT_dialog_BusinessMenu
{
	idd=-1500;
	movingenable=false;
	
	class controlsBackground {
		class RscStructuredText_1100: RscOverthrowStructuredText
		{
			idc = 1100;

			x = 0.200937 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.531094 * safezoneW;
			h = 0.693 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
			colorActive[] = {0.1,0.1,0.1,1};
		};
	};
	class controls {
		class RscStructuredText_1101: RscOverthrowStructuredText
		{
			idc = 1101;
			text = ""; //--- ToDo: Localize;
			x = 0.226719 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
			sizeEx = -1;
		};
		class RscStructuredText_1102: RscOverthrowStructuredText
		{
			idc = 1102;
			text = ""; //--- ToDo: Localize;
			x = 0.237031 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.121 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		/*class RscCheckbox_2800: RscOverthrowCheckBox
		{
			idc = 2800;
			x = 0.234479 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscStructuredText_1103: RscOverthrowStructuredText
		{
			idc = 1103;
			text = "<t size='1.5' align='Left' font = ""PuristaMedium"">Running?</t>"; //--- ToDo: Localize;
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		/*class RscCheckbox_2801: RscOverthrowCheckBox
		{
			idc = 2801;
			x = 0.366094 * safezoneW + safezoneX;
			y = 0.412926 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscStructuredText_1104: RscOverthrowStructuredText
		{
			idc = 1104;
			text = "<t size='1.5' align='Left'  font = ""PuristaMedium"">Autosell?</t>"; //--- ToDo: Localize;
			x = 0.38776 * safezoneW + safezoneX;
			y = 0.412926 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};*/
		class RscStructuredText_1110: RscOverthrowStructuredText
		{
			idc = 1110;
			text = "";
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.363 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class RscStructuredText_1107: RscOverthrowStructuredText
		{
			idc = 1107;

			text = "<t size='2' align='center' font = ""PuristaBold"">Logistics</t>"; //--- ToDo: Localize;
			x = 0.489688 * safezoneW + safezoneX;
			y = 0.203 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			action = "closeDialog 0;";
			text = ""; //--- ToDo: Localize;
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.652 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.033 * safezoneH;
			tooltip = "Upgrade this business to increase its maximum number of workers by 10";
		};
		/*class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			action = "closeDialog 0;";

			text = "Build Logistics Center: $250,000"; //--- ToDo: Localize;
			x = 0.489687 * safezoneW + safezoneX;
			y = 0.705 * safezoneH + safezoneY;
			w = 0.216563 * safezoneW;
			h = 0.033 * safezoneH;
		};*/
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class OT_dialog_BusConfirm
{
	idd=-20;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1101: RscOverthrowStructuredText
		{
			idc = 1101;
			x = 0.324687 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.355781 * safezoneW;
			h = 0.198 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
			colorActive[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Kizeru)
		////////////////////////////////////////////////////////

		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			action = "closeDialog 0;";

			text = "Yes"; //--- ToDo: Localize;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			action = "closeDialog 0;";

			text = "No"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class RscStructuredText_1101: RscOverthrowStructuredText
		{
			idc = 1101;

			text = "<t size='1' align='center' font = ""PuristaBold""></t>"; //--- ToDo: Localize;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.324844 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};


