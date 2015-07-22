if (hasInterface) then {
	cutText ["wake up neo, follow the white rabbit", "BLACK FADED",999];
};

waitUntil {!isNil "bis_fnc_init"}; 

if (hasInterface) then {
	0 fadeSound 0; 
	0 fadeSpeech 0;
	0 fadeMusic  0; 
};

DEBUG_OUTPUT = true;
DEBUG_TYPE_HINT = false;
DEBUG_TYPE_CHAT = true;
DEBUG_TYPE_LOG = true;

ADL_DEBUG = compile preprocessFile "fnc\sys\debug.sqf";

ADL_TRAPS_MONEY_NADE_MENU = compile preprocessFile "fnc\traps\menuDisarm.sqf";
ADL_TRAPS_MONEY_NADE_SPAWN = compile preprocessFile "fnc\traps\spawnNade.sqf";
ADL_TRAPS_MONEY_TAKE_MENU = compile preprocessFile "fnc\traps\menuTake.sqf";

if (isServer) then {
	missionNamespace setVariable ["HELO_COMPLETE",false];
	//create c130 fixed in air, public variable is "HELO_SPAWN_C130"
	[] call compile preprocessFile "fnc\srv\spawnC130.sqf";
	
	["server is ready"] call ADL_DEBUG;
	SERVER_IS_READY = true;
	publicVariable "SERVER_IS_READY";
};
if (hasInterface) then {
	if (!isServer) then {["waiting on server"] call ADL_DEBUG;};
	waitUntil {!isNil "SERVER_IS_READY" && !isNull player};
};


if (hasInterface && !(missionNamespace getVariable "HELO_COMPLETE")) then {
	["Player (non JIP) connected"] call ADL_DEBUG;
	//Mission noch nicht gestartet
	//init variable from player = this setVariable ["c130_seat",2];
	player moveInCargo [HELO_SPAWN_C130,player getVariable ["c130_seat", 0]];
	[] spawn compile preprocessFile "fnc\player\heloPrepare.sqf";
};
if (hasInterface && missionNamespace getVariable "HELO_COMPLETE") then {
	//Mission gestartet und spieler bereits gesprungen (JIP's)
	["JIP connected"] call ADL_DEBUG;
}