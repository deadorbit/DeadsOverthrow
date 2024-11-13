#define TEXTATTRIBUTES \
	font = OT_THEME_MENU_FONT_BOLD; \
	color = OT_THEME_MENU_TEXT_HEX; \
	shadow = 0; \
	valign = "middle"; \
	underline = false; \
	align = "center"
	
#define TEXTATTRIBUTESLEFT \
	font = OT_THEME_MENU_FONT_BOLD; \
	color = OT_THEME_MENU_TEXT_HEX; \
	shadow = 0; \
	valign = "middle"; \
	underline = false; \
	align = "left"

class OT_hudBarImageSection : RscOverthrowPicture {
	text = LABEL_MODERN_INFOPANAL_SMALL_HEADER;
	colorText[] = {1,1,1,0.9};
	colorBackground[] = {1,1,1,0};
};

class OT_hudBarEyeImage : RscOverthrowPicture {
	text = IMAGE_EYEEMPTY;
	
	colorText[] = OT_THEME_MENU_TEXT;
};

class OT_hudBarDataImageSection : OT_hudBarImageSection {
	text = LABEL_MODERN_INFOPANAL_SMALL;
};

class OT_hudBarTextSection : RscOverthrowStructuredText {
	text = "";
	font = OT_THEME_MENU_FONT_BOLD;

	colorText[] 		= OT_THEME_MENU_TEXT;
	colorBackground[] 	= {1,1,1,0};
	shadow 				= 0;
	colorShadow[] 		= {0,0,0,0};
};

class OT_hudBarBattleProgressSection : RscOverthrowProgress {
	texture = "#(argb,8,8,3)color(1,1,1,0.9)";
	colorBar[] = {0.0, 0.3, 0.6, 0.9};
	colorFrame[] = {0.582, 0.582, 0.606, 0.8};
	shadow = 2;
};

class OT_hudBarBattleProgressGroup : RscControlsGroup {
	class HScrollbar {
		height = 0;
	};
	class Controls {
		class flagIcon : OT_hudBarImageSection {
			text = "\A3\Data_F\Flags\flag_NATO_CO.paa";
		};
		class progressBar : OT_hudBarBattleProgressSection {};
	};
};

class OT_hudBarTalkToGroup : RscControlsGroup {
	class HScrollbar {
		height = 0;
	};
	class VScrollbar {
		width = 0;
	};
	class Controls {
		class background : OT_hudBarDataImageSection {};
		class icon : OT_hudBarImageSection {
			text = IMAGE_TALKTO_GENERAL;
		};
		class nameText : OT_hudBarTextSection {};
	};
};

/*
	class OT_hudCurrencyPicture : RscOverthrowPicture {
		text = IMAGE_AUSTRAL2;
		colorText[] = OT_THEME_MENU_TEXT;
		colorBackground[] = OT_THEME_MENU_IMAGE_BACKGROUND;
	};
	
	class moneySymbolImage : OT_hudCurrencyPicture {
		idc = 10011;
		
		x = (START_X + (MARGIN_SPACING*2)) * safezoneWX;
		w = ((MONEYSYMBOL_W - MARGIN_SPACING) * safezoneW);
		y = 0.009 * safezoneHY;
		h = 0.018 * safezoneH;
	};
*/

class OT_StatsHUD {
	//Total Length = 0.2675
	//R edge = 0.635
	#define TEXT_H 0.026
	#define TEXT_Y 0.003
	
	#define START_X 0.3663
	#define START_Y 0.0015
	#define START_H 0.03
	
	#define MARGIN_SPACING 0.0025
	#define TWOMARGINS (MARGIN_SPACING * 2)

	#define MONEY_W 0.13
	#define MONEY_END (START_X+MONEY_W)

	#define STATUS_W 0.04
	#define STATUS_END (MONEY_END+STATUS_W)
	
	#define WARNING_W 0.10
	#define WARNING_END (STATUS_END+WARNING_W)
	
