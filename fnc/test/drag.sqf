//ersatz script für das fehlerhafte ace_dragging_fnc_setDraggable in ACE 3.2.0
_mainAction = ["ACE_MainActions", (localize "STR_ACE_Interaction_MainAction"), "", {}, {true}] call ace_interact_menu_fnc_createAction;
tonne setMass 0.1;
[tonne, 0, [], _mainAction] call ace_interact_menu_fnc_addActionToObject;
tonne setVariable ["ace_dragging_canDrag", true];  
tonne setVariable ["ace_dragging_dragPosition", [0,1,0]];  
tonne setVariable ["ace_dragging_dragDirection", 20];  
 
 
_dragAction = ["ace_dragging_drag", (localize "STR_ACE_Dragging_Drag"), "", {[player, _target] call ace_dragging_fnc_startDrag}, {[player, _target] call ace_dragging_fnc_canDrag}] call ace_interact_menu_fnc_createAction;
_dropAction = ["ace_dragging_drop", (localize "STR_ACE_Dragging_Drop"), "", {[player, _target] call ace_dragging_fnc_dropObject}, {[player, _target] call ace_dragging_fnc_canDrop}] call ace_interact_menu_fnc_createAction;
[tonne, 0, ["ACE_MainActions"], _dragAction] call ace_interact_menu_fnc_addActionToObject;
[tonne, 0, ["ACE_MainActions"], _dropAction] call ace_interact_menu_fnc_addActionToObject;
 