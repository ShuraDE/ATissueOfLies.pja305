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

