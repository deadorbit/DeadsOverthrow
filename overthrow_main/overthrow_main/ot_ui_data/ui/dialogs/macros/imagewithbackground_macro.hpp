#define IMAGE_WITH_BACKGROUND(IMGCLASS,ID,X,W,Y,H,IMGSCALE,BGCOLOR,FGCOLOR) \
	class IMGCLASS##_BG : IMGCLASS { \
		idc = ID; \
		colorText[] = BGCOLOR; \
		x = (X * safezoneWX); \
		w = (W * safezoneW); \
		y = (Y * safezoneHY); \
		h = (H * safezoneH); \
	}; \
	class IMGCLASS##_FG : IMGCLASS##_BG { \
		idc = ID##1; \
		colorText[] = FGCOLOR; \
		x = ((X + ((W - (W * IMGSCALE)) * 0.5)) * safezoneWX); \
		w = (W * IMGSCALE * safezoneW); \
		y = ((Y + ((H - (H * IMGSCALE)) * 0.5)) * safezoneHY); \
		h = (H * IMGSCALE * safezoneH); \
	}