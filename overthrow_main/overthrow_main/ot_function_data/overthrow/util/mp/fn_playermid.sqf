//_this is player unit
//_id is machine ID of client  on server
private _player = _this;
private _id = 0;

_id = _player call BIS_fnc_netID;
_id = _id splitstring ":";
_id = parsenumber(_id select 0);

_id