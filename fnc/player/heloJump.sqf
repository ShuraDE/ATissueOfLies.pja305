/*
Author(s): cobra4v320 - effects adapted from old halo.sqs 
http://forums.bistudio.com/showthread.php?167042-AI-HALO-Jump-Example-Mission
modified shura
*/

private ["_unit"];
_unit = player;

if (hasInterface) then { //nur für spieler
	
	["helo jump init"] call ADL_DEBUG;
		
	//auto open at 130m above
	[_unit] spawn {
		private ["_unit"];
		_unit = _this select 0;
		["helo auto open init"] call ADL_DEBUG;
		if ((getPos _unit select 2) > 500) then {
			["helo auto open wait for jump"] call ADL_DEBUG;
			waitUntil {(getPos _unit select 2) < 130 && animationState _unit == "HaloFreeFall_non" && alive _unit};
			_unit action ["OpenParachute", _unit]; //open parachute if 150m above ground
		};
		["helo auto open done"] call ADL_DEBUG;
	};

	["helo jump wait for jump"] call ADL_DEBUG;
	waitUntil {animationState _unit == "HaloFreeFall_non"};
	
	//cutText ["", "BLACK FADED",999];
	[_unit] spawn {
		private ["_unit"];
		_unit = _this select 0;
		["helo jumping"] call ADL_DEBUG;
		//sleep 2;

		"dynamicBlur" ppEffectEnable true;   
		"dynamicBlur" ppEffectAdjust [6];   
		"dynamicBlur" ppEffectCommit 0;	 
		"dynamicBlur" ppEffectAdjust [0.0];  
		"dynamicBlur" ppEffectCommit 5;  

		//cutText ["", "BLACK IN", 5];

		["helo jump wait for pilot"] call ADL_DEBUG;
		waitUntil {animationState _unit != "HaloFreeFall_non" && alive _unit};
		sleep 1;
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
		
		["helo jump done, pilot chute"] call ADL_DEBUG;
	};
}; 
