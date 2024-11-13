/*	
	CBA SETTING EXAMPLE:
		[
			"Commy_ViewDistance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			"View Distance", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"My Mission Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[200, 15000, 5000, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
			nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{  
				params ["_value"];
				setViewDistance _value;
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_fnc_addSetting;
*/

[
    "OT_INV_scriptEnabled",
    "CHECKBOX",
    ["Should the Enhanced Inventory script be enabled?"],
    ["Overthrow", "Enhanced Inventory"],
    [true],
    nil
] call CBA_fnc_addSetting;

[
    "OT_armorCalcSetting",
    "LIST",
    ["Armor Value Calculation Mode","How the effectiveness of body armor is judged."],
    ["Overthrow", "Enhanced Inventory"],
    [[0, 1, 2, 3], ["Combined", "Max", "Average", "Total"], 0],
    nil
] call CBA_fnc_addSetting;

[
    "OT_INV_armorBarUseRelative",
    "LIST",
    ["Armor Total Bar Fill Mode","How the armor total bar in the inventory screen should be calculated."],
    ["Overthrow", "Enhanced Inventory"],
    [[false, true], ["Real", "Relative"], 0],
    nil
] call CBA_fnc_addSetting;

[
    "OT_INV_armorBarCurrentColor",
    "COLOR",
    ["Current Armor Color","The UI color used to represent the current armor values."],
    ["Overthrow", "Enhanced Inventory"],
    [0.00, 0.60, 0.80],
    nil
] call CBA_fnc_addSetting;

[
    "OT_INV_armorBarFutureColor",
    "COLOR",
    ["Future Armor Color","The UI color used to represent the possible change in armor values."],
    ["Overthrow", "Enhanced Inventory"],
    [0.65, 1.00, 1.00],
    nil
] call CBA_fnc_addSetting;
