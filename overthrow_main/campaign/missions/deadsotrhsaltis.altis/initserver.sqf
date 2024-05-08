/*
 * Overthrow
 *
 * Server Init
 *
 */

//Init VCM 3.4
[] execVM "overthrow_main\functions\AI\Vcom\VcomInit.sqf";

[] call OT_fnc_initOverthrow;

[
	independent, 100, 
	[["Land_BagFence_Short_F",5],
	["Land_BagFence_Round_F",5],
	["Land_Plank_01_4m_F",5],
	["Land_SlumWall_01_s_2m_F",5],
	["Land_BagFence_Long_F",10],
	["Land_SandbagBarricade_01_hole_F",15],
	["Land_Mil_ConcreteWall_F",15],
	["Land_Barricade_01_4m_F",20],
	["Land_BagBunker_Small_F",25]]
] call acex_fortify_fnc_registerObjects;
