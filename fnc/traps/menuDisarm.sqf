if (_this select 0) then {
	if (player getVariable ["adl_disarmAction",-1] == -1) then {
		player setVariable ["adl_disarmAction", player addAction ["Disarm", {deleteVehicle MONEY_NADE;}]];
		["disarm action append"] call ADL_DEBUG;
	};
} else {
	if (player getVariable ["adl_disarmAction",-1] != -1) then {
		player removeAction (player getVariable ["adl_disarmAction",-1]);
		["disarm action removed"] call ADL_DEBUG;
	};
};