//prison skeet machine
_actionsClass = missionNamespace getVariable [format ["ace_interact_menu_Act_%1", "SkeetMachine"], []];
if (count _actionsClass == 0) then {
	_mainAction = ["ACE_MainActions", (localize "STR_ACE_Interaction_MainAction"), "", {}, {true}, {},[],[0,0,0],6] call ace_interact_menu_fnc_createAction;
	["SkeetMachine", 0, [], _mainAction] call ace_interact_menu_fnc_addActionToClass;
};

_actionThrowSkeet = ["skeet_shoot_single",localize "STR_ADL_ACE_SKEET_DISK_1","", {[[_target],"ADL_SKEET_SPAWN",false,false] call BIS_fnc_MP;}, {true}, {},[],[0,0,0],6] call ace_interact_menu_fnc_createAction;
["SkeetMachine", 0, ["ACE_MainActions"], _actionThrowSkeet] call ace_interact_menu_fnc_addActionToClass;

_actionThrowSkeet_n = ["skeet_shoot_n",format[localize "STR_ADL_ACE_SKEET_DISK_n","15"],"", {[[_target, false, 15],"ADL_SKEET_SPAWN",false,false] call BIS_fnc_MP;}, {true}, {},[],[0,0,0],6] call ace_interact_menu_fnc_createAction;
["SkeetMachine", 0, ["ACE_MainActions"], _actionThrowSkeet_n] call ace_interact_menu_fnc_addActionToClass;

_actionAutoSkeet = ["skeet_shoot_auto",localize "STR_ADL_ACE_SKEET_DISK_AUTO","", {[[_target, true, 1],"ADL_SKEET_SPAWN",false,false] call BIS_fnc_MP;}, {true}, {},[],[0,0,0],6] call ace_interact_menu_fnc_createAction;
["SkeetMachine", 0, ["ACE_MainActions"], _actionAutoSkeet] call ace_interact_menu_fnc_addActionToClass;

_actionSettings = ["skeet_settings", localize "STR_ADL_ACE_SKEET_SETTINGS","",{}, {true}, {},[],[0,0,0],2] call ace_interact_menu_fnc_createAction;
_actionSettingSpeed = ["skeet_ctl_speed", localize "STR_ADL_ACE_SKEET_SPEED","",{}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingSpeed_plus = ["skeet_ctl_speed_plus", "+1","",{_target setVariable["skeet_machine_speed", ((_target getVariable["skeet_machine_speed", 10]) + 1 min 25)]; hint format["speed: %1",_target getVariable["skeet_machine_speed", 6]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingSpeed_plusplus = ["skeet_ctl_speed_plusplus", "+5","",{_target setVariable["skeet_machine_speed", ((_target getVariable["skeet_machine_speed", 6]) + 5 min 25)]; hint format["speed: %1",_target getVariable["skeet_machine_speed", 6]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingSpeed_minus = ["skeet_ctl_speed_minus", "-1","",{_target setVariable["skeet_machine_speed",((_target getVariable["skeet_machine_speed", 10]) - 1 max 5)]; hint format["speed: %1",_target getVariable["skeet_machine_speed", 6]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingSpeed_minusminus = ["skeet_ctl_speed_minusminus", "-5","",{_target setVariable["skeet_machine_speed",((_target getVariable["skeet_machine_speed", 6]) - 5 max 5)]; hint format["speed: %1",_target getVariable["skeet_machine_speed", 6]]}, {true}] call ace_interact_menu_fnc_createAction;

_actionSettingRaise = ["skeet_ctl_raise", localize "STR_ADL_ACE_SKEET_RAISE","",{}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingRaise_plus = ["skeet_ctl_raise_plus", "+1","",{_target setVariable["skeet_machine_up", ((_target getVariable["skeet_machine_up", 6]) + 1 min 15)]; hint format["raise: %1",_target getVariable["skeet_machine_up", 6]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingRaise_plusplus = ["skeet_ctl_raise_plusplus", "+5","",{_target setVariable["skeet_machine_up", ((_target getVariable["skeet_machine_up", 6]) + 5 min 15)]; hint format["raise: %1",_target getVariable["skeet_machine_up", 6]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingRaise_minus = ["skeet_ctl_raise_minus", "-1","",{_target setVariable["skeet_machine_up", ((_target getVariable["skeet_machine_up", 6]) - 1 max 1)]; hint format["raise: %1",_target getVariable["skeet_machine_up", 6]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingRaise_minusminus = ["skeet_ctl_raise_minusminus", "-5","",{_target setVariable["skeet_machine_up", ((_target getVariable["skeet_machine_up", 6]) - 5 max 1)]; hint format["raise: %1",_target getVariable["skeet_machine_up", 6]]}, {true}] call ace_interact_menu_fnc_createAction;

_actionSettingInterval = ["skeet_ctl_interval", localize "STR_ADL_ACE_SKEET_INTERVAL","",{}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingInterval_plus = ["skeet_ctl_interval_plus", "+1","",{_target setVariable["skeet_sequence", ((_target getVariable["skeet_sequence", 1]) + 1 min 5)]; hint format["interval: %1",_target getVariable["skeet_sequence", 6]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingInterval_plusplus = ["skeet_ctl_interval_plusplus", "+5","",{_target setVariable["skeet_sequence", ((_target getVariable["skeet_sequence", 1]) + 5 min 5)]; hint format["interval: %1",_target getVariable["skeet_sequence", 6]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingInterval_minus = ["skeet_ctl_interval_minus", "-1","",{_target setVariable["skeet_sequence", ((_target getVariable["skeet_sequence", 1]) - 1 max 0)]; hint format["interval: %1",_target getVariable["skeet_sequence", 6]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingInterval_minusminus = ["skeet_ctl_interval_minusminus", "-5","",{_target setVariable["skeet_sequence", ((_target getVariable["skeet_sequence", 1]) - 5 max 0)]; hint format["interval: %1",_target getVariable["skeet_sequence", 6]]}, {true}] call ace_interact_menu_fnc_createAction;

_actionSettingVar = ["skeet_ctl_var", localize "STR_ADL_ACE_SKEET_COINCIDENCE","",{}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingVar_plus = ["skeet_ctl_var_plus", "+1","",{_target setVariable["skeet_machine_variability", ((_target getVariable["skeet_machine_variability", 6]) + 1 min 30)]; hint format["coincidence: %1",_target getVariable["skeet_machine_variability", 6]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingVar_plusplus = ["skeet_ctl_var_plusplus", "+5","",{_target setVariable["skeet_machine_variability", ((_target getVariable["skeet_machine_variability", 6]) + 5 min 30)]; hint format["coincidence: %1",_target getVariable["skeet_machine_variability", 6]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingVar_minus = ["skeet_ctl_var_minus", "-1","",{_target setVariable["skeet_machine_variability", ((_target getVariable["skeet_machine_variability", 6]) - 1 min 0)]; hint format["coincidence: %1",_target getVariable["skeet_machine_variability", 6]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingVar_minusminus = ["skeet_ctl_var_minusminus", "-5","",{_target setVariable["skeet_machine_variability", ((_target getVariable["skeet_machine_variability", 6]) - 5 min 0)]; hint format["coincidence: %1",_target getVariable["skeet_machine_variability", 6]]}, {true}] call ace_interact_menu_fnc_createAction;

_actionSettingChemlight = ["skeet_ctl_chemlight", localize "STR_ADL_ACE_SKEET_CHEMLIGHT","",{_target setVariable["skeet_machine_chemlight", (!(_target getVariable["skeet_machine_chemlight", false]))]; hint format["add chemlight: %1",_target getVariable["skeet_machine_chemlight", false]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingHitHint = ["skeet_ctl_hitHint", localize "STR_ADL_ACE_SKEET_SHOW_SINGLE", "", {_target  setVariable["skeet_machine_hitHint", (!(_target getVariable["skeet_machine_hitHint", false]))]; hint format["show hit: %1",_target getVariable["skeet_machine_hitHint", false]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingResults = ["skeet_ctl_results", localize "STR_ADL_ACE_SKEET_SHOW_RESULT", "", {_target  setVariable["skeet_machine_results", (!(_target getVariable["skeet_machine_results", false]))]; hint format["show results: %1",_target getVariable["skeet_machine_results", false]]}, {true}] call ace_interact_menu_fnc_createAction;


["SkeetMachine", 0, ["ACE_MainActions"], _actionSettings] call ace_interact_menu_fnc_addActionToClass;
["SkeetMachine", 0, ["ACE_MainActions","skeet_settings"], _actionSettingSpeed] call ace_interact_menu_fnc_addActionToClass;
["SkeetMachine", 0, ["ACE_MainActions","skeet_settings"], _actionSettingRaise] call ace_interact_menu_fnc_addActionToClass;
["SkeetMachine", 0, ["ACE_MainActions","skeet_settings"], _actionSettingVar] call ace_interact_menu_fnc_addActionToClass;
["SkeetMachine", 0, ["ACE_MainActions","skeet_settings"], _actionSettingInterval] call ace_interact_menu_fnc_addActionToClass;
["SkeetMachine", 0, ["ACE_MainActions","skeet_settings"], _actionSettingChemlight] call ace_interact_menu_fnc_addActionToClass;
["SkeetMachine", 0, ["ACE_MainActions","skeet_settings"], _actionSettingHitHint] call ace_interact_menu_fnc_addActionToClass;
["SkeetMachine", 0, ["ACE_MainActions","skeet_settings"], _actionSettingResults] call ace_interact_menu_fnc_addActionToClass;

["SkeetMachine", 0, ["ACE_MainActions","skeet_settings","skeet_ctl_interval"], _actionSettingInterval_plus] call ace_interact_menu_fnc_addActionToClass;
["SkeetMachine", 0, ["ACE_MainActions","skeet_settings","skeet_ctl_interval"], _actionSettingInterval_plusplus] call ace_interact_menu_fnc_addActionToClass;
["SkeetMachine", 0, ["ACE_MainActions","skeet_settings","skeet_ctl_interval"], _actionSettingInterval_minus] call ace_interact_menu_fnc_addActionToClass;
["SkeetMachine", 0, ["ACE_MainActions","skeet_settings","skeet_ctl_interval"], _actionSettingInterval_minusminus] call ace_interact_menu_fnc_addActionToClass;

["SkeetMachine", 0, ["ACE_MainActions","skeet_settings","skeet_ctl_speed"], _actionSettingSpeed_plus] call ace_interact_menu_fnc_addActionToClass;
["SkeetMachine", 0, ["ACE_MainActions","skeet_settings","skeet_ctl_speed"], _actionSettingSpeed_minus] call ace_interact_menu_fnc_addActionToClass;
["SkeetMachine", 0, ["ACE_MainActions","skeet_settings","skeet_ctl_speed"], _actionSettingSpeed_plusplus] call ace_interact_menu_fnc_addActionToClass;
["SkeetMachine", 0, ["ACE_MainActions","skeet_settings","skeet_ctl_speed"], _actionSettingSpeed_minusminus] call ace_interact_menu_fnc_addActionToClass;

["SkeetMachine", 0, ["ACE_MainActions","skeet_settings","skeet_ctl_raise"], _actionSettingRaise_plus] call ace_interact_menu_fnc_addActionToClass;
["SkeetMachine", 0, ["ACE_MainActions","skeet_settings","skeet_ctl_raise"], _actionSettingRaise_minus] call ace_interact_menu_fnc_addActionToClass;
["SkeetMachine", 0, ["ACE_MainActions","skeet_settings","skeet_ctl_raise"], _actionSettingRaise_plusplus] call ace_interact_menu_fnc_addActionToClass;
["SkeetMachine", 0, ["ACE_MainActions","skeet_settings","skeet_ctl_raise"], _actionSettingRaise_minusminus] call ace_interact_menu_fnc_addActionToClass;

["SkeetMachine", 0, ["ACE_MainActions","skeet_settings","skeet_ctl_var"], _actionSettingVar_plus] call ace_interact_menu_fnc_addActionToClass;
["SkeetMachine", 0, ["ACE_MainActions","skeet_settings","skeet_ctl_var"], _actionSettingVar_minus] call ace_interact_menu_fnc_addActionToClass;
["SkeetMachine", 0, ["ACE_MainActions","skeet_settings","skeet_ctl_var"], _actionSettingVar_plusplus] call ace_interact_menu_fnc_addActionToClass;
["SkeetMachine", 0, ["ACE_MainActions","skeet_settings","skeet_ctl_var"], _actionSettingVar_minusminus] call ace_interact_menu_fnc_addActionToClass;
["menu skeet machine"] call ADL_DEBUG;