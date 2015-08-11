private ["_tv","_videoFile","_scr"];
_tv = _this select 0;
_videoFile = _this select 1;

if (!hasInterface) exitWith { hint "no interface"; };

["video: client init"] call ADL_DEBUG;

missionNamespace setVariable ["video_active",true];
with uiNamespace do {
    _tv setObjectTexture [0,_videoFile]; 
    1100 cutRsc ["RscMissionScreen","PLAIN"];
	disableSerialization;
    _scr = BIS_RscMissionScreen displayCtrl 1100;
    _scr ctrlSetPosition [-10,-10,0,0];
    _scr ctrlSetText _videoFile;
    _scr ctrlAddEventHandler ["VideoStopped", {
        (uiNamespace getVariable "BIS_RscMissionScreen") closeDisplay 1;
		missionNamespace setVariable ["video_active",false];
    }];
    _scr ctrlCommit 0;
};