	#define TIMER_W 0.04
    idd = 745;
    movingEnable =  0;
    enableSimulation = 1;
    enableDisplay = 1;
    duration     =  10e10;
    fadein       =  0;
    fadeout      =  0;
    name = "OT_statsHUD";
	onLoad = "with uiNameSpace do { OT_statsHUD = _this select 0 }";
	class controls {
		//1st Label (Money)
		class moneySectionImage : OT_hudBarImageSection {
			idc = 1001;

			x = START_X * safezoneWX;
			w = (MONEY_W - MARGIN_SPACING) * safezoneW;

			y = 0.0015 * safezoneHY;
			h = START_H * safezoneH;
		};
		class moneySectionText : OT_hudBarTextSection {
			idc = 101;
			
			text = "$ <t color='#56595c'>0,000,000,00</t>1,000";
			size = (TEXT_H * safezoneH) * 1.0;
			
			x = (START_X + MARGIN_SPACING) * safezoneWX;
			w = (MONEY_W - (MARGIN_SPACING * 3)) * safezoneW;
			y = TEXT_Y * safezoneHY;
			h = TEXT_H * safezoneH;
			
			class Attributes {
				TEXTATTRIBUTES;
			};
		};
		//2nd Label (Status/Visiabilty)
		class statusSectionImage : moneySectionImage {
			idc = 1002;

			x = MONEY_END * safezoneWX;
			w = (STATUS_W - MARGIN_SPACING) * safezoneW;
		};
		#define EYEIMAGE_X (MONEY_END + MARGIN_SPACING)
		#define EYEIMAGE_W (STATUS_W - (MARGIN_SPACING * 3))
		#define EYEIMAGE_Y (TEXT_Y + MARGIN_SPACING)
		#define EYEIMAGE_H (TEXT_H - (MARGIN_SPACING * 2))
		#define EYEIMAGE_BGSCALE 1.00
		#define EYEIMAGE_BGCOLOR {0.776,0.792,0.808,0.8}
		#define EYEIMAGE_FGCOLOR {0.9,0.9,0.9,0}
		
		IMAGE_WITH_BACKGROUND(OT_hudBarEyeImage,102,EYEIMAGE_X,EYEIMAGE_W,EYEIMAGE_Y,EYEIMAGE_H,EYEIMAGE_BGSCALE,EYEIMAGE_BGCOLOR,EYEIMAGE_FGCOLOR);
		
		#undef EYEIMAGE_X
		#undef EYEIMAGE_W
		#undef EYEIMAGE_Y
		#undef EYEIMAGE_H
		#undef EYEIMAGE_BGSCALE
		#undef EYEIMAGE_BGCOLOR
		#undef EYEIMAGE_FGCOLOR
		
		//3rd Label (Warning)
		class warningSectionImage : moneySectionImage {
			idc = 1003;

			x = STATUS_END * safezoneWX;
			w = (WARNING_W - MARGIN_SPACING) * safezoneW;
		};
		class warningSectionText : moneySectionText {
			idc = 103;

			text = "CLEAN";

			x = (STATUS_END + MARGIN_SPACING) * safezoneWX;
			w = (WARNING_W - (MARGIN_SPACING * 3)) * safezoneW;

			class Attributes {
				TEXTATTRIBUTES;
			};
		};
		//Battle Info
		#define HUDTOTAL_W 0.2675
		
		#define BATTLETEXT_LARGERSIZE 0.85
		#define BATTLETEXT_SMALLERSIZE 0.8
		
		#define BATTLE_X (START_X + (MARGIN_SPACING * 2))
		#define BATTLE_W (HUDTOTAL_W - (MARGIN_SPACING * 4))
		#define BATTLE_Y (START_Y + START_H + MARGIN_SPACING)
		#define BATTLE_H (START_H * (BATTLETEXT_LARGERSIZE + BATTLETEXT_SMALLERSIZE))
		
