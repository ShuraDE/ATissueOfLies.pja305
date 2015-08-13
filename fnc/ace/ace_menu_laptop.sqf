//remove inital appended
[prison_laptop, 0, ["prison_laptop_intel_search"]] call ace_interact_menu_fnc_removeActionFromObject;




//add main action
_mainAction = ["ACE_MainActions", (localize "STR_ACE_Interaction_MainAction"), "", {}, {true}] call ace_interact_menu_fnc_createAction;
[prison_laptop, 0, [], _mainAction] call ace_interact_menu_fnc_addActionToObject;


//files
_laptopFiles = ["prison_laptop_files",localize "STR_ADL_ATOL_ACE_FILE", "", {}, {true}] call ace_interact_menu_fnc_createAction;
_laptopFile_1 = ["prison_laptop_file_1",  format[localize "STR_ADL_ATOL_ACE_SHOW_FILE","neraca keuangan"], "", {prison_laptop setObjectTextureGlobal [0, "pic\bilanz_sized.paa"];}, {true}] call ace_interact_menu_fnc_createAction;
_laptopFile_2 = ["prison_laptop_file_2",  format[localize "STR_ADL_ATOL_ACE_SHOW_FILE","hastubiro"], "", {prison_laptop setObjectTextureGlobal [0, "pic\mail.paa"];}, {true}] call ace_interact_menu_fnc_createAction;
_laptopFile_3 = ["prison_laptop_file_3",  format[localize "STR_ADL_ATOL_ACE_SHOW_FILE","aberadeis"], "", {prison_laptop setObjectTextureGlobal [0, "pic\map.paa"];}, {true}] call ace_interact_menu_fnc_createAction;

[prison_laptop, 0, ["ACE_MainActions"], _laptopFiles] call ace_interact_menu_fnc_addActionToObject;
[prison_laptop, 0, ["ACE_MainActions","prison_laptop_files"], _laptopFile_1] call ace_interact_menu_fnc_addActionToObject;
[prison_laptop, 0, ["ACE_MainActions","prison_laptop_files"], _laptopFile_2] call ace_interact_menu_fnc_addActionToObject;
[prison_laptop, 0, ["ACE_MainActions","prison_laptop_files"], _laptopFile_3] call ace_interact_menu_fnc_addActionToObject;

//videos
_laptopVideos = ["prison_laptop_videos", localize "STR_ADL_ATOL_ACE_VIDEO", "", {}, {true}] call ace_interact_menu_fnc_createAction;
_laptopVideo_1 = ["prison_laptop_video_1", format[localize "STR_ADL_ATOL_ACE_SHOW_VIDEO","us guy"], "", {[prison_laptop, "media\intro_video.ogg", "media\intro_audio.ogg"] spawn ADL_VIDEO_SHOW_SRV}, {true}] call ace_interact_menu_fnc_createAction;

[prison_laptop, 0, ["ACE_MainActions"], _laptopVideos] call ace_interact_menu_fnc_addActionToObject;
[prison_laptop, 0, ["ACE_MainActions","prison_laptop_videos"], _laptopVideo_1] call ace_interact_menu_fnc_addActionToObject;

