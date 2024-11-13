if (isnil "NR6_SiteMarkNotif") then {NR6_SiteMarkNotif = true};

NR6_SiteFMarkB = {
	if (NR6_SiteMarkNotif) then { ['NR6_Objective_B',[(_this select 0) + ' Seized', (_this select 0) + ' has been seized by ' + (_this select 1)]] remoteExecCall ["BIS_fnc_showNotification",0];};
};

NR6_SiteFMarkO = {
	if (NR6_SiteMarkNotif) then { ['NR6_Objective_O',[(_this select 0) + ' Seized', (_this select 0) + ' has been seized by ' + (_this select 1)]] remoteExecCall ["BIS_fnc_showNotification",0];};
};

NR6_SiteFMarkI = {
	if (NR6_SiteMarkNotif) then { ['NR6_Objective_I',[(_this select 0) + ' Seized', (_this select 0) + ' has been seized by ' + (_this select 1)]] remoteExecCall ["BIS_fnc_showNotification",0];};
};
