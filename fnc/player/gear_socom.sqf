private ["_unit"];

_unit = _this select 0;

//ALL units
comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	//removeGoggles _unit; //keep players googles

//uniform & helmet
	_unit forceAddUniform "U_CombatUniSleeves_A";
	_unit addVest "LOP_V_CarrierRig_ANA";
	_unit addHeadgear "H_Hat_Cap_Thai";

  _unit addBackpack "tf_rt1523g_bwmod";
  _unit addItemToVest "ACE_HuntIR_monitor";
  _unit addWeapon "Binocular";


	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_quikclot";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 1 do {_unit addItemToUniform "SmokeShell";};
	for "_i" from 1 to 1 do {_unit addItemToUniform "SmokeShellRed";};
	for "_i" from 1 to 1 do {_unit addItemToUniform "SmokeShellGreen";};

	_unit addItemToVest "ACE_EarPlugs";
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "Chemlight_green";
	_unit addItemToUniform "Chemlight_red";

//vest items
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToVest "ACE_elasticBandage";};
	for "_i" from 1 to 5 do {_unit addItemToVest "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToVest "ACE_quikclot";};
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_morphine";};
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_epinephrine";};


//link items
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ACE_Altimeter";
	_unit linkItem "tf_anprc152";
	_unit linkItem "ItemGPS";
	//_unit linkItem "ACE_NVG_Wide"; //mission soll tagsüber bzw in den morgenstunden spielen


	for "_i" from 1 to 1 do {_unit addItemToUniform "rhsusf_mag_7x45acp_MHP";};
	_unit addWeapon "rhsusf_weap_m1911a1";
	_unit addGoggles "G_Lowprofile";
