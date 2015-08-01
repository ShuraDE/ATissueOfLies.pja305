_skeet = createVehicle ["SkeetDisk", getPosASL TTWerfer, [], 0, "FLY"];
//_skeet setVectorDirAndUp [vectorDir TTWerfer, vectorUp TTWerfer];
_skeet attachTo [TTWerfer , [0,-0.4,0.15]];
detach _skeet;

_skeet setDir (direction TTWerfer - 180 % 360);

_vel = velocity _skeet;
_dir = ((direction _skeet) + (random(10) - 5) % 360);
_speed = 11 + (random(6) - 3);

_skeet setVelocity [
	(_vel select 0) + (sin _dir * _speed), 
	(_vel select 1) + (cos _dir * _speed), 
	10 + (random(6) -3)
];

skeet_shooter setBehaviour "COMBAT";
sleep 0.1;
skeet_shooter doTarget _skeet; 

sleep 0.3;
skeet_shooter forceWeaponFire [currentWeapon skeet_shooter, currentWeaponMode skeet_shooter];
//skeet_shooter doFire _skeet;
sleep 0.2;
skeet_shooter forceWeaponFire [currentWeapon skeet_shooter, currentWeaponMode skeet_shooter];
//skeet_shooter doFire _skeet;
skeet_shooter setBehaviour "SAFE";
skeet_shooter doTarget objNull;
//skeet_shooter stop false;

//clear up
sleep 2;
deleteVehicle _skeet;
