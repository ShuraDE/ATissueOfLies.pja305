/*
Based on: VQI - R. Von Quest - aka the "Goblin" 
    with: a big thanks to dr_strangepete and cobra4v320!
*/
private ["_demonPortal"];


_demonPortal = "Sign_Sphere25cm_F" createVehicle ([15029,4747.89,3000]);
hideObject _demonPortal; 
_demonPortal setVectorUp [0,0,1]; 
_demonPortal setDir 315;
_demonPortal setPosASL [(getMarkerPos "mrk_c130_drop" select 0),(getMarkerPos "mrk_c130_drop" select 1),3000]; //ASL = Above Sea level
sleep 1;
["HELO C130 spawn"] call ADL_DEBUG;

//create the C130 Jump Craft!!!!
DROPSHIP_C130 = "RHS_C130J" createVehicle (position _demonPortal);
publicVariable "DROPSHIP_C130";

DROPSHIP_C130 allowDamage false; 
DROPSHIP_C130 setVectorUp [0,0,1];
DROPSHIP_C130 attachTo [_demonPortal,[0,0,0]];
DROPSHIP_C130 engineOn true;

gamemaster01 addCuratorEditableObjects [[DROPSHIP_C130],true]; 
gamemaster02 addCuratorEditableObjects [[DROPSHIP_C130],true]; 

/*
 .... aber nimm mal createvehicle Array und mach am bei NONE ein CAN_COLLIDE rein 
*/

sleep 1;

//Fix the Damn Floor, or you'll trip and go into FreeFall animation!
_floorfix1 = "Box_NATO_WpsSpecial_F" createVehicle (position _demonPortal); //HotFix until more time to test
_floorfix2 = "Box_NATO_WpsSpecial_F" createVehicle (position _demonPortal); //HotFix until more time to test
clearWeaponCargoGlobal _floorfix1;
clearWeaponCargoGlobal _floorfix2;
clearMagazineCargoGlobal _floorfix1;
clearMagazineCargoGlobal _floorfix2;
clearItemCargoGlobal _floorfix1;
clearItemCargoGlobal _floorfix2;
_floorfix1 enableSimulation false;
_floorfix2 enableSimulation false;
_floorfix1 attachTo [DROPSHIP_C130,[0.8,-3.1,-2.7]];
_floorfix2 attachTo [DROPSHIP_C130,[-0.8,-3.1,-2.7]];


sleep 1;

/* TODO 

* xxxxxxxxx   Cargoslot 25 KI (so no player get in) --- done
* board/attach a ship or shipcontainer
* jump light (red) --> green only via mission start
* retract gears

*/
