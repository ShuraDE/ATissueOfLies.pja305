private ["_msg"];

if (!DEBUG_OUTPUT) then { exit; };

_msg = _this select 0;

if (DEBUG_TYPE_HINT) then {hintSilent format ["debug: %1", _msg];};
if (DEBUG_TYPE_CHAT) then {systemChat format ["debug: %1", _msg];};
if (DEBUG_TYPE_LOG) then {diag_log format ["debug: %1", _msg]};