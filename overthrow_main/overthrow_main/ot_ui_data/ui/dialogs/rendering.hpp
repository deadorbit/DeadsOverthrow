class vehicleSkinDisplay {
	idd=10010;
	movingenable=false;
	class controlsBackground {
		class TextureBackground: RscPicture {
			idc = 1;
			x = 0;
			y = 0;
			w = 1;
			h = 1;
			colorBackground[] = {0,0,0,1};
			text  = "cup\TrackedVehicles\CUP_TrackedVehicles_BMP\bmp2\data\bmp2_01_sla_co.paa";
		};
	};
	class controls {
		class TextureOrigin: RscPicture {
			idc = 2;
			x = 0;
			y = 0;
			w = 1;
			h = 1;
			colorBackground[] = {0,0,0,0};
			colorText[] = {0.5,0.5,0.5,1};
			text  = "";
		};
		class TextureOverlay: RscPicture {
			idc = 3;
			x = 0;
			y = 0;
			w = 1;
			h = 1;
			colorBackground[] = {0,0,0,0};
			colorText[] = {0.5,0.5,0.5,0.5};
			text  = "";
		};
	};
};
