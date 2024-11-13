private _data = _this call OT_fnc_getBusinessData;
private _baseprice = 150000;
if(count _data isEqualTo 2) then {
    //turns nothing into money
    _baseprice = round(_baseprice * 1.2);
};
if(count _data isEqualTo 4) then {
        if((_data select 3) == "OT_Ore") then {
            _baseprice = round(_baseprice * 1.2);
        };
        if((_data select 3) == "OT_Sugarcane") then {
            _baseprice = round(_baseprice * 0.6);
        };
		if((_data select 3) == "OT_Grapes") then {
            _baseprice = round(_baseprice * 0.6);
        };
		if((_data select 3) == "OT_Olives") then {
            _baseprice = round(_baseprice * 0.7);
        };
		if((_data select 3) == "OT_Fertalizer") then {
            _baseprice = round(_baseprice * 0.9);
        };
};

if(count _data isEqualTo 5) then {
        if((_data select 5) == "OT_Steel") then {
            _baseprice = round(_baseprice * 2.5);
        };
		if((_data select 3) == "OT_Plastic") then {
            _baseprice = round(_baseprice * 1.8);
        };
        if((_data select 3) == "OT_CE") then {
            _baseprice = round(_baseprice * 3);
        };
		if((_data select 3) == "OT_Furniture") then {
            _baseprice = round(_baseprice * 3.2);
        };
		if((_data select 3) == "OT_MP") then {
            _baseprice = round(_baseprice * 2.7);
        };
};
private _stability = 1.0 - ((server getVariable [format["stability%1",OT_nation],100]) / 100);

_baseprice + (_baseprice * _stability)
