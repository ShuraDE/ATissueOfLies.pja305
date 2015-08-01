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
	_speed = 6 + (random(6) - 3);

	_skeet setVelocity [
		(_vel select 0) + (sin _dir * _speed), 
		(_vel select 1) + (cos _dir * _speed), 
		10 + (random(6) -3)
	];

	//append hit event and shoot all non bluefor in range
	_eh_hP_skeet = _skeet addMPEventHandler ["MPHit", {hint format["%1 has hit", name (_this select 1)];}];
	_list = TTWerfer nearEntities ["Man", 10];

	{
		if (side _x != west) then {
			[_x,_skeet,_skeet_nr] spawn compile preprocessFile "fnc\srv\shootSkeet.sqf";
		};
	}forEach _list;
	
	//clear up
	sleep 5;
	removeMissionEventHandler  ["MPHit", _eh_hP_skeet];
	deleteVehicle _skeet;
} else {
	["bitte als nur server ausführen"] call ADL_DEBUG;
	hint "server only";
}