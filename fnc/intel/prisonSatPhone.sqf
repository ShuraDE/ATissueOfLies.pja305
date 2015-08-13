private ["_unit"];

_unit = _this select 0;

if !(missionNamespace getVariable ["intel_satphone",false]) then {

	[_unit] call ADL_ANIM_ACTIVATE;

	//intel officer & engineer are faster
	[(if (typeOf _unit in ["B_engineer_F","B_officer_F"]) then {30} else {90}), [], {missionNamespace setVariable ["intel_satphone",true]; hintSilent localize "STR_ADL_ATOL_PHONE_SUCCESS" }, {hintSilent localize "STR_ADL_ATOL_FAILURE"}, localize "STR_ADL_ATOL_HACK_N_COPY"] call ace_common_fnc_progressBar;

} else {
	hintSilent localize "STR_ADL_ATOL_PHONE_DONE";
};