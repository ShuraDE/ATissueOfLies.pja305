//cargo mode
    private ["_unit","_pack","_class","_magazines","_weapons","_items","_helmet","_packHolder"];
    _pack       = unitBackpack _unit;
    _class      = typeOf _pack;
    _magazines 	= getMagazineCargo _pack;
    _weapons   	= getWeaponCargo _pack;
    _items      = getItemCargo _pack;
    _helmet     = "";


	if (_altitude > 3040) then 
	{
		if (headgear _unit != "") then {_helmet = headgear _unit;};
		unit addHeadgear "H_CrewHelmetHeli_B";
	};
    removeBackpack _unit; //remove the backpack
    _unit addBackpack "b_parachute"; //add the parachute	

    _packHolder = createVehicle ["groundWeaponHolder", [0,0,0], [], 0, "can_collide"];
	_packHolder addBackpackCargoGlobal [_class, 1];	
	
	
	waitUntil {animationState _unit == "HaloFreeFall_non"};
    _packHolder attachTo [_unit,[-0.12,-0.02,-.74],"pelvis"]; 
    _packHolder setVectorDirAndUp [[0,-1,-0.05],[0,0,-1]];	
    
	waitUntil {animationState _unit == "para_pilot"};
	_packHolder attachTo [vehicle _unit,[-0.07,0.67,-0.13],"pelvis"]; 
	_packHolder setVectorDirAndUp [[0,-0.2,-1],[0,1,0]];

	waitUntil {isTouchingGround _unit || (getPos _unit select 2) < 1};
	detach _packHolder;
	deleteVehicle _packHolder; //delete the backpack in front	
	
	_unit addBackpack _class; //return the backpack
	clearAllItemsFromBackpack _unit; //clear all gear from new backpack

	if (__helmet != "" && _helmet != "H_CrewHelmetHeli_B") then 
	{
		(unitBackpack _unit) addItemCargoGlobal [_helmet, 1];
	}; //(not complete) do a check to see if there is available space

	for "_i" from 0 to (count (_magazines select 0) - 1) do {
		(unitBackpack _unit) addMagazineCargoGlobal [(_magazines select 0) select _i,(_magazines select 1) select _i]; //return the magazines
	};

	for "_i" from 0 to (count (_weapons select 0) - 1) do {
		(unitBackpack _unit) addWeaponCargoGlobal [(_weapons select 0) select _i,(_weapons select 1) select _i]; //return the weapons
	};

	for "_i" from 0 to (count (_items select 0) - 1) do {
		(unitBackpack _unit) addItemCargoGlobal [(_items select 0) select _i,(_items select 1) select _i]; //return the items
	};	
