private ["_unit","_cn","_holder"];

_unit = _this select 0;



if (!isNil("MONEY_NADE")) then  {

	[_unit] spawn ADL_ANIM_TAKE;
	sleep 1;
	
	
	deleteVehicle MONEY_NADE;

	MONEY_NADE = nil;
	publicVariable "MONEY_NADE";

	["nade disarmed"] call ADL_DEBUG;
	
	_cn = {_x == "HandGrenade"} count (magazines _unit);

	_unit addItemToUniform "HandGrenade";
	if (_cn < ({_x == "HandGrenade"} count (magazines _unit))) exitWith { true; };
	
	_unit addItemToVest "HandGrenade";
	if (_cn < ({_x == "HandGrenade"} count (magazines _unit))) exitWith { true; };

	_unit addItemToBackpack  "HandGrenade";
	if (_cn < ({_x == "HandGrenade"} count (magazines _unit))) exitWith { true; };

	//kein platz...  auf boden legen
	["no more room, place nade on desk"] call ADL_DEBUG;
	hint "Ich habe kein Platz mehr, lege sie derweil auf den Tisch";
	
	_holder = createVehicle [ "GroundWeaponHolder", [13219.75,6561.1,0], [], 0, "NONE"];

	_holder setPosATL [13220.12,6560.5,1.525]; 
	_holder setDir 250;
	_holder addMagazineCargoGlobal ["HandGrenade", 1];
};