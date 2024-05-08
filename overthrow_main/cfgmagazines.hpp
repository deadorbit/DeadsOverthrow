class CfgMagazines {
    class DemoCharge_Remote_Mag;
    class IEDUrbanSmall_Remote_Mag: DemoCharge_Remote_Mag {
        ot_craftable = 1;
        ot_craftQuantity = 1;
        ot_craftRecipe = "[[""HandGrenade"",4],[""ACE_Cellphone"",1]]";
    };
    class IEDLandSmall_Remote_Mag: IEDUrbanSmall_Remote_Mag {
        ot_craftable = 1;
        ot_craftQuantity = 1;
        ot_craftRecipe = "[[""HandGrenade"",4],[""ACE_Cellphone"",1]]";
    };
    class IEDUrbanBig_Remote_Mag: DemoCharge_Remote_Mag {
        ot_craftable = 1;
        ot_craftQuantity = 2;
        ot_craftRecipe = "[[""CA_LauncherMagazine"",2],[""ACE_Cellphone"",2]]";
    };
    class IEDLandBig_Remote_Mag: IEDUrbanBig_Remote_Mag {
        ot_craftable = 1;
        ot_craftQuantity = 2;
        ot_craftRecipe = "[[""OT_Fertilizer"",1],[""OT_NVC"",1],[""ACE_Cellphone"",2]]";
    };
};
