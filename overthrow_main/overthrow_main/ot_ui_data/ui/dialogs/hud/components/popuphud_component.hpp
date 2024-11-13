class overthrowPopupControlGroup : RscControlsGroup {
	class HScrollbar : HScrollbar {
		width = 0;
		height = 0;
		autoScrollEnabled = 0;
	};
	class VScrollbar : HScrollbar {};
	class Controls {
		class backgroundimage_1 : RscOverthrowPicture {
			idc = -1;
			
			text = LABEL_MODERN_INFOPANAL_SMALL_HEADER;
			
			colorBackground[] 	= OT_THEME_MENU_BACKGROUND;
			colorText[] 		= {1,1,1,1};
		};
		class backgroundimage_2 : backgroundimage_1 {};
		class text_header : RscOverthrowStructuredText {};
		class text_body : text_header{};
	};
};

class OT_RscPopupBasic {
	idd			= 10010;
    duration	=  10e10;
    fadein		=  0;
    fadeout		=  0;
	onload		= "uiNamespace setvariable [""OT_RscPopupBasic"", (_this select 0)]";
	
	//Parent Margins
		#define P_X 0.8
		#define P_Y 0.85
		#define P_WIDTH 0.2
		#define P_HEIGHT 0.15
	//header margins
		#define H_X 0.0
		#define H_Y 0.0
		#define H_WIDTH 1.0
		#define H_HEIGHT 0.195
	//body margins
		#define B_X 0.0
		#define B_Y 0.2
		#define B_WIDTH 1.0
		#define B_HEIGHT 0.8
	//Grid for parent (makes X-Y relative to parent)
		#define PARENT_GRID_X(child) (child) * P_WIDTH * safezoneW
		#define PARENT_GRID_Y(child) (child) * P_HEIGHT * safezoneH
	class controls {
		class controlGroup : overthrowPopupControlGroup {
			idc = 100;
			onload = "(_this select 0) ctrlShow false;";
			
			x = P_X * safezoneWX;
			y = P_Y * safezoneHY;
			w = P_WIDTH * safezoneW;
			h = P_HEIGHT * safezoneH;
			class Controls : Controls {
				class backgroundimage_1 : backgroundimage_1 {
					x 	= PARENT_GRID_X(H_X);
					y 	= PARENT_GRID_Y(H_Y);
					w 	= PARENT_GRID_X(H_WIDTH);
					h 	= PARENT_GRID_Y(H_HEIGHT);
				};
				class backgroundimage_2 : backgroundimage_1 {
					text = LABEL_MODERN_INFOPANAL_SMALL;
					
					y 	= PARENT_GRID_Y(B_Y);
					h 	= PARENT_GRID_Y(B_HEIGHT);
				};
				class text_header : RscOverthrowStructuredText {
					idc = 10;
					
					text = "Test Text";
					size = PARENT_GRID_Y(H_HEIGHT);
					
					colorBackground[] 	= {0,0,0,0};
					
					x 	= PARENT_GRID_X(H_X);
					y 	= PARENT_GRID_Y(H_Y);
					w 	= PARENT_GRID_X(H_WIDTH);
					h 	= PARENT_GRID_Y(H_HEIGHT);
					
					class Attributes {
						font = OT_THEME_MENU_FONT_BOLD;
						color = OT_THEME_MENU_TEXT_HEX;
						colorLink = OT_THEME_MENU_TEXT_HEX;
						align = "center";
						shadow = 1;
					};
				};
				class text_main : text_header {
					idc = 20;
					
					text = "Test Text";
					size = PARENT_GRID_Y(H_HEIGHT) * 0.8;
					
					y 	= PARENT_GRID_Y(B_Y);
					h 	= PARENT_GRID_Y(B_HEIGHT);
					
					class Attributes {
						font = OT_THEME_MENU_FONT;
						color = OT_THEME_MENU_TEXT_HEX;
						colorLink = OT_THEME_MENU_TEXT_HEX;
						align = "left";
						shadow = 1;
					};
				};
			};
		};
	};
	//Cleanup
		//Undefine Parent Coords
			#undef P_X
			#undef P_Y
			#undef P_WIDTH
			#undef P_HEIGHT
		//Undefine Header Coords
			#undef H_X		
			#undef H_Y
			#undef H_WIDTH	
			#undef H_HEIGHT
		//Undefine Body Coords
			#undef B_X		
			#undef B_Y
			#undef B_WIDTH	
			#undef B_HEIGHT
		//Undefine Grids
			#undef PARENT_GRID_X
			#undef PARENT_GRID_Y
	//Cleanup End
};