private ["_user","_cn","_holder"];

_user = _this select 0;

if (!isNil("MONEY_NADE")) then  {

	deleteVehicle MONEY_NADE;

	MONEY_NADE = nil;
	publicVariable "MONEY_NADE";

	["money nade disarmed"] call ADL_DEBUG;
	
	_cn = {_x == "HandGrenade"} count (magazines _user);

	_user addItemToUniform "HandGrenade";
	if (_cn < ({_x == "HandGrenade"} count (magazines _user))) exitWith { true; };
	
	_user addItemToVest "HandGrenade";
	if (_cn < ({_x == "HandGrenade"} count (magazines _user))) exitWith { true; };

	_user addItemToBackpack  "HandGrenade";
	if (_cn < ({_x == "HandGrenade"} count (magazines _user))) exitWith { true; };

	//kein platz...  auf boden legen
	["no more room, place nade on desk"] call ADL_DEBUG;
	hint "Kein Platz mehr, ich lege sie mal auf den Tisch";
	
	_holder = createVehicle [ "GroundWeaponHolder", [13219.75,6561.1,0], [], 0, "NONE"];

	_holder setPosATL [13220.12,6560.5,1.525]; 
	_holder setDir 250;
	_holder addMagazineCargoGlobal ["HandGrenade", 1];
};