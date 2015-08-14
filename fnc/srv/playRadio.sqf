private ["_unit","_radio", "_audioCfg"];

_unit = _this select 0;
_radio = _this select 1;
_audioCfg = _this select 2;

[_radio, _audioCfg] call ADL_AUDIO_PLAY;
