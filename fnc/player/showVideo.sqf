private ["_tv","_src","_soundToPlay","_videoFile","_audioFile"];
_tv = _this select 0;
_videoFile = _this select 1;
_audioFile = _this select 2;

with uiNamespace do {
    _tv setObjectTexture [0,_videoFile]; 
    1100 cutRsc ["RscMissionScreen","PLAIN"];
	disableSerialization;
    _scr = BIS_RscMissionScreen displayCtrl 1100;
    _scr ctrlSetPosition [-10,-10,0,0];
    _scr ctrlSetText _videoFile;
    _scr ctrlAddEventHandler ["VideoStopped", {
        (uiNamespace getVariable "BIS_RscMissionScreen") closeDisplay 1;
    }];
    _scr ctrlCommit 0;
};

_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
_soundToPlay = _soundPath + _audioFile;
playSound3D [_soundToPlay, _tv, false, getPos _tv, 10, 1, 50]; 
