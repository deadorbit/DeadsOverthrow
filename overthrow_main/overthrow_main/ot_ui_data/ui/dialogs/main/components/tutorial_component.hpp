class OT_dialog_tute
{
	idd=-1;
	movingenable=false;
	onUnload = "['Important Note', 'You can press [Y] to open the Overthrow Menu, which is used to interact with most things in the mod. This popup will close once you do.', {[false,'']}, [], true, true, 15] spawn OT_fnc_popupbasic;";
	class controlsBackground {
		class RscStructuredText_1101: RscOverthrowStructuredText
		{
			idc = 1101;
			x = 0.324687 * safezoneWX;
			y = 0.313 * safezoneHY;
			w = 0.355781 * safezoneW;
			h = 0.1 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			colorActive[] = {0,0,0,0.3};
		};
	};
	
	class controls{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Kizeru)
		////////////////////////////////////////////////////////

		class RscStructuredText_1100: RscOverthrowStructuredText
		{
			idc = 1100;
			text = "<t size=""1.5"" align='Right'>Would you like a quick tutorial? (You will receive free stuff!)</t>";
			x = 0.324687 * safezoneWX;
			y = 0.263 * safezoneHY;
			w = 0.355781 * safezoneW;
			h = 0.05 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
			colorActive[] = {0,0,0,0.9};
		};


		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			action = "closeDialog 0;[] spawn OT_fnc_tutorial;";

			text = "Yes"; //--- ToDo: Localize;
			x = 0.340156 * safezoneWX;
			y = 0.318 * safezoneHY;
			w = 0.0721875 * safezoneW;
			h = 0.05 * safezoneH;
			colorBackground[] = {0.3,0.84,0.12,0.8};
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			action = "closeDialog 0;";

			text = "No"; //--- ToDo: Localize;
			x = 0.592812 * safezoneWX;
			y = 0.318 * safezoneHY;
			w = 0.0721875 * safezoneW;
			h = 0.05 * safezoneH;
			colorBackground[] = {0.85,0.09,0.09,0.8};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};