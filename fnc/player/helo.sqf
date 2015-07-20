//need sounds: flapping,para_pilot
private ["_pack","_class","_magazines","_weapons","_items","_helmet"];
    _pack       = unitBackpack _unit;
    _class		= typeOf _pack;
    _magazines	= getMagazineCargo _pack;
    _weapons   	= getWeaponCargo _pack;
    _items      = getItemCargo _pack;
    _helmet     = headgear _unit;

    removeBackpack _unit; //remove the backpack
    _unit addBackpack "b_parachute"; //add the parachute	
	
    cutText ["", "BLACK FADED",999];
    [_unit] spawn {

        private "_unit";
        _unit = _this select 0;

        sleep 2;

        "dynamicBlur" ppEffectEnable true;   
        "dynamicBlur" ppEffectAdjust [6];   
        "dynamicBlur" ppEffectCommit 0;     
        "dynamicBlur" ppEffectAdjust [0.0];  
        "dynamicBlur" ppEffectCommit 5;  

        cutText ["", "BLACK IN", 5];

        while {animationState _unit != "para_pilot" && alive _unit} do {
            playSound "flapping"; //play flapping sound
            sleep 4.2;
        };	
		
        setAperture 0.05; 
        setAperture -1;

        "DynamicBlur" ppEffectEnable true;  
		"DynamicBlur" ppEffectAdjust [8.0];  
        "DynamicBlur" ppEffectCommit 0.01;

        sleep 1;

        "DynamicBlur" ppEffectAdjust [0.0]; 
        "DynamicBlur" ppEffectCommit 3;

        sleep 3;

        "DynamicBlur" ppEffectEnable false;
        "RadialBlur" ppEffectAdjust [0.0, 0.0, 0.0, 0.0]; 
        "RadialBlur" ppEffectCommit 1.0; 
        "RadialBlur" ppEffectEnable false;

 

        while {(getPos _unit select 2) > 2} do {
            playSound "para_pilot";
            sleep 4.2;
        };		
		
    };
