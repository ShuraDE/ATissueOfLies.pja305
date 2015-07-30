private ["_msg"];

if (isNil "DEBUG_OUTPUT" || !DEBUG_OUTPUT) then { exit; };

_msg = _this select 0;

if (!isNil "DEBUG_OUTPUT" && DEBUG_TYPE_HINT) then {hintSilent format ["debug: %1", _msg];};
if (!isNil "DEBUG_TYPE_CHAT" && DEBUG_TYPE_CHAT) then {systemChat format ["debug: %1", _msg];};
if (!isNil "DEBUG_TYPE_LOG" && DEBUG_TYPE_CHAT) then {diag_log format ["debug: %1", _msg]};