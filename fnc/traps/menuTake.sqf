if (!(isNull(prison_money_1) && isNull(prison_money_2))) then  {
	if (_this select 0) then {
		if (player getVariable ["adl_takeMoneyAction",-1] == -1) then {
			player setVariable ["adl_takeMoneyAction", player addAction ["Take Money", 
						{
							player addItemToVest "EvMoney";
							
							//remove money 1
							if (!isNull(prison_money_1)) then {
								["delete money 1"] call ADL_DEBUG;
								
								deleteVehicle prison_money_1;

							//remove money 2
							} else {
								["delete money 2"] call ADL_DEBUG;

								//wenn granate noch da, falle auslösen
								["check nade"] call ADL_DEBUG;
								if (!isNil("MONEY_NADE")) then {
									["money trap execute"] call ADL_DEBUG;

									_nade = createVehicle ["GrenadeHand", position prison_money_2, [], 0, "CAN_COLLIDE"];
									//"GrenadeHand" createVehicle  position prison_money_2;
									deleteVehicle MONEY_NADE;
									MONEY_NADE = nil;
									publicVariable "MONEY_NADE";
									
									//remove action entries
									[[false],"ADL_TRAPS_MONEY_NADE_MENU" ,true,true] call BIS_fnc_MP;
									[false] call ADL_TRAPS_MONEY_NADE_MENU;
									
								};
								deleteVehicle prison_money_2;
								
								//remove action entries
								[[false],"ADL_TRAPS_MONEY_TAKE_MENU" ,true,true] call BIS_fnc_MP;
								[false] call ADL_TRAPS_MONEY_TAKE_MENU;
								//remove action menu trigger
								deleteVehicle t_money_take;								
							};
							["money taken by " + name player] call ADL_DEBUG;
						}]];
			["action take money append"] call ADL_DEBUG;
		};
	} else {
		if (player getVariable ["adl_takeMoneyAction",-1] != -1) then {
			player removeAction (player getVariable ["adl_takeMoneyAction",-1]);
			player setVariable ["adl_takeMoneyAction", -1];
			["action take money removed"] call ADL_DEBUG;
		};
	};
};