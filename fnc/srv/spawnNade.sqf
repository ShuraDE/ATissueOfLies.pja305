private ["_holder"];
if (alive prison_money_2 && (isNil "MONEY_NADE")) then {
	
	["prison nade init"] call ADL_DEBUG;

	//_holder = createVehicle [ "GroundWeaponHolder", [13219.729492,6561.291504,1.37793], [], 0, "NONE" ];
	_holder = createVehicle [ "GroundWeaponHolder", [13219.75,6561.1,1.37793], [], 0, "NONE"];
	_holder setPosATL [13219.80,6561.0,1.37793]; 
	_holder setDir 250;
	_holder addMagazineCargoGlobal ["HandGrenade", 1];
		
	MONEY_NADE = _holder;
	publicVariable "MONEY_NADE";
	
};