		#define BATTLETEXT_X (BATTLE_X + MARGIN_SPACING)
		#define BATTLETEXT_Y (BATTLE_Y + MARGIN_SPACING)
		#define BATTLETEXT_W (BATTLE_W - (MARGIN_SPACING * 2))
		#define BATTLETEXTUPPER_H ((START_H * BATTLETEXT_LARGERSIZE) - MARGIN_SPACING)
		#define BATTLETEXTLOWER_H ((START_H * BATTLETEXT_SMALLERSIZE) - (MARGIN_SPACING * 2))
		class battleSectionImage : OT_hudBarDataImageSection {
			idc = 2001;
			//onLoad = "(_this select 0) ctrlShow false";
			
			x = BATTLE_X * safezoneWX;
			w = BATTLE_W * safezoneW;
			y = BATTLE_Y * safezoneHY;
			h = BATTLE_H * safezoneH;
		};
		class battleSectionUpperText : OT_hudBarTextSection {
			idc = 201;
			//onLoad = "(_this select 0) ctrlShow false";
			
			text = "32nd Battle Of Lonstanopopolopolisis";
			size = BATTLETEXTUPPER_H * safezoneH;
			
			x = BATTLETEXT_X * safezoneWX;
			w = BATTLETEXT_W * safezoneW;
			y = BATTLETEXT_Y * safezoneHY;
			h = BATTLETEXTUPPER_H * safezoneH;
			
			class Attributes {
				TEXTATTRIBUTESLEFT;
			};
		};
		class battleSectionLowerText : battleSectionUpperText {
			idc = 202;
			//onLoad = "(_this select 0) ctrlShow false";
			
			text = "<t font='OxaniumRegular'>Preparation Phase: <t align='right'>01:61</t></t>";
			size = BATTLETEXTLOWER_H * safezoneH;
			
			x = BATTLETEXT_X * safezoneWX;
			w = BATTLETEXT_W * safezoneW;
			y = (BATTLETEXT_Y + BATTLETEXTUPPER_H) * safezoneHY;
			h = BATTLETEXTLOWER_H * safezoneH;
			
			class Attributes {
				TEXTATTRIBUTESLEFT;
			};
		};
		
		class battleProgressGroup : OT_hudBarBattleProgressGroup {
			#define GROUP_X (BATTLETEXT_X + MARGIN_SPACING)
			#define GROUP_W (BATTLETEXT_W - (MARGIN_SPACING * 2))
			#define GROUP_Y (BATTLETEXT_Y + BATTLETEXTUPPER_H)
			#define GROUP_H (BATTLETEXTLOWER_H - MARGIN_SPACING)
			idc = 203;
			onLoad = "(_this select 0) ctrlShow false";
			
			x = GROUP_X * safezoneWX;
			w = GROUP_W * safezoneW;
			y = GROUP_Y * safezoneHY;
			h = GROUP_H * safezoneH;
			
			class Controls : Controls {
				#define PARENT_W (GROUP_W * safezoneW)
				#define PARENT_H (GROUP_H * safezoneH)
				class flagIcon : flagIcon {
					idc = 11;
					
					x = 0.000 * PARENT_W;
					w = 0.150 * PARENT_W;
					y = 0.000 * PARENT_H;
					h = 1.000 * PARENT_H;	
				};
				class progressBar : progressBar {
					idc = 12;
					
					x = 0.175 * PARENT_W;
					w = 0.825 * PARENT_W;
					y = 0.100 * PARENT_H;
					h = 0.800 * PARENT_H;
				};
				#undef PARENT_W
				#undef PARENT_H
			};
			#undef GROUP_X
			#undef GROUP_W
			#undef GROUP_Y
			#undef GROUP_H
		};
		#undef HUDTOTAL_W
		#undef BATTLETEXT_LARGERSIZE
		#undef BATTLETEXT_SMALLERSIZE
		#undef BATTLE_X
		#undef BATTLE_W
		#undef BATTLE_Y
		#undef BATTLE_H
		#undef BATTLETEXT_X
		#undef BATTLETEXT_Y
		#undef BATTLETEXT_W
		#undef BATTLETEXTUPPER_H
		#undef BATTLETEXTLOWER_H
	};
};

