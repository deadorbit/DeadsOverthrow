private _seenColor = [0.6,0.6,0.6,0];
private _seenImage = OT_IMAGE_EYECLOSED;

private _seenNATO = (player call OT_fnc_unitSeenNATO);
private _seenCRIM = (player call OT_fnc_unitSeenCRIM);

switch (true) do {
	case(_seenNATO && _seenCRIM): {
		_seenColor = [0.40, 0.00, 0.50, 0.80];
	};
	case(_seenNATO): {
		_seenColor = [0.00, 0.30, 0.60, 0.80];
	};
	case(_seenCrim): {
		_seenColor = [0.50, 0.00, 0.00, 0.80];
	};
	default {
		_seenImage = OT_IMAGE_EYEEMPTY;
	};
};

[_seenColor, _seenImage]