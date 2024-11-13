//Images
#define IMAGE_OVERTHROW_LOGO_RECT "\overthrow_main\ot_ui_data\ui\images\logos\logo_overthrow_rect.paa"

#define IMAGE_OVERTHROW_LOGO "\overthrow_main\ot_ui_data\ui\images\logos\logo_overthrow.paa"

#define IMAGE_OVERTHROW_LOGO_NEW "\overthrow_main\ot_ui_data\ui\images\logos\ot_logo_new_ca.paa"

#define IMAGE_CLOSED_SIGN_DEPRECATED "\overthrow_main\ot_ui_data\ui\images\closed_deprecated.paa"

#define IMAGE_CLOSED_SIGN_WHITE "\overthrow_main\ot_ui_data\ui\images\ot_closedsign_white_ca.paa"

#define IMAGE_CLEAR "\overthrow_main\ot_ui_data\ui\images\clear.paa"

#define IMAGE_MECHANICALGEAR "\overthrow_main\ot_ui_data\ui\images\ot_icon_gear_ca.paa"

#define IMAGE_LEFTARROW "\overthrow_main\ot_ui_data\ui\images\ot_icon_leftarrow_ca.paa"

#define IMAGE_RIGHTARROW "\overthrow_main\ot_ui_data\ui\images\ot_icon_rightarrow_ca.paa"

#define IMAGE_AUSTRAL1 "\overthrow_main\ot_ui_data\ui\images\currency\ot_austral.paa"

#define IMAGE_AUSTRAL2 "\overthrow_main\ot_ui_data\ui\images\currency\ot_austral2.paa"

#define IMAGE_EYE "\overthrow_main\ot_ui_data\ui\images\ot_icon_eye_ca.paa"

#define IMAGE_EYECLOSED "\overthrow_main\ot_ui_data\ui\images\ot_icon_eyeclosed_ca.paa"

#define IMAGE_EYEEMPTY "\overthrow_main\ot_ui_data\ui\images\ot_icon_eyeempty_ca.paa"

//TalkTo Icons
#define IMAGE_TALKTO_GENERAL "\overthrow_main\ot_ui_data\ui\images\talkto\ot_talkto_general_ca.paa"

#define IMAGE_TALKTO_GENERIC "\overthrow_main\ot_ui_data\ui\images\talkto\ot_talkto_generic_ca.paa"

//Labels (UI design elements)
#define LABEL_MODERN_VMENU_BUTTON_ACTIVE "\overthrow_main\ot_ui_data\ui\labels\vmenu\buttons\modern_vmenu_button_active_ca.paa"

#define LABEL_MODERN_VMENU_BUTTON_NORMAL "\overthrow_main\ot_ui_data\ui\labels\vmenu\buttons\modern_vmenu_button_normal_ca.paa"

#define LABEL_MODERN_VMENU_BUTTON_NORMAL "\overthrow_main\ot_ui_data\ui\labels\vmenu\buttons\modern_vmenu_button_normal_ca.paa"

#define LABEL_MODERN_INFOPANAL_SMALL "\overthrow_main\ot_ui_data\ui\labels\infomenu\modern_infopanal_small_ca.paa"

#define LABEL_MODERN_INFOPANAL_SMALL_HEADER "\overthrow_main\ot_ui_data\ui\labels\infomenu\modern_infopanal_small_header_ca.paa"

//markers
#define MARKER_CAMP "\overthrow_main\ot_ui_data\ui\markers\camp.paa"

#define MARKER_SHOP "\overthrow_main\ot_ui_data\ui\markers\shop.paa"

#define MARKER_POLICE "\overthrow_main\ot_ui_data\ui\markers\police.paa"

#define MARKER_ANARCHY "\overthrow_main\ot_ui_data\ui\markers\anarchy.paa"

#define MARKER_WAREHOUSE "\overthrow_main\ot_ui_data\ui\markers\warehouse.paa"

#define MARKER_BUSINESS "\overthrow_main\ot_ui_data\ui\markers\business.paa"

#define MARKER_FACTORY "\overthrow_main\ot_ui_data\ui\markers\factory.paa"

#define MARKER_CARSTORE "\overthrow_main\ot_ui_data\ui\markers\shop-car.paa"

