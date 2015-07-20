if ((getPos player) select 2 > 150) then { 
	[] spawn compile preprocessFile "fnc\player\heloCargo.sqf";
	[] spawn compile preprocessFile "fnc\player\heloJump.sqf";
} else {
	["abort helo; reason: to low"] call ADL_DEBUG;
};