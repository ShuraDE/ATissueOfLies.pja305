private ["_msg"];

if (!DEBUG_OUTPUT) then { exit; };

_msg = _this select 0;


if (DEBUG_TYPE_HINT) then {hintSilent _msg;};
if (DEBUG_TYPE_CHAT) then {systemChat _msg;};