private ["_c130"];

_c130 = _this select 0;

_grpAir = group _c130;
{
	deleteWaypoint [_grpAir, _x select 1];
}forEach waypoints _grpAir;


_c130 flyInHeight 10;


//fast to target
_c130 setSpeedMode "full";
_wp =_grpAir addWaypoint [getMarkerPos "mrk_c130_drop", 0];

//fast to target
_c130 setSpeedMode "full";
_wp =_grpAir addWaypoint [getMarkerPos "mrk_c130_drop", 0];
waitUntil { (abs(((getPos _c130) select 0) - ((getMarkerPos "mrk_c130_drop") select 0)) < 800) 
		 && (abs(((getPos _c130) select 1) - ((getMarkerPos "mrk_c130_drop") select 1)) < 800); };

//flucht vector 		
deleteWaypoint [_grpAir, 0]; 
_wp =_grpAir addWaypoint [getMarkerPos "mrk_c130_direction", 0];		

waitUntil { (abs(((getPos _c130) select 0) - ((getMarkerPos "mrk_c130_drop") select 0)) < 50) 
		 && (abs(((getPos _c130) select 1) - ((getMarkerPos "mrk_c130_drop") select 1)) < 50); };

["reach c130 dropzone"] call ADL_DEBUG;
		 
//todo: add jump light

sleep 10;
{
	//notfall port
	if (isPlayer _x) then { 
		_x setPos [12570,5800,0];//236.88843];
	} else {
		deleteVehicle _x;
	};
}forEach crew _c130;

deleteVehicle _c130;