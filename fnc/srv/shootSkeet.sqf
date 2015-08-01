private ["_shooter"];
_shooter = _this select 0;

_shooter setVariable ["skeet_nr",_skeet_nr];

//handle  ai
_shooter setBehaviour "COMBAT";
_shooter disableAI "MOVE";
//skeet_shooter doWatch _skeet; 
_shooter doTarget _skeet; 

sleep (random(2)/10 + 0.3);
_shooter fire currentWeapon _shooter;
if (random(4) < 3) then {
	sleep (random(10)/10) min 0.5;
	_shooter fire currentWeapon _shooter;	
};
//skeet_shooter forceWeaponFire [currentWeapon skeet_shooter, currentWeaponMode skeet_shooter];
//skeet_shooter doFire _skeet;

//if another one is fired ignore this
if (_shooter getVariable ["skeet_nr",0] == TTWerfer getVariable ["skeet_nr",0]) then {
	sleep (random(10)/10) min 0.3;
	_shooter doTarget objNull;
	_shooter setBehaviour "SAFE";
	_shooter enableAI "MOVE";
};