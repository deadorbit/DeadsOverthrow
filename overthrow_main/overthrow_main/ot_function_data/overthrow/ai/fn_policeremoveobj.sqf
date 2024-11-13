//script to stop police from having milliatary grade explosives
_me = _this;
sleep 30;

_BadItemMag = ["rhsusf_m112_mag","rhs_mine_Mk2_tripwire_mag","DemoCharge_Remote_Mag","ClaymoreDirectionalMine_Remote_Mag","APERSTripMine_Wire_Mag","SLAMDirectionalMine_Wire_Mag","APERSBoundingMine_Range_Mag","IEDUrbanSmall_Remote_Mag","rhsusf_m112x4_mag","IEDLandBig_Remote_Mag","IEDUrbanBig_Remote_Mag","SatchelCharge_Remote_Mag","ATMine_Range_Mag","rhs_mine_TM43_mag","Drone_Range_Mag","Drone_Range_Mag_dummy","IEDLandSmall_Remote_Mag"];

_VestInv = (getMagazineCargo vestContainer _me) select 0;
_UniInv = (getMagazineCargo uniformContainer _me) select 0;

if !(alive _me) exitwith {};
{
	_cls = _x;
	if (_cls in _BadItemMag) then {
		_me removemagazine _cls;
	};
}foreach(_VestInv);

{
	_cls = _x;
	if (_cls in _BadItemMag) then {
		_me removemagazine _cls;
	};
}foreach(_UniInv);