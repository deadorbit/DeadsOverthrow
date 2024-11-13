#define OT_LEGAL_ITEM(className, bc, wc, sc, pc, cc)\
	class className : OT_itemData_base { \
		baseCost = bc; \
		woodCost = wc; \
		steelCost = sc; \
		plasticCost = pc; \
		clothCost = cc; \
		isIllegal = 0; \
	}
	
#define OT_ILLEGAL_ITEM(className, bc, wc, sc, pc, cc)\
	class className : OT_itemData_base { \
		baseCost = bc; \
		woodCost = wc; \
		steelCost = sc; \
		plasticCost = pc; \
		clothCost = cc; \
		isIllegal = 1; \
	}