//TalkTo prompt
/*
	TODO: Draw3D Maybe?
*/
class OT_talkToHUD : OT_StatsHUD {
	idd = 746;

    name = "OT_talkToHUD";
	onLoad = "with uiNameSpace do {OT_talkToHUD = _this select 0}";
	class controls {
		#define PARENT_X 0.375
		#define PARENT_W 0.250
		#define PARENT_Y 0.750
		#define PARENT_H 0.065
		class talkToGroup : OT_hudBarTalkToGroup {
			idc = 101;
			onLoad = "[_this select 0, true, 0, 0.25] call DEDF_fnc_ctrlFadeSimple";
			
			x = PARENT_X * safezoneWX;
			w = PARENT_W * safezoneW;
			y = PARENT_Y * safezoneHY;
			h = PARENT_H * safezoneH;
			class Controls : Controls {
				class background : background {
					idc = 11;
					
					x = 0;
					w = PARENT_W * safezoneW;
					y = 0;
					h = PARENT_H * safezoneH;
				};
				#define TALKTO_X (0 + MARGIN_SPACING)
				#define TALKTO_W (PARENT_W - TWOMARGINS)
				#define TALKTO_Y ((0 + MARGIN_SPACING) * PARENT_Y)
				#define TALKTO_H (PARENT_H / 2)
				
				#define TALKTOUPPER_H ((TALKTO_H * 1.200) - TWOMARGINS)
				#define TALKTOLOWER_H (TALKTO_H * 0.835)
				
				#define TALKTOICON_W (0.08 * PARENT_W)
				class icon : icon {
					idc = 12;
					onLoad = "(_this select 0) ctrlSetText ([OT_PLAYER_LOOKATTARGET] call OT_fnc_getNPCIcon)";
					
					colorText[] = OT_THEME_MENU_TEXT;
					
					x = TALKTO_X * safezoneW;
					w = TALKTOICON_W * safezoneW;
					y = TALKTO_Y * safezoneH;
					h = TALKTOUPPER_H * safezoneH;
				};
				class nameText : nameText {
					idc = 13;
					onLoad = "(_this select 0) ctrlSetStructuredText parseText([OT_PLAYER_LOOKATTARGET] call DEDF_fnc_unitFormatName)";
					
					text = "Panteleimon Ponomarenko";
					size = TALKTOUPPER_H * safezoneH * 1.0;
					
					x = (TALKTO_X + TALKTOICON_W) * safezoneW;
					w = ((0.92 * PARENT_W) - TWOMARGINS) * safezoneW;
					y = TALKTO_Y * safezoneH;
					h = TALKTOUPPER_H * safezoneH;
					
					class Attributes {
						TEXTATTRIBUTESLEFT;
					};
				};
				class infoText : nameText {
					idc = 14;
					onLoad = "";
					
					text = "<t font='OxaniumRegular'>Press [Y] to Talk";
					size = TALKTOLOWER_H * safezoneH * 1.0;
					
					x = (TALKTO_X + TALKTOICON_W + MARGIN_SPACING) * safezoneW;
					w = ((0.92 * PARENT_W) - (TWOMARGINS * 2)) * safezoneW;
					y = (TALKTO_Y + TALKTOUPPER_H) * safezoneH;
					h = (TALKTOLOWER_H - MARGIN_SPACING) * safezoneH;
				};
				#undef TALKTO_X
				#undef TALKTO_W
				#undef TALKTO_Y
				#undef TALKTO_H
				
				#undef TALKTOUPPER_H
				#undef TALKTOLOWER_H
				
				#undef TALKTOICON_W
			};
		};
	};
};

#undef TEXT_H
#undef TEXT_Y
#undef START_X
#undef START_Y
#undef START_H
#undef MARGIN_SPACING
#undef MONEY_W
#undef MONEY_END
#undef STATUS_W
#undef STATUS_END
#undef WARNING_W
#undef WARNING_END
#undef TIMER_W
#undef TEXTATTRIBUTES