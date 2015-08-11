private ["_user"];

_user = _this select 0;

//intel officer & engineer are faster
[(if (typeOf _user in ["B_engineer_F","B_officer_F"]) then {30} else {90}), [], {Hint "Finished!"}, {hint "Failure!"}, "Suche nach Kontaktdaten...."] call ace_common_fnc_progressBar;