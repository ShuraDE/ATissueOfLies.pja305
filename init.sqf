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
[] call compile preprocessFileLineNumbers "fnc\functions.sqf";

//server only
if (isServer) then {
	//TFAR
	tf_no_auto_long_range_radio = true; //Long Range Radio an GrpFhr austeilen? - ja ^ nein
	publicVariable "tf_no_auto_long_range_radio";
  tf_give_personal_radio_to_regular_soldier = false; //Personal Radio an normalen Schützen austeilen? - ja ^ nein
  publicVariable "tf_give_personal_radio_to_regular_soldier";

	//server only functions
	ADL_SRV_flight_drop_V22 =  compile preprocessFileLineNumbers "fnc\srv\flight_drop_V22.sqf";
	ADL_SRV_spawnC130 = compile preprocessFileLineNumbers "fnc\srv\spawnC130_fixed.sqf";
	ADL_SRV_spawnNade = compile preprocessFileLineNumbers "fnc\srv\spawnNade.sqf";

	//set civ & ind to friendly
	civilian setFriend [west, 1];
	civilian setFriend [east, 1];
	civilian setFriend [independent, 1];
	independent setFriend [west, 1];
	independent setFriend [east, 1];
	independent setFriend [civilian, 1];

	//set default parameters
	missionNamespace setVariable ["HELO_COMPLETE",false];
	publicVariable "HELO_COMPLETE";

	//create c130 fixed in air, public variable is "HELO_SPAWN_C130"
	[] call ADL_SRV_spawnC130;

	//create nade, public variable "MONEY_NADE"
	[] call ADL_SRV_spawnNade;


	["server is ready"] call ADL_DEBUG;
	SERVER_IS_READY = true;
	publicVariable "SERVER_IS_READY";
};


if ((!isServer) && (player != player)) then {waitUntil {player == player};};

//all players
if (hasInterface) then {

	if (!isServer) then {["waiting on server"] call ADL_DEBUG;};
	waitUntil {!isNil "SERVER_IS_READY" && !isNull player};

	//bound ace menu entries
	[] call compile preprocessFile "fnc\ace\ace_interaction_menu.sqf";

	//gear (switch file in 2 files gear_bullfrog, gear_foxhound)
	[player] call compile preprocessFile "fnc\player\gear.sqf";

	//connection before / after HELO
	if (!(missionNamespace getVariable ["HELO_COMPLETE",false])) then {
		//Mission noch nicht gestartet
		["Player (non JIP) connected"] call ADL_DEBUG;

		//player  moveInCargo C130 (HELO Jump)
		if (player getVariable ["c130_seat", -1] >= 0) then {
			player moveInCargo [DROPSHIP_C130,player getVariable ["c130_seat", -1]];
			[] spawn compile preprocessFile "fnc\player\heloPrepare.sqf";
		};
		//player moveInCargo Osprey V22 (Water Jump)
		if (player getVariable ["v22_seat", -1] >= 0) then {
			player moveInCargo [DROPSHIP_V22,player getVariable ["v22_seat", -1]];
		};
	} else {
		//player connected after jump
		if (hasInterface && missionNamespace getVariable "HELO_COMPLETE") then {
			//Mission gestartet und spieler bereits gesprungen (JIP's)
			["Player JIP connected"] call ADL_DEBUG;
		};
	};

	//create mission briefing
	[] execVM "briefing.sqf";
};

//cleanup
if (hasInterface) then {
	//wiederherstellen von audio und video
	5 fadeSound 1;
	5 fadeSpeech 1;
	5 fadeMusic 1;
	cutText ["", "BLACK IN", 5];
};
