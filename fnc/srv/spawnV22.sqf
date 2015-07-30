private ["_grpAir","_mv22","_dropper","_xVel","_yVel","_zVel","_wp","_vel","_velFactor"];
_grpAir = createGroup west;

_dropper = [[10000,0,500],45,"MV22",_grpAir] call BIS_fnc_spawnVehicle;
_mv22 = _dropper select 0;
_mv22 flyInHeight 10;


//fast to target
_mv22 setSpeedMode "full";
_wp =_grpAir addWaypoint [getMarkerPos "mrk_drop", 0];
waitUntil { (abs(((getPos _mv22) select 0) - ((getMarkerPos "mrk_drop") select 0)) < 800) 
		 && (abs(((getPos _mv22) select 1) - ((getMarkerPos "mrk_drop") select 1)) < 800); };
		 
//slowdown near target		 
_mv22 setSpeedMode "limited";
waitUntil { (abs(((getPos _mv22) select 0) - ((getMarkerPos "mrk_drop") select 0)) < 350) 
		 && (abs(((getPos _mv22) select 1) - ((getMarkerPos "mrk_drop") select 1)) < 350); };

		 
//prepare water jump		 
while {Alive _mv22 and (speed _mv22 >= 15) and (getPosASL _mv22 select 2 > 10) } do
{
	_xVel = velocity _mv22 select 0;
	_yVel = velocity _mv22 select 1;
	_zVel = velocity _mv22 select 2;
	
	if (getPosASL _mv22 select 2 < 10) then { _zVel = 1.02;} else { _zVel = -1.9;}; //backup damit er nicht absäuft
	
	_vel = (1.002+(((speed _mv22)/100)^3)/100) max 1.08;
							//1.1
	_mv22 setVelocity [_xVel/_vel,_yVel/_vel,_zVel];

	//für testzweckem RPM nicht bei MV22 verfügbar
	hint format ["Speed: %1 \nHeight: %2\nEngines: %3\n Rotors: %4\n Velocity: %5\n VelFaktor: %6", speed _mv22, getPosASL _mv22 select 2, enginesRpmRTD _mv22, rotorsRpmRTD _mv22, velocity _mv22, _vel];
	sleep 0.3;
};

//hint "open ramp";
_mv22 animate["ramp_top",1];
_mv22 animate["ramp_bottom",1];

//player moveInCargo[_mv22,2];

waitUntil { _mv22 emptyPositions "cargo" == 24;};



sleep 5;

//close the doors
//hint "close ramp";
_mv22 animate["ramp_top",0];
_mv22 animate["ramp_bottom",0];


_mv22 flyInHeight 100;
_mv22 setSpeedMode "full";
_wp =_grpAir addWaypoint [getMarkerPos "mrk_exit", 0];
_velFactor = 0;
//leave, reverse velocity
while {Alive _mv22 && (abs(((getPos _mv22) select 0) - ((getMarkerPos "mrk_exit") select 0)) > 50) && (abs(((getPos _mv22) select 1) - ((getMarkerPos "mrk_exit") select 1)) > 50)} do
{
	_xVel = velocity _mv22 select 0;
	_yVel = velocity _mv22 select 1;
	_zVel = velocity _mv22 select 2;
	
	if (getPosASL _mv22 select 2 < 10) then { _zVel = 0;}; //backup damit er nicht absäuft
	
	//_vel = (1.002+(((speed _mv22)/100)^3)/100) max 1.1;
	if (speed _mv22 < 150) then { _velFactor = 1.1; } else { _velFactor = 1.04; };
	_mv22 setVelocity [_xVel*_velFactor,_yVel*_velFactor,_zVel*_velFactor];
	sleep 0.2;
};
_mv22 setSpeedMode "full";
sleep 10;
{
	if (isPlayer _x) then { 
		_x setPos [13358.338,0.7497673];
	} else {
		deleteVehicle _x;
	};
}forEach crew _mv22;

deleteVehicle _mv22;
