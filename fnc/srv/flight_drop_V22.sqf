//fly a v22 to marker, get down on height 10 (water jump possible) and fly away after
//2015 shura für gruppe adler
private ["_grpAir","_mv22","_xVel","_yVel","_zVel","_wp","_vel","_velFactor","_timer"];

/*
private ["_grpAir","_mv22","_dropper","_xVel","_yVel","_zVel","_wp","_vel","_velFactor"];
_grpAir = createGroup west;

_dropper = [[10000,0,500],45,"MV22",_grpAir] call BIS_fnc_spawnVehicle;
_mv22 = _dropper select 0;
*/

["v22 init waterdrop"] call ADL_DEBUG;
_mv22 = _this select 0;
_grpAir = group _mv22;


{
	deleteWaypoint [_grpAir, _x select 1];
}forEach waypoints _grpAir;


_mv22 flyInHeight 10;


//fast to target
_mv22 setSpeedMode "full";
_wp =_grpAir addWaypoint [getMarkerPos "mrk_v22_drop", 0];
waitUntil { (abs(((getPos _mv22) select 0) - ((getMarkerPos "mrk_v22_drop") select 0)) < 900) 
		 && (abs(((getPos _mv22) select 1) - ((getMarkerPos "mrk_v22_drop") select 1)) < 900); };

//flucht vector 		 
_wp =_grpAir addWaypoint [getMarkerPos "mrk_v22_direction", 0];		

//slowdown near target		 
_mv22 setSpeedMode "limited";
["v22 reduce"] call ADL_DEBUG;
waitUntil { (abs(((getPos _mv22) select 0) - ((getMarkerPos "mrk_v22_drop") select 0)) < 450) 
		 && (abs(((getPos _mv22) select 1) - ((getMarkerPos "mrk_v22_drop") select 1)) < 450); };

deleteWaypoint [_grpAir, 0];
		 
//prepare water jump		 
while {Alive _mv22 and (speed _mv22 >= 15) and (getPosASL _mv22 select 2 > 10) } do
{
	_xVel = velocity _mv22 select 0;
	_yVel = velocity _mv22 select 1;
	_zVel = velocity _mv22 select 2;
	
	if (getPosASL _mv22 select 2 < 10) then { _zVel = 1.02;} else { _zVel = -1.9;}; //backup damit er nicht absäuft
	
	//https://docs.google.com/spreadsheets/d/1UDEQ_qWoSTITSK0ewhiN0FQA3cdNhqwiuMVT-laEtCI/edit?usp=sharing
	if (speed _mv22 > 300) then {_vel = 1.08;};
	if (speed _mv22 > 120) then {_vel = 1.06;};
	if (speed _mv22 > 50) then {
		_vel = 1.04;
	} else {
		_vel=1.02;
	};

	_mv22 setVelocity [_xVel/_vel,_yVel/_vel,_zVel];

	sleep 0.2;
};

//todo: add jump light

_mv22 animate["ramp_top",1];
_mv22 animate["ramp_bottom",1];

_timer = 0;
while {(_mv22 emptyPositions "cargo" < 24) && _timer < 30} do {
	_xVel = velocity _mv22 select 0;
	_yVel = velocity _mv22 select 1;
	_zVel = velocity _mv22 select 2;

	//leichtes sinken ausgleichen
	_mv22 setVelocity [_xVel/1.01,_yVel/1.01,0.01];
	sleep 0.3;
	_timer = _timer +1;
};
//waitUntil { _mv22 emptyPositions "cargo" == 24;};



sleep 1;

//close the doors
//hint "close ramp";
_mv22 animate["ramp_top",0];
_mv22 animate["ramp_bottom",0];


_mv22 flyInHeight 100;
_mv22 setSpeedMode "full";
_wp =_grpAir addWaypoint [getMarkerPos "mrk_v22_exit", 0];
_velFactor = 0;
//leave, reverse velocity
while {Alive _mv22 && (abs(((getPos _mv22) select 0) - ((getMarkerPos "mrk_v22_exit") select 0)) > 50) && (abs(((getPos _mv22) select 1) - ((getMarkerPos "mrk_v22_exit") select 1)) > 50)} do
{
	_xVel = velocity _mv22 select 0;
	_yVel = velocity _mv22 select 1;
	_zVel = velocity _mv22 select 2;
	
	if (getPosASL _mv22 select 2 < 10) then { _zVel = 1;}; //backup damit er nicht absäuft
	
	//_vel = (1.002+(((speed _mv22)/100)^3)/100) max 1.1;
	if (speed _mv22 < 150) then { _velFactor = 1.1; } else { _velFactor = 1.03; };
	_mv22 setVelocity [_xVel*_velFactor,_yVel*_velFactor,_zVel*_velFactor];
	sleep 0.2;
};

_mv22 setSpeedMode "full";
sleep 10;
{
	//notfall port
	if (isPlayer _x) then { 
		_x setPos [15624.82,243,0];//236.88843];
	} else {
		deleteVehicle _x;
	};
}forEach crew _mv22;

deleteVehicle _mv22;
