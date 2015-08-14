private ["_unit"];

_unit = _this select 0;

if (_unit in [DEV_1,DEV_2]) exitWith { _unit addWeapon "hgun_Rook40_F"; };

if (_unit in [Bullfrog_0,Bullfrog_1,Bullfrog_2,Bullfrog_3,Bullfrog_4,Bullfrog_5]) then {
	[_unit] spawn compile preprocessFileLineNumbers "fnc\player\gear_bullfrog.sqf";
} else {
	[_unit] spawn compile preprocessFileLineNumbers "fnc\player\gear_foxhound.sqf";
};
