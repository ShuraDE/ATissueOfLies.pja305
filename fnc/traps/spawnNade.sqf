private ["_holder","_actionRemoveTrap"];
if (alive prison_money_2 && !(isNil "MONEY_NADE")) then {
	
	["money nade init"] call ADL_DEBUG;

	_holder = createVehicle [ "GroundWeaponHolder", [13219.729492,6561.291504,1.37793], [], 0, "CAN_COLLIDE" ];
	_holder addMagazineCargoGlobal ["HandGrenade", 1];
	
	["money nade spawned"] call ADL_DEBUG;
	
	MONEY_NADE = _holder;
	publicVariable "MONEY_NADE";
	
	["money nade finish"] call ADL_DEBUG;
};
