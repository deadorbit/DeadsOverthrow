params [["_baseString", "0,000,000,000,000"], ["_overlayString", "1,000"], ["_baseColor", "#56595c"], ["_overlayColor", "#C6C9CE"]];

private _baseLen = count(_baseString);
private _overlayLen = count(_overlayString);
private _missingLen = _baseLen - _overlayLen;
if (_missingLen < 0) then {
	_overlayString = _overlayString select [_missingLen * -1, _overlayLen];
	_baseString = "";
}else{
	_baseString = _baseString select [0, _baseLen - _overlayLen];
};

private _formatedString = format["<t color='%1'>%2</t><t color='%3'>%4</t>", _baseColor, _baseString, _overlayColor, _overlayString];

_formatedString
