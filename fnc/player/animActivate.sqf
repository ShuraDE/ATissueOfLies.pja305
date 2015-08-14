private ["_unit"];

_unit = _this select 0;

_unit playActionNow "PutDown";

/*
if (currentWeapon _unit != "" && {currentWeapon _unit == primaryWeapon _unit}) then {
	[_unit,"AmovPercMstpSrasWrflDnon_AinvPercMstpSrasWrflDnon_Putdown", 1, true] call ace_common_fnc_doAnimation; //0,555
};

if (currentWeapon _unit != "" && {currentWeapon _unit == secondaryWeapon _unit}) then {
	[_unit,"AmovPercMstpSrasWpstDnon_AinvPercMstpSrasWpstDnon_Putdown", 1, true] call ace_common_fnc_doAnimation; //0,555
};
*/
sleep 1;