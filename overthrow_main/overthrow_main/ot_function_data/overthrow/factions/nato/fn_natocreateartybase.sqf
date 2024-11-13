private _break = false; 
private _tries = 0;
while {!_break && _tries < 100} do{ 
	sleep 0.1; 
	_base = getmarkerpos "Marker_0";    
	private _radius = 10000;   
	private _exp = "(1 - trees) * (1 - sea) * (1 - houses) * (0.5 - hills)";   
	private _prec = 50;  
	private _bestplace = selectBestPlaces [_base,_radius,_exp,_prec,1];   
	private _spot = _bestplace select 0;   
	private _TargetLoc = _spot select 0; 
  
	_isEmpty = !(_TargetLoc  isFlatEmpty  [20, -1, -1, -1, -1, false, player] isEqualTo []); 
  
	if (_isEmpty) then { 
		_thegay = [
		["Land_Mil_WallBig_4m_F",[-2.27228,-12.0525,-0.0119424],359.898,1,0,[0,0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[5.40712,-12.022,-0.0119424],359.898,1,0,[0,0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[-5.74481,-12.0725,-0.0119424],359.898,1,0,[0,0],"","",true,false], 
		["Land_ConcreteHedgehog_01_F",[-2.20764,-13.2544,0.0119934],360,1,0,[-1.30034e-007,2.19917e-006],"","",true,false], 
		["Land_ConcreteHedgehog_01_F",[5.32406,-12.9642,0.011991],1.32712e-005,1,0,[0.000604872,0.000147453],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[9.33048,-12.0491,-0.0119424],359.898,1,0,[0,0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[-9.58031,-12.0704,-0.0119424],359.898,1,0,[0,0],"","",true,false], 
		["Land_ConcreteHedgehog_01_F",[-7.47176,-13.2043,0.011991],360,1,0,[-0.000604291,0.000147577],"","",true,false],  
		["Land_Mil_WallBig_4m_F",[13.1744,-12.0164,-0.0119424],359.898,1,0,[0,0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[-13.4242,-12.103,-0.0119424],359.898,1,0,[0,0],"","",true,false], 
		["B_MBT_01_arty_F",[11.3774,13.53,-0.0827584],179.342,1,0,[1.4638,-0.0243913],"","",true,false], 
		["Land_BagBunker_Small_F",[-7.58686,-16.8181,0],359.94,1,0,[0,0],"","",true,false], 
		["RHS_M2StaticMG_USMC_D",[-7.99915,-16.8622,0],183.312,1,0,[-0.000584805,-0.0030678],"","",true,false], 
		["Land_BagBunker_Small_F",[9.75732,-16.753,0],359.94,1,0,[0,0],"","",true,false], 
		["RHS_M2StaticMG_USMC_D",[9.50457,-16.867,0],183.313,1,0,[-0.00023989,0.00101016],"","",true,false], 
		["Land_ConcreteHedgehog_01_F",[15.5939,-12.968,0.0119934],360,1,0,[-8.03528e-006,1.18128e-005],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[17.0099,-12.0186,-0.0119424],359.898,1,0,[0,0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[-17.1494,-12.206,-0.0119424],359.898,1,0,[0,0],"","",true,false], 
		["Land_TentHangar_V1_F",[11.0707,17.3873,0],0,1,0,[0,0],"","",true,false], 
		["B_MBT_01_arty_F",[-16.0465,13.53,-0.0820904],179.342,1,0,[1.46437,-0.0243367],"","",true,false], 
		["Land_ConcreteHedgehog_01_F",[-17.2745,-13.2809,0.011991],2.20052e-006,1,0,[-0.000127221,0.000600554],"","",true,false], 
		["Land_HBarrier_5_F",[-4.1187,-19.4161,0],89.8696,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_5_F",[6.23689,-19.6576,0],89.8696,1,0,[0,0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[20.6015,-12.038,-0.0119424],359.898,1,0,[0,0],"","",true,false], 
		["Land_TentHangar_V1_F",[-16.0798,17.3967,0],0,1,0,[0,0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[-20.9849,-12.2039,-0.0119424],359.898,1,0,[0,0],"","",true,false], 
		["Land_ConcreteHedgehog_01_F",[22.354,-13.1638,0.0119934],4.83995e-005,1,0,[5.32692e-007,1.74263e-005],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[24.4455,-12.0054,-0.0119424],359.898,1,0,[0,0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[-24.8288,-12.2365,-0.0119424],359.898,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_5_F",[-4.10688,-25.0044,0],89.8696,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_5_F",[6.24871,-25.1928,0],89.8696,1,0,[0,0],"","",true,false], 
		["Land_DragonsTeeth_01_4x2_new_redwhite_F",[-14.317,-25.6806,0],203.062,1,0,[0,0],"","",true,false], 
		["RHS_M2StaticMG_USMC_D",[-27.7521,-7.89274,4.371],183.313,1,0,[-0.000323445,-0.00100624],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[-27.4317,-12.1561,-0.0119424],359.898,1,0,[0,0],"","",true,false], 
		["Land_Cargo_Patrol_V3_F",[-28.7525,-8.40137,0],0,1,0,[0,0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[28.281,-12.0075,-0.0119424],359.898,1,0,[0,0],"","",true,false], 
		["Land_ConcreteHedgehog_01_F",[27.7989,-12.9222,0.011991],360,1,0,[-0.000600994,0.000147375],"","",true,false], 
		["Land_DragonsTeeth_01_4x2_new_redwhite_F",[17.8995,-25.3443,0],161.635,1,0,[0,-0],"","",true,false], 
		["Land_ConcreteHedgehog_01_F",[-29.1407,-12.9886,0.011991],2.69456e-005,1,0,[-0.000137071,-0.000599044],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[-31.2672,-12.1539,-0.0119424],359.898,1,0,[0,0],"","",true,false], 
		["Land_DragonsTeeth_01_4x2_new_redwhite_F",[-26.2059,-20.9052,0],203.062,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_Big_F",[-3.92454,33.6321,0],1.33008,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_Big_F",[4.41874,33.6838,0],1.33008,1,0,[0,0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[32.1612,-11.9061,-0.0119424],359.898,1,0,[0,0],"","",true,false], 
		["Land_Cargo_HQ_V3_F",[30.421,15.9971,0],272.391,1,0,[0,0],"","",true,false], 
		["StorageBladder_01_fuel_sand_F",[-31.127,16.4168,0],89.8261,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_Big_F",[-12.1663,33.4627,0],1.33008,1,0,[0,0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[-36.3263,-1.87742,-0.0119424],89.8646,1,0,[0,0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[-36.3749,2.07552,-0.0119424],89.8646,1,0,[0,0],"","",true,false], 
		["Land_DragonsTeeth_01_4x2_new_redwhite_F",[29.9735,-21.0586,0],161.635,1,0,[0,-0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[-36.2385,5.76842,-0.0119424],89.8646,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_Big_F",[13.0006,33.7486,0],1.33008,1,0,[0,0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[-36.3272,-5.88846,-0.0119424],89.8646,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_5_F",[0.696835,-36.3556,0],179.588,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_5_F",[6.26672,-36.2606,0],179.588,1,0,[0,-0],"","",true,false], 
		["Land_Cargo_Patrol_V3_F",[35.5899,-8.82298,0],0,1,0,[0,0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[-35.1111,-12.1866,-0.0119424],359.898,1,0,[0,0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[-36.2792,9.51664,-0.0119424],89.8646,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_5_F",[-4.8909,-36.3823,0],179.588,1,0,[0,-0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[-36.2865,-9.63669,-0.0119424],89.8646,1,0,[0,0],"","",true,false], 
		["Land_ConcreteHedgehog_01_F",[-37.0156,-3.25655,0.0119991],0.000194394,1,0,[0.0012487,-0.00438007],"","",true,false], 
		["Land_HBarrier_5_F",[11.6077,-36.0686,0],179.588,1,0,[0,-0],"","",true,false], 
		["Land_ConcreteHedgehog_01_F",[34.9642,-12.9809,0.0119934],360,1,0,[2.74188e-005,1.24568e-005],"","",true,false], 
		["Land_ConcreteHedgehog_01_F",[-37.2966,1.87888,0.0119934],7.11858e-007,1,0,[7.03459e-006,1.20362e-005],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[36.0051,-11.8734,-0.0119424],359.898,1,0,[0,0],"","",true,false], 
		["Land_ConcreteHedgehog_01_F",[-35.6713,-12.9229,0.0119934],1.32978e-005,1,0,[6.04916e-006,1.00973e-005],"","",true,false], 
		["RHS_M2StaticMG_USMC_D",[36.7262,-8.35315,4.371],183.313,1,0,[-0.000297621,0.000985761],"","",true,false], 
		["Land_ConcreteHedgehog_01_F",[-37.1112,8.95519,0.011991],4.003e-005,1,0,[0.000606638,-0.000141988],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[-36.2783,13.5277,-0.0119424],89.8646,1,0,[0,0],"","",true,false], 
		["Land_ConcreteHedgehog_01_F",[-37.6069,-9.21315,0.011991],5.14917e-007,1,0,[-0.000598757,0.000151961],"","",true,false], 
		["Land_HBarrier_Big_F",[-20.4938,33.5469,0],1.33008,1,0,[0,0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[-36.3269,17.4806,-0.0119424],89.8646,1,0,[0,0],"","",true,false], 
		["Land_ConcreteHedgehog_01_F",[-37.0798,14.8507,0.0119939],3.10847e-005,1,0,[4.0957e-007,6.45867e-005],"","",true,false], 
		["Land_HBarrier_Big_F",[21.2916,33.679,0],1.33008,1,0,[0,0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[39.8406,-11.8755,-0.0119424],359.898,1,0,[0,0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[-36.4068,21.3557,-0.0119424],89.8646,1,0,[0,0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[42.2939,-1.81625,-0.0119424],271.121,1,0,[0,0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[42.3354,1.93197,-0.0119424],271.121,1,0,[0,0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[42.205,-5.82631,-0.0119424],271.121,1,0,[0,0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[42.3405,5.80782,-0.0119424],271.121,1,0,[0,0],"","",true,false], 
		["Land_ConcreteHedgehog_01_F",[-37.203,20.7071,0.011991],2.09541e-006,1,0,[-0.000613939,0.00012921],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[42.1669,-9.77937,-0.0119424],271.121,1,0,[0,0],"","",true,false], 
		["Land_ConcreteHedgehog_01_F",[40.8626,-12.96,0.011991],5.1907e-005,1,0,[-0.000615185,-0.000120283],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[42.3787,9.76087,-0.0119424],271.121,1,0,[0,0],"","",true,false], 
		["Land_ConcreteHedgehog_01_F",[43.3721,5.04918,0.0119939],360,1,0,[2.58318e-006,6.41388e-005],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[-36.4475,25.1039,-0.0119424],89.8646,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_Big_F",[-28.6842,33.4885,0],1.33008,1,0,[0,0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[42.4675,13.7709,-0.0119424],271.121,1,0,[0,0],"","",true,false], 
		["Land_ConcreteHedgehog_01_F",[43.2171,-10.0703,0.0119939],3.11077e-005,1,0,[2.32929e-006,6.04015e-005],"","",true,false], 
		["Land_ConcreteHedgehog_01_F",[43.5415,9.84808,0.0119934],360,1,0,[-8.86783e-006,9.0028e-006],"","",true,false], 
		["Land_HBarrier_Big_F",[29.7564,33.6731,0],1.33008,1,0,[0,0],"","",true,false], 
		["Land_ConcreteHedgehog_01_F",[43.2306,14.0033,0.0119934],2.70517e-006,1,0,[2.68704e-005,9.0457e-006],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[42.509,17.5191,-0.0119424],271.121,1,0,[0,0],"","",true,false], 
		["Land_ConcreteHedgehog_01_F",[-37.1642,27.3452,0.0119939],3.11518e-005,1,0,[3.4706e-006,6.38224e-005],"","",true,false], 
		["B_Radar_System_01_F",[45.8832,-5.54152,-0.102454],182.187,1,0,[1.55164e-005,7.66729e-007],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[-36.4466,29.1149,-0.0119424],89.8646,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_Big_F",[-31.8563,33.7383,0],0,1,0,[-13.438,2.39347],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[42.7264,21.2082,-0.0119424],271.121,1,0,[0,0],"","",true,false], 
		["Land_ConcreteHedgehog_01_F",[43.685,19.6596,0.0119934],5.55371e-005,1,0,[8.3642e-006,7.6943e-006],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[-36.4952,33.0679,-0.0119424],89.8646,1,0,[0,0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[42.7645,25.1612,-0.0119424],271.121,1,0,[0,0],"","",true,false], 
		["Land_ConcreteHedgehog_01_F",[-37.2065,33.4256,0.0119934],3.18615e-005,1,0,[-5.06964e-007,2.00136e-005],"","",true,false], 
		["Land_ConcreteHedgehog_01_F",[43.595,24.9046,0.0119939],3.11302e-005,1,0,[3.70346e-006,6.1553e-005],"","",true,false], 
		["Land_HBarrier_Big_F",[38.1634,33.7717,0],1.33008,1,0,[0,0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[42.8534,29.1713,-0.0119424],271.121,1,0,[0,0],"","",true,false], 
		["Land_Mil_WallBig_4m_F",[42.8948,32.9195,-0.0119424],271.121,1,0,[0,0],"","",true,false], 
		["Land_Radar_Small_F",[49.1204,19.4591,0],88.7517,1,0,[0,0],"","",true,false], 
		["Land_ConcreteHedgehog_01_F",[43.9474,32.0065,0.0119939],360,1,0,[-2.93886e-006,5.8685e-005],"","",true,false], 
		["B_SAM_System_03_F",[58.3139,19.2838,-0.102454],360,1,0,[5.70118e-006,-4.80181e-007],"","",true,false]
		]; 
		_objects = [_TargetLoc, 0, _thegay, 0] call BIS_fnc_objectsMapper; 
		player setpos _TargetLoc;
		
		{
			private _veh = _x;
			private _pos = position _veh;
			if (_veh isKindOf "StaticWeapon") then {
				createVehicleCrew _veh;
				if(_x isKindOf "StaticWeapon") then { //Added to keep statics from falling over -Ded
					private _lock = "Land_Antibiotic_F" createVehicle _pos;
					_lock hideObjectGlobal true;
					_veh attachTo [_lock];
				};
			};
		}foreach(_objects);
		_break = true; 
	}else{
		_tries = _tries + 1;
	};
}; 