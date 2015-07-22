sleep 1;
cutText ["", "BLACK IN", 15];
15 fadeSound 1; 
15 fadeSpeech 1;
15 fadeMusic 1; 


//	player setVariable ["tf_globalVolume", 0.4]
//	player setVariable ["tf_voiceVolume", 0.6, true]	


if ((getPosASL player) select 2 > 200) then { 
	[] spawn compile preprocessFile "fnc\player\heloCargo.sqf";
	[] spawn compile preprocessFile "fnc\player\heloJump.sqf";	
} else {
	["abort helo; reason: to low"] call ADL_DEBUG;
};