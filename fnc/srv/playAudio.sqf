//create a new temporary object, use it as sound source

private ["_obj","_snd","_tmp"];

_obj = _this select 0;
_snd = _this select 1;

if (count (attachedObjects prison_radio) > 0) then {
	if (count (attachedObjects prison_radio) == 1 && typeOf (attachedObjects prison_radio select 0) == "Sign_Arrow_Blue_F") then {
		deleteVehicle (attachedObjects prison_radio select 0);
		["delete temp sound holder"] call ADL_DEBUG;
	} else { //mehr als 1
		{
			if (typeOf _x == "Sign_Arrow_Blue_F") exitWith { 
				deleteVehicle _x; 
				["delete temp sound holder"] call ADL_DEBUG;
			};
		} forEach (attachedObjects prison_radio);
	};
};

//create a new object attach to source
_tmp = "Sign_Arrow_Blue_F" createVehicle position _obj;
hideObject _tmp; 
_tmp attachTo [_obj, [0, 0, 0]]; 
["create sound holder"] call ADL_DEBUG;

//raising the pv eventHandler
PVEH_netSay3D = [_tmp,_snd];
publicVariable "PVEH_netSay3D";

//local execute
if (!isDedicated) then {_tmp say3D _snd};

//all fine
true;