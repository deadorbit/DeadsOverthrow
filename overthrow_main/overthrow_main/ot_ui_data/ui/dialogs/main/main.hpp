#include "components\startMenu_component.hpp"
#include "components\tutorial_component.hpp"

class OT_dialog_vehicle
{
	idd=-1;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1103: RscOverthrowStructuredText
		{
			idc = 1103;

			text = "";
			x = 0 * safezoneWX;
			y = 0 * safezoneHY;
			w = 0.159844 * safezoneW;
			h = 1 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Xeqozy)
		////////////////////////////////////////////////////////
		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			action = "closeDialog 0;[] spawn OT_fnc_fastTravel;";
			tooltip = "Fast travels this vehicle and it's occupants"; //--- ToDo: Localize;

			text = "Fast Travel"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.126 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class RscButton_1614: RscOverthrowButton
		{
			idc = 1614;
			action = "closeDialog 0;[player] spawn OT_fnc_recover;";
			tooltip = "Loot bodies within 150m"; //--- ToDo: Localize;

			text = "Loot"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.214 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class RscButton_1613: RscOverthrowButton
		{
			idc = 1613;
			text = "Jobs"; //--- ToDo: Localize;
			action = "call OT_fnc_jobsDialog";

			x = 0.005 * safezoneWX;
			y = 0.302 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;

		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			text = "Transfer In"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.478 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Transfers the contents of the closest container into this vehicle"; //--- ToDo: Localize;
			action = "closeDialog 0;[] spawn OT_fnc_transferFrom;";
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			text = "Transfer Out"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.390 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Transfers the contents of this vehicle into the closest container"; //--- ToDo: Localize;
			action = "closeDialog 0;[] spawn OT_fnc_transferTo;";
		};
		class RscButton_1603: RscOverthrowButton
		{
			idc = 1603;
			text = "Transfer Legal In"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.566 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Transfers only legal (sellable) items from the closest container into this vehicle"; //--- ToDo: Localize;
			action = "closeDialog 0;[] spawn OT_fnc_transferLegit;";
		};
		class RscButton_1604: RscOverthrowButton
		{
			idc = 1604;
			text = "Take Legal"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.654 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Takes legal (sellable) items from the vehicle into your inventory"; //--- ToDo: Localize;
			action = "closeDialog 0;[] spawn OT_fnc_takeLegit;";
		};
		class RscButton_1605: RscOverthrowButton
		{
			idc = 1605;
			text = "Lock Vehicle"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.742 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Locks this car so only you can drive it or access it's inventory"; //--- ToDo: Localize;
			action = "closeDialog 0;[] call OT_fnc_lockVehicle;";
		};
		class RscButton_1612: RscOverthrowButton
		{
			idc = 1612;
			action = "call OT_fnc_optionsDialog";

			text = "Options"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.885 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class RscButton_1620: RscOverthrowButton
		{
			idc = 1620;
			action = "closeDialog 0;[] spawn OT_fnc_mapInfoDialog";

			text = "Map Info"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.04 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.066 * safezoneH;
			tooltip = "Retrieve information on town stability and more"; //--- ToDo: Localize;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};

class OT_dialog_container
{
	idd=-1;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1103: RscOverthrowStructuredText
		{
			idc = 1103;

			text = "";
			x = 0 * safezoneWX;
			y = 0 * safezoneHY;
			w = 0.159844 * safezoneW;
			h = 1 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Xeqozy)
		////////////////////////////////////////////////////////
		/*class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			text = "Transfer From"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.478 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Transfers the contents of the closest container into this vehicle"; //--- ToDo: Localize;
			action = "closeDialog 0;[] spawn OT_fnc_transferFrom;";
		};*/
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			text = "Transfer Out"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.390 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Transfers the contents of this container into another container"; //--- ToDo: Localize;
			action = "closeDialog 0;[cursortarget] spawn OT_fnc_transferTo;";
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			text = ""; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.478 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = ""; //--- ToDo: Localize;
			action = "";
		};
		class RscButton_1603: RscOverthrowButton
		{
			idc = 1603;
			text = ""; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.566 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = ""; //--- ToDo: Localize;
			action = "";
		};
		class RscButton_1604: RscOverthrowButton
		{
			idc = 1604;
			text = "Import"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.654 * safezoneHY;//0.011
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Import items from the global market"; //--- ToDo: Localize;
			action = "closeDialog 0;createDialog ""OT_dialog_import"";[cursortarget] call OT_fnc_importDialog;";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};

class OT_dialog_vehiclewarehouse
{
	idd=-1;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1103: RscOverthrowStructuredText
		{
			idc = 1103;

			text = "";
			x = 0 * safezoneWX;
			y = 0 * safezoneHY;
			w = 0.159844 * safezoneW;
			h = 1 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Xeqozy)
		////////////////////////////////////////////////////////

		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			text = "Fast Travel"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.39 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			action = "closeDialog 0;[] spawn OT_fnc_fastTravel;";
			tooltip = "Fast travels this vehicle and it's occupants"; //--- ToDo: Localize;
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			text = "Take From"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.654 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Take from the warehouse"; //--- ToDo: Localize;
			action = "closeDialog 0;createDialog ""OT_dialog_warehouse"";[] call OT_fnc_warehouseDialog;";
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			text = "Store All"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.478 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Stores the contents of this vehicle in the warehouse"; //--- ToDo: Localize;
			action = "closeDialog 0;[] spawn OT_fnc_storeAll;";
		};
		class RscButton_1603: RscOverthrowButton
		{
			idc = 1603;
			text = "Transfer Legit"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.566 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Takes all legal (sellable) items from the warehouse"; //--- ToDo: Localize;
			action = "closeDialog 0;[] spawn OT_fnc_transferLegit;";
		};
		class RscButton_1612: RscOverthrowButton
		{
			idc = 1612;
			action = "call OT_fnc_optionsDialog";

			text = "Options"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.885 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.066 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};

class OT_dialog_vehicleport
{
	idd=-1;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1103: RscOverthrowStructuredText
		{
			idc = 1103;

			text = "";
			x = 0 * safezoneWX;
			y = 0 * safezoneHY;
			w = 0.159844 * safezoneW;
			h = 1 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Xeqozy)
		////////////////////////////////////////////////////////

		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			text = "Fast Travel"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.39 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			action = "closeDialog 0;[] spawn OT_fnc_fastTravel;";
			tooltip = "Fast travels this vehicle and it's occupants"; //--- ToDo: Localize;
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			text = "Import"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.654 * safezoneHY;//0.011
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Import items from the global market"; //--- ToDo: Localize;
			action = "closeDialog 0;createDialog ""OT_dialog_import"";[] call OT_fnc_importDialog;";
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			text = "Export All"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.566 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Exports the contents of this vehicle"; //--- ToDo: Localize;
			action = "closeDialog 0;[] spawn OT_fnc_exportAll;";
		};
		class RscButton_1603: RscOverthrowButton
		{
			idc = 1603;
			text = "Purchase Container"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.742 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "View purchasable containers that offer massive amounts of transportation potential."; //--- ToDo: Localize;
			action = "closeDialog 0;[] call OT_fnc_buycontainerdialog;";
		};
		class RscButton_1612: RscOverthrowButton
		{
			idc = 1612;
			action = "call OT_fnc_optionsDialog";

			text = "Options"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.885 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.066 * safezoneH;
		};
		class RscButton_1604: RscOverthrowButton
		{
			idc = 1604;
			text = ""; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.478 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = ""; //--- ToDo: Localize;
			action = "";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};

class OT_dialog_vehiclehardware
{
	idd=-1;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1103: RscOverthrowStructuredText
		{
			idc = 1103;

			text = "";
			x = 0 * safezoneWX;
			y = 0 * safezoneHY;
			w = 0.159844 * safezoneW;
			h = 1 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Xeqozy)
		////////////////////////////////////////////////////////

		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			text = "Fast Travel"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.39 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			action = "closeDialog 0;[] spawn OT_fnc_fastTravel;";
			tooltip = "Fast travels this vehicle and it's occupants"; //--- ToDo: Localize;
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			text = "Buy"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.654 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Buy from this hardware store"; //--- ToDo: Localize;
			action = "closeDialog 0;[] call OT_fnc_buyHardwareDialog;";
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			text = "Sell"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.566 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Sell to this hardware store"; //--- ToDo: Localize;
			action = "closeDialog 0;[] call OT_fnc_sellHardwareDialog;";
		};
		class RscButton_1612: RscOverthrowButton
		{
			idc = 1612;
			action = "call OT_fnc_optionsDialog";

			text = "Options"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.885 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.066 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};

class OT_dialog_vehiclestore
{
	idd=-1;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1103: RscOverthrowStructuredText
		{
			idc = 1103;

			text = "";
			x = 0 * safezoneWX;
			y = 0 * safezoneHY;
			w = 0.159844 * safezoneW;
			h = 1 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Xeqozy)
		////////////////////////////////////////////////////////

		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			text = "Fast Travel"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.39 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			action = "closeDialog 0;[] spawn OT_fnc_fastTravel;";
			tooltip = "Fast travels this vehicle and it's occupants"; //--- ToDo: Localize;
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			text = "Buy"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.654 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Buy from this store"; //--- ToDo: Localize;
			action = "closeDialog 0;[] call OT_fnc_buyDialogVehicle;";
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			text = "Sell"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.566 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Sell to this store"; //--- ToDo: Localize;
			action = "closeDialog 0;[] call OT_fnc_sellDialogVehicle;";
		};
		class RscButton_1612: RscOverthrowButton
		{
			idc = 1612;
			action = "call OT_fnc_optionsDialog";

			text = "Options"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.885 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.066 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};

class OT_dialog_command
{
	idd=-1;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1103: RscOverthrowStructuredText
		{
			idc = 1103;

			text = "";
			x = 0 * safezoneWX;
			y = 0 * safezoneHY;
			w = 0.159844 * safezoneW;
			h = 1 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Xeqozy)
		////////////////////////////////////////////////////////
		class RscButton_1604: RscOverthrowButton
		{
			idc = 1604;
			text = "Open Arsenal"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.236 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Commands first unit selected to walk to and open the closest ammobox arsenal, uses warehouse if ammobox is at a warehouse"; //--- ToDo: Localize;
			action = "closeDialog 0;[] call OT_fnc_orderOpenArsenal;";
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			text = "Loot"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.412 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Commands all selected units to loot bodies and fill closest container to them"; //--- ToDo: Localize;
			action = "closeDialog 0;[] spawn OT_fnc_orderLoot;";
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			text = "Open Inventory"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.324 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Commands first unit selected to open inventory"; //--- ToDo: Localize;
			action = "closeDialog 0;[] spawn OT_fnc_orderOpenInventory;";
		};
		class RscButton_1603: RscOverthrowButton
		{
			idc = 1603;
			text = "Create Squad"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.5 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Splits selected units off into a new squad"; //--- ToDo: Localize;
			action = "closeDialog 0;[] spawn OT_fnc_createSquad;";
		};
		class RscButton_1612: RscOverthrowButton
		{
			idc = 1612;
			action = "call OT_fnc_optionsDialog";

			text = "Options"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.885 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.066 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};

class OT_dialog_squad
{
	idd=-1;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1103: RscOverthrowStructuredText
		{
			idc = 1103;

			text = "";
			x = 0 * safezoneWX;
			y = 0 * safezoneHY;
			w = 0.159844 * safezoneW;
			h = 1 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Xeqozy)
		////////////////////////////////////////////////////////

		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			text = "Assign Vehicle"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.324 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Assigns vehicle you are looking at to squad"; //--- ToDo: Localize;
			action = "closeDialog 0;[] call OT_fnc_squadAssignVehicle;";
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			text = "Get In"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.412 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Orders squad to board assigned vehicle"; //--- ToDo: Localize;
			action = "closeDialog 0;[] call OT_fnc_squadGetIn;";
		};
		class RscButton_1603: RscOverthrowButton
		{
			idc = 1603;
			text = "Get Out"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.5 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Orders squad to disembark vehicle"; //--- ToDo: Localize;
			action = "closeDialog 0;[] call OT_fnc_squadGetOut;";
		};
		class RscButton_1604: RscOverthrowButton
		{
			idc = 1604;
			text = "Get In My Vehicle"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.588 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Orders squad to board your vehicle"; //--- ToDo: Localize;
			action = "closeDialog 0;[] call OT_fnc_squadGetInMyVehicle;";
		};
		class RscButton_1612: RscOverthrowButton
		{
			idc = 1612;
			action = "call OT_fnc_optionsDialog";

			text = "Options"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.885 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.066 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};

class OT_dialog_options
{
	idd=-1;
	movingenable=false;

	class controls
	{
		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			action = "closeDialog 0;[player] remoteExec ['OT_fnc_saveGame',2,false];";

			text = "Persistent Save"; //--- ToDo: Localize;
			x = 0.386563 * safezoneWX;
			y = 0.225 * safezoneHY;
			w = 0.2475 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "A more secure save than default, this will work across updates of both Arma and Overthrow. To load this just restart the mission and choose ""load persistent""."; //--- ToDo: Localize;
		};
		class RscButton_1607: RscOverthrowButton
		{
			idc = 1607;
			action = "[] remoteExec [""OT_fnc_autoSaveToggle"",2];";
			text = "Autosave Toggle"; //--- ToDo: Localize;
			x = 0.386562 * safezoneWX;
			y = 0.313 * safezoneHY;
			w = 0.118594 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Toggle between (0/5/10/15/30/45/60) minute autosaves.\n0 will disable autosaving!"; //--- ToDo: Localize;
		};
		class RscButton_1608: RscOverthrowButton
		{
			idc = 1608;
			action = "[] remoteExec [""OT_fnc_autoloadToggle"",2]";
			text = "Toggle Autoloading"; //--- ToDo: Localize;
			x = 0.515469 * safezoneWX;
			y = 0.313 * safezoneHY;
			w = 0.118594 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Autoload mission if on a dedicated server";
		};

		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			action = "call OT_fnc_jukebox";

			text = "Enable/Disable Jukebox"; //--- ToDo: Localize;
			x = 0.386562 * safezoneWX;
			y = 0.511 * safezoneHY;
			w = 0.118594 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Play randomly selected tracks from the ARMA 3 OST"; //--- ToDo: Localize;
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			action = "[];";

			text = ""; //--- ToDo: Localize;
			x = 0.515469 * safezoneWX;
			y = 0.511 * safezoneHY;
			w = 0.118594 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = ""; //--- ToDo: Localize;
		};
		class RscButton_1603: RscOverthrowButton
		{
			idc = 1603;
			action = "call OT_fnc_decreaseTax";

			text = "Tax % --"; //--- ToDo: Localize;
			x = 0.386562 * safezoneWX;
			y = 0.61 * safezoneHY;
			w = 0.118594 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Decreases the resistance tax rate"; //--- ToDo: Localize;
		};
		class RscButton_1604: RscOverthrowButton
		{
			idc = 1604;
			action = "call OT_fnc_increaseTax";

			text = "Tax % ++"; //--- ToDo: Localize;
			x = 0.515469 * safezoneWX;
			y = 0.61 * safezoneHY;
			w = 0.118594 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Increases the resistance tax rate"; //--- ToDo: Localize;
		};
		class RscButton_1605: RscOverthrowButton
		{
			idc = 1605;
			action = "call OT_fnc_cleanDead;";
			text = "Clean bodies/wrecks"; //--- ToDo: Localize;
			x = 0.386562 * safezoneWX;
			y = 0.412 * safezoneHY;
			w = 0.118594 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Will completely destroy all dead bodies, wrecks and vehicles that cannot move"; //--- ToDo: Localize;
		};
		class RscButton_1606: RscOverthrowButton
		{
			idc = 1606;
			action = "[0,0] remoteExecCall ['setFog',0,false]";

			text = "Clean fog"; //--- ToDo: Localize;
			x = 0.515469 * safezoneWX;
			y = 0.412 * safezoneHY;
			w = 0.118594 * safezoneW;
			h = 0.077 * safezoneH;
			tooltip = "Clears fog"; //--- ToDo: Localize;
		};
		class RscText_1009: RscOverthrowButton
		{
			idc = 1609;
			action = "call OT_fnc_toggleZeus;";
			text = "Toggle Zeus"; //--- ToDo: Localize;
			x = 0.386562 * safezoneWX;
			y = 0.709 * safezoneHY;
			w = 0.2475 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Toggle between zeus access as the host"; //--- ToDo: Localize;
		};
	};
};

class OT_dialog_upload
{
	idd=49558;
	movingenable=false;
	onLoad = "params [""_display""]; _display displayAddEventHandler [""KeyDown"", ""if ((_this select 1) == 1) then { true }""];";

	class controlsBackground
	{
		class background1: RscOverthrowText
		{
			idc = -1;
			text = "OVERTHROW MISSION EXPORT"; //--- ToDo: Localize;
			x = 0.29375 * safezoneWX;
			y = 0.225 * safezoneHY;
			w = 0.4125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
		};
		class background2: RscOverthrowText
		{
			idc = -1;
			x = 0.29375 * safezoneWX;
			y = 0.247 * safezoneHY;
			w = 0.4125 * safezoneW;
			h = 0.528 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class background3: RscOverthrowText
		{
			idc = -1;
			x = 0.298905 * safezoneWX;
			y = 0.577 * safezoneHY;
			w = 0.402187 * safezoneW;
			h = 0.143 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.5};
		};
	};
	class controls
	{
		class EditBox: RscEdit
		{
			idc = 1;
			style= 16;
			x = 0.298906 * safezoneWX;
			y = 0.258 * safezoneHY;
			w = 0.402187 * safezoneW;
			h = 0.308 * safezoneH;
			canModify = 0;
			font="EtelkaMonospacePro";
			colorBackground[] = {-1,-1,-1,0.75};
		};
		class LegalControlGroup: RscControlsGroup
		{
			idc = -1;
			x = 0.298905 * safezoneWX;
			y = 0.577 * safezoneHY;
			w = 0.402187 * safezoneW;
			h = 0.143 * safezoneH;
			class Controls
			{
				class LegalText: RscOverthrowStructuredText
				{
					idc = 5;
					x = 0 * safezoneW;
					y = 0 * safezoneH;
					w = 0.397031 * safezoneW;
					h = 0.143 * safezoneH;
					text = "";
					colorBackground[] = {-1,-1,-1,0};
				};
			};
		};
		class CancelButton: RscOverthrowStructuredText
		{
			idc = -1;
			text = "<t align='center' font='PuristaBold' color='#FFFFFF'>CLOSE MENU</t>"; //--- ToDo: Localize;
			onMouseButtonClick = "playSound ""click""; closeDialog 0;";
			x = 0.298906 * safezoneWX;
			y = 0.731 * safezoneHY;
			w = 0.402187 * safezoneW;
			h = 0.033 * safezoneH;
			onMouseEnter = "(_this select 0) ctrlSetStructuredText parseText ""<t align='center' font='PuristaBold' color='#00FF00'>CLOSE MENU</t>""; (_this select 0) ctrlCommit 0.5; ";
			onMouseExit = "(_this select 0) ctrlSetStructuredText parseText ""<t align='center' font='PuristaBold' color='#FFFFFF'>CLOSE MENU</t>""; (_this select 0) ctrlCommit 0.5; ";
			colorBackground[] = {-1,-1,-1,0.7};
		};
	};
};

class OT_dialog_main
{
	idd=8001;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1103: RscOverthrowStructuredText
		{
			idc = 1103;

			text = "";
			x = 0 * safezoneWX;
			y = 0 * safezoneHY;
			w = 0.159844 * safezoneW;
			h = 1 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class RscStructuredText_1104: RscOverthrowStructuredText
		{
			idc = 1104;

			text = "";
			x = 0.876406 * safezoneWX;
			y = 0 * safezoneHY;
			w = 0.123759 * safezoneW;
			h = 1 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
	};

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Mucomo)
		////////////////////////////////////////////////////////
		class RscButton_1699: RscOverthrowButton
		{
			idc = 1699;
			action = "closeDialog 0;[] spawn OT_fnc_mapInfoDialog";

			text = "Map Info"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.147 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Retrieve information on town stability and more"; //--- ToDo: Localize;
		};
		class RscStructuredText_1100: RscOverthrowStructuredText
		{
			idc = 1100;

			x = 0.005 * safezoneWX;
			y = 0.202 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.202 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		class RscStructuredText_1150: RscOverthrowStructuredText
		{
			idc = 1150;

			x = 0.16 * safezoneWX;
			y = 0.302 * safezoneHY;
			w = 0.3 * safezoneW;
			h = 0.3 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};
		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			action = "closeDialog 0;[] spawn OT_fnc_fastTravel";

			text = "Fast Travel"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.423 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Instantly travel to various controlled locations"; //--- ToDo: Localize;
		};
		class RscButton_1613: RscOverthrowButton
		{
			idc = 1613;
			action = "closeDialog 0;[] spawn OT_fnc_resistanceDialog";

			text = "Resistance"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.478 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Manage owned businesses and resistance funds"; //--- ToDo: Localize;
		};
		class RscButton_1614: RscOverthrowButton
		{
			idc = 1614;
			action = "closeDialog 0;[] spawn OT_fnc_jobsDialog";

			text = "Jobs"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.533 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Jobs and tasks currently available"; //--- ToDo: Localize;
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			action = "closeDialog 0;createDialog 'OT_dialog_place'";

			text = "Place"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.588 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Place smaller items around houses you own or at friendly bases"; //--- ToDo: Localize;
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			action = "closeDialog 0;[] spawn OT_fnc_build";

			text = "Build"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.643 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Build structures in towns and at bases"; //--- ToDo: Localize;
		};
		class RscButton_1603: RscOverthrowButton
		{
			idc = 1603;
			action = "[] spawn OT_fnc_manageRecruitsDialog;";

			text = "Manage Recruits"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.698 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Manage recruits in your group"; //--- ToDo: Localize;
		};
		class RscButton_1611: RscOverthrowButton
		{
			idc = 1611;
			action = "[] spawn OT_fnc_manageHCDialog;";

			text = "Manage HCommand"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.753 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Manage High Command groups you've assigned"; //--- ToDo: Localize;
		};
		class RscButton_1612: RscOverthrowButton
		{
			idc = 1612;
			action = "[] spawn OT_fnc_characterSheetDialog;";

			text = "Skills"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.808 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Upgrade your character"; //--- ToDo: Localize;
		};
		
		class RscButton_1680: RscOverthrowButton
		{
			idc = 1680;
			action = "call OT_fnc_optionsDialog";

			text = "Options"; //--- ToDo: Localize;
			x = 0.005 * safezoneWX;
			y = 0.863 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Persistent save, clear bodies/fog and more"; //--- ToDo: Localize;
		};
		
		
		class RscButton_1620: RscOverthrowButton
		{
			idc = 1620;
			action = "closeDialog 0;[] spawn OT_fnc_manageArea";

			text = "Procurement"; //--- ToDo: Localize;
			x = 0.881562 * safezoneWX;
			y = 0.412 * safezoneHY;
			w = 0.0515625 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class RscButton_1621: RscOverthrowButton
		{
			idc = 1621;
			action = "closeDialog 0;[] call OT_fnc_garrisonDialog";

			text = "Garrison"; //--- ToDo: Localize;
			x = 0.943438 * safezoneWX;
			y = 0.412 * safezoneHY;
			w = 0.0515625 * safezoneW;
			h = 0.044 * safezoneH;
		};

		class RscPicture_1201: RscOverthrowPicture
		{
			idc = 1201;

			text = "#(argb,8,8,3)color(0,0,0,0)";
			x = 0.881562 * safezoneWX;
			y = 0.479 * safezoneHY;
			w = 0.113437 * safezoneW;
			h = 0.1 * safezoneH;
		};
		class RscButton_1608: RscOverthrowButton
		{
			idc = 1608;
			action = "closeDialog 0;[] call OT_fnc_buyBuilding";

			text = "Buy"; //--- ToDo: Localize;
			x = 0.881562 * safezoneWX;
			y = 0.698 * safezoneHY;
			w = 0.113437 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Purchase this building"; //--- ToDo: Localize;
		};
		class RscButton_1630: RscOverthrowButton
		{
			idc = 1630;
			action = "[] spawn{closeDialog 0; waituntil{isnull finddisplay 8001}; call OT_fnc_logisticsDialog}";

			text = "Vehicles"; //--- ToDo: Localize;
			x = 0.881562 * safezoneWX;
			y = 0.247 * safezoneHY;
			w = 0.113437 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "List of all military vehicles and their state"; //--- ToDo: Localize;
		};
		class RscButton_1632: RscOverthrowButton
		{
			idc = 1632;
			action = "[] spawn{closeDialog 0; waituntil{isnull finddisplay 8001}; call OT_fnc_townlogisticDialog};";

			text = "Towns"; //--- ToDo: Localize;
			x = 0.881562 * safezoneWX;
			y = 0.137 * safezoneHY;
			w = 0.113437 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Lists all Towns on the map and their occupation status"; //--- ToDo: Localize;
		};
		class RscButton_1631: RscOverthrowButton
		{
			idc = 1631;
			action = "[] spawn{closeDialog 0; waituntil{isnull finddisplay 8001}; call OT_fnc_containerlogisticDialog};";

			text = "Containers"; //--- ToDo: Localize;
			x = 0.881562 * safezoneWX;
			y = 0.192 * safezoneHY;
			w = 0.113437 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Lists all owned containers (I.E ammoboxes)"; //--- ToDo: Localize;
		};
		class RscButton_1609: RscOverthrowButton
		{
			idc = 1609;
			action = "closeDialog 0;[] call OT_fnc_leaseBuilding";

			text = "Lease"; //--- ToDo: Localize;
			x = 0.881562 * safezoneWX;
			y = 0.753 * safezoneHY;
			w = 0.0515625 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Lease this building"; //--- ToDo: Localize;
		};
		class RscButton_1610: RscOverthrowButton
		{
			idc = 1610;
			action = "closeDialog 0;[] call OT_fnc_setHome";

			text = "Set Home"; //--- ToDo: Localize;
			x = 0.943438 * safezoneWX;
			y = 0.753 * safezoneHY;
			w = 0.0515625 * safezoneW;
			h = 0.044 * safezoneH;
			tooltip = "Make this your home (respawn point)"; //--- ToDo: Localize;
		};
		class RscStructuredText_1101: RscOverthrowStructuredText
		{
			idc = 1101;

			x = 0.881562 * safezoneWX;
			y = 0.302 * safezoneHY;
			w = 0.113437 * safezoneW;
			h = 0.1 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		class RscStructuredText_1102: RscOverthrowStructuredText
		{
			idc = 1102;

			x = 0.881562 * safezoneWX;
			y = 0.588 * safezoneHY;
			w = 0.113437 * safezoneW;
			h = 0.1 * safezoneH;
			colorBackground[] = {0,0,0,0.4};
		};
		class RscPicture_1200: RscOverthrowPicture
		{
			idc = 1200;
			text = IMAGE_OVERTHROW_LOGO_NEW;
			x = 0.00499997 * safezoneWX;
			y = 0.002 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.144 * safezoneW;
		};
		/*class RscStructuredText_1106: RscOverthrowStructuredText
		{
			idc = 1106;

			x = safezoneX + (0.8 * safezoneW);
			y = safezoneY + (0.15 * safezoneH);
			w = 0.19 * safezoneW;
			h = 0.1 * safezoneH;
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,0};
		};*/
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class OT_dialog_char
{
	idd=8003;
	movingenable=false;

	class controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Pejity)
		////////////////////////////////////////////////////////
		class RscStructuredText_1100: RscOverthrowStructuredText
		{
			idc = 1100;
			text = ""; //--- ToDo: Localize;
			x = 0.273125 * safezoneWX;
			y = 0.269 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.143 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0,0,0,0.5};
		};
		class RscButton_1600: RscOverthrowButton
		{
			idc = 1600;
			text = "Increase Level (-10 Influence)"; //--- ToDo: Localize;
			x = 0.273125 * safezoneWX;
			y = 0.423 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
			action="[""fitness""] call buyPerk;";
		};
		class RscStructuredText_1101: RscOverthrowStructuredText
		{
			idc = 1101;
			text = "Increase Level (-10 Influence)"; //--- ToDo: Localize;
			x = 0.427812 * safezoneWX;
			y = 0.269 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.143 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			colorActive[] = {0,0,0,0.3};
		};
		class RscButton_1601: RscOverthrowButton
		{
			idc = 1601;
			text = "Increase Level (-10 Influence)"; //--- ToDo: Localize;
			x = 0.427812 * safezoneWX;
			y = 0.423 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
			action="[""trade""] call buyPerk;";
		};
		class RscStructuredText_1102: RscOverthrowStructuredText
		{
			idc = 1102;
			text = ""; //--- ToDo: Localize;
			x = 0.5825 * safezoneWX;
			y = 0.269 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.143 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			colorActive[] = {0,0,0,0.3};
		};
		class RscButton_1602: RscOverthrowButton
		{
			idc = 1602;
			text = "Increase Level (-10 Influence)"; //--- ToDo: Localize;
			x = 0.5825 * safezoneWX;
			y = 0.423 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
			action="[""stealth""] call buyPerk;";
		};
		class RscStructuredText_1103: RscOverthrowStructuredText
		{
			idc = 1103;
			text = ""; //--- ToDo: Localize;0.006875
			x = 0.273125 * safezoneWX;
			y = 0.48075 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.143 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			colorActive[] = {0,0,0,0.3};
		};
		class RscButton_1603: RscOverthrowButton
		{
			idc = 1603;
			text = "Increase Level (-10 Influence)"; //--- ToDo: Localize;
			x = 0.273125 * safezoneWX;
			y = 0.630625 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
			action="[""Resilience""] call buyPerk;";
		};
		class RscStructuredText_1104: RscOverthrowStructuredText
		{
			idc = 1104;
			text = ""; //--- ToDo: Localize;0.006875
			x = 0.427812 * safezoneWX;
			y = 0.48075 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.143 * safezoneH;
			colorBackground[] = {0,0,0,0.3};
			colorActive[] = {0,0,0,0.3};
		};
		class RscButton_1604: RscOverthrowButton
		{
			idc = 1604;
			text = "Buy Perk (-100 Influence)"; //--- ToDo: Localize;
			x = 0.427812 * safezoneWX;
			y = 0.630625 * safezoneHY;
			w = 0.149531 * safezoneW;
			h = 0.044 * safezoneH;
			action="[""Covert""] call buyPerk;";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};
};

class OT_dialog_choose
{
	idd=8002;
	movingenable=false;

	class controlsBackground
	{// 0.04 offset
		class RscStructuredText_1099: RscOverthrowStructuredText
		{
			idc = 1099;
			x = 0.172578 * safezoneWX;
			y = 0.17 * safezoneHY;
			w = 0.652844 * safezoneW;
			h = 0.66 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,0};
		};
		
		class RscStructuredText_1098: RscOverthrowStructuredText //PiP background
		{
			idc = 1098;
			x = 0.5 * safezoneWX;
			y = 0.17 * safezoneHY;
			w = 0.33 * safezoneW;
			h = 0.33 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,0.7};
		};
	};
	
	class controls {
		class RscPicture_1210: RscOverthrowPicture //PiP Portrait, top right
		{
			idc = 1210;
			x = 0.5 * safezoneWX;
			y = 0.17 * safezoneHY;
			w = 0.33 * safezoneW;
			h = 0.33 * safezoneH;
			text = "";
		};
		
		class RscStructuredText_1097: RscOverthrowStructuredText //PiP Portrait overlay
		{
			idc = 1097;
			x = 0.5 * safezoneWX; 
			y = 0.39 * safezoneHY;
			w = 0.33 * safezoneW;
			h = 0.11 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,0.2};
			text = "Test text and even more test text that is very extreamly cool";
		};
		
		class RscStructuredText_1096: RscOverthrowStructuredText //PiP warning
		{
			idc = 1096;
			x = 0.5 * safezoneWX; 
			y = 0.17 * safezoneHY;
			w = 0.33 * safezoneW;
			h = 0.11 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
			text = "<t size=""1"" align='Center'>PiP is not enabled in settings</t>";
		};
		
		class RscStructuredText_1088: RscOverthrowStructuredText //Information Panel, top left
		{
			idc = 1088;
			x = 0.172578 * safezoneWX; //Org: 0.242187, moved by -0.069609
			y = 0.17 * safezoneHY;
			w = 0.317422 * safezoneW;
			h = 0.33 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,0.7};
		};
		
		class RscListbox_1500: RscOverthrowListbox //Dialog Options bottom middle
		{
			idc = 1500;
			x = 0.3035468 * safezoneWX;
			y = 0.53 * safezoneHY;
			w = 0.3829064 * safezoneW; //0.1309688
			h = 0.161 * safezoneH;
			colorBackground[] = {0.1, 0.1, 0.1, 0.7};
			colorSelectBackground[] = {0,0,0,0.9};
			style = ST_BORDER | ST_SINGLE;
			onLBSelChanged = "closeDialog 0; (_this select 1) call OT_fnc_choiceMade;";
			
		};
	};
	/* 	class RscButton_1600: RscOverthrowButton
	{
		idc = 1600;
		text = "Lorem Ipsum dolor sit amet blah blah blah"; //--- ToDo: Localize;
		action = "closeDialog 0;0 call OT_fnc_choiceMade;";
		x = 0.298906 * safezoneWX;
		y = 0.478 * safezoneHY;
		w = 0.402187 * safezoneW;
		h = 0.353906 * safezoneH;
		sizeEx = 0.017 * safezoneH;
	};
	class RscButton_1601: RscOverthrowButton
	{
		idc = 1601;
		text = "Lorem Ipsum dolor sit amet blah blah blah"; //--- ToDo: Localize;
		action = "closeDialog 0;1 call OT_fnc_choiceMade;";
		x = 0.298906 * safezoneWX;
		y = 0.544 * safezoneHY;
		w = 0.402187 * safezoneW;
		h = 0.055 * safezoneH;
		sizeEx = 0.017 * safezoneH;
	};
	class RscButton_1602: RscOverthrowButton
	{
		idc = 1602;
		text = "Lorem Ipsum dolor sit amet blah blah blah"; //--- ToDo: Localize;
		action = "closeDialog 0;2 call OT_fnc_choiceMade;";
		x = 0.298906 * safezoneWX;
		y = 0.61 * safezoneHY;
		w = 0.402187 * safezoneW;
		h = 0.055 * safezoneH;
		sizeEx = 0.017 * safezoneH;
	};
	class RscButton_1603: RscOverthrowButton
	{
		idc = 1603;
		text = "Lorem Ipsum dolor sit amet blah blah blah"; //--- ToDo: Localize;
		action = "closeDialog 0;3 call OT_fnc_choiceMade;";
		x = 0.298906 * safezoneWX;
		y = 0.676 * safezoneHY;
		w = 0.402187 * safezoneW;
		h = 0.055 * safezoneH;
		sizeEx = 0.017 * safezoneH;
	};
	class RscButton_1604: RscOverthrowButton
	{
		idc = 1604;
		text = "Lorem Ipsum dolor sit amet blah blah blah"; //--- ToDo: Localize;
		action = "closeDialog 0;4 call OT_fnc_choiceMade;";
		x = 0.298906 * safezoneWX;
		y = 0.742 * safezoneHY;
		w = 0.402187 * safezoneW;
		h = 0.055 * safezoneH;
		sizeEx = 0.017 * safezoneH;
	};
	class RscButton_1605: RscOverthrowButton
	{
		idc = 1605;
		text = "Lorem Ipsum dolor sit amet blah blah blah"; //--- ToDo: Localize;
		action = "closeDialog 0;5 call OT_fnc_choiceMade;";
		x = 0.298906 * safezoneWX;
		y = 0.808 * safezoneHY;
		w = 0.402187 * safezoneW;
		h = 0.055 * safezoneH;
		sizeEx = 0.017 * safezoneH;
	}; */
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT END
	////////////////////////////////////////////////////////
};

class OT_dialog_newgame
{
	idd=8099;
	movingenable=false;

	class controlsBackground {
		class RscStructuredText_1100: RscOverthrowStructuredText
		{
			idc = 1100;
            x = 0.238 * safezoneWX;
            y = 0.269 * safezoneHY;
            w = 0.518 * safezoneW;
            h = 0.495 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0,0,0,0.5};
		};
	};

	class controls
	{
        ////////////////////////////////////////////////////////
        // GUI EDITOR OUTPUT START (by ARMAzac, v1.063, #Zosiwi)
        ////////////////////////////////////////////////////////

        class RscButton_1600: RscOverthrowButton
        {
            idc = 1600;
            text = "Easy"; //--- ToDo: Localize;
            x = 0.426 * safezoneWX;
            y = 0.285 * safezoneHY;
            w = 0.10533333 * safezoneW;
            h = 0.033 * safezoneH;
			action = "server setvariable [""OT_difficulty"",0,true];call OT_fnc_newGameDialog;";
			tooltip = "Recommended for beginners playing solo";
			colorBackground[] = {0,0,0,0.3};
			colorActive[] = {0,0,0,0.3};
        };
        class RscButton_1601: RscOverthrowButton
        {
            idc = 1601;
            text = "Normal"; //--- ToDo: Localize;
            x = 0.5313333333333333 * safezoneWX;
            y = 0.285 * safezoneHY;
            w = 0.1054 * safezoneW;
            h = 0.033 * safezoneH;
			action = "server setvariable [""OT_difficulty"",1,true];call OT_fnc_newGameDialog;";
            color[] = {0,0.8,0,1};
			tooltip = "Recommended for beginners playing in groups or experienced players solo";
			colorBackground[] = {0,0,0,0.3};
			colorActive[] = {0,0,0,0.3};
        };
        class RscButton_1602: RscOverthrowButton
        {
            idc = 1602;
            text = "Hard"; //--- ToDo: Localize;
            x = 0.6366666666666666 * safezoneWX;
            y = 0.285 * safezoneHY;
            w = 0.1054 * safezoneW;
            h = 0.033 * safezoneH;
			action = "server setvariable [""OT_difficulty"",2,true];call OT_fnc_newGameDialog;";
			tooltip = "For the hardcore";
			colorBackground[] = {0,0,0,0.3};
			colorActive[] = {0,0,0,0.3};
        };
        class RscStructuredText_1101: RscOverthrowStructuredText
        {
            idc = 1101;
            text = "<t size=""1.5"" align='Right'>Difficulty:</t>"; //--- ToDo: Localize;
            x = 0.252 * safezoneWX;
            y = 0.285 * safezoneHY;
            w = 0.160 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,0};
        };
        class RscStructuredText_1102: RscOverthrowStructuredText
		//0.0165 inbetween
        {
            idc = 1102;
            text = "<t size=""1.5"" align='Right'>Fast Travel Rules:</t>"; //--- ToDo: Localize;
            x = 0.252 * safezoneWX;
            y = 0.3345 * safezoneHY;
            w = 0.160 * safezoneW;
            h = 0.033 * safezoneH;
			tooltip = "Rules regarding fast travel. Rules of: can't fast travel with illegal items or in a vehicle with cargo always apply.";
            colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,0};
        };
        class RscButton_1603: RscOverthrowButton
        {
            idc = 1603;
            text = "Open"; //--- ToDo: Localize;
            x = 0.426 * safezoneWX;
            y = 0.3345 * safezoneHY;
            w = 0.10533333 * safezoneW;
            h = 0.033  * safezoneH;
			action = "server setvariable [""OT_fastTravelType"",0,true];call OT_fnc_newGameDialog;";
			tooltip = "Can fast travel in non-millitary vehicle.";
			colorBackground[] = {0,0,0,0.3};
			colorActive[] = {0,0,0,0.3};
        };
        class RscButton_1604: RscOverthrowButton
        {
            idc = 1604;
            text = "Restricted"; //--- ToDo: Localize;
            x = 0.5313333333333333 * safezoneWX;
            y = 0.3345 * safezoneHY;
            w = 0.1054 * safezoneW;
            h = 0.033 * safezoneH;
			color[] = {0,0.8,0,1};
			action = "server setvariable [""OT_fastTravelType"",1,true];call OT_fnc_newGameDialog;";
			tooltip = "Can only fast travel on foot.";
			colorBackground[] = {0,0,0,0.3};
			colorActive[] = {0,0,0,0.3};
        };
        class RscButton_1605: RscOverthrowButton
        {
            idc = 1605;
            text = "Disabled"; //--- ToDo: Localize;
            x = 0.6366666666666666 * safezoneWX;
            y = 0.3345 * safezoneHY;
            w = 0.1054 * safezoneW;
            h = 0.033 * safezoneH;
			action = "server setvariable [""OT_fastTravelType"",2,true];call OT_fnc_newGameDialog;";
			tooltip = "How our grandparents used to do it.";
			colorBackground[] = {0,0,0,0.3};
			colorActive[] = {0,0,0,0.3};
        };
		class RscStructuredText_1103: RscOverthrowStructuredText
        {
            idc = 1103;
            text = "<t size=""1.5"" align='Right'>Population Modifier:</t>"; //--- ToDo: Localize;
            x = 0.252 * safezoneWX;
            y = 0.384 * safezoneHY;
            w = 0.159844 * safezoneW;
            h = 0.033 * safezoneH;
			tooltip = "How much of town's civilian population is spawned as an interactable entity when the player is near. Has no effect on NATO.";
            colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,0};
        };
        class RscButton_1607: RscOverthrowButton
        {
            idc = 1607;
            text = "Low"; //--- ToDo: Localize;
            x = 0.426  * safezoneWX;
            y = 0.384 * safezoneHY;
            w = 0.10533333  * safezoneW;
            h = 0.033 * safezoneH;
			action = "server setvariable [""OT_popModifier"",0,true];call OT_fnc_newGameDialog;";
			tooltip = "Good for playing with multiple people.";
			colorBackground[] = {0,0,0,0.3};
			colorActive[] = {0,0,0,0.3};
        };
        class RscButton_1608: RscOverthrowButton
        {
            idc = 1608;
            text = "Medium"; //--- ToDo: Localize;
            x = 0.5313333333333333 * safezoneWX;
            y = 0.384 * safezoneHY;
            w = 0.1054 * safezoneW;
            h = 0.033 * safezoneH;
			color[] = {0,0.8,0,1};
			action = "server setvariable [""OT_popModifier"",1,true];call OT_fnc_newGameDialog;";
			tooltip = "Good for solo play.";
			colorBackground[] = {0,0,0,0.3};
			colorActive[] = {0,0,0,0.3};
        };
        class RscButton_1609: RscOverthrowButton
        {
            idc = 1609;
            text = "High"; //--- ToDo: Localize;
            x = 0.6366666666666666 * safezoneWX;
            y = 0.384 * safezoneHY;
            w = 0.1054 * safezoneW;
            h = 0.033 * safezoneH;
			action = "server setvariable [""OT_popModifier"",2,true];call OT_fnc_newGameDialog;";
			tooltip = "Why is my CPU burning?";
			colorBackground[] = {0,0,0,0.3};
			colorActive[] = {0,0,0,0.3};
        };
		class RscStructuredText_1104: RscOverthrowStructuredText
		{
            idc = 1104;
            text = "<t size=""1.5"" align='Right'>Tutorial:</t>"; //--- ToDo: Localize;
            x = 0.252 * safezoneWX;
            y = 0.4335 * safezoneHY;
            w = 0.159844 * safezoneW;
            h = 0.033 * safezoneH;
			tooltip = "Rules regarding the in-game tutorial.";
            colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,0};
        };
        class RscButton_1610: RscOverthrowButton
        {
            idc = 1610;
            text = "Skip"; //--- ToDo: Localize;
            x = 0.426  * safezoneWX;
            y = 0.4335 * safezoneHY;
            w = 0.10533333  * safezoneW;
            h = 0.033 * safezoneH;
			action = "server setvariable [""OT_tutorial"",0,true];call OT_fnc_newGameDialog;";
			tooltip = "Disable the tutorial for new players.";
			colorBackground[] = {0,0,0,0.3};
			colorActive[] = {0,0,0,0.3};
        };
        class RscButton_1611: RscOverthrowButton
        {
            idc = 1611;
            text = "Skip, Items"; //--- ToDo: Localize;
            x = 0.5313333333333333 * safezoneWX;
            y = 0.4335 * safezoneHY;
            w = 0.1054 * safezoneW;
            h = 0.033 * safezoneH;
			color[] = {0,0.8,0,1};
			action = "server setvariable [""OT_tutorial"",1,true];call OT_fnc_newGameDialog;";
			tooltip = "Disables tutorial, will place all items player's would have gotten in their ammobox.";
			colorBackground[] = {0,0,0,0.3};
			colorActive[] = {0,0,0,0.3};
        };
        class RscButton_1612: RscOverthrowButton
        {
            idc = 1612;
            text = "Allow"; //--- ToDo: Localize;
            x = 0.6366666666666666 * safezoneWX;
            y = 0.4335 * safezoneHY;
            w = 0.1054 * safezoneW;
            h = 0.033 * safezoneH;
			action = "server setvariable [""OT_tutorial"",2,true];call OT_fnc_newGameDialog;";
			tooltip = "Allows players to do the tutorial.";
			colorBackground[] = {0,0,0,0.3};
			colorActive[] = {0,0,0,0.3};
        };
			
		class RscStructuredText_1105: RscOverthrowStructuredText
		{
            idc = 1105;
            text = "<t size=""1.5"" align='Right'>Auto-Delete Dead Bodies:</t>"; //--- ToDo: Localize;
            x = 0.252 * safezoneWX;
            y = 0.483 * safezoneHY;
            w = 0.159844 * safezoneW;
            h = 0.033 * safezoneH;
			tooltip = "How long in minutes should a unit a dead body need to have persisted to be automatically cleaned.";
            colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,0};
        };
        class RscButton_1613: RscOverthrowButton
        {
            idc = 1613;
            text = "Never"; //--- ToDo: Localize;
            x = 0.426  * safezoneWX;
            y = 0.483 * safezoneHY;
            w = 0.10533333  * safezoneW;
            h = 0.033 * safezoneH;
			action = "server setvariable [""OT_Despawn"",0,true];call OT_fnc_newGameDialog;";
			tooltip = "Bodies can only be cleared by a server authority, or, if none is present, after a large amount has accumalated";
			colorBackground[] = {0,0,0,0.3};
			colorActive[] = {0,0,0,0.3};
        };
        class RscButton_1614: RscOverthrowButton
        {
            idc = 1614;
            text = "15"; //--- ToDo: Localize;
            x = 0.5313333333333333 * safezoneWX;
            y = 0.483 * safezoneHY;
            w = 0.1054 * safezoneW;
            h = 0.033 * safezoneH;
			color[] = {0,0.8,0,1};
			action = "server setvariable [""OT_Despawn"",1,true];call OT_fnc_newGameDialog;";
			tooltip = "Dead bodies will be marked for deletion after 15 minutes.";
			colorBackground[] = {0,0,0,0.3};
			colorActive[] = {0,0,0,0.3};
        };
        class RscButton_1615: RscOverthrowButton
        {
            idc = 1615;
            text = "60"; //--- ToDo: Localize;
            x = 0.6366666666666666 * safezoneWX;
            y = 0.483 * safezoneHY;
            w = 0.1054 * safezoneW;
            h = 0.033 * safezoneH;
			action = "server setvariable [""OT_Despawn"",2,true];call OT_fnc_newGameDialog;";
			tooltip = "Dead bodies will be marked for deletion after an hour.";
			colorBackground[] = {0,0,0,0.3};
			colorActive[] = {0,0,0,0.3};
        };
		
        class RscButton_1606: RscOverthrowButton
        {
            idc = 1606;
            text = "Start Game"; //--- ToDo: Localize;
            x = 0.577344 * safezoneWX;
            y = 0.708 * safezoneHY;
            w = 0.0876563 * safezoneW;
            h = 0.045 * safezoneH;
			action = "['OT_dialog_start_pfeh'] call OT_fnc_removeLocalPFEH; closeDialog 0;[] remoteExec [""OT_fnc_newGame"",2,false]; 'Loading' call OT_fnc_notifyStart;";
			colorBackground[] = {0,0,0,0.3};
			colorActive[] = {0,0,0,0.3};
        };
        ////////////////////////////////////////////////////////
        // GUI EDITOR OUTPUT END
        ////////////////////////////////////////////////////////
    };
};
