private ["_unit","_radio", "_audioFile"];

_unit = _this select 0;
_radio = _this select 1;
_audioFile = _this select 2;

_soundToPlay = ([(str missionConfigFile), 0, -15] call BIS_fnc_trimString) + _audioFile;
playSound3D [_soundToPlay, _radio, true, getPos _radio, 30, 1, 50]; 

[_radio,_audioFile] spawn {
	private ["_radio","_audioFile"];
	_radio = _this select 0;
	_audioFile = _this select 1;
	
	//remove "turn on" entry
	[[_radio,0,["prison_radio_turnOn"]],"ace_interact_menu_fnc_removeActionFromObject"] call BIS_fnc_MP;
	sleep 256; //sleep 4:16 
	//append menu again after play
	_actionTurnOnRadio = ["prison_radio_turnOn","Radio anschalten","", {[player,_target,_audioFile] spawn ADL_MNU_INTEL_RADIO;}, {true}] call ace_interact_menu_fnc_createAction;
	[[_radio, 0, [], _actionTurnOnRadio],"ace_interact_menu_fnc_addActionToObject"] call BIS_fnc_MP;
};


