waitUntil {!isNil "bis_fnc_init"}; 

DEBUG_OUTPUT = true;
DEBUG_TYPE_HINT = false;
DEBUG_TYPE_CHAT = true;
DEBUG_TYPE_LOG = true;

ADL_DEBUG = compile preprocessFile "fnc\sys\debug.sqf";

ADL_TRAPS_MENU = compile preprocessFile "fnc\traps\menuDisarm.sqf";



if (isServer) then {
	hint "server";
};