private ["_unit"];

_unit = _this select 0;

if (!(prison_laptop getVariable ["laptop_hacked", false])) then {

	[_unit] call ADL_ANIM_ACTIVATE;

	//intel officer & engineer & fusselwurm are much faster  (shura only to debug)
	//if success, recall function
	[(if (typeOf _unit in ["B_engineer_F","B_officer_F"] || name _unit in ["Shura","Fusselwurm"]) then {5} else {180}), [], {
			prison_laptop setVariable ["laptop_hacked", true, true];prison_laptop setObjectTextureGlobal [0, "pic\desktop.paa"];[[],"ADL_MNU_INTEL_LAPTOP_HACKED", true] call BIS_fnc_MP;
		}, {hintSilent localize "STR_ADL_ATOL_LAPTOP_FAILED"}, localize "STR_ADL_ATOL_HACK"] call ace_common_fnc_progressBar;
};



