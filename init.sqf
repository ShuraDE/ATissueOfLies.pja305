waitUntil {!isNil "bis_fnc_init"}; 

if (hasInterface) then {
	//schlafmodus audio&video
	cutText ["wake up ... ", "BLACK FADED",999];
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
	[] call compile preprocessFile "fnc\srv\spawnC130_fixed.sqf";
	
	["server is ready"] call ADL_DEBUG;
	SERVER_IS_READY = true;
	publicVariable "SERVER_IS_READY";
};
if (hasInterface) then {
	if (!isServer) then {["waiting on server"] call ADL_DEBUG;};
	waitUntil {!isNil "SERVER_IS_READY" && !isNull player};
};


if (hasInterface && !(missionNamespace getVariable "HELO_COMPLETE")) then {
	//Mission noch nicht gestartet
	["Player (non JIP) connected"] call ADL_DEBUG;
	
	//C130 HELO Jump
	if (player getVariable ["c130_seat", -1] >= 0) then {
		player moveInCargo [HELO_SPAWN_C130,player getVariable ["c130_seat", -1]];
		[] spawn compile preprocessFile "fnc\player\heloPrepare.sqf";
	};
	//Osprey V22 Sitz
	if (player getVariable ["v22_seat", -1] >= 0) then {
		player moveInCargo [DROPSHIP_V22,player getVariable ["v22_seat", -1]];
		
	};	

	//wiederherstellen von audio und video
	5 fadeSound 1; 
	5 fadeSpeech 1;
	5 fadeMusic 1; 
	cutText ["", "BLACK IN", 5];
};
if (hasInterface && missionNamespace getVariable "HELO_COMPLETE") then {
	//Mission gestartet und spieler bereits gesprungen (JIP's)
	["JIP connected"] call ADL_DEBUG;
}