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