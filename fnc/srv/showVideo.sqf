private ["_tv","_videoFile","_audioCfg","_soundSource"];
_tv = _this select 0;
_videoFile = _this select 1;
_audioCfg = _this select 2;


if (!isServer) exitWith {
	[[_this], "ADL_VIDEO_SHOW_SRV", false] call BIS_fnc_MP;
	["video: is not server, call server"] call ADL_DEBUG;
};

//check video is active, stop it for each player
if (missionNamespace getVariable "video_active") then {
	
	["video: playback should be stopped"] call ADL_DEBUG;
	
	//funktioniert nicht !! :-/
	//stop video
	[[],"ADL_VIDEO_STOP",true] call BIS_fnc_MP;
	//stop audio
	deleteVehicle (missionNamespace getVariable "video_audio_src");
};


[[_tv, _videoFile],"ADL_VIDEO_SHOW_LOCAL",true] call BIS_fnc_MP;
missionNamespace setVariable ["video_active",true];

//create audio source
if (!(isNil "_audioCfg") && _audioCfg != "") then {
	//missionNamespace setVariable ["video_file", _videoFile];
	["video: create audio source"] call ADL_DEBUG;
	_soundSource = createSoundSource [_audioCfg, position _tv, [], 0];
	missionNamespace setVariable ["video_audio_src",_soundSource];
} else {
	["video: no audio file"] call ADL_DEBUG;
};