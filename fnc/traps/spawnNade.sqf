private ["_holder","_actionRemoveTrap"];
if (alive prison_money_2) then {
	_holder = createVehicle [ "GroundWeaponHolder", [13219.729492,6561.291504,1.37793], [], 0, "CAN_COLLIDE" ];
	_holder addMagazineCargoGlobal ["HandGrenade", 1];
	
	["spawned"] call ADL_DEBUG;
	
	MONEY_NADE = _holder;
};
