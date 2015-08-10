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

	_unit addHeadgear "rhsusf_lwh_helmet_marpatwd";
	
	_unit forceAddUniform "rhs_uniform_FROG01_wd";

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
		
//vest	
	_unit addVest "V_PlateCarrier2_rgr";
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToVest "ACE_elasticBandage";};
	for "_i" from 1 to 5 do {_unit addItemToVest "ACE_packingBandage";};	
	for "_i" from 1 to 5 do {_unit addItemToVest "ACE_quikclot";};
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_morphine";};
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_epinephrine";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
	
//link items	
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ACE_Altimeter";
	_unit linkItem "tf_anprc152";
	_unit linkItem "ItemGPS";
	//_unit linkItem "ACE_NVG_Wide"; //mission soll tagsüber bzw in den morgenstunden spielen
	
	
	switch (typeOf _unit) do {	
		case "B_Soldier_GL_F": {			
			_unit addBackpack "B_Kitbag_rgr";
			
			for "_i" from 1 to 2 do {_unit addItemToUniform "3Rnd_SmokeYellow_Grenade_shell";};
			for "_i" from 1 to 4 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
			for "_i" from 1 to 4 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
			for "_i" from 1 to 10 do {_unit addItemToBackpack "30Rnd_556x45_Stanag_Tracer_Green";};
			//for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HuntIR_M203";};	 //seals only
			
			_unit addWeapon "rhs_weap_m16a4_carryhandle_M203";
			_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15A";
			_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552";				
		};
		
		case "B_Soldier_AR_F": {
			_unit addBackpack "B_Carryall_khk";
			for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
			for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_200rnd_556x45_T_SAW";};
			
			_unit addWeapon "rhs_weap_m249_pip_S_para";
			_unit addPrimaryWeaponItem "ACE_acc_pointer_green";
			_unit addPrimaryWeaponItem "optic_Aco_smg";		
		};
		
		case "B_Soldier_A_F": {
			_unit addBackpack "B_Kitbag_rgr";
			for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
			for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_200rnd_556x45_T_SAW";};				
		};
		
		case "B_medic_F": {
			_unit addBackpack "B_Carryall_khk";
			//additional medic equip (+ default medic see below)
			for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_fieldDressing";};
			for "_i" from 1 to 20 do {_unit addItemToBackpack "ACE_packingBandage";};
			for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_elasticBandage";};
			for "_i" from 1 to 4 do {_unit addItemToBackpack "ACE_tourniquet";};
			for "_i" from 1 to 25 do {_unit addItemToBackpack "ACE_morphine";};
			for "_i" from 1 to 5 do {_unit addItemToBackpack "ACE_atropine";};
			for "_i" from 1 to 25 do {_unit addItemToBackpack "ACE_epinephrine";};
			for "_i" from 1 to 5 do {_unit addItemToBackpack "ACE_salineIV_500";};
			for "_i" from 1 to 5 do {_unit addItemToBackpack "ACE_salineIV_250";};
			for "_i" from 1 to 5 do {_unit addItemToBackpack "ACE_personalAidKit";};
			for "_i" from 1 to 5 do {_unit addItemToBackpack "ACE_surgicalKit";};
			for "_i" from 1 to 1 do {_unit addItemToBackpack "30Rnd_556x45_Stanag_Tracer_Green";};
				
		};
		
		case "B_engineer_F";
		case "B_soldier_exp_F": {
			_unit addBackpack "B_Kitbag_rgr";
			_unit addItemToBackpack "ACE_wirecutter";
		};
		
		case "B_Soldier_TL_F";
		case "B_Soldier_SL_F";
		case "B_officer_F": {
			//TFAR LR radio
			_unit addBackpack "tf_rt1523g_bwmod";

			//binocular to leaders
			_unit addWeapon "Binocular";
		};
		default {
			_unit addBackpack "B_Kitbag_rgr";
		};
	};

//default primary weapon if not already defined
	if ((primaryWeapon _unit) == "") then {
		for "_i" from 1 to 1 do {_unit addItemToUniform "30Rnd_556x45_Stanag_Tracer_Green";};
		for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Green";};	
		for "_i" from 1 to 10 do {_unit addItemToBackpack "30Rnd_556x45_Stanag_Tracer_Green";};
		_unit addWeapon "rhs_weap_m16a4_grip_acog_usmc";
		_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15A";  
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552";			
	};
	
//sidearms only for seals, medic & leaders
	if ("Bullfrog" == (groupId (group _unit)) || typeOf _unit in ["B_medic_F","B_Soldier_TL_F","B_Soldier_SL_F","B_officer_F"]) then {
		if (!(typeOf _unit in ["B_Soldier_TL_F","B_Soldier_SL_F"])) then {
			for "_i" from 1 to 3 do {_unit addItemToVest "rhsusf_mag_7x45acp_MHP";};
			_unit addWeapon "rhsusf_weap_m1911a1";	
		};
	};
	
//default medic backpack equipment for everyone
	_unit addItemToBackpack "ACE_personalAidKit";
	for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_fieldDressing";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_packingBandage";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_elasticBandage";};
	

//seals special equipment
	if ("Bullfrog" == (groupId (group _unit))) then {
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black"; //silencer
	
		//seal GL get 2x HuntIR
		if (typeOf _unit in ["B_Soldier_GL_F"]) then {
			for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HuntIR_M203";};	
		};
	};

