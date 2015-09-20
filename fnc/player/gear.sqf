private ["_unit"];

_unit = _this select 0;

if (_unit in [DEV_1,DEV_2]) exitWith {
	_unit addWeapon "hgun_Rook40_F";
	[[ player, "SOCOM"], "BIS_fnc_setUnitInsignia", nil, true, true] call BIS_fnc_MP;
};

if (_unit in [Bullfrog_0,Bullfrog_1,Bullfrog_2,Bullfrog_3,Bullfrog_4,Bullfrog_5]) then {
	[_unit] spawn compile preprocessFileLineNumbers "fnc\player\gear_bullfrog.sqf";
	[[ player, "DEVGRU"], "BIS_fnc_setUnitInsignia", nil, true, true] call BIS_fnc_MP;
} else {
	[_unit] spawn compile preprocessFileLineNumbers "fnc\player\gear_foxhound.sqf";
	[[ player, "MARSOC"], "BIS_fnc_setUnitInsignia", nil, true, true] call BIS_fnc_MP;
};