#define MARKER_HQ "\overthrow_main\ot_ui_data\ui\markers\hq.paa"

#define MARKER_HARDWARE "\overthrow_main\ot_ui_data\ui\markers\shop-hardware.paa"

#define MARKER_PIER "\overthrow_main\ot_ui_data\ui\markers\shop-boat.paa"

#define MARKER_DEATH "\overthrow_main\ot_ui_data\ui\markers\death.paa"

//flags
#define FLAG_MALDEN_LIBERATED "\overthrow_main\ot_ui_data\ui\flags\flag_malden_liberated_co.paa"

#define FLAG_MALDEN_OCCUPIED "\overthrow_main\ot_ui_data\ui\flags\flag_malden_occupied_co.paa"

//To connect defines in a way that can be used in sqf scripts
class OT_CfgImages {
	//Template
	class OT_imageTemplate {
		imageDesc = ""; //For camo names, or others
		imageDir = "";
	};
	//Images
	class OT_image_overthrow_logo_rect : OT_imageTemplate {
		imageDir = IMAGE_OVERTHROW_LOGO_RECT;
	};
	class OT_image_overthrow_logo : OT_imageTemplate {
		imageDir = IMAGE_OVERTHROW_LOGO;
	};
	class OT_image_overthrow_logo_new : OT_imageTemplate {
		imageDir = IMAGE_OVERTHROW_LOGO_NEW;
	};
	class OT_image_closed_sign_dep : OT_imageTemplate {
		imageDir = IMAGE_CLOSED_SIGN_DEPRECATED;
	};
	class OT_image_closed_sign_white : OT_imageTemplate {
		imageDir = IMAGE_CLOSED_SIGN_WHITE;
	};
	class OT_image_clear : OT_imageTemplate {
		imageDir = IMAGE_CLEAR;
	};
	class OT_image_eye : OT_imageTemplate {
		imageDir = IMAGE_EYE;
	};
	class OT_image_eyeclosed : OT_imageTemplate {
		imageDir = IMAGE_EYECLOSED;
	};
	class OT_image_eyeempty : OT_imageTemplate {
		imageDir = IMAGE_EYEEMPTY;
	};
	//Talkto
	class OT_image_talkto_general : OT_imageTemplate {
		imageDir = IMAGE_TALKTO_GENERAL;
	};
	class OT_image_talkto_generic : OT_imageTemplate {
		imageDir = IMAGE_TALKTO_GENERIC;
	};
	//UI Labels
	class OT_label_modern_vmenu_button_active : OT_imageTemplate {
		imageDir = LABEL_MODERN_VMENU_BUTTON_ACTIVE;
	};
	class OT_label_modern_vmenu_button_normal : OT_imageTemplate {
		imageDir = LABEL_MODERN_VMENU_BUTTON_NORMAL;
	};
	//Marker images
	class OT_marker_camp : OT_imageTemplate {
		imageDir = MARKER_CAMP;
	};
	class OT_marker_shop : OT_imageTemplate {
		imageDir = MARKER_SHOP;
	};
	class OT_marker_anarchy : OT_imageTemplate {
		imageDir = MARKER_ANARCHY;
	};
	class OT_marker_warehouse : OT_imageTemplate {
		imageDir = MARKER_WAREHOUSE;
	};
	class OT_marker_business : OT_imageTemplate {
		imageDir = MARKER_BUSINESS;
	};
	class OT_marker_factory : OT_imageTemplate {
		imageDir = MARKER_FACTORY;
	};
	class OT_marker_carstore : OT_imageTemplate {
		imageDir = MARKER_CARSTORE;
	};
	class OT_marker_hq : OT_imageTemplate {
		imageDir = MARKER_HQ;
	};
	class OT_marker_hardware : OT_imageTemplate {
		imageDir = MARKER_HARDWARE;
	};
	class OT_marker_pier : OT_imageTemplate {
		imageDir = MARKER_PIER;
	};
	class OT_marker_death : OT_imageTemplate {
		imageDir = MARKER_DEATH;
	};
	//flag images
	class OT_flag_malden_liberated : OT_imageTemplate {
		imageDir = FLAG_MALDEN_LIBERATED;
	};
	class OT_flag_malden_occupied : OT_imageTemplate {
		imageDir = FLAG_MALDEN_OCCUPIED;
	};
};