private ["_unit", "_dlg"];

_unit = _this select 0;

[_unit] call ADL_ANIM_ACTIVATE;


[] spawn {
	_dlg = createDialog "dlg_intel_paper";
};

if (typeOf _unit == "B_officer_F" || (DEBUG_OUTPUT && (name _unit) in ["Shura"])) then {
//show translation color='#ff0000'
	[localize "STR_ADL_ATOL_MEMO_TRANSLATE",-1,-0.4,4,1,0,789] spawn BIS_fnc_dynamicText;
	//["<t size = '.8'>Verkauft!<br />2nd Lt. für 220.000 USD<br />PFC für 50.000 USD<br />Ort Quienhammel, an Kertosudiro heute in 2h</t>",-1,-0.4,4,1,0,789] spawn BIS_fnc_dynamicText;
	//ctrlSetText [1001, "Menjual,\n2d Lt untuk $ 220,000\nPFC untuk $ 50.000\nLokasi Quienhammel untuk Kertosudiro\nhari ini di 2jam\n\nVerkauft\n2nd Lt. für 220.000USD\nPFC für 50.000USD\nOrt Quienhammel, an Kertosudiro heute in 2h"];
};