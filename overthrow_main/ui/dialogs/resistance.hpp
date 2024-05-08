class OT_dialog_resistance
{
	idd=8000;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1100: RscOverthrowStructuredText
		{
			idc = 1100;
            x = 0.237031 * safezoneW + safezoneX;
            y = 0.17 * safezoneH + safezoneY;
            w = 0.525937 * safezoneW;
            h = 0.7 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
			colorActive[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
        ////////////////////////////////////////////////////////
        // GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Defoki)
        ////////////////////////////////////////////////////////

        class RscStructuredText_1101: RscOverthrowStructuredText
        {
            idc = 1101;
            text = "<t align='center' size='2'>Resistance</t>"; //--- ToDo: Localize;
            x = 0.242187 * safezoneW + safezoneX;
            y = 0.181 * safezoneH + safezoneY;
            w = 0.515625 * safezoneW;
            h = 0.044 * safezoneH;
            colorBackground[] = {0,0,0,0};
            colorActive[] = {0,0,0,0};
        };
        class RscListbox_1500: RscOverthrowListbox
        {
            idc = 1500;
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.165 * safezoneH;
			onLBSelChanged = "_this call OT_fnc_showMemberInfo";
        };
        class RscStructuredText_1102: RscOverthrowStructuredText
        {
            idc = 1102;
            x = 0.546406 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.154687 * safezoneW;
            h = 0.11 * safezoneH;
            colorBackground[] = {0,0,0,0.2};
            colorActive[] = {0,0,0,0};
        };
        class RscButton_1600: RscOverthrowButton
        {
            idc = 1600;
            text = "Make General"; //--- ToDo: Localize;
            x = 0.628906 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.044 * safezoneH;
			action = "[] call OT_fnc_makeGeneral;";
        };
        class RscButton_1601: RscOverthrowButton
        {
            idc = 1601;
            text = "Transfer funds"; //--- ToDo: Localize;
            x = 0.546406 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.044 * safezoneH;
			action = "[] call OT_fnc_transferFunds;";
        };
        class RscStructuredText_1103: RscOverthrowStructuredText
        {
            idc = 1103;
            text = "<t align='center' size='1.2'>Businesses</t>"; //--- ToDo: Localize;
            x = 0.242187 * safezoneW + safezoneX;
            y = 0.412 * safezoneH + safezoneY;
            w = 0.515625 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0,0,0,0};
            colorActive[] = {0,0,0,0};
        };
        class RscListbox_1501: RscOverthrowListbox// Businesses
        {
            idc = 1501;
            x = 0.298906 * safezoneW + safezoneX;
            y = 0.445 * safezoneH + safezoneY;
            w = 0.242344 * safezoneW;
            h = 0.165 * safezoneH;
			onLBSelChanged = "_this call OT_fnc_showBusinessInfo";
        };
        class RscStructuredText_1104: RscOverthrowStructuredText
        {
            idc = 1104;
            x = 0.546406 * safezoneW + safezoneX;
            y = 0.445 * safezoneH + safezoneY;
            w = 0.154687 * safezoneW;
            h = 0.11 * safezoneH;
            colorBackground[] = {0,0,0,0.2};
            colorActive[] = {0,0,0,0};
        };
        class RscButton_1602: RscOverthrowButton
        {
            idc = 1602;
            text = "Fire"; //--- ToDo: Localize;
            x = 0.546406 * safezoneW + safezoneX;
            y = 0.566 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.044 * safezoneH;
			action = "[] call OT_fnc_fireEmployee;";
        };
        class RscButton_1603: RscOverthrowButton
        {
            idc = 1603;
            text = "Hire"; //--- ToDo: Localize;
            x = 0.628906 * safezoneW + safezoneX;
            y = 0.566 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.044 * safezoneH;
			action = "[] call OT_fnc_hireEmployee;";
        };
		class RscStructuredText_1106: RscOverthrowStructuredText// Balance sheet
		{
			idc = 1106;

			x = 0.298906 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.151 * safezoneH;
			colorBackground[] = {0,0,0,0.2};
			colorActive[] = {0,0,0,0};
		};
		class RscButton_1604: RscOverthrowButton
		{
			idc = 1604;
			text = "Give funds"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.6246666666666667 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			action = "[] call OT_fnc_giveFunds;";
		};
		class RscButton_1605: RscOverthrowButton
		{
			idc = 1605;
			text = "Take funds"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.6613333333333334 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			action = "[] call OT_fnc_takeFunds;";
		};
		class RscButton_1606: RscOverthrowButton
		{
			idc = 1606;
			text = "Refill Foritfy Budget"; //--- ToDo: Localize;
			x = 0.4115413666666667 * safezoneW + safezoneX;
			y = 0.624666666666666 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Pay $2500 from the resistance's funds to increase the ACE foritfy budget by 100."; //--- ToDo: Localize;
			action = "[] call OT_fnc_refillFortifyBudget;";
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


class OT_dialog_garrison
{
	idd=9000;
	movingenable=false;
	class controlsBackground
	{
		class RscStructuredText_1199: RscOverthrowStructuredText
		{
			idc = 1199;

			text = ""; //--- ToDo: Localize;
			x = 0.288594 * safezoneW + safezoneX;
			y = 0.214 * safezoneH + safezoneY;
			w = 0.422812 * safezoneW;
			h = 0.572 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
			colorActive[] = {0.1,0.1,0.1,1};
		};
	};
	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Niwire)
		////////////////////////////////////////////////////////

		class RscStructuredText_1100: RscOverthrowStructuredText
		{
			idc = 1100;
			text = "<t size='1.5' align='center'>Base</t>"; //--- ToDo: Localize;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			text = "+1 Rifleman"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,0] spawn OT_fnc_addGarrison";
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			text = "+1 Autorifleman"; //--- ToDo: Localize;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,1] spawn OT_fnc_addGarrison";
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			text = "+1 Grenadier"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,12] spawn OT_fnc_addGarrison";
		};
		class RscButton_1603: RscOverthrowButton
		{
			idc = 1603;
			text = "+1 Medic"; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,8] spawn OT_fnc_addGarrison";
		};
		class RscButton_1604: RscOverthrowButton
		{
			idc = 1604;
			text = "+1 Anti-Tank"; //--- ToDo: Localize;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,9] spawn OT_fnc_addGarrison";
		};
		class RscButton_1605: RscOverthrowButton
		{
			idc = 1605;
			text = "+1 Anti-Air"; //--- ToDo: Localize;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,10] spawn OT_fnc_addGarrison";
		};
		class RscButton_1606: RscOverthrowButton
		{
			idc = 1606;
			text = "+1 HMG"; //--- ToDo: Localize;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,'HMG'] spawn OT_fnc_addGarrison";
		};
		class RscButton_1607: RscOverthrowButton
		{
			idc = 1607;
			text = "+1 GMG"; //--- ToDo: Localize;
			x = 0.561875 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[getpos player,'GMG'] spawn OT_fnc_addGarrison";
		};
		class RscStructuredText_1101: RscOverthrowStructuredText
		{
			idc = 1101;
			x = 0.314375 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.37125 * safezoneW;
			h = 0.264 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class OT_dialog_jobs
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
			onLBSelChanged = "_this call OT_fnc_displayJobDetails";
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
			text = "Set Waypoint"; //--- ToDo: Localize;
			x = 0.840312 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.099 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[] call OT_fnc_setJobWaypoint;";
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			text = "Clear Waypoint"; //--- ToDo: Localize;
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.099 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[] call OT_fnc_clearPlayerWaypoint;";
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
			text = "<t size='1.7' shadow='2' align='left' valign = 'middle'>Missions</t>";
		};
		class RscButton_1699: RscOverthrowButton
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
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////



	};
};

