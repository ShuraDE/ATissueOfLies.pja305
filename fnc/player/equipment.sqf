private ["_unit"];

_unit = [_this, 0, player] call BIS_fnc_param;

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
//removeGoggles _unit; //würde ich drin lassen, da manche die im def haben

_unit forceAddUniform "rhs_uniform_FROG01_wd";
for "_i" from 1 to 9 do {_unit addItemToUniform "ACE_quikclot";};
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "ACE_microDAGR";
_unit addItemToUniform "SmokeShell";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellRed";};
for "_i" from 1 to 3 do {_unit addItemToUniform "SmokeShellGreen";};
_unit addItemToUniform "Chemlight_green";

_unit addVest "V_PlateCarrier2_rgr";
_unit addItemToVest "ACE_EarPlugs";
for "_i" from 1 to 2 do {_unit addItemToVest "ACE_CableTie";};
for "_i" from 1 to 10 do {_unit addItemToVest "ACE_fieldDressing";};
for "_i" from 1 to 10 do {_unit addItemToVest "ACE_packingBandage";};
for "_i" from 1 to 10 do {_unit addItemToVest "ACE_elasticBandage";};
for "_i" from 1 to 5 do {_unit addItemToVest "ACE_morphine";};
for "_i" from 1 to 5 do {_unit addItemToVest "ACE_atropine";};
for "_i" from 1 to 5 do {_unit addItemToVest "ACE_epinephrine";};
for "_i" from 1 to 11 do {_unit addItemToVest "ACE_quikclot";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Green";};

_unit addHeadgear "rhsusf_lwh_helmet_marpatwd";
_unit addWeapon "rhs_weap_m16a4_grip_acog_usmc";
_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15side";
_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_USMC";

_unit addWeapon "rhsusf_weap_m1911a1";

_unit addWeapon "Binocular";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "tf_microdagr";
_unit linkItem "tf_anprc152_2";
_unit linkItem "ACE_NVG_Wide";
_unit linkItem "ACE_Altimeter";
