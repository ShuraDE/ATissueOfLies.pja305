private ["_unit"];

_unit = _this select 0;

if (typeOf _unit == "B_soldier_F") then {
	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform "rhs_uniform_FROG01_wd";
	for "_i" from 1 to 9 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellRed";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
	_unit addItemToUniform "Chemlight_green";
	_unit addItemToUniform "Chemlight_red";
	_unit addVest "V_PlateCarrier2_rgr";
	_unit addItemToVest "ACE_EarPlugs";
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToVest "ACE_elasticBandage";};
	for "_i" from 1 to 10 do {_unit addItemToVest "ACE_quikclot";};
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_salineIV_250";};
	_unit addItemToVest "ACE_salineIV_500";
	for "_i" from 1 to 15 do {_unit addItemToVest "ACE_morphine";};
	for "_i" from 1 to 5 do {_unit addItemToVest "ACE_atropine";};
	for "_i" from 1 to 15 do {_unit addItemToVest "ACE_epinephrine";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Green";};
	_unit addBackpack "B_Kitbag_rgr";
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_fieldDressing";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToBackpack "ACE_elasticBandage";};
	for "_i" from 1 to 15 do {_unit addItemToBackpack "30Rnd_556x45_Stanag_Tracer_Green";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
	_unit addHeadgear "rhsusf_lwh_helmet_marpatwd";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m16a4_grip_acog_usmc";
	_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
	_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15A";
	_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_USMC";
	_unit addWeapon "rhsusf_weap_m1911a1";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ACE_Altimeter";
	_unit linkItem "tf_anprc152_3";
	_unit linkItem "ACE_NVG_Wide";
};	


//Leader
if (typeOf _unit in ["B_Soldier_TL_F","B_Soldier_SL_F"]) then {
	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform "rhs_uniform_FROG01_wd";
	for "_i" from 1 to 9 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellRed";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
	_unit addItemToUniform "Chemlight_green";
	_unit addItemToUniform "Chemlight_red";
	_unit addVest "V_PlateCarrier2_rgr";
	_unit addItemToVest "ACE_EarPlugs";
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToVest "ACE_elasticBandage";};
	for "_i" from 1 to 10 do {_unit addItemToVest "ACE_quikclot";};
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_salineIV_250";};
	_unit addItemToVest "ACE_salineIV_500";
	for "_i" from 1 to 15 do {_unit addItemToVest "ACE_morphine";};
	for "_i" from 1 to 5 do {_unit addItemToVest "ACE_atropine";};
	for "_i" from 1 to 15 do {_unit addItemToVest "ACE_epinephrine";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Green";};
	_unit addBackpack "tf_rt1523g_bwmod";
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_fieldDressing";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToBackpack "ACE_elasticBandage";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "30Rnd_556x45_Stanag_Tracer_Green";};
	_unit addHeadgear "rhsusf_lwh_helmet_marpatwd";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m16a4_grip_acog_usmc";
	_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
	_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15A";
	_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_USMC";
	_unit addWeapon "rhsusf_weap_m1911a1";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ACE_Altimeter";
	_unit linkItem "tf_anprc152_4";
	_unit linkItem "ItemGPS";
	_unit linkItem "ACE_NVG_Wide";
};	


//Wirecutter
if (typeOf _unit in ["B_engineer_F","B_soldier_exp_F"]) then {

	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform "rhs_uniform_FROG01_wd";
	for "_i" from 1 to 9 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellRed";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
	_unit addItemToUniform "Chemlight_green";
	_unit addItemToUniform "Chemlight_red";
	_unit addVest "V_PlateCarrier2_rgr";
	_unit addItemToVest "ACE_EarPlugs";
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToVest "ACE_elasticBandage";};
	for "_i" from 1 to 10 do {_unit addItemToVest "ACE_quikclot";};
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_salineIV_250";};
	_unit addItemToVest "ACE_salineIV_500";
	for "_i" from 1 to 15 do {_unit addItemToVest "ACE_morphine";};
	for "_i" from 1 to 5 do {_unit addItemToVest "ACE_atropine";};
	for "_i" from 1 to 15 do {_unit addItemToVest "ACE_epinephrine";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Green";};
	_unit addBackpack "B_Kitbag_rgr";
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_fieldDressing";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToBackpack "ACE_elasticBandage";};
	_unit addItemToBackpack "ACE_wirecutter";
	for "_i" from 1 to 3 do {_unit addItemToBackpack "30Rnd_556x45_Stanag_Tracer_Green";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
	_unit addHeadgear "rhsusf_lwh_helmet_marpatwd";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m16a4_grip_acog_usmc";
	_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
	_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15A";
	_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_USMC";
	_unit addWeapon "rhsusf_weap_m1911a1";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ACE_Altimeter";
	_unit linkItem "tf_anprc152_5";
	_unit linkItem "ItemGPS";
	_unit linkItem "ACE_NVG_Wide";
};	


//MG
if (typeOf _unit == "B_Soldier_AR_F") then {
	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform "rhs_uniform_FROG01_wd";
	for "_i" from 1 to 9 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellRed";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
	_unit addItemToUniform "Chemlight_green";
	_unit addItemToUniform "Chemlight_red";
	_unit addVest "V_PlateCarrier2_rgr";
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToVest "ACE_elasticBandage";};
	for "_i" from 1 to 10 do {_unit addItemToVest "ACE_quikclot";};
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_salineIV_250";};
	_unit addItemToVest "ACE_salineIV_500";
	for "_i" from 1 to 15 do {_unit addItemToVest "ACE_morphine";};
	for "_i" from 1 to 5 do {_unit addItemToVest "ACE_atropine";};
	for "_i" from 1 to 15 do {_unit addItemToVest "ACE_epinephrine";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
	_unit addBackpack "B_Carryall_khk";
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_fieldDressing";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToBackpack "ACE_elasticBandage";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
	for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_200rnd_556x45_T_SAW";};
	_unit addHeadgear "rhsusf_lwh_helmet_marpatwd";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m249_pip_S_para";
	_unit addPrimaryWeaponItem "ACE_acc_pointer_green";
	_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_USMC";
	_unit addWeapon "rhsusf_weap_m1911a1";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ACE_Altimeter";
	_unit linkItem "tf_anprc152_7";
	_unit linkItem "ItemGPS";
	_unit linkItem "ACE_NVG_Wide";
};	

//Ammoträger
if (typeOf _unit == "B_Soldier_A_F") then {

	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform "rhs_uniform_FROG01_wd";
	for "_i" from 1 to 9 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellRed";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
	_unit addItemToUniform "Chemlight_green";
	_unit addItemToUniform "Chemlight_red";
	_unit addVest "V_PlateCarrier2_rgr";
	_unit addItemToVest "ACE_EarPlugs";
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToVest "ACE_elasticBandage";};
	for "_i" from 1 to 10 do {_unit addItemToVest "ACE_quikclot";};
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_salineIV_250";};
	_unit addItemToVest "ACE_salineIV_500";
	for "_i" from 1 to 15 do {_unit addItemToVest "ACE_morphine";};
	for "_i" from 1 to 5 do {_unit addItemToVest "ACE_atropine";};
	for "_i" from 1 to 15 do {_unit addItemToVest "ACE_epinephrine";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Green";};
	_unit addBackpack "B_Kitbag_rgr";
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_fieldDressing";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_packingBandage";};
	for "_i" from 1 to 5 do {_unit addItemToBackpack "ACE_elasticBandage";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "30Rnd_556x45_Stanag_Tracer_Green";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "HandGrenade";};
	for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_200rnd_556x45_T_SAW";};
	_unit addHeadgear "rhsusf_lwh_helmet_marpatwd";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m16a4_grip_acog_usmc";
	_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
	_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15A";
	_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_USMC";
	_unit addWeapon "rhsusf_weap_m1911a1";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ACE_Altimeter";
	_unit linkItem "tf_anprc152_9";
	_unit linkItem "ItemGPS";
	_unit linkItem "ACE_NVG_Wide";
};	

//Medic
if (typeOf _unit == "B_medic_F") then {
	comment "Remove existing items";
	removeAllWeapons _unit;
	removeAllItems _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	comment "Add containers";
	_unit forceAddUniform "rhs_uniform_FROG01_wd";
	for "_i" from 1 to 9 do {_unit addItemToUniform "ACE_quikclot";};
	_unit addItemToUniform "ACE_MapTools";
	_unit addItemToUniform "ACE_microDAGR";
	_unit addItemToUniform "SmokeShell";
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellRed";};
	for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
	_unit addItemToUniform "Chemlight_green";
	_unit addItemToUniform "Chemlight_red";
	_unit addVest "V_PlateCarrier2_rgr";
	_unit addItemToVest "ACE_EarPlugs";
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_CableTie";};
	for "_i" from 1 to 5 do {_unit addItemToVest "ACE_elasticBandage";};
	for "_i" from 1 to 10 do {_unit addItemToVest "ACE_quikclot";};
	for "_i" from 1 to 2 do {_unit addItemToVest "ACE_salineIV_250";};
	_unit addItemToVest "ACE_salineIV_500";
	for "_i" from 1 to 15 do {_unit addItemToVest "ACE_morphine";};
	for "_i" from 1 to 5 do {_unit addItemToVest "ACE_atropine";};
	for "_i" from 1 to 15 do {_unit addItemToVest "ACE_epinephrine";};
	for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
	for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
	for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Green";};
	_unit addBackpack "B_Kitbag_rgr";
	for "_i" from 1 to 30 do {_unit addItemToBackpack "ACE_fieldDressing";};
	for "_i" from 1 to 30 do {_unit addItemToBackpack "ACE_packingBandage";};
	for "_i" from 1 to 25 do {_unit addItemToBackpack "ACE_elasticBandage";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_tourniquet";};
	for "_i" from 1 to 20 do {_unit addItemToBackpack "ACE_morphine";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_atropine";};
	for "_i" from 1 to 20 do {_unit addItemToBackpack "ACE_epinephrine";};
	for "_i" from 1 to 2 do {_unit addItemToBackpack "ACE_salineIV";};
	for "_i" from 1 to 5 do {_unit addItemToBackpack "ACE_salineIV_500";};
	for "_i" from 1 to 10 do {_unit addItemToBackpack "ACE_salineIV_250";};
	_unit addItemToBackpack "ACE_personalAidKit";
	_unit addItemToBackpack "ACE_surgicalKit";
	for "_i" from 1 to 3 do {_unit addItemToBackpack "30Rnd_556x45_Stanag_Tracer_Green";};
	_unit addHeadgear "rhsusf_lwh_helmet_marpatwd";

	comment "Add weapons";
	_unit addWeapon "rhs_weap_m16a4_grip_acog_usmc";
	_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
	_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15A";
	_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_USMC";
	_unit addWeapon "rhsusf_weap_m1911a1";
	_unit addWeapon "Binocular";

	comment "Add items";
	_unit linkItem "ItemMap";
	_unit linkItem "ItemCompass";
	_unit linkItem "ACE_Altimeter";
	_unit linkItem "tf_anprc152_10";
	_unit linkItem "ItemGPS";
	_unit linkItem "ACE_NVG_Wide";
};	



