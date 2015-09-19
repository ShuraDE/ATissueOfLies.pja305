/*
PADDLE_fnc_ropeOnOff = {player execVM "\A3_Paddle_Mod\functions\fnc_ropeOnOff.sqf"};
PADDLE_fnc_ropeShorten = {player execVM "\A3_Paddle_Mod\functions\fnc_ropeShorten.sqf"};
PADDLE_fnc_ropeLengthen = {player execVM "\A3_Paddle_Mod\functions\fnc_ropeLengthen.sqf"};
PADDLE_fnc_killSwitch = {player execVM "\A3_Paddle_Mod\functions\fnc_killSwitch.sqf"};

PADDLE_fnc_paddleStop = {player execVM "\A3_Paddle_Mod\functions\fnc_paddleStop.sqf"};
PADDLE_fnc_paddleForward = {player execVM "\A3_Paddle_Mod\functions\fnc_paddleForward.sqf"};
PADDLE_fnc_paddleBackward = {player execVM "\A3_Paddle_Mod\functions\fnc_paddleBackward.sqf"};
PADDLE_fnc_spinBoatLeft = {player execVM "\A3_Paddle_Mod\functions\fnc_spinBoatLeft.sqf"};
PADDLE_fnc_spinBoatRight = {player execVM "\A3_Paddle_Mod\functions\fnc_spinBoatRight.sqf"};
PADDLE_fnc_slideLeft = {player execVM "\A3_Paddle_Mod\functions\fnc_slideLeft.sqf"};
PADDLE_fnc_slideRight = {player execVM "\A3_Paddle_Mod\functions\fnc_slideRight.sqf"};
*/

//boat class
//A3_Boat_F_Boat_Transport_01
_actionPaddleRope = ["MNU_ROPE",localize "STR_ADL_ACE_PADDLE_ROPE","", {}, {vehicle player != player && player == driver (vehicle player)}, {},[],[0,0,0],6] call ace_interact_menu_fnc_createAction;
_actionPaddleRopeSwitch = ["paddle_mod_rope_onoff",localize "STR_ADL_ACE_PADDLE_ROPE_SWITCH","", {[_target] call PADDLE_fnc_ropeOnOff;}, {true}, {},[],[0,0,0],6] call ace_interact_menu_fnc_createAction;
_actionPaddleRopeShorten = ["paddle_mod_rope_shorten",localize "STR_ADL_ACE_PADDLE_ROPE_SHORTEN","", {[_target] call PADDLE_fnc_ropeShorten;}, {true}, {},[],[0,0,0],6] call ace_interact_menu_fnc_createAction;
_actionPaddleRopeLengthen = ["paddle_mod_rope_lengthen",localize "STR_ADL_ACE_PADDLE_ROPE_LENGTHEN","", {[_target] call PADDLE_fnc_ropeLengthen;}, {true}, {},[],[0,0,0],6] call ace_interact_menu_fnc_createAction;

_actionPaddleRopeKillSwitch = ["paddle_mod_killswitch",localize "STR_ADL_ACE_PADDLE_KILLSWITCH","", {[_target] call PADDLE_fnc_killSwitch;}, {vehicle player != player && player == driver (vehicle player)}, {},[],[0,0,0],6] call ace_interact_menu_fnc_createAction;

["paddlemod menu"] call ADL_DEBUG;

["B_Boat_Transport_01_F", 1, ["ACE_SelfActions"], _actionPaddleRope] call ace_interact_menu_fnc_addActionToClass;
["B_Boat_Transport_01_F", 1, ["ACE_SelfActions","MNU_ROPE"], _actionPaddleRopeSwitch] call ace_interact_menu_fnc_addActionToClass;
["B_Boat_Transport_01_F", 1, ["ACE_SelfActions","MNU_ROPE"], _actionPaddleRopeShorten] call ace_interact_menu_fnc_addActionToClass;
["B_Boat_Transport_01_F", 1, ["ACE_SelfActions","MNU_ROPE"], _actionPaddleRopeLengthen] call ace_interact_menu_fnc_addActionToClass;

["B_Boat_Transport_01_F", 1, ["ACE_SelfActions"], _actionPaddleRopeKillSwitch] call ace_interact_menu_fnc_addActionToClass;
