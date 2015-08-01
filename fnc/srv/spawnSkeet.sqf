/*
* created by shura für gruppe-adler 01.08.2015
* execute as server
*/
if (isServer) then {
	//position of skeet
	_skeet_nr =  (TTWerfer getVariable ["skeet_nr",0]) + 1;
	TTWerfer setVariable ["skeet_nr", _skeet_nr];

	_skeet = createVehicle ["SkeetDisk", getPos TTWerfer, [], 0, "FLY"];
	_skeet attachTo [TTWerfer , [0,-0.4,0.15]];
	detach _skeet;
	_skeet setDir (direction TTWerfer - 180 % 360);

	//velocity
	_vel = velocity _skeet;
	_dir = ((direction _skeet) + (random(10) - 5) % 360);
	_speed = 5 + (random(6) - 3);

	_skeet setVelocity [
		(_vel select 0) + (sin _dir * _speed), 
		(_vel select 1) + (cos _dir * _speed), 
		10 + (random(6) -3)
	];

	//append hit event
	_eh_hP_skeet = _skeet addMPEventHandler ["MPHit", {hint format["%1 has hit", name (_this select 1)];}];
	skeet_shooter setVariable ["skeet_nr",_skeet_nr];

	//handle  ai
	skeet_shooter setBehaviour "COMBAT";
	skeet_shooter disableAI "MOVE";
	//skeet_shooter doWatch _skeet; 
	skeet_shooter doTarget _skeet; 

	sleep (random(2)/10 + 0.3);
	skeet_shooter fire currentWeapon skeet_shooter;
	if (random(4) < 3) then {
		sleep (random(10)/10) min 0.5;
		skeet_shooter fire currentWeapon skeet_shooter;	
	};
	//skeet_shooter forceWeaponFire [currentWeapon skeet_shooter, currentWeaponMode skeet_shooter];
	//skeet_shooter doFire _skeet;
	
	//if another one is fired ignore this
	if (skeet_shooter getVariable ["skeet_nr",0] == TTWerfer getVariable ["skeet_nr",0]) then {
		sleep (random(10)/10) min 0.3;
		skeet_shooter doTarget objNull;
		skeet_shooter setBehaviour "SAFE";
		skeet_shooter enableAI "MOVE";
	};
	
	//clear up
	sleep 5;
	removeMissionEventHandler  ["MPHit", _eh_hP_skeet];
	deleteVehicle _skeet;
} else {
	["bitte als nur server ausführen"] call ADL_DEBUG;
	hint "server only";
}