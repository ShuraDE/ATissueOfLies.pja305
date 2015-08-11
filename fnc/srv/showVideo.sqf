private ["_tv","_src","_soundToPlay","_soundPath","_videoFile","_audioFile"];
_tv = _this select 0;
_videoFile = _this select 1;
_audioFile = _this select 2;


if (!isServer) exitWith {
	[[_this], "ADL_VIDEO_SHOW_SRV", false] call BIS_fnc_MP;
	["video: is not server, call server"] call ADL_DEBUG;
};

//check video is active, stop it for each player
if (missionNamespace getVariable "video_active") then {
	
	["video: playback should be stopped"] call ADL_DEBUG;
	
	//funktioniert nicht !! :-/
	[[],"ADL_VIDEO_STOP",true] call BIS_fnc_MP;
};


[[_tv, _videoFile],"ADL_VIDEO_SHOW_LOCAL",true] call BIS_fnc_MP;


if (!(isNil "_audioFile") && _audioFile != "") then {
	//missionNamespace setVariable ["video_file", _videoFile];
	["video: create audio source"] call ADL_DEBUG;
	_soundPath = ([(str missionConfigFile), 0, -15] call BIS_fnc_trimString);
	_soundToPlay = ([(str missionConfigFile), 0, -15] call BIS_fnc_trimString) + _audioFile;
	playSound3D [_soundToPlay, _tv, false, getPos _tv, 10, 1, 50]; 
} else {
	["video: no audio file"] call ADL_DEBUG;
};