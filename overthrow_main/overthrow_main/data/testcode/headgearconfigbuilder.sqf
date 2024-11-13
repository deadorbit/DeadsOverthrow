private _allCfgHelmets = format 
	["
		(
			((configName _x) isKindOf [""H_HelmetB"", configFile >> ""CfgWeapons""])
			||
			((configname _x) isKindOf [""HelmetBase"", configFile >> ""CfgWeapons""])
		)
		&&
		(getNumber ( _x >> ""scope"" ) isEqualTo 2)
		&&
		(getNumber(_x >> 'ItemInfo' >> 'HitpointsProtectionInfo' >> 'Head' >> 'armor') > 0.1)
	"] 
configClasses (configFile >> "CfgWeapons");

private _validateIllegalMode = true;
private _legalExceptions = []; //Baseclasses that shouldnt be thought illegal
private _legalProtThreshold = 0.5; //Amount of total armor where a helmet is probably meant for nefarious means