//root menu entry, append if !exists
_mainAction = ["ACE_MainActions", (localize "STR_ACE_Interaction_MainAction"), "", {}, {true}] call ace_interact_menu_fnc_createAction;
/* 
* Prison objects
*/

//prison radio
_actionsObject = prison_radio getVariable ["ace_interact_menu_actions", []];
_actionsClass = missionNamespace getVariable [format ["ace_interact_menu_Act_%1", typeOf prison_radio], []];
if (count _actionsObject == 0 && {count _actionsClass == 0}) then {
  _actionTurnOnRadio = ["prison_radio_turnOn","Radio anschalten","", {hint "todo: radio on"}, {true}] call ace_interact_menu_fnc_createAction;
  [prison_radio, 0, [], _actionTurnOnRadio] call ace_interact_menu_fnc_addActionToObject;  
};
["menu prison radio"] call ADL_DEBUG;

//prison sat phone
_actionsObject = prison_phone getVariable ["ace_interact_menu_actions", []];
_actionsClass = missionNamespace getVariable [format ["ace_interact_menu_Act_%1", typeOf prison_phone], []];
if (count _actionsObject == 0 && {count _actionsClass == 0}) then {
  _actionSearchSatPhoneIntel = ["prison_phone_intel_search","Untersuchen","", {hint "todo: sat intel"}, {true}] call ace_interact_menu_fnc_createAction;
  [prison_phone, 0, [], _actionSearchSatPhoneIntel] call ace_interact_menu_fnc_addActionToObject;
};
["menu prison sat phone"] call ADL_DEBUG;

//prison map
_actionsObject = prison_map getVariable ["ace_interact_menu_actions", []];
_actionsClass = missionNamespace getVariable [format ["ace_interact_menu_Act_%1", typeOf prison_map], []];
if (count _actionsObject == 0 && {count _actionsClass == 0}) then {
  _actionSearchSatPhoneIntel = ["prison_phone_intel_search","Untersuchen","", {hint "todo: sat intel"}, {true}] call ace_interact_menu_fnc_createAction;
  [prison_map, 0, [], _actionSearchSatPhoneIntel] call ace_interact_menu_fnc_addActionToObject;
};
["menu prison map"] call ADL_DEBUG;

//prison file
_actionsObject = prison_file getVariable ["ace_interact_menu_actions", []];
_actionsClass = missionNamespace getVariable [format ["ace_interact_menu_Act_%1", typeOf prison_file], []];
if (count _actionsObject == 0 && {count _actionsClass == 0}) then {
  _actionSearchSatPhoneIntel = ["prison_phone_intel_search","Untersuchen","", {hint "todo: sat intel"}, {true}] call ace_interact_menu_fnc_createAction;
  [prison_file, 0, [], _actionSearchSatPhoneIntel] call ace_interact_menu_fnc_addActionToObject;
};
["menu prison file"] call ADL_DEBUG;

//prison money  ---  append to class!!
_actionsObject = prison_money_1 getVariable ["ace_interact_menu_actions", []];
_actionsClass = missionNamespace getVariable [format ["ace_interact_menu_Act_%1", typeOf prison_money_1], []];
if (count _actionsObject == 0 && {count _actionsClass == 0}) then {
  ["EvMoney", 0, [], _mainAction] call ace_interact_menu_fnc_addActionToClass;
};
_actionTakeMoney = ["prison_money_take","Geld nehmen","", {call ADL_TRAPS_MONEY_TAKE_MENU;}, {true}] call ace_interact_menu_fnc_createAction;
_actionCheckMoney = ["prison_money_check","Geld untersuchen","", {hint "todo: check money"}, {true}] call ace_interact_menu_fnc_createAction;
["EvMoney", 0, ["ACE_MainActions"], _actionTakeMoney] call ace_interact_menu_fnc_addActionToClass;
["EvMoney", 0, ["ACE_MainActions"], _actionCheckMoney] call ace_interact_menu_fnc_addActionToClass;
["menu prison money"] call ADL_DEBUG;

//prison tontauben werfer
_actionsObject = TTWerfer getVariable ["ace_interact_menu_actions", []];
_actionsClass = missionNamespace getVariable [format ["ace_interact_menu_Act_%1", typeOf TTWerfer], []];
if (count _actionsObject == 0 && {count _actionsClass == 0}) then {
  _actionThrowSkeet = ["skeet_thrower","Neue Disk","", {[[[_target],"fnc\srv\spawnSkeet.sqf"],"BIS_fnc_execVM",false,false] call BIS_fnc_MP;}, {true}, {},[],[0,0,0],6] call ace_interact_menu_fnc_createAction;
  [TTWerfer, 0, [], _actionThrowSkeet] call ace_interact_menu_fnc_addActionToObject;  
};
["menu prison skeet machine"] call ADL_DEBUG;

/*
 * 5: Insert children code <CODE> (Optional)
 * 6: Action parameters <ANY> (Optional)
 * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
 * 8: Distance <NUMBER> (Optional)
*/
//prison money nade
_actionsObject = MONEY_NADE getVariable ["ace_interact_menu_actions", []];
_actionsClass = missionNamespace getVariable [format ["ace_interact_menu_Act_%1", typeOf MONEY_NADE], []];
if (count _actionsObject == 0 && {count _actionsClass == 0}) then {
  //_actionDisarmNade = ["prison_money_disarm","Entschärfen","", {hint "todo: disarm"}, {true}] call ace_interact_menu_fnc_createAction;
  _actionDisarmNade = ["prison_money_disarm","Entschaerfen","", {hint "todo: disarm"}, {true}, {},[],[0.1,0,-0.65],1] call ace_interact_menu_fnc_createAction;
  [MONEY_NADE, 0, [], _actionDisarmNade] call ace_interact_menu_fnc_addActionToObject;  
};
["menu prison money trap"] call ADL_DEBUG;


//prison skeet machine
_actionsClass = missionNamespace getVariable [format ["ace_interact_menu_Act_%1", "SkeetMachine"], []];
if (count _actionsClass == 0) then {
	_mainAction = ["ACE_MainActions", (localize "STR_ACE_Interaction_MainAction"), "", {}, {true}, {},[],[0,0,0],6] call ace_interact_menu_fnc_createAction;
	["SkeetMachine", 0, [], _mainAction] call ace_interact_menu_fnc_addActionToClass;
};

_actionThrowSkeet = ["skeet_shoot_single","Neue Disk","", {[[[_target],"fnc\skeet\spawnSkeet.sqf"],"BIS_fnc_execVM",false,false] call BIS_fnc_MP;}, {true}, {},[],[0,0,0],6] call ace_interact_menu_fnc_createAction;
["SkeetMachine", 0, ["ACE_MainActions"], _actionThrowSkeet] call ace_interact_menu_fnc_addActionToClass;

_actionThrowSkeet10 = ["skeet_shoot_10","10 Disk's","", {[[[_target, false, 10],"fnc\skeet\spawnSkeet.sqf"],"BIS_fnc_execVM",false,false] call BIS_fnc_MP;}, {true}, {},[],[0,0,0],6] call ace_interact_menu_fnc_createAction;
["SkeetMachine", 0, ["ACE_MainActions"], _actionThrowSkeet10] call ace_interact_menu_fnc_addActionToClass;

_actionAutoSkeet = ["skeet_shoot_auto","Automatisch","", {[[[_target, true, 1],"fnc\skeet\spawnSkeet.sqf"],"BIS_fnc_execVM",false,false] call BIS_fnc_MP;}, {true}, {},[],[0,0,0],6] call ace_interact_menu_fnc_createAction;
["SkeetMachine", 0, ["ACE_MainActions"], _actionAutoSkeet] call ace_interact_menu_fnc_addActionToClass;

_actionSettings = ["skeet_settings","Settings","",{}, {true}, {},[],[0,0,0],2] call ace_interact_menu_fnc_createAction;
_actionSettingSpeed = ["skeet_ctl_speed", "Speed","",{}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingSpeed_plus = ["skeet_ctl_speed_plus", "+1","",{_target setVariable["skeet_machine_speed", ((_target getVariable["skeet_machine_speed", 10]) + 1 min 25)]; hint format["speed: %1",_target getVariable["skeet_machine_speed", 6]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingSpeed_plusplus = ["skeet_ctl_speed_plusplus", "+5","",{_target setVariable["skeet_machine_speed", ((_target getVariable["skeet_machine_speed", 6]) + 5 min 25)]; hint format["speed: %1",_target getVariable["skeet_machine_speed", 6]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingSpeed_minus = ["skeet_ctl_speed_minus", "-1","",{_target setVariable["skeet_machine_speed",((_target getVariable["skeet_machine_speed", 10]) - 1 max 5)]; hint format["speed: %1",_target getVariable["skeet_machine_speed", 6]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingSpeed_minusminus = ["skeet_ctl_speed_minusminus", "-5","",{_target setVariable["skeet_machine_speed",((_target getVariable["skeet_machine_speed", 6]) - 5 max 5)]; hint format["speed: %1",_target getVariable["skeet_machine_speed", 6]]}, {true}] call ace_interact_menu_fnc_createAction;

_actionSettingRaise = ["skeet_ctl_raise", "Raise","",{}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingRaise_plus = ["skeet_ctl_raise_plus", "+1","",{_target setVariable["skeet_machine_up", ((_target getVariable["skeet_machine_up", 6]) + 1 min 15)]; hint format["raise: %1",_target getVariable["skeet_machine_up", 6]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingRaise_plusplus = ["skeet_ctl_raise_plusplus", "+5","",{_target setVariable["skeet_machine_up", ((_target getVariable["skeet_machine_up", 6]) + 5 min 15)]; hint format["raise: %1",_target getVariable["skeet_machine_up", 6]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingRaise_minus = ["skeet_ctl_raise_minus", "-1","",{_target setVariable["skeet_machine_up", ((_target getVariable["skeet_machine_up", 6]) - 1 max 1)]; hint format["raise: %1",_target getVariable["skeet_machine_up", 6]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingRaise_minusminus = ["skeet_ctl_raise_minusminus", "-5","",{_target setVariable["skeet_machine_up", ((_target getVariable["skeet_machine_up", 6]) - 5 max 1)]; hint format["raise: %1",_target getVariable["skeet_machine_up", 6]]}, {true}] call ace_interact_menu_fnc_createAction;

_actionSettingInterval = ["skeet_ctl_interval", "Interval","",{}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingInterval_plus = ["skeet_ctl_interval_plus", "+1","",{_target setVariable["skeet_sequence", ((_target getVariable["skeet_sequence", 1]) + 1 min 5)]; hint format["interval: %1",_target getVariable["skeet_sequence", 6]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingInterval_plusplus = ["skeet_ctl_interval_plusplus", "+5","",{_target setVariable["skeet_sequence", ((_target getVariable["skeet_sequence", 1]) + 5 min 5)]; hint format["interval: %1",_target getVariable["skeet_sequence", 6]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingInterval_minus = ["skeet_ctl_interval_minus", "-1","",{_target setVariable["skeet_sequence", ((_target getVariable["skeet_sequence", 1]) - 1 max 0)]; hint format["interval: %1",_target getVariable["skeet_sequence", 6]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingInterval_minusminus = ["skeet_ctl_interval_minusminus", "-5","",{_target setVariable["skeet_sequence", ((_target getVariable["skeet_sequence", 1]) - 5 max 0)]; hint format["interval: %1",_target getVariable["skeet_sequence", 6]]}, {true}] call ace_interact_menu_fnc_createAction;

_actionSettingVar = ["skeet_ctl_var", "Coincidence","",{}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingVar_plus = ["skeet_ctl_var_plus", "+1","",{_target setVariable["skeet_machine_variability", ((_target getVariable["skeet_machine_variability", 6]) + 1 min 30)]; hint format["coincidence: %1",_target getVariable["skeet_machine_variability", 6]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingVar_plusplus = ["skeet_ctl_var_plusplus", "+5","",{_target setVariable["skeet_machine_variability", ((_target getVariable["skeet_machine_variability", 6]) + 5 min 30)]; hint format["coincidence: %1",_target getVariable["skeet_machine_variability", 6]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingVar_minus = ["skeet_ctl_var_minus", "-1","",{_target setVariable["skeet_machine_variability", ((_target getVariable["skeet_machine_variability", 6]) - 1 min 0)]; hint format["coincidence: %1",_target getVariable["skeet_machine_variability", 6]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingVar_minusminus = ["skeet_ctl_var_minusminus", "-5","",{_target setVariable["skeet_machine_variability", ((_target getVariable["skeet_machine_variability", 6]) - 5 min 0)]; hint format["coincidence: %1",_target getVariable["skeet_machine_variability", 6]]}, {true}] call ace_interact_menu_fnc_createAction;

_actionSettingChemlight = ["skeet_ctl_chemlight", "appended chemlight","",{_target setVariable["skeet_machine_chemlight", (!(_target getVariable["skeet_machine_chemlight", false]))]; hint format["add chemlight: %1",_target getVariable["skeet_machine_chemlight", false]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingHitHint = ["skeet_ctl_hitHint", "Show single hit", "", {_target  setVariable["skeet_machine_hitHint", (!(_target getVariable["skeet_machine_hitHint", false]))]; hint format["show hit: %1",_target getVariable["skeet_machine_hitHint", false]]}, {true}] call ace_interact_menu_fnc_createAction;
_actionSettingResults = ["skeet_ctl_results", "Show results", "", {_target  setVariable["skeet_machine_results", (!(_target getVariable["skeet_machine_results", false]))]; hint format["show results: %1",_target getVariable["skeet_machine_results", false]]}, {true}] call ace_interact_menu_fnc_createAction;


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