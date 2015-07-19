if (!isNil("MONEY_NADE")) then  {
	if (_this select 0) then {
		if (player getVariable ["adl_disarmAction",-1] == -1) then {
			player setVariable ["adl_disarmAction", player addAction ["Disarm", 
						{
							deleteVehicle MONEY_NADE;
							deleteVehicle t_moneytrap;
							
							[[false],"ADL_TRAPS_MONEY_NADE_MENU" ,true,true] call BIS_fnc_MP;
							[false] call ADL_TRAPS_MONEY_NADE_MENU;
							
							MONEY_NADE = nil;
							publicVariable "MONEY_NADE";
							
							["money nade disarmed"] call ADL_DEBUG;
						}]];
			["action disarm money nade append"] call ADL_DEBUG;
		};
	} else {
		if (player getVariable ["adl_disarmAction",-1] != -1) then {
			player removeAction (player getVariable ["adl_disarmAction",-1]);
			player setVariable ["adl_disarmAction", -1];
			["action disarm money nade removed"] call ADL_DEBUG;
		};
	};
};