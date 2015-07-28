["************   SOUNDS  *******************"] call ADL_DEBUG;
_cfg =  (configFile >> "CfgSounds") call BIS_fnc_getCfgSubClasses;
hint "test";
for "_i" from 0 to (count _cfg) - 1 do { 
	_sound = getArray(configFile >> "CfgSounds" >> _cfg select _i >> "sound");
	//_sound = getArray (configFile >> "CfgSound" >> configName (_cfg select _i) >> "sound");
	_dur = getNumber(configFile >> "CfgSounds" >> _cfg select _i >> "duration");
	[format ["%1 -> %2; duration: %3", (_cfg select _i), _sound select 0, _dur]] call ADL_DEBUG;
};

["************   MUSIK  *******************"] call ADL_DEBUG;

_cfg =  (configFile >> "CfgMusic") call BIS_fnc_getCfgSubClasses;
hint "test";
for "_i" from 0 to (count _cfg) - 1 do { 
	_sound = getArray (configFile >> "CfgMusic" >> _cfg select _i >> "sound");
	[format ["%1 -> %2", (_cfg select _i), _sound select 0]] call ADL_DEBUG;
};
