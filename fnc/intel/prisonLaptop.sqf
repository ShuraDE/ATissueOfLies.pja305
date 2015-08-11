private ["_user"];

_user = _this select 0;

if (!(prison_laptop getVariable ["laptop_hacked", false])) then {
	//intel officer & engineer & fusselwurm are much faster  (shura only to debug)
	//if success, recall function
	[(if (typeOf _user in ["B_engineer_F","B_officer_F"] || name _user in ["Shura","Fusselwurm"]) then {5} else {180}), [], {
			prison_laptop setVariable ["laptop_hacked", true, true];prison_laptop setObjectTextureGlobal [0, "pic\desktop.paa"];[[],"ADL_MNU_INTEL_LAPTOP_HACKED", true] call BIS_fnc_MP;
		}, {hint "Linux has beaten you :-P"}, "Hacking...."] call ace_common_fnc_progressBar;
};



