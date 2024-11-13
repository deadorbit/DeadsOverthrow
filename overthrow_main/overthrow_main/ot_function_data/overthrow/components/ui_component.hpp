//Functions directly affected the player's UI or called from the UI
class UI {
	file = DIRECTORY(\UI);
	
	class dialogFadeIn {};
	class dynamicText {};
	class formatTime {};
	class getAssignedKey {};
	class progressBar {};
	class controlEdgeSlide {};
	class topMessage {};
};

//Functions dealing with RscTitles elements (Huds)
class UIHud {
	file = DIRECTORY(\UI\hud);
	
	class lookAtLoop {};
	class popupBasic{};
	class statsSystem {};
	class statsSystemLoop {};
	class updateLookAtHUD {};
};

//Functions dealing with calls from or affecting dialogs (the other UI type)
class UIDialog {
	file = DIRECTORY(\UI\dialog);
	
	class buyBusinessDialog {};
	class buyClothesDialog {};
	class buycontainerdialog {};
	class buyDialog {};
	class buyDialogVehicle {};
	class buygangdialog {};
	class buyHardwareDialog {};
	class buyVehicleDialog {};
	class characterSheetDialog {};
	class containerdialog {};
	class containerlogisticdialog {};
	class craftDialog {};
	class factoryDialog {};
	class factoryUpgradeDialog {};
	class garrisonDialog {};
	class gunDealerDialog {};
	class importDialog {};
	class inputDialog {};
	class jobsDialog {};
	class LegitMenu {};
	class loadoutDialog {};
	class logisticsDialog {};	
	class mainMenu {};
	class manageHCDialog {};
	class manageRecruitsDialog {};
	class mapInfoDialog {};
	class newGameDialog {};
	class optionsDialog {};
	class paintDialog {};
	class policeDialog {};
	class recruitDialog {};
	class resistanceDialog {};
	class reverseEngineerDialog {};
	class sellDialog {};
	class sellDialogVehicle {};
	class sellHardwareDialog {};
	class sellvalueloop {};
	class townlogisticdialog {};
	class uploadData {};
	class vehicleDialog {};
	class warehouseDialog {};
	class workshopDialog {};
};

//Functions that visually display data based off user's actions
class UIDisplay {
	file = DIRECTORY(\UI\display);
	
	class displayCraftItem {};
	class displayJobDetails {};
	class displayLogisticDetails {};
	class displayPaintPic {};
	class displayselldata {};
	class displayShopPic {};
	class displayWarehousePic {};
	class factoryRefresh {};
	class refreshEmployees {};
	class showBusinessInfo {};
	class showMemberInfo {};
};

class UIControlGroupHandler {
	file = DIRECTORY(\UI\controlgrouphandler);
	
	class startmenubutton {};
};

//Notifies system
class UINotify {
	file = DIRECTORY(\UI\notify);	
	
	class notifyAndLog {};
	class notifyBad {};
	class notifyBig {};
	class notifyGood {};
	class notifyMinor {};
	class notifySilent {};
	class notifyStart {};
	class notifyVehicle {};
};