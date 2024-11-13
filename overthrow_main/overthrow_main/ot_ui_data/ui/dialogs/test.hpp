class OT_test_dialog {
	idd = 90909;
	movingenable=false;
	
	#define myX 0.3
	#define myW 0.4
	#define myY 0.7
	#define myH 0.2
	class OT_test_img : RscOverthrowPicture {
		idc = -1;
	
		text = IMAGE_TALKTO_GENERIC;
	};
	
	class controls {
		//IMAGE_WITH_BACKGROUND(OT_test_img,10,myX,myW,myY,myH,0.75);
	};
};