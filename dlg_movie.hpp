class RscMissionScreen
{
	idd = -1;
	movingEnable = 1;
	duration = 1e+011;
	fadein = 0;
	fadeout = 1;
	onload = "uinamespace setvariable ['BIS_RscMissionScreen',_this select 0];";
	class Controls
	{	
		class Picture_0: RscPicture
		{
			idc = 1100;
			text = "";
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";
			autoplay = 1;
			loops = 1;
		};
	};
};	
class CfgSounds
{
	sounds[] = {};
	class videoSound
	{
		// how the sound is referred to in the editor (e.g. trigger effects)
		name = "videoSoundfile";
		// filename, volume, pitch
		sound[] = {"test2_audio.ogg", 1, 1};
		// subtitle delay in seconds, subtitle text 
		titles[] = {1, "playback startet"};
	};
};