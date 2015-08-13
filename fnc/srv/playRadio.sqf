private ["_unit","_radio", "_audioCfg"];

if (!isServer) exitWith { 
	[[_this],"ADL_AUDIO_RADIO",false] spawn BIS_fnc_MP;
	["radio: is not server, call server"] call ADL_DEBUG;
};	

_unit = _this select 0;
_radio = _this select 1;
_audioCfg = _this select 2;


[_radio, _audioCfg] call ADL_AUDIO_PLAY;


/*
[_radio,_audioCfg] spawn {
	private ["_radio","_audioCfg"];
	_radio = _this select 0;
	_audioCfg = _this select 1;
	
	//remove "turn on" entry
	[[_radio,0,["prison_radio_turnOn"]],"ace_interact_menu_fnc_removeActionFromObject"] call BIS_fnc_MP;
	sleep 256; //sleep 4:16 
	//append menu again after play
	_actionTurnOnRadio = ["prison_radio_turnOn","Radio anschalten","", {[player,_target,_audioCfg] spawn ADL_MNU_INTEL_RADIO;}, {true}] call ace_interact_menu_fnc_createAction;
	[[_radio, 0, [], _actionTurnOnRadio],"ace_interact_menu_fnc_addActionToObject"] call BIS_fnc_MP;
};
'/

