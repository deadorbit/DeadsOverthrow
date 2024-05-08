class OT_dialog_buy
{
	idd=8000;
	movingenable=false;
	
	/*class RscOverthrowControlsGroup_3000: RscOverthrowControlsGroup
		{
			idc = 3000;
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.265 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			class ScrollBar
			{
				color[] = {1,1,1,0.6};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
			};
			class Controls
			{
				class RscStructuredText_1200: RscOverthrowStructuredText
				{
					idc = 1200;
					x = 0;
					y = 0;
					w = 1 * safezoneW;
					h = 2 * safezoneH;
					colorBackground[] = {0,0,0,0.3};
				};
			};
	};*/
	
	class controlsBackground {
		class RscStructuredText_1199: RscOverthrowStructuredText
		{
			idc = 1199;
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.654844 * safezoneW;
			h = 0.572 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
			colorActive[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Jeduvu)
		////////////////////////////////////////////////////////


		/*
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			action = "[100] call OT_fnc_buy;";

			text = "Buy 100"; //--- ToDo: Localize;
			x = 0.773 * safezoneW + safezoneX;
			y = 0.726 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.05 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			action = "[10] call OT_fnc_buy;";

			text = "Buy 10"; //--- ToDo: Localize;
			x = 0.713 * safezoneW + safezoneX;
			y = 0.726 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.05 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		*/
		class RscListbox_1500: RscOverthrowListbox
		{
			idc = 1500;
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
			onLBSelChanged = "_this call OT_fnc_displayShopPic";
		};
		class RscPicture_1200: RscOverthrowPicture
		{
			idc = 1200;
			text = "";
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.165 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RscButton_1600: RscOverthrowButton//buy button, bottom
		{
			idc = 1600;
			text = "Buy"; //--- ToDo: Localize;
			x = 0.8443123 * safezoneW + safezoneX;
			y = 0.716 * safezoneH + safezoneY;
			w = 0.0437187 * safezoneW;
			h = 0.05 * safezoneH;
			colorBackground[] = {0.3,0.84,0.12,0.8};
			action = "[] call OT_fnc_buy;";
		};
		class RscOverthrowControlsGroup_3000: RscOverthrowControlsGroup
		{
			idc = 3000;
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.265 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			/*class ScrollBar
			{
				color[] = {1,1,1,0.6};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
			};*/
			class ScrollBar
			{
				color[] = {1,1,1,0.6};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
			};
			class VScrollbar: ScrollBar
			{
				width = 0.021;
				autoScrollSpeed = -1;
				autoScrollDelay = 5;
				autoScrollRewind = 0;
				shadow = 0;
			};
			class Controls
			{
				class RscStructuredText_1201: RscOverthrowStructuredText
				{
					idc = 1201;
					x = 0;
					y = 0;
					w = 0.216187 * safezoneW;
					h = (0.165 * 5) * safezoneH;
					colorBackground[] = {0,0,0,0.3};
				};
			};
		};
		class RscStructuredText_1101: RscOverthrowStructuredText//Top label, displays shop name
		{
			idc = 1101;
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.6290628 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			text = "";
		};
		class RscButton_1699: RscOverthrowButton//Close dialog buttton
        {
            idc = 1699;
            text = "X"; //--- ToDo: Localize;
			action = "closeDialog 0";
            x = 0.8712498 * safezoneW + safezoneX;
            y = 0.17 * safezoneH + safezoneY;
            w = 0.0257812 * safezoneW;
            h = 0.044 * safezoneH;
			colorBackground[] = {0.85,0.09,0.09,0.8};
        };
		class RscEdit_2000: RscEditOverthrow//User buy amnt input box
		{
			idc = 2000;
			x = 0.7682811335  * safezoneW + safezoneX;
			y = 0.716 * safezoneH + safezoneY;
			w = 0.0670311665 * safezoneW;
			h = 0.05 * safezoneH;
			maxChars = 4;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////



	};
};

class OT_dialog_recruit
{
	idd=8000;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1199: RscOverthrowStructuredText
		{
			idc = 1199;
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.654844 * safezoneW;
			h = 0.572 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
			colorActive[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Jeduvu)
		////////////////////////////////////////////////////////

		class RscListbox_1500: RscOverthrowListbox
		{
			idc = 1500;
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
			onLBSelChanged = "_this call OT_fnc_displayShopPic";
		};
		class RscPicture_1200: RscOverthrowPicture
		{
			idc = 1200;
			text = "";
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.165 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			action = "[] call OT_fnc_buy";

			text = "Recruit"; //--- ToDo: Localize;
			x = 0.840312 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.099 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			action = "[] call OT_fnc_editLoadout";

			text = "Edit"; //--- ToDo: Localize;
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.099 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscStructuredText_1100: RscOverthrowStructuredText
		{
			idc = 1100;
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.265 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class RscButton_1699: RscOverthrowButton
        {
            idc = 1699;
            text = "X"; //--- ToDo: Localize;
			action = "closeDialog 0";
            x = 0.732031 * safezoneW + safezoneX;
            y = 0.181 * safezoneH + safezoneY;
            w = 0.0257812 * safezoneW;
            h = 0.044 * safezoneH;
        };
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////



	};
};

class OT_dialog_sell
{
	idd=8000;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1199: RscOverthrowStructuredText
		{
			idc = 1199;
			x = 0.1 * safezoneW + safezoneX;
			y = 0.1 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.1 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,0};
		};
	};

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Fylaby)
		////////////////////////////////////////////////////////
		class RscStructuredText_1200: RscOverthrowStructuredText//background label
		{
			idc = 1200;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.775 * safezoneH + safezoneY;
			w = 0.240937333 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		
		class RscStructuredText_1201: RscOverthrowStructuredText//text label
		{
			idc = 1201;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.78875 * safezoneH + safezoneY;
			w = 0.240937333 * safezoneW;
			h = 0.0275 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			class Attributes
			{
				color = "#ffffff";
				shadow = 1;
			};
		};
		
		class RscListbox_1500: RscOverthrowListBox
		{
			idc = 1500;

			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
			onLBSelChanged = "";
		};
		class RscEdit_2000: RscEditOverthrow//User sell amnt input box
		{//0.005
			idc = 2000;
			x = 0.539687333  * safezoneW + safezoneX;
			y = 0.7775 * safezoneH + safezoneY;
			w = 0.0670311665 * safezoneW;
			h = 0.05 * safezoneH;
			maxChars = 6;
			//Edge: 0.6067184995
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			action = "[] call OT_fnc_sellAll";

			text = "Sell"; //--- ToDo: Localize;
			x = 0.6109934995 * safezoneW + safezoneX;
			y = 0.7775 * safezoneH + safezoneY;
			w = 0.0292188335 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class RscButton_1603: RscOverthrowButton
		{
			idc = 1603;
			action = "[1] call OT_fnc_sellAll";

			text = "Sell 1"; //--- ToDo: Localize;
			x = 0.645212333 * safezoneW + safezoneX;
			y = 0.7775 * safezoneH + safezoneY;
			w = 0.0280188335 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class RscButton_1604: RscOverthrowButton
		{
			idc = 1604;
			action = "[-1] call OT_fnc_sellAll";

			text = "Sell All"; //--- ToDo: Localize;
			x = 0.6782311665 * safezoneW + safezoneX;
			y = 0.7775 * safezoneH + safezoneY;
			w = 0.0280188335 * safezoneW;
			h = 0.05 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class OT_dialog_workshop
{
	idd=8000;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1199: RscOverthrowStructuredText
		{
			idc = 1199;
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.654844 * safezoneW;
			h = 0.572 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
			colorActive[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Jimepa)
		////////////////////////////////////////////////////////

		class RscListbox_1500: RscOverthrowListBox
		{
			idc = 1500;
			onLBSelChanged = "_this call OT_fnc_displayShopPic";

			x = 0.247344 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class RscPicture_1200: RscOverthrowPicture
		{
			idc = 1200;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.165 * safezoneH;
		};
		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			action = "[] call OT_fnc_workshopAdd;";

			text = "Add"; //--- ToDo: Localize;
			x = 0.752656 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.099 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscStructuredText_1100: RscOverthrowStructuredText
		{
			idc = 1100;

			x = 0.654688 * safezoneW + safezoneX;
			y = 0.3999 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.265001 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class RscStructuredText_1101: RscOverthrowStructuredText
		{
			idc = 1101;
			text = "<t size=""2"" align=""center"">Workshop</t>"; //--- ToDo: Localize;
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,0};
		};
		class RscPicture_1201: RscOverthrowPicture
		{
			idc = 1201;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.783594 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.165 * safezoneH;
		};
		class RscStructuredText_1102: RscOverthrowStructuredText
		{
			idc = 1102;
			text = "<t size=""2"" align=""center"">&gt;&gt;</t>"; //--- ToDo: Localize;
			x = 0.752656 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,0};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};
class OT_dialog_warehouse
{
	idd=8000;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1199: RscOverthrowStructuredText
		{
			idc = 1199;
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.654844 * safezoneW;
			h = 0.572 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
			colorActive[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Wivoti)
		////////////////////////////////////////////////////////
		/*class RscProgressbar_2000: RscOverthrowProgress {
			idc = 2000;
			x = 0.242187  * safezoneW + safezoneX;
			y = 0.797 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.05 * safezoneH;
		};*/
		class RscListbox_1500: RscOverthrowListBox
		{
			idc = 1500;
			onLBSelChanged = "_this call OT_fnc_displayWarehousePic";

			x = 0.247344 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class RscPicture_1200: RscOverthrowPicture
		{
			idc = 1200;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.165 * safezoneH;
		};
		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			action = "[-1] call OT_fnc_warehouseTake;";

			text = "Take All"; //--- ToDo: Localize;
			x = 0.840312 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.099 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscStructuredText_1100: RscOverthrowStructuredText
		{
			idc = 1100;

			x = 0.654688 * safezoneW + safezoneX;
			y = 0.3999 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.265001 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1600;
			action = "[100] call OT_fnc_warehouseTake;";

			text = "Take 100"; //--- ToDo: Localize;
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.099 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1600;
			action = "[10] call OT_fnc_warehouseTake;";

			text = "Take 10"; //--- ToDo: Localize;
			x = 0.716563 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.099 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscButton_1603: RscOverthrowButton
		{
			idc = 1600;
			action = "[1] call OT_fnc_warehouseTake;";

			text = "Take 1"; //--- ToDo: Localize;
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.099 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

		class RscButton_1604: RscOverthrowButton
		{
			idc = 1604;
			text = "Search";
			x = 0.65  * safezoneW + safezoneX;
			y = 0.155 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class RscEdit_1700: RscEditOverthrow
		{
			idc = 1700;
			x = 0.242187  * safezoneW + safezoneX;
			y = 0.155 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.05 * safezoneH;
		};
	};
};

class OT_dialog_import
{
	idd=8000;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1199: RscOverthrowStructuredText
		{
			idc = 1199;
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.654844 * safezoneW;
			h = 0.572 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
			colorActive[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Wivoti)
		////////////////////////////////////////////////////////

		class RscListbox_1500: RscOverthrowListBox
		{
			idc = 1500;
			onLBSelChanged = "_this call OT_fnc_displayShopPic";

			x = 0.247344 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class RscPicture_1200: RscOverthrowPicture
		{
			idc = 1200;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.165 * safezoneH;
		};
		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			action = "[1000] call OT_fnc_import;";

			text = "Import 1000"; //--- ToDo: Localize;
			x = 0.840312 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.099 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscOverthrowControlsGroup_3000: RscOverthrowControlsGroup
		{
			idc = 3000;
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.265 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			/*class ScrollBar
			{
				color[] = {1,1,1,0.6};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
			};*/
			class ScrollBar
			{
				color[] = {1,1,1,0.6};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
			};
			class VScrollbar: ScrollBar
			{
				width = 0.021;
				autoScrollSpeed = -1;
				autoScrollDelay = 5;
				autoScrollRewind = 0;
				shadow = 0;
			};
			class Controls
			{
				class RscStructuredText_1201: RscOverthrowStructuredText
				{
					idc = 1201;
					x = 0;
					y = 0;
					w = 0.216187 * safezoneW;
					h = (0.165 * 5) * safezoneH;
					colorBackground[] = {0,0,0,0.3};
				};
			};
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1600;
			action = "[100] call OT_fnc_import;";

			text = "Import 100"; //--- ToDo: Localize;
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.099 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1600;
			action = "[10] call OT_fnc_import;";

			text = "Import 10"; //--- ToDo: Localize;
			x = 0.716563 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.099 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
		
		class RscButton_1603: RscOverthrowButton
		{
			idc = 1603;
			text = "Search";
			x = 0.65  * safezoneW + safezoneX;
			y = 0.155 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.05 * safezoneH;
		};
		class RscEdit_1700: RscEditOverthrow
		{
			idc = 1700;
			x = 0.247344  * safezoneW + safezoneX;
			y = 0.155 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.05 * safezoneH;
		};

	};
};

class OT_dialog_loadout
{
	idd=8000;
	movingenable=false;

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Sozafo)
		////////////////////////////////////////////////////////

		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			action = "[player,OT_context,lbData [1500,lbCurSel 1500]] call OT_fnc_restoreLoadout";

			text = "Restore"; //--- ToDo: Localize;
			x = 0.12875 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.088 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			action = "[lbData [1500,lbCurSel 1500]] call OT_fnc_removeLoadout";

			text = "Delete"; //--- ToDo: Localize;
			x = 0.12875 * safezoneW + safezoneX;
			y = 0.61 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0.5,0,0,0.8};
			colorActive[] = {0.5,0,0,0.8};
		};
		class RscListbox_1500: RscOverthrowListbox
		{
			idc = 1500;
			x = 0.12875 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.264 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class OT_dialog_paint
{
	idd=8000;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1199: RscOverthrowStructuredText
		{
			idc = 1199;
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.654844 * safezoneW;
			h = 0.572 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
			colorActive[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Jeduvu)
		////////////////////////////////////////////////////////


		/*
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			action = "[100] call OT_fnc_buy;";

			text = "Buy 100"; //--- ToDo: Localize;
			x = 0.773 * safezoneW + safezoneX;
			y = 0.726 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.05 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			action = "[10] call OT_fnc_buy;";

			text = "Buy 10"; //--- ToDo: Localize;
			x = 0.713 * safezoneW + safezoneX;
			y = 0.726 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.05 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		*/
		class RscListbox_1500: RscOverthrowListbox
		{
			idc = 1500;
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
			onLBSelChanged = "_this call OT_fnc_displayPaintPic";
		};
		class RscPicture_1200: RscOverthrowPicture
		{
			idc = 1200;
			text = "";
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.165 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RscButton_1600: RscOverthrowButton//buy button, bottom
		{
			idc = 1600;
			text = "Paint"; //--- ToDo: Localize;
			x = 0.8443123 * safezoneW + safezoneX;
			y = 0.716 * safezoneH + safezoneY;
			w = 0.0437187 * safezoneW;
			h = 0.05 * safezoneH;
			colorBackground[] = {0.3,0.84,0.12,0.8};
			action = "[] call OT_fnc_paint;";
		};
		class RscStructuredText_1100: RscOverthrowStructuredText
		{
			idc = 1100;
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.265 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		class RscStructuredText_1101: RscOverthrowStructuredText//Top label, displays shop name
		{
			idc = 1101;
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.6290628 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			text = "";
		};
		class RscButton_1699: RscOverthrowButton//Close dialog buttton
        {
            idc = 1699;
            text = "X"; //--- ToDo: Localize;
			action = "closeDialog 0";
            x = 0.8712498 * safezoneW + safezoneX;
            y = 0.17 * safezoneH + safezoneY;
            w = 0.0257812 * safezoneW;
            h = 0.044 * safezoneH;
			colorBackground[] = {0.85,0.09,0.09,0.8};
        };
		/*class RscEdit_2000: RscEditOverthrow//User buy amnt input box
		{
			idc = 2000;
			x = 0.7682811335  * safezoneW + safezoneX;
			y = 0.716 * safezoneH + safezoneY;
			w = 0.0670311665 * safezoneW;
			h = 0.05 * safezoneH;
			maxChars = 4;
		};*/
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////



	};
};