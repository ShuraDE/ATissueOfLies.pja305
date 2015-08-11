private ["_unit"];

_unit = _this select 0;
_target = _this select 1;

if (isNil "_unit" || !(isPlayer _unit)) exitWith { ["no user @ take money"] call ADL_DEBUG; };

[_unit] spawn ADL_ANIM_TAKE;
sleep 1;

if (_target == prison_money_2 && !isNil("MONEY_NADE")) then {
	["execute money trap"] call ADL_DEBUG;
	_nade = createVehicle ["GrenadeHand", position prison_money_2, [], 0, "CAN_COLLIDE"];
	_nade setPos position MONEY_NADE; //high is wrong on create vehicle
	_nade setPosASL [getPosASL MONEY_NADE SELECT 0,getPosASL MONEY_NADE SELECT 1,getPosASL MONEY_NADE SELECT 2];
	
	deleteVehicle MONEY_NADE;
	MONEY_NADE = nil;
	publicVariable "MONEY_NADE";

};

deleteVehicle _target;
_unit setVariable ["money",((_unit getVariable ["money",0]) + 70000), true];


//inform player what he get
[format["Du hast nun %1 USD", _unit getVariable ["money",0]],"hint", _unit] call BIS_fnc_MP;
["money taken by " + name player] call ADL_DEBUG;
