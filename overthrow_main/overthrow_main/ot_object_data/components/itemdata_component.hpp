#include "..\macros\itemdata_macro.hpp"

class OT_itemData {
	class OT_itemData_base {
		baseCost = 0;
		woodCost = 0;
		steelCost = 0;
		plasticCost = 0;
		clothCost = 0;
		
		isIllegal = 0;
	};
	
	#include "itemdata\medical_data.hpp"
};