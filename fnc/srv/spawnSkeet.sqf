/*
* created by shura für gruppe-adler 01.08.2015
* execute as server
*
* Parameter IN
* 0 = Skeet Machine
* 1 = skeet machine will fire until units nearby, radius 5
* 2 = amount of disks  (min 1)
* 3 = time to next disk if amount > 1
* 4 = disk speed throw
* 5 = vertical power
* 6 = variability between disk parameter  (max 10)
* 7 = append chemlight to disk
* 8 = append explosive to disk (explodes on hit)  N/A!
* 9 = enable AI in range shooting on disks
*/
private ["_skeet_machine", "_skeet_amount", "_skeet_interval", "_skeet_speed","_skeet_raise", "_variability","_attachChemlight","_attachExplosive", "_shootingAI", "_triggerBasedActivation", "_skeet", "_chemlight", "_variablityHalf", "_hitCounter"];

if (isServer) then {

	_skeet_machine = param [0, objNull];
	 
	if (isNil "_skeet_machine" || typeOf _skeet_machine != "SkeetMachine") exitWith { ["skeet machine is missing"] call ADL_DEBUG };
	if (_skeet_machine getVariable ["skeet_machine_isBusy",false]) exitWith {["skeet machine is busy"] call ADL_DEBUG };
	
	_distanceActivation = param [1,false];
	_skeet_amount = param [2, 1] max 1;
	//unnötig die als params zu machen
	_skeet_interval = param [3, _skeet_machine getVariable["skeet_sequence", 1]] min 5;
	_skeet_speed = param [4, _skeet_machine getVariable["skeet_machine_speed", 10]];
	_skeet_raise = param [5, _skeet_machine getVariable["skeet_machine_up", 10]];
	_variability = param [6, _skeet_machine getVariable["skeet_machine_variability", 6]];
	_attachChemlight = param [7, _skeet_machine getVariable["skeet_machine_chemlight", false]];
	_attachExplosive = param [8, _skeet_machine getVariable["skeet_machine_nade", false]];
	_shootingAI = param [9,_skeet_machine getVariable["skeet_machine_ai", false]];
 
	_displayHitHint =  _skeet_machine getVariable["skeet_machine_hitHint", false];
	_displayResults =  _skeet_machine getVariable["skeet_machine_results", false];
	
	
	//to set variability +/- value  --> _skeet_speed + random(_variability);
	_skeet_speed = _skeet_speed - (_variability/2);
	_skeet_raise = _skeet_raise - (_variability/2);
	
	_chemlight = "";
	_skeet_machine setVariable ["skeet_machine_isBusy",true,true];
	
	_counter = [[],[]];
 	_skeet_machine setVariable ["skeet_machine_counter",_counter];
	
	while {_skeet_amount > 0} do {
	
		[format["skeet #%1", _skeet_amount]] call ADL_DEBUG;
		
		_skeet_machine setVariable ["skeet_nr",  ((_skeet_machine getVariable ["skeet_nr",0]) + 1), true];

		_skeet = createVehicle ["SkeetDisk", getPos _skeet_machine, [], 0, "FLY"];
		_skeet attachTo [_skeet_machine , [0,-0.4,0.15]];
		detach _skeet;
		_skeet setVariable["skeet_machine",_skeet_machine];
		_skeet setDir (direction _skeet_machine - 180 % 360);

		if (_attachChemlight) then {
			//placed_chemlight_green
			_chemlight = createVehicle ["Chemlight_green", getPos _skeet_machine, [], 0, "NONE"];
			_chemlight attachTo [_skeet, [0,0,0]];
			sleep 0.2;
		};
		
		if (_attachExplosive) then {
			["todo _attachExplosive"] call ADL_DEBUG;
		};
		
		
		//velocity
		_vel = velocity _skeet;
		_dir = (((direction _skeet) + random(_variability)) % 360);
		_speed = (_skeet_speed + random(_variability)) max 5;

		_skeet setVelocity [
			(_vel select 0) + (sin _dir * _speed), 
			(_vel select 1) + (cos _dir * _speed), 
			(_skeet_raise + random(_variability)) min 15
		];

		if (_skeet_machine getVariable["skeet_machine_hitHint", false] || _skeet_machine getVariable["skeet_machine_results", false]) then {
			//append hit event
			_eh_hP_skeet = _skeet addMPEventHandler ["MPHit", 
				{
					//get skeet machine
					_tmp_skeetMachine = (_this select 0) getVariable["skeet_machine",objNull];
					if (isNil "_tmp_skeetMachine") exitWith {["error handler"] call ADL_DEBUG; };
					
					//wenn hit angezeigt werden soll, public hint
					if (_tmp_skeetMachine getVariable["skeet_machine_hitHint", false]) then {
						[format["%1 has hit", name (_this select 1)],"hint", (_tmp_skeetMachine nearEntities ["Man", 15])] call BIS_fnc_MP;
					};
					
					//wenn results angezeigt werden sollen, hash map befüllen
					_hits = _tmp_skeetMachine getVariable["skeet_machine_counter",[[],[]]];
					if (_tmp_skeetMachine getVariable["skeet_machine_results", true]) then {
						_idx = ((_hits select 0) find (name (_this select 1)));
						if (_idx!=-1) then {
							(_hits select 1) set[_idx,((_hits select 1) select _idx) +1];
							[format ["raise %1",name (_this select 1)]] call ADL_DEBUG;
						} else {
							[format ["add %1",name (_this select 1)]] call ADL_DEBUG;
							_idx = (count (_hits select 0));
							(_hits select 0) set[_idx,  name (_this select 1)];
							(_hits select 1) set[_idx,  1];
						};
						_tmp_skeetMachine setVariable["skeet_machine_counter",_hits];
					};
				}];
		};
		
		//lets shoot all non bluefor in range
		if (_shootingAI) then {
			_list = _skeet_machine nearEntities ["Man", 10];
			{
				if (side _x != west) then {
					[_x,_skeet, (_skeet_machine getVariable ["skeet_nr",0]), _skeet_machine] spawn ADL_SKEET_SHOOT_AI; //compile preprocessFile "fnc\srv\shootSkeet.sqf";
				};
			}forEach _list;
		};
		
		if (_skeet_interval > 0) then { sleep (_skeet_interval  + (random(_variability)*0.2)); };
		
		//remove EH from skeet
		[_eh_hP_skeet, _attachChemlight, _chemlight, _skeet] spawn {
			sleep 5;
			removeMissionEventHandler  ["MPHit", _this select 0];
			if (_this select 1) then { deleteVehicle (_this select 2); };
			deleteVehicle (_this select 3);
		};
		
		
		if (_distanceActivation) then {
			if ( count (_skeet_machine nearEntities ["Man", 5]) == 0) then {
				_skeet_amount = 0;
			} else {
				_skeet_amount = _skeet_amount + 1;
			};
		} else {
			_skeet_amount = _skeet_amount - 1;
		};

	};
	
	_skeet_machine setVariable ["skeet_machine_isBusy",false,true];	
	
	_counter = _skeet_machine getVariable ["skeet_machine_counter",[[],[]]];
	if (_displayResults && count (_counter select 0) > 0) then {
		["results:","systemChat"] call BIS_fnc_MP;
		{
			[format["%1 : %2", _x,(_counter select 1) select _forEachIndex],"systemChat"] call BIS_fnc_MP;
		} forEach (_counter select 0);
	};

} else {
	["should server executed"] call ADL_DEBUG;
	hint "server only";
};