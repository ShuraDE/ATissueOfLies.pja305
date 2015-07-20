//need sounds: flapping, para_pilot

private ["_unit"];
_unit = player;
	
if (hasInterface) then { //nur für spieler
	
	//auto open at 130m above
	[_unit] spawn {
		private ["_unit"];
		_unit = _this select 0;
		["helo auto open init"] call ADL_DEBUG;
		if ((getPos _unit select 2) > 500) then {
			["helo auto open waiting"] call ADL_DEBUG;
			waitUntil {(getPos _unit select 2) < 130 && animationState _unit == "HaloFreeFall_non" && alive _unit};
			_unit action ["OpenParachute", _unit]; //open parachute if 150m above ground
		};
		["helo auto open done"] call ADL_DEBUG;
	};
	
	["helo wait for jump"] call ADL_DEBUG;
	waitUntil {animationState _unit == "HaloFreeFall_non"};
	
    cutText ["", "BLACK FADED",999];
    [_unit] spawn {
        private ["_unit"];
        _unit = _this select 0;
		["helo init"] call ADL_DEBUG;
        sleep 2;

        "dynamicBlur" ppEffectEnable true;   
        "dynamicBlur" ppEffectAdjust [6];   
        "dynamicBlur" ppEffectCommit 0;     
        "dynamicBlur" ppEffectAdjust [0.0];  
        "dynamicBlur" ppEffectCommit 5;  

        cutText ["", "BLACK IN", 5];

		["helo wait for pilot"] call ADL_DEBUG;
        while {animationState _unit != "para_pilot" && alive _unit} do {
            //playSound "flapping"; //play flapping sound
            //sleep 4.2;		
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
            //playSound "para_pilot";
            //sleep 4.2;
        };		
		["helo jump done"] call ADL_DEBUG;
    };
	
}; 