//Used to associate various weapons with apporiate regions and time periods, I.e: Cold War weapons with forest camo for Tanoa
class OT_WeaponRegions {
	class OT_WeaponRegion_Base {
		classname 	= ""; 	// Weapon classname
		period[] 	= {}; 	// What timeperiod would the weapon be fielded in: "PreColdWar","ColdWar", "Modern", "ArmaVerse"
		design[] 	= {}; 	// What enviroment is the weapon textured for: "All","Desert", "Forest", "Snow", "Obscure"
		power[] 	= {}; 	// Historically, which global side is associated with the weapon: "Western", "Eastern", "Neutral"
		rarity 		= 0;	// How much sense does it make for a unit to use the weapon from 1-10
	};
};