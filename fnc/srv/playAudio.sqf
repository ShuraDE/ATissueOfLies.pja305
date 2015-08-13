private ["_obj","_snd","_tmp"];

_obj = _this select 0;
_snd = _this select 1;


_tmp = "Sign_Arrow_Blue_F" createVehicle position _obj;
_tmp attachTo [_obj, [0, 0, 0]]; 


PVEH_netSay3D = [_tmp,_snd];
publicVariable "PVEH_netSay3D";

if (!isDedicated) then {_tmp say3D _snd};

true;