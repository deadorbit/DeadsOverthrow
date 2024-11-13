class OT_SprayBlack {
	displayName 	= "";
	requiredItem 	= "ACE_SpraypaintBlue";
	textures[]		= {""};
	icon 			= "\z\ace\addons\tagging\UI\icons\iconTaggingBlack.paa";
};
class OT_SprayRed 		: OT_SprayBlack {
	requiredItem 	= "ACE_SpraypaintRed";
	icon 			= "\z\ace\addons\tagging\UI\icons\iconTaggingRed.paa";
};
class OT_SprayGreen 	: OT_SprayBlack{
	requiredItem 	= "ACE_SpraypaintGreen";
	icon 			= "\z\ace\addons\tagging\UI\icons\iconTaggingGreen.paa";
};
class OT_SprayBlue 		: OT_SprayBlack {
	requiredItem 	= "ACE_SpraypaintBlue";
	icon 			= "\z\ace\addons\tagging\UI\icons\iconTaggingBlue.paa";
};
class OT_SprayYellow 	: OT_SprayBlack{
	requiredItem 	= "ACE_SpraypaintYellow";
	icon 			= "\z\ace\addons\tagging\UI\icons\iconTaggingYellow.paa";
};
class OT_SprayWhite 	: OT_SprayBlack {
	requiredItem 	= "ACE_SpraypaintWhite";
	icon 			= "\z\ace\addons\tagging\UI\icons\iconTaggingWhite.paa";
};

class ACE_Tags {
	//Black
	class OT_goHome 	: OT_SprayBlack {
		displayName = "NATO Go Home";
		textures[] 	= {"\overthrow_main\ot_ui_data\ui\tags\black\ot_tag_gohome_ca.paa"};
	};
	class OT_fuckNato 	: OT_SprayBlack {
		displayName = "Fuck NATO";
		textures[] 	= {"\overthrow_main\ot_ui_data\ui\tags\black\fucknato.paa"};
	};
	class OT_join 		: OT_SprayBlack {
		displayName = "Join";
		textures[] 	= {"\overthrow_main\ot_ui_data\ui\tags\black\join.paa"};
	};
	class OT_live 		: OT_SprayBlack {
		displayName = "Live";
		textures[] 	= {"\overthrow_main\ot_ui_data\ui\tags\black\live.paa"};
	};
	class OT_stand 		: OT_SprayBlack {
		displayName = "stand";
		textures[] 	= {"\overthrow_main\ot_ui_data\ui\tags\black\stand.paa"};
	};
	class OT_heyNato 	: OT_SprayBlack {
		displayName = "hey Nato";
		textures[]	= {"\overthrow_main\ot_ui_data\ui\tags\black\heynato.paa"};
	};
	class OT_comply 	: OT_SprayBlack {
		displayName = "comply";
		textures[] 	= {"\overthrow_main\ot_ui_data\ui\tags\black\comply.paa"};
	};
	class OT_logoblack 	: OT_SprayBlack {
		displayName = "Overthrow Black";
		textures[] 	= {"\overthrow_main\ot_ui_data\ui\tags\black\ot_tag_logoblack_ca.paa"};
	};
	
	//Red
	class OT_youare 	: OT_SprayRed {
		displayName = "you are";
		textures[] = {"\overthrow_main\ot_ui_data\ui\tags\red\youare.paa"};
	};
	class OT_spill 		: OT_SprayRed {
		displayName = "spill";
		textures[] = {"\overthrow_main\ot_ui_data\ui\tags\red\spill.paa"};
	};
	
	class OT_rebel 		: OT_SprayRed {
		displayName = "rebel";
		textures[] = {"\overthrow_main\ot_ui_data\ui\tags\red\rebel.paa"};
	};
	class OT_logored 	: OT_SprayRed {
		displayName = "Overthrow Red";
		textures[] = {"\overthrow_main\ot_ui_data\ui\tags\red\ot_tag_logored_ca.paa"};
	};
	
	//Yellow
	class OT_logoyellow : OT_SprayYellow {
		displayName = "Overthrow Yellow";
		textures[] = {"\overthrow_main\ot_ui_data\ui\tags\yellow\ot_tag_logoyellow_ca.paa"};
	};
	class OT_cringe 	: OT_SprayYellow {
		displayName = "Cringe";
		textures[] = {"\overthrow_main\ot_ui_data\ui\tags\yellow\ot_tag_cringe_ca.paa"};
	};
	
	//Green
	class OT_logogreen 	: OT_SprayGreen {
		displayName = "Overthrow Green";
		textures[] = {"\overthrow_main\ot_ui_data\ui\tags\green\ot_tag_logogreen_ca.paa"};
	};
	class OT_papagee 	: OT_SprayGreen {
		displayName = "Papagee";
		textures[] = {"\overthrow_main\ot_ui_data\ui\tags\green\papagee.paa"};
	};
	
	//Blue
	class OT_schizo 	: OT_SprayBlue {
		displayName = "Schizo";
		textures[] = {"\overthrow_main\ot_ui_data\ui\tags\blue\schizo.paa"};
	};
	class OT_inmy 		: OT_SprayBlue {
		displayName = "In My";
		textures[] = {"\overthrow_main\ot_ui_data\ui\tags\blue\inmy.paa"};
	};
	class OT_logoblue 	: OT_SprayBlue {
		displayName = "Overthrow Blue";
		textures[] = {"\overthrow_main\ot_ui_data\ui\tags\blue\ot_tag_logoblue_ca.paa"};
	};
	
	//White
	class OT_logowhite 	: OT_SprayWhite {
		displayName = "Overthrow White";
		textures[] = {"\overthrow_main\ot_ui_data\ui\tags\white\ot_tag_logowhite_ca.paa"};
	};
		class OT_logorainbow : OT_SprayWhite {
		displayName = "Overthrow Rainbow";
		textures[] = {"\overthrow_main\ot_ui_data\ui\tags\white\ot_tag_logorainbow_ca.paa"};
	};
};