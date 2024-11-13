/*
	class className {
		baseCost 	= Int
		woodCost 	= Float
		steelcost 	= Float
		plasticCost	= Float
		clothCost 	= Float
		
		all 0 material cost means the item cannot be produced
	};
*/

//ACE Bandages
OT_LEGAL_ITEM(ACE_fieldDressing, 1, 0, 0, 0, 0.1);
OT_LEGAL_ITEM(ACE_packingBandage, 4, 0, 0, 0, 0.2);
OT_LEGAL_ITEM(ACE_quikclot, 4, 0, 0, 0, 0.2);
OT_LEGAL_ITEM(ACE_elasticBandage, 6, 0, 0, 0, 0.25);

//Ace Injectors (drugs)
OT_LEGAL_ITEM(ACE_morphine, 10, 0, 0, 0.1, 0.2);
OT_LEGAL_ITEM(ACE_epinephrine, 10, 0, 0, 0.1, 0.2);
OT_LEGAL_ITEM(ACE_painkillers, 15, 0, 0, 0.2, 0.1);
OT_LEGAL_ITEM(ACE_atropine, 20, 0, 0, 0.2, 0.2);
	
//Ace IV
OT_LEGAL_ITEM(ACE_salineIV_250, 40, 0, 0, 0, 0);
OT_LEGAL_ITEM(ACE_salineIV_500, 53, 0, 0, 0, 0);
OT_LEGAL_ITEM(ACE_salineIV, 70, 0, 0, 0, 0);

OT_LEGAL_ITEM(ACE_bloodIV_250, 116, 0, 0, 0, 0);
OT_LEGAL_ITEM(ACE_bloodIV_500, 154, 0, 0, 0, 0);
OT_LEGAL_ITEM(ACE_bloodIV, 205, 0, 0, 0, 0);

OT_LEGAL_ITEM(ACE_plasmaIV_250, 141, 0, 0, 0, 0);
OT_LEGAL_ITEM(ACE_plasmaIV_500, 188, 0, 0, 0, 0);
OT_LEGAL_ITEM(ACE_plasmaIV, 250, 0, 0, 0, 0);
//Ace Medical Kits

//Ace Medical Tools/Others

//Arma Medical items (fall back)