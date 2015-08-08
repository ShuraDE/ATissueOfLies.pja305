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


//functions for all
ADL_DEBUG = compile preprocessFileLineNumbers "fnc\sys\debug.sqf";



if (isServer) then {

	//server functions
	ADL_SRV_spawnSkeet = compile preprocessFileLineNumbers "fnc\srv\spawnSkeet.sqf";
	ADL_SRV_spawnV22  = compile preprocessFileLineNumbers "fnc\srv\spawnV22.sqf";
	ADL_SRV_spawnC130 = compile preprocessFileLineNumbers "fnc\srv\spawnC130_fixed.sqf";
	ADL_SRV_spawnNade = compile preprocessFileLineNumbers "fnc\srv\spawnNade.sqf";
	
	//set civ & ind to friendly
	civilian setFriend [west, 1];
	independent setFriend [west, 1];
	independent setFriend [east, 1];

	//set default parameters
	missionNamespace setVariable ["HELO_COMPLETE",false];
	
	//create c130 fixed in air, public variable is "HELO_SPAWN_C130"
	[] call ADL_SRV_spawnC130;
	
	//create nade, public variable "MONEY_NADE"
	[] call ADL_SRV_spawnNade;
	
	
	["server is ready"] call ADL_DEBUG;
	SERVER_IS_READY = true;
	publicVariable "SERVER_IS_READY";
};

//all players
if (hasInterface) then {
	if (!isServer) then {["waiting on server"] call ADL_DEBUG;};
	waitUntil {!isNil "SERVER_IS_READY" && !isNull player};
	
	//bound ace menu entries
	[] call compile preprocessFile "fnc\ace\ace_interaction_menu.sqf";
};

//player regular connected
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

//player jip connected
if (hasInterface && missionNamespace getVariable "HELO_COMPLETE") then {
	//Mission gestartet und spieler bereits gesprungen (JIP's)
	["JIP connected"] call ADL_DEBUG;
}