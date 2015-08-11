private ["_unit"];

_unit = _this select 0;

if !(missionNamespace getVariable ["intel_satphone",false]) then {

	[_unit] call ADL_ANIM_ACTIVATE;

	//intel officer & engineer are faster
	[(if (typeOf _unit in ["B_engineer_F","B_officer_F"]) then {30} else {90}), [], {missionNamespace setVariable ["intel_satphone",true]; Hint "Successfully copied contacts to your flashdevice"}, {hint "Failure!"}, "Hacking and copy data...."] call ace_common_fnc_progressBar;

} else {
	hint "Someone has already copied the data";
};