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
	_unit forceAddUniform "U_Coveralls_B";
	_unit addVest "V_TacVestIR_blk";
	_unit addHeadgear "H_HelmetB_light_black";	


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
	
	
	switch (typeOf _unit) do {	
		case "B_Soldier_GL_F": {			
		
			for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_M433_HEDP";};
			for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_M441_HE";};
			for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_m714_White";};
			for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HuntIR_M203";};
			for "_i" from 1 to 2 do {_unit addItemToVest "ACE_HuntIR_M203";};
			for "_i" from 1 to 8 do {_unit addItemToUniform "30Rnd_556x45_Stanag_Tracer_Green";};		
			
			_unit addWeapon "Auto556x45_CQM4_GL";
			_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552";			
			_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";				
			
			for "_i" from 1 to 1 do {_unit addItemToUniform "30Rnd_556x45_Stanag_Tracer_Green";};		
		};
		
		case "B_Soldier_AR_F": {
			_unit addBackpack "B_Carryall_khk";
			for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
			for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_200rnd_556x45_T_SAW";};
			
			_unit addWeapon "rhs_weap_m249_pip_S_para";
			_unit addPrimaryWeaponItem "ACE_acc_pointer_green";
			_unit addPrimaryWeaponItem "optic_Aco_smg";		
		};
		
		case "B_medic_F": {

			for "_i" from 1 to 5 do {_unit addItemToUniform "ACE_quikclot";};
			for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_packingBandage";};
			for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_elasticBandage";};
			for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
			for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_morphine";};
			for "_i" from 1 to 4 do {_unit addItemToUniform "ACE_epinephrine";};	
			for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_personalAidKit";};
			for "_i" from 1 to 1 do {_unit addItemToUniform "ACE_surgicalKit";};
			
		};
		
		case "B_engineer_F";
		case "B_soldier_exp_F": {
		
			_unit addItemToUniform "ACE_M26_Clacker";
			_unit addItemToUniform "ACE_Clacker";
			_unit addItemToUniform "ACE_DefusalKit";		
		
			_unit addBackpack "B_AssaultPack_blk";
			for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
			_unit addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";
			_unit addItemToBackpack "ACE_wirecutter";
		};
		
		case "B_Soldier_TL_F";
		case "B_Soldier_SL_F";
		case "B_officer_F": {
			//TFAR LR radio
			_unit addBackpack "tf_rt1523g_bwmod";
			_unit addItemToVest "ACE_HuntIR_monitor";
			_unit addWeapon "Binocular";		
		};
		default {
			//none
		};
	};

//default primary weapon if not already defined
	if ((primaryWeapon _unit) == "") then {
	
		for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Green";};
		_unit addWeapon "Auto556x45_CQM4";
		_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552";
		_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";				

		for "_i" from 1 to 1 do {_unit addItemToUniform "30Rnd_556x45_Stanag_Tracer_Green";};
		for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Green";};	
	};
	
//give after rifle!
	for "_i" from 1 to 1 do {_unit addItemToUniform "rhsusf_mag_7x45acp_MHP";};
	_unit addWeapon "rhsusf_weap_m1911a1";	
	_unit addGoggles "G_Lowprofile";
	

