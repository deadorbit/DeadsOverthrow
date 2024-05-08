if (call OT_fnc_playerIsGeneral) then {
		private _target = OT_factoryLevel + 1;
		private _price = ((500000*(_target^2))+(2500000*_target)-2000000) * 2;

        private _money = [] call OT_fnc_resistanceFunds;
        if(_money >= _price) then {
            [-_price] call OT_fnc_resistanceFunds;
			OT_factoryLevel = _target;
			publicVariable "OT_factoryLevel";
            format["The Factory has been upgraded to level %1",OT_factoryLevel] remoteExec ["OT_fnc_notifyMinor",0,false];
        }else{
            format["The resistance cannot afford this"] remoteExec ["OT_fnc_notifyMinor",0,false];
        };
};
