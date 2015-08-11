//root menu entry, append if !exists
_mainAction = ["ACE_MainActions", (localize "STR_ACE_Interaction_MainAction"), "", {}, {true}] call ace_interact_menu_fnc_createAction;
/* 
* Prison objects
*/

//prison nade
_actionDisarmNade = ["prison_money_disarm","Entschaerfen","", {[player] spawn ADL_MNU_INTEL_NADE;}, {true}, {},[],[0.1,0,-0.65],1] call ace_interact_menu_fnc_createAction;
[MONEY_NADE, 0, [], _actionDisarmNade] call ace_interact_menu_fnc_addActionToObject;  
["menu prison trap"] call ADL_DEBUG;

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
  _actionSearchSatPhoneIntel = ["prison_phone_intel_search","Untersuchen","", {[player,_target] spawn ADL_MNU_INTEL_SATPHONE;}, {true}] call ace_interact_menu_fnc_createAction;
  [prison_phone, 0, [], _actionSearchSatPhoneIntel] call ace_interact_menu_fnc_addActionToObject;
};
["menu prison sat phone"] call ADL_DEBUG;

//prison map
_actionsObject = prison_map getVariable ["ace_interact_menu_actions", []];
_actionsClass = missionNamespace getVariable [format ["ace_interact_menu_Act_%1", typeOf prison_map], []];
if (count _actionsObject == 0 && {count _actionsClass == 0}) then {
  _actionSearchMapIntel = ["prison_map_intel_search","Untersuchen","", {hint "todo: map intel"}, {true}] call ace_interact_menu_fnc_createAction;
  [prison_map, 0, [], _actionSearchMapIntel] call ace_interact_menu_fnc_addActionToObject;
};
["menu prison map"] call ADL_DEBUG;

//prison memo
_actionsObject = prison_file getVariable ["ace_interact_menu_actions", []];
_actionsClass = missionNamespace getVariable [format ["ace_interact_menu_Act_%1", typeOf prison_file], []];
if (count _actionsObject == 0 && {count _actionsClass == 0}) then {
  _actionSearchMemoIntel = ["prison_memo_intel_search","Untersuchen","", {[player, true] spawn ADL_MNU_INTEL_MEMO;}, {true}] call ace_interact_menu_fnc_createAction;
  [prison_file, 0, [], _actionSearchMemoIntel] call ace_interact_menu_fnc_addActionToObject;
};
["menu prison memo"] call ADL_DEBUG;

//prison laptop
_actionsObject = prison_laptop getVariable ["ace_interact_menu_actions", []];
_actionsClass = missionNamespace getVariable [format ["ace_interact_menu_Act_%1", typeOf prison_laptop], []];
if (count _actionsObject == 0 && {count _actionsClass == 0}) then {
  _actionSearchLaptopIntel = ["prison_laptop_intel_search","Hacken","", {[player,_target] spawn ADL_MNU_INTEL_LAPTOP;}, {true}] call ace_interact_menu_fnc_createAction;
  [prison_laptop, 0, [], _actionSearchLaptopIntel] call ace_interact_menu_fnc_addActionToObject;
};
["menu prison laptop"] call ADL_DEBUG;

//prison money  ---  append to class!!
_actionsObject = prison_money_1 getVariable ["ace_interact_menu_actions", []];
_actionsClass = missionNamespace getVariable [format ["ace_interact_menu_Act_%1", typeOf prison_money_1], []];
if (count _actionsObject == 0 && {count _actionsClass == 0}) then {
  ["EvMoney", 0, [], _mainAction] call ace_interact_menu_fnc_addActionToClass;
};
_actionTakeMoney = ["prison_money_take","Geld nehmen","", {[player,_target] spawn ADL_MNU_INTEL_MONEY;}, {true}] call ace_interact_menu_fnc_createAction;
_actionCheckMoney = ["prison_money_check","Geld untersuchen","", {[player,_target] spawn ADL_MNU_INTEL_MONEY_CHECK;}, {true}] call ace_interact_menu_fnc_createAction;
["EvMoney", 0, ["ACE_MainActions"], _actionTakeMoney] call ace_interact_menu_fnc_addActionToClass;
["EvMoney", 0, ["ACE_MainActions"], _actionCheckMoney] call ace_interact_menu_fnc_addActionToClass;
["menu prison money"] call ADL_DEBUG;