class OT_dialog_logistics
{
	idd=8001;
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
			onLBSelChanged = "_this call OT_fnc_displayLogisticDetails";
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
			text = "Set Waypoint"; //--- ToDo: Localize;
			x = 0.840312 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.099 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[] call OT_fnc_setVehicleWaypoint;";
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			text = "Clear Waypoint"; //--- ToDo: Localize;
			x = 0.778437 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.099 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[] call OT_fnc_clearPlayerWaypoint;";
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			text = "Remove Vehicle"; //--- ToDo: Localize;
			x = 0.716562 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.1338749‬ * safezoneW;
			h = 0.099 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			tooltip = "Comepetly removes the vehicle without leaving a wreck."; //--- ToDo: Localize;
			action = "[] call OT_fnc_UnownVehicle;";
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
		class RscStructuredText_1101: RscOverthrowStructuredText//Top label, displays shop name
		{
			idc = 1101;
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.17 * safezoneH + safezoneY;
			w = 0.6290628 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscStructuredText_1102: RscOverthrowStructuredText//Bottom label
		{
			idc = 1102;
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.654844 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscCheckBox_2001: RscOverthrowCheckBox
        {
            idc = 2001;
            x = 0.242187 * safezoneW + safezoneX;
            y = 0.786 * safezoneH + safezoneY;
            w = 0.0257812 * safezoneW;
            h = 0.044 * safezoneH;
        };
		class RscStructuredText_1103: RscOverthrowStructuredText
		{
			idc = 1103;
			x = 0.2679682 * safezoneW + safezoneX;
			y = 0.786 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0};
			text = ":Show only owned vehicles";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////



	};
};

class OT_dialog_joboffer
{
	idd=8000;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1199: RscOverthrowStructuredText
		{
			idc = 1199;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.345469 * safezoneW;
			h = 0.319 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
			colorActive[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Jeduvu)
		////////////////////////////////////////////////////////
		class RscButton_1600: RscOverthrowGreenButton
		{
			idc = 1600;
			text = "Accept"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.066 * safezoneH;
			action = "[] call OT_fnc_acceptJob;";
			tooltip = "Accept this job (will appear in Jobs screen for all players)";
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			text = "Deny"; //--- ToDo: Localize;
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.066 * safezoneH;
			action = "[] call OT_fnc_denyJob;";
			tooltip = "Deny this job (will be offered another job if available)";
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			text = "Cancel"; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.066 * safezoneH;
			action = "closeDialog 0";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	}
};

class OT_dialog_expand
{
	idd=-10;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1101: RscOverthrowStructuredText
		{
			idc = -9;
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
			idc = -11;
			action = "closeDialog 0;[] spawn OT_fnc_buyExpand;";

			text = "Yes"; //--- ToDo: Localize;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = -12;
			action = "closeDialog 0;";

			text = "No"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.088 * safezoneH;
		};
		class RscStructuredText_1100: RscOverthrowStructuredText
		{
			idc = -13;

			text = ""; //--- ToDo: Localize;
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

class OT_dialog_LegitInfo
{
	idd=-20;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1199: RscOverthrowStructuredText
		{
			idc = 1199;
			x = 0.329844 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.345469 * safezoneW;
			h = 0.319 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
			colorActive[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Jeduvu)
		////////////////////////////////////////////////////////
		class RscButton_1600: RscOverthrowGreenButton
		{
			idc = 1600;
			text = "Deliever Vehicle"; //--- ToDo: Localize;
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.066 * safezoneH;
			action = "[] call OT_fnc_sellLegitVehicle;";
			tooltip = "There are no quailfying vehicles within range of the representitive";
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1602;
			text = "Cancel"; //--- ToDo: Localize;
			x = 0.335 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.066 * safezoneH;
			action = "closeDialog 0";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	}
};
