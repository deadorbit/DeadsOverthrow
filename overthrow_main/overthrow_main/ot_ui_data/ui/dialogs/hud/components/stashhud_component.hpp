class OT_stashHUD {
	idd=746;
	movingEnable =  0;
    enableSimulation = 1;
    enableDisplay = 1;
    duration     =  10e10;
    fadein       =  0;
    fadeout      =  0;
	name = "OT_stashHUD";
	onLoad = "with uiNameSpace do { OT_stashHUD = _this select 0 }";

	class controls{
		class RscListbox_1500: RscOverthrowListbox {
			idc = 1500;
			x = 0.247344 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		
		class RscPicture_1200: RscOverthrowPicture {
			idc = 1200;
			text = "";
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.165 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		
		class RscButton_1600: RscOverthrowButton {
			idc = 1600;
			text = "Buy"; //--- ToDo: Localize;
			x = 0.752656 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.099 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			action = "[] call OT_fnc_buy;";
		};
		
		class RscStructuredText_1100: RscOverthrowStructuredText {
			idc = 1100;
			x = 0.654688 * safezoneW + safezoneX;
			y = 0.4 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.265 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
		};
	};
};