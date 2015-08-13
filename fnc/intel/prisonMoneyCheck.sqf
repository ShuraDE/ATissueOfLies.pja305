private ["_user","_target","_checkValue"];

_user = _this select 0;
_target = _this select 1;
_checkValue = random(100);

[format["Money: check %1 < %2 result is %3",_checkValue,(if (typeOf _user == "B_officer_F") then {75} else {40}),(_checkValue < (if (typeOf _user == "B_officer_F") then {90} else {60}))]] call ADL_DEBUG;

if (_target == prison_money_2 && (_checkValue < (if (typeOf _user == "B_officer_F") then {75} else {40}))) exitWith {
		hintSilent localize "STR_ADL_ATOL_MONEY_CHECK";
};
hintSilent localize "STR_ADL_ATOL_MONEY_AMOUNT";