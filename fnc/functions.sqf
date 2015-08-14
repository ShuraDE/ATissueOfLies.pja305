//FIRST !!!
ADL_DEBUG = compile preprocessFileLineNumbers "fnc\sys\debug.sqf";
[] call compile preprocessFileLineNumbers "fnc\sys\pvEventHandler.sqf";


//anything else

ADL_MNU_INTEL_MONEY  = compile preprocessFileLineNumbers "fnc\intel\prisonMoney.sqf";
ADL_MNU_INTEL_MONEY_CHECK  = compile preprocessFileLineNumbers "fnc\intel\prisonMoneyCheck.sqf";
ADL_MNU_INTEL_NADE  = compile preprocessFileLineNumbers "fnc\intel\prisonNade.sqf";
ADL_MNU_INTEL_SATPHONE  = compile preprocessFileLineNumbers "fnc\intel\prisonSatPhone.sqf";
ADL_MNU_INTEL_LAPTOP = compile preprocessFileLineNumbers "fnc\intel\prisonLaptop.sqf";
ADL_MNU_INTEL_MEMO = compile preprocessFileLineNumbers "fnc\intel\prisonMemo.sqf";
ADL_MNU_INTEL_EMAIL = compile preprocessFileLineNumbers "fnc\intel\prisonEMail.sqf";


ADL_MNU_INTEL_LAPTOP_HACKED = compile preprocessFileLineNumbers "fnc\ace\ace_menu_laptop.sqf";


ADL_AUDIO_RADIO = compile preprocessFileLineNumbers "fnc\srv\playRadio.sqf";
ADL_AUDIO_PLAY = compile preprocessFileLineNumbers "fnc\srv\playAudio.sqf";

ADL_VIDEO_SHOW_SRV = compile preprocessFileLineNumbers "fnc\srv\showVideo.sqf";
ADL_VIDEO_SHOW_LOCAL = compile preprocessFileLineNumbers "fnc\player\showVideo_local.sqf";
ADL_VIDEO_STOP = compile preprocessFileLineNumbers "fnc\player\stopVideo.sqf";

ADL_ANIM_TAKE =  compile preprocessFileLineNumbers "fnc\player\animTake.sqf";
ADL_ANIM_ACTIVATE =  compile preprocessFileLineNumbers "fnc\player\animActivate.sqf";

ADL_SKEET_SPAWN = compile preprocessFileLineNumbers "fnc\srv\spawnSkeet.sqf";
ADL_SKEET_SHOOT_AI = compile preprocessFileLineNumbers "fnc\srv\shootSkeet.sqf";