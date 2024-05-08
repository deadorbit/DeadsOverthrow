params [["_vehicle",objnull]];

createdialog "OT_dialog_paint";

_textctrl = (findDisplay 8000) displayCtrl 1101;
_textctrl ctrlSetStructuredText parseText format["<t size='1.7' shadow='2' align='left' valign = 'middle'>Painting</t>"];

private _textures = [];
private _temp = [];
private _cls = typeof _vehicle;
private _cursel = lbCurSel 1500;

OT_paintTarget = _vehicle;

private _cfg = inheritsfrom (configFile >> "CfgVehicles" >> _cls);
_temp append ([_cfg >> "Texturesources"] call BIS_fnc_returnChildren);//Direct textures for the vehicle

_cfg = inheritsfrom (configFile >> "CfgVehicles" >> _cls);
_temp append ([_cfg >> "Texturesources"] call BIS_fnc_returnChildren);//Textures assigned to the vehicles parent

{
	private _d = tolower(gettext(_x >> "displayName"));
	if(!(_d in _textures)) then {
		_textures pushbackunique _x;
	};
}foreach(_temp);
_temp = nil;

private _price = [_vehicle] call {
	private _cls = _this select 0;
	if(_cls iskindof "Quadbike_01_base_F" || _cls iskindof "Kart_01_Base_F") exitwith {1};
	if(_cls iskindof "Plane" || _cls iskindof "Helicopter") exitwith {5};
	if(_cls iskindof "Tank") exitwith {4};
	if(_cls iskindof "Truck_F") exitwith {3};
	2
};

lbClear 1500;
	
if(count _textures > 0) then {
	private _sorted = [_textures,[],{tolower(gettext(_x >> "displayName"))},"ASCEND"] call BIS_fnc_SortBy;
	{
		private _text = gettext(_x >> "displayName");
		if(!(_text == "")) then {
			private _idx = lbAdd [1500,_text];
			private _data = str([0,getarray(_x >> "textures")]);
			lbSetData [1500,_idx,_data];
			lbSetValue [1500,_idx,_price];
		};
	}foreach(_sorted);
};

private _procedtexs = [
	["Procedural Texture: Black","#(argb,8,8,3)color(0.07,0.07,0.07,1,co)"],
	["Procedural Texture: Dark Gray","#(argb,8,8,3)color(0.13,0.13,0.13,1,co)"],
	["Procedural Texture: Gray","#(argb,8,8,3)color(0.2,0.2,0.2,1,co)"],
	["Procedural Texture: Light Gray","#(argb,8,8,3)color(0.35,0.35,0.35,1,co)"],
	["Procedural Texture: White","#(argb,8,8,3)color(0.45,0.45,0.45,1,co)"],
	["Procedural Texture: Sea Green","#(argb,8,8,3)color(0.2,0.25,0.25,1,co)"],
	["Procedural Texture: Jungle Green","#(argb,8,8,3)color(0.05,0.14,0.05,1,co)"],
	["Procedural Texture: Forest Green","#(argb,8,8,3)color(0.05,0.1,0.05,1,co)"],
	["Procedural Texture: Olive Drab","#(argb,8,8,3)color(0.25,0.25,0.2,1,co)"],
	["Procedural Texture: Mustard Yellow","#(argb,8,8,3)color(0.19,0.15,0,1,co)"],
	["Procedural Texture: Oil Yellow","#(argb,8,8,3)color(0.38,0.34,0.1,1,co)"],
	["Procedural Texture: Dirty Orange","#(argb,8,8,3)color(0.2,0.15,0.1,1,co)"],
	["Procedural Texture: Dirt Brown","#(argb,8,8,3)color(0.13,0.08,0.02,1,co)"],
	["Procedural Texture: Blood Red","#(argb,8,8,3)color(0.15,0.05,0.05,1,co)"],
	["Procedural Texture: Primer Red","#(argb,8,8,3)color(0.25,0.15,0.15,1,co)"],
	["Procedural Texture: Navy Blue","#(argb,8,8,3)color(0,0.11,0.14,1,co)"],
	["Procedural Texture: Silver","#(argb,8,8,3)color(0.15,0.17,0.18,1,co)"],
	["Procedural Texture: Camo AAF","\overthrow_main\ui\textures\ProceduralCamoAAF.paa"],
	["Procedural Texture: Camo CSAT","\overthrow_main\ui\textures\ProceduralCamoCSAT.paa"],
	["Procedural Texture: Camo 1","\overthrow_main\ui\textures\ProceduralCamo1.paa"],
	["Procedural Texture: Camo 2","\overthrow_main\ui\textures\ProceduralCamo2.paa"],
	["Procedural Texture: Camo 3","\overthrow_main\ui\textures\ProceduralCamo3.paa"],
	["Procedural Texture: Camo 4","\overthrow_main\ui\textures\ProceduralCamo4.paa"],
	["Procedural Texture: Camo 5","\overthrow_main\ui\textures\ProceduralCamo5.paa"],
	["Procedural Texture: Camo 6","\overthrow_main\ui\textures\ProceduralCamo6.paa"],
	["Procedural Texture: Camo 7","\overthrow_main\ui\textures\ProceduralCamo7.paa"],
	["Procedural Texture: Camo 8","\overthrow_main\ui\textures\ProceduralCamo8.paa"],
	["Procedural Texture: Camo 9","\overthrow_main\ui\textures\ProceduralCamo9.paa"],
	["Procedural Texture: Camo 10","\overthrow_main\ui\textures\ProceduralCamo10.paa"],
	["Procedural Texture: Camo 11","\overthrow_main\ui\textures\ProceduralCamo11.paa"],
	["Procedural Texture: Camo 12","\overthrow_main\ui\textures\ProceduralCamo12.paa"],
	["Procedural Texture: Camo 13","\overthrow_main\ui\textures\ProceduralCamo13.paa"],
	["Procedural Texture: Camo 14","\overthrow_main\ui\textures\ProceduralCamo14.paa"],
	["Procedural Texture: Camo 15","\overthrow_main\ui\textures\ProceduralCamo15.paa"],
	["Procedural Texture: Camo 16","\overthrow_main\ui\textures\ProceduralCamo16.paa"],
	["Procedural Texture: Camo 17","\overthrow_main\ui\textures\ProceduralCamo17.paa"],
	["Procedural Texture: Camo 18","\overthrow_main\ui\textures\ProceduralCamo18.paa"],
	["Procedural Texture: Camo 19","\overthrow_main\ui\textures\ProceduralCamo19.paa"],
	["Procedural Texture: Camo 20","\overthrow_main\ui\textures\ProceduralCamo20.paa"]
];
	
{
	private _text = _x select 0;
	private _data = str([1,_x select 1]);
	if(!(_text == "")) then {
		private _idx = lbAdd [1500,_text];
		lbSetData [1500,_idx,_data];
		lbSetValue [1500,_idx,_price];
	};
}foreach(_procedtexs);
	
if(_cursel >= _numitems) then {_cursel = 0};
lbSetCurSel [1500, _cursel];
	
_textctrl = (findDisplay 8000) displayCtrl 1100;
_textctrl ctrlSetStructuredText parseText format["
	<t align='center' size='1'>Spraypaint Needed:</t><br/>
	<t align='center' size='0.8'>%1x Blue</t><br/>
	<t align='center' size='0.8'>%1x Green</t><br/>
	<t align='center' size='0.8'>%1x Red</t><br/>
	<t align='center' size='0.8'>%1x Black</t><br/>",
	_price
];