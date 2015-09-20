private ["_unit"];

_unit = _this select 0;



switch (_unit) do {
	case Bullfrog_0;
	case Bullfrog_1;
	case Bullfrog_2;
	case Bullfrog_3;
	case Bullfrog_4;
	case Bullfrog_5: {
		["gear DEVGRU"] call ADL_DEBUG;
		[_unit] spawn compile preprocessFileLineNumbers "fnc\player\gear_bullfrog.sqf";
		[[ player, "DEVGRU"], "BIS_fnc_setUnitInsignia", nil, true, true] call BIS_fnc_MP; };
	case IntelOfficer: {
		["gear MSOIB"] call ADL_DEBUG;
		[_unit] spawn compile preprocessFileLineNumbers "fnc\player\gear_foxhound.sqf";
		[[ player, "MSOIB"], "BIS_fnc_setUnitInsignia", nil, true, true] call BIS_fnc_MP; };
	case Foxhound_0_0;
	case Foxhound_0_1: {
		["gear MARSOC"] call ADL_DEBUG;
		[_unit] spawn compile preprocessFileLineNumbers "fnc\player\gear_foxhound.sqf";
		[[ player, "MARSOC"], "BIS_fnc_setUnitInsignia", nil, true, true] call BIS_fnc_MP; };
	case zeus1;
	case zeus2: {
		["gear SOCOM"] call ADL_DEBUG;
		[_unit] spawn compile preprocessFileLineNumbers "fnc\player\gear_socom.sqf";
		[[ player, "SOCOM"], "BIS_fnc_setUnitInsignia", nil, true, true] call BIS_fnc_MP; };
	default {
		["gear 1stMRB"] call ADL_DEBUG;
		[_unit] spawn compile preprocessFileLineNumbers "fnc\player\gear_foxhound.sqf";
		[[ player, "1stMRB"], "BIS_fnc_setUnitInsignia", nil, true, true] call BIS_fnc_MP; };
};
