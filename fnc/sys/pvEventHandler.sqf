if (isNil "PVEH_netSay3D") then {
	PVEH_netSay3D = [objNull,0];
};

"PVEH_netSay3D" addPublicVariableEventHandler {
	private["_array"];
	_array = _this select 1;
	if (hasInterface) exitWith {
		(_array select 0) say3D (_array select 1);
		[format["PVEH say3D: execute %1 on %2", (_array select 1), str(position (_array select 0))]] call ADL_DEBUG;
	};
};
