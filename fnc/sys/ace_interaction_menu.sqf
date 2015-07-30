//root menu entry, append if !exists
_mainAction = ["ACE_MainActions", "Interaktionen", "", {}, {true}] call ace_interact_menu_fnc_createAction;

/* 
* Prison 
*/

//prison radio
_actionsObject = prison_radio getVariable ["ace_interact_menu_actions", []];
_actionsClass = missionNamespace getVariable [format ["ace_interact_menu_Act_%1", typeOf prison_radio], []];
if (count _actionsObject == 0 && {count _actionsClass == 0}) then {
  [prison_radio, 0, [], _mainAction] call ace_interact_menu_fnc_addActionToObject;
};
_actionTurnOnRadio = ["prison_radio_turnOn","Radio anschalten","", {hint "todo: radio on"}, {true}] call ace_interact_menu_fnc_createAction;
[prison_radio, 0, ["ACE_MainActions"], _actionTurnOnRadio] call ace_interact_menu_fnc_addActionToObject;

//prison sat phone
_actionsObject = prison_phone getVariable ["ace_interact_menu_actions", []];
_actionsClass = missionNamespace getVariable [format ["ace_interact_menu_Act_%1", typeOf prison_phone], []];
if (count _actionsObject == 0 && {count _actionsClass == 0}) then {
  [prison_phone, 0, [], _mainAction] call ace_interact_menu_fnc_addActionToObject;
};
_actionSearchSatPhoneIntel = ["prison_phone_intel_search","Untersuchen","", {hint "todo: sat intel"}, {true}] call ace_interact_menu_fnc_createAction;
[prison_phone, 0, ["ACE_MainActions"], _actionSearchSatPhoneIntel] call ace_interact_menu_fnc_addActionToObject;


//prison money  ---  append to class!!
_actionsObject = prison_money_1 getVariable ["ace_interact_menu_actions", []];
_actionsClass = missionNamespace getVariable [format ["ace_interact_menu_Act_%1", typeOf prison_money_1], []];
if (count _actionsObject == 0 && {count _actionsClass == 0}) then {
  ["EvMoney", 0, [], _mainAction] call ace_interact_menu_fnc_addActionToClass;
};
_actionTakeMoney = ["prison_money_take","Geld nehmen","", {hint "todo: take money"}, {true}] call ace_interact_menu_fnc_createAction;
_actionCheckMoney = ["prison_money_check","Geld untersuchen","", {hint "todo: check money"}, {true}] call ace_interact_menu_fnc_createAction;
["EvMoney", 0, ["ACE_MainActions"], _actionTakeMoney] call ace_interact_menu_fnc_addActionToClass;
["EvMoney", 0, ["ACE_MainActions"], _actionCheckMoney] call ace_interact_menu_fnc_addActionToClass;


//prison money nade
_actionsObject = MONEY_NADE getVariable ["ace_interact_menu_actions", []];
_actionsClass = missionNamespace getVariable [format ["ace_interact_menu_Act_%1", typeOf MONEY_NADE], []];
if (count _actionsObject == 0 && {count _actionsClass == 0}) then {
  [MONEY_NADE, 0, [], _mainAction] call ace_interact_menu_fnc_addActionToObject;
};
_actionDisarmNade = ["prison_money_disarm","Entschärfen","", {hint "todo: disarm"}, {true}] call ace_interact_menu_fnc_createAction;
[MONEY_NADE, 0, ["ACE_MainActions"], _actionDisarmNade] call ace_interact_menu_fnc_addActionToObject;
