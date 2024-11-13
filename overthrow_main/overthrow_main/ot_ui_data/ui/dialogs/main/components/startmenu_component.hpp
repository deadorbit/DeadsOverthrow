class RscOverthrowVMenuButton : RscOverthrowButton {
	text = "";
	font = OT_THEME_MENU_FONT;
	style = ST_CENTER;
	
	onSetFocus 		= "[(_this select 0),true] call OT_fnc_startMenuButton";
	onKillFocus 	= "[(_this select 0),false] call OT_fnc_startMenuButton";
	onMouseEnter 	= "ctrlsetfocus (_this select 0); (_this select 0) ctrlSetTextColor  [1.0, 1.0, 1.0, 1]";
	onMouseExit 	= "ctrlsetfocus (_this select 0); (_this select 0) ctrlSetTextColor  [1.0, 1.0, 1.0, 0.7]";
	
	//Starting color
	colorText[] 	= {1.0, 1.0, 1.0, 0.7};
	//Text color is handled in handler script
	colorActive[] 	= OT_THEME_MENU_TEXT;
	colorDisabled[] = OT_THEME_MENU_TEXT;
	
	//Background color cycles between these two colors when focused
	colorFocused[] 	= {1,1,1,0};
	colorFocused2[] = {1,1,1,0};
	
	//Disables background color
	colorBackground[] 			= {1,1,1,0};
	colorBackgroundActive[] 	= {1,1,1,0};
	colorBackgroundDisabled[] 	= {1,1,1,0};
	
	//Disables shadow
	colorShadow[] = {1,1,1,0};
	shadow = 0;
	
	borderSize = 0;
	colorBorder[] = {0,0,0,0};
};

class RscOverthrowVMenuButtonBackground : RscOverthrowPicture {
	text = LABEL_MODERN_VMENU_BUTTON_NORMAL;
	colorText[] = OT_THEME_MENU_TEXT;
	colorBackground[] = OT_THEME_MENU_IMAGE_BACKGROUND;
};

class RscOverthrowVBanner : RscOverthrowStaticBox {
	x = 0.8 * safezoneWX;
	y = 0.0 * safezoneHY;
	w = 0.2 * safezoneW;
	h = 1.0 * safezoneH;
	
	colorText[] 		= {1,1,1,0};
	colorBackground[] 	= OT_THEME_MENU_BACKGROUND;
	colorActive[] 		= OT_THEME_MENU_BACKGROUND;
	
	shadow = 1;
	colorShadow[] 		= {1,1,1,0.5};
};

class RscOverthrowVBannerMenu {
	idd=-1;
	movingenable=false;

	class controlsBackground {
		class Background: RscOverthrowVBanner {
			idc = -1;
		};
	};
	
	class controls {
		class controlGroup : RscControlsGroup {
			idc = 1;
			
			x = 0.8 * safezoneWX;
			y = 0.0 * safezoneHY;
			w = 0.2 * safezoneW;
			h = 1.0 * safezoneH;
		};
	};
};


class RscOverthrowVMenuText : RscOverthrowText {
	style = ST_CENTER;
	
	text = "";
	font = OT_THEME_MENU_FONT;
	
	colorText[] 		= OT_THEME_MENU_TEXT_SECONDARY;
	colorBackground[] 	= {1,1,1,0};
	
	shadow = 0;
	colorShadow[] = {1,1,1,0};
};

class OT_dialog_start: RscOverthrowVBannerMenu {
	idd=101010;
	movingenable=false;
	//onLoad = "_this spawn OT_fnc_dialogfadein;";
	class controlsBackground : controlsBackground {
		class Background : Background{};
		//Parent container margins
			#define P_X				0.800
			#define P_Y				0.000
			#define P_WIDTH 		0.200
			#define P_HEIGHT 		1.000
		//Image Margins
			#define I_X 			0.000
			#define I_Y 			0.025
			#define I_WIDTH 		1.000
			#define I_HEIGHT		0.300
		//Button margins
			#define B_X				0.050
			#define B_Y				0.400
			#define B_WIDTH			0.900
			#define B_HEIGHT		0.050
			#define B_SPACING		0.025
		//Button from bottom X/Y
		//Bottom Version text margins
			#define BTEXT_X			0.333
			#define BTEXT_Y			0.975
			#define	BTEXT_WIDTH		0.333
			#define BTEXT_HEIGHT	0.025
		class Picture_1: RscOverthrowPictureKeepAspect {
			idc = -1;
			text = IMAGE_OVERTHROW_LOGO_NEW;
			
			x 	= (I_X * P_WIDTH + P_X) * safezoneWX;
			y 	= (I_Y * P_HEIGHT + P_Y) * safezoneHY;
			w 	= I_WIDTH * P_WIDTH * safezoneW;
			h 	= I_HEIGHT * P_HEIGHT * safezoneH;
			
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
		};
		class Text_1: RscOverthrowVMenuText {
			idc = -1;
			
			text = "DOT v2.0";
			SizeEx = BTEXT_HEIGHT * P_HEIGHT * safezoneH;
			
			x 	= (BTEXT_X * P_WIDTH + P_X) * safezoneWX;
			y 	= (BTEXT_Y * P_HEIGHT + P_Y) * safezoneHY;
			w 	= BTEXT_WIDTH * P_WIDTH * safezoneW;
			h 	= BTEXT_HEIGHT * P_HEIGHT * safezoneH;
		};
		class buttonBackground_100: RscOverthrowVMenuButtonBackground {
			idc = 100;
			
			x 	= ((B_X * P_WIDTH) + P_X) * safezoneWX;
			y 	= ((B_Y * P_HEIGHT) + P_Y) * safezoneHY;
			w 	= B_WIDTH * P_WIDTH * safezoneW;
			h 	= B_HEIGHT * P_HEIGHT * safezoneH;
		};
		class buttonBackground_200: buttonBackground_100 {
			idc = 200;
			
			y 	= (((B_Y + B_SPACING + B_HEIGHT) * P_HEIGHT) + P_Y) * safezoneHY;
		};
		class buttonBackground_300: buttonBackground_100 {
			idc = 300;
			
			y 	= (((B_Y + (B_SPACING + B_HEIGHT) * 2.0) * P_HEIGHT) + P_Y) * safezoneHY;
		};
	};		
	class controls : controls {
		class controlGroup : controlGroup {
			class Controls {
				class Button_10: RscOverthrowVMenuButton {
					idc = 10;
					
					text = "New Game";
					tooltip = "Starts a new game (Please note, saving will overwrite any previous games)";
					SizeEx = B_HEIGHT * P_HEIGHT * safezoneH;
					
					onButtonClick = "closeDialog 0; createDialog ""OT_dialog_newgame""; call OT_fnc_newGameDialog;";

					x 	= B_X * P_WIDTH * safezoneW;
					y 	= B_Y * P_HEIGHT * safezoneH;
					w 	= B_WIDTH * P_WIDTH * safezoneW;
					h 	= B_HEIGHT * P_HEIGHT * safezoneH;
					
					default = true;
				};
				class Button_20: Button_10 {
					idc = 20;
					
					text = "Load Game";
					tooltip = "Continue previous save";
					
					onButtonClick = "closeDialog 0; [] remoteExec ['OT_fnc_loadGame',2,false];";
					
					y 	= (B_Y + B_SPACING + B_HEIGHT) * P_HEIGHT * safezoneH;
				};
				class Button_30: Button_10 {
					idc = 30;
					
					text = "Wiki";
					tooltip = "Opens link to the GitHub Wiki";
					
					onButtonClick = "";
					url = "https://github.com/deadorbit/DeadsOverthrow/wiki";
					overlayMode = 1;
					
					y 	= (B_Y + (B_SPACING + B_HEIGHT) * 2.0) * P_HEIGHT * safezoneH;
				};
			};
		};
	};
	//Cleanup
	#undef P_X
	#undef P_Y
	#undef P_WIDTH
	#undef P_HEIGHT
	#undef B_WIDTH	
	#undef B_HEIGHT
	#undef B_SPACING
	#undef B_X		
	#undef B_Y
	#undef I_X 	
    #undef I_Y 	
	#undef I_WIDTH 
	#undef I_HEIGHT
	#undef BTEXT_HEIGHT
	#undef BTEXT_WIDTH	
	#undef BTEXT_Y			
	#undef BTEXT_X		
};
