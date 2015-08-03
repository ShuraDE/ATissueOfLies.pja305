/*
* created by shura für gruppe-adler 01.08.2015
* execute as server
*
* Parameter IN
* 0 = Skeet Machine
* 1 = amount of disks  (min 1)
* 2 = time to next disk if amount > 1
* 3 = disk speed throw
* 4 = vertical power
* 5 = variability between disk parameter  (max 10)
* 6 = append chemlight to disk
* 7 = append explosive to disk (explodes on hit)  N/A!
*/
private ["_skeet_machine", "_skeet_amount", "_skeet_interval", "_skeet_speed","_skeet_raise", "_variability","_attachChemlight","_attachExplosive", "_skeet", "_chemlight", "_variablityHalf"];

if (isServer) then {

	_skeet_machine = param [0, objNull];
	 
	if (isNil "_skeet_machine" || typeOf _skeet_machine != "SkeetMachine") exitWith { ["skeet machine is missing"] call ADL_DEBUG };
	if (_skeet_machine getVariable ["skeet_machine_isBusy",false]) exitWith {["skeet machine is busy"] call ADL_DEBUG };
	
	_skeet_amount = param [1, 1] max 1;
	
	_skeet_speed = param [3, _skeet_machine getVariable["skeet_machine_speed", 6]];
	_skeet_raise = param [4, _skeet_machine getVariable["skeet_machine_up", 10]];
	_variability = param [5, _skeet_machine getVariable["skeet_machine_variability", 6]] min 10;
	_attachChemlight = param [6, _skeet_machine getVariable["skeet_machine_chemlight", false]];
	_attachExplosive = param [7, _skeet_machine getVariable["skeet_machine_nade", false]];
 
	_skeet_interval = param [2, (2 + (random(_variability)*0.1))];
	
	_chemlight = "";
	_skeet_machine setVariable ["skeet_machine_isBusy",true];
	while {_skeet_amount > 0} do {
	
		[format["skeet #%1", _skeet_amount]] call ADL_DEBUG;
		
		//position of skeet
		_skeet_nr =  (_skeet_machine getVariable ["skeet_nr",0]) + 1;
		_skeet_machine setVariable ["skeet_nr", _skeet_nr];

		_skeet = createVehicle ["SkeetDisk", getPos _skeet_machine, [], 0, "FLY"];
		_skeet attachTo [_skeet_machine , [0,-0.4,0.15]];
		detach _skeet;
		_skeet setDir (direction _skeet_machine - 180 % 360);

		if (_attachChemlight) then {
			//placed_chemlight_red
			_chemlight = createVehicle ["SkeetDisk", getPos _skeet_machine, [], 0, "NONE"];
			_chemlight attachTo [_skeet, [0,0,0]];
		};
		
		if (_attachExplosive) then {
			["todo"] call ADL_DEBUG;
		};
		
		
		//velocity
		_variability = _variability + 1;
		_vel = velocity _skeet;
		_dir = (direction _skeet) + (random(_variability) % 360);
		_speed = _skeet_speed + random(_variability);

		_skeet setVelocity [
			(_vel select 0) + (sin _dir * _speed), 
			(_vel select 1) + (cos _dir * _speed), 
			_skeet_raise + random(_variability)
		];

		//append hit event and shoot all non bluefor in range
		_eh_hP_skeet = _skeet addMPEventHandler ["MPHit", {hint format["%1 has hit", name (_this select 1)];}];
		_list = _skeet_machine nearEntities ["Man", 10];

		{
			if (side _x != west) then {
				[_x,_skeet,_skeet_nr] spawn compile preprocessFile "fnc\srv\shootSkeet.sqf";
			};
		}forEach _list;
		
		[format["sleep #%1", _skeet_interval]] call ADL_DEBUG;
		sleep _skeet_interval;
		
		//clear up
		[_eh_hP_skeet, _attachChemlight, _chemlight, _skeet] spawn {
			sleep 5;
			/*removeMissionEventHandler  ["MPHit", _eh_hP_skeet];
			if (_attachChemlight) then { deleteVehicle _chemlight; };
			deleteVehicle _skeet;
			*/
			removeMissionEventHandler  ["MPHit", _this select 0];
			if (_this select 1) then { deleteVehicle (_this select 2); };
			deleteVehicle (_this select 3);
		};
		
		_skeet_amount = _skeet_amount - 1;
	};
	_skeet_machine setVariable ["skeet_machine_isBusy",false];
} else {
	["bitte als nur server ausführen"] call ADL_DEBUG;
	hint "server only";
};