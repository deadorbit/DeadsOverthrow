class CfgMarkers {
	class ot_markerbase {
		name = "";
		icon = "";
		color[] = {1, 0, 0, 1};
		size = 32;
		shadow = true;
		scope = 1;
		markerClass = "Flags";
	};
	class ot_Camp : ot_markerbase {
		name = "Camp";
		icon = MARKER_CAMP;
	};
	class ot_Shop : ot_markerbase {
		name = "Shop";
		icon = MARKER_SHOP;
	};
	class ot_Police : ot_markerbase {
		name = "Police";
		icon = MARKER_POLICE;
	};
	class ot_Anarchy : ot_markerbase {
		name = "Anarchy";
		icon = MARKER_ANARCHY;
	};
	class ot_Warehouse : ot_markerbase {
		name = "Warehouse";
		icon = MARKER_WAREHOUSE;
	};
	class ot_Business : ot_markerbase {
		name = "Business";
		icon = MARKER_BUSINESS;
	};
	class ot_Factory : ot_markerbase {
		name = "Factory";
		icon = MARKER_FACTORY;
	};
	class ot_CarStore : ot_markerbase {
		name = "Car Store";
		icon = MARKER_CARSTORE;
	};
	class ot_HQ : ot_markerbase {
		name = "HQ";
		icon = MARKER_HQ;
		color[] = {1, 1, 1, 1};
	};
	//Flags
	class flag_Malden_liberated : ot_markerbase {
		name = "Malden Liberated";
		icon = FLAG_MALDEN_LIBERATED;
		color[] = {1, 1, 1, 1};
	};
	
	class flag_Malden_occupied : ot_markerbase {
		name = "Malden Occupied";
		icon = FLAG_MALDEN_OCCUPIED;
		color[] = {1, 1, 1, 1};
	};
};