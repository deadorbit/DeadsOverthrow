disableSerialization;
params ["_ctrl","_index"];

private _data = _ctrl lbData _index;
_data = call compile _data;
private _mode = _data select 0;
private _textures = _data select 1;
private _pic = "";

if(count _textures > 0) then {
	if(_mode == 0) then {
		_pic = _textures select 0;
	}else{
		_pic = _textures;
	};
};
ctrlSetText [1200,_pic];