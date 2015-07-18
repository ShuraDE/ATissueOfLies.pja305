/*
//alternative:
//[player, 0.3] call ace_medical_fnc_adjustPainLevel;
// sleep 1;
//[player, -0.3] call ace_medical_fnc_adjustPainLevel;
*/

// 3x^2-x6  x=[-1.5, 0)
private ["_fnc_createEffect","_effectCC","_effectHandler","_interval","_strength"];

_fnc_createEffect = {
    private ["_type", "_layer", "_default", "_effect"];
    _type = _this select 0;
    _layer = _this select 1;
    _default = _this select 2;

    _effect = ppEffectCreate [_type, _layer];
    _effect ppEffectForceInNVG true;
    _effect ppEffectAdjust _default;
    _effect ppEffectCommit 0;

    _effect
};

_effectCC = [
    "ColorCorrections",
    4206,
    [1,1,0, [1,1,1,1], [0,0,0,0], [1,1,1,1], [1.3,1.3,0,0,0,0.2,2]]
] call _fnc_createEffect;


_effectHandler = [{
	private["_interval", "_strength", "_pain"];
	_interval = 60;
	_strength = 2;
	_effectCC ppEffectEnable true;
	_effectCC ppEffectAdjust [1,1,0, [1,1,1,1], [0,0,0,0], [1,1,1,1], [1 - _strength,1 - _strength,0,0,0,0.2,2]];
	_effectCC ppEffectCommit 0.01;
	[{
		_effectCC ppEffectAdjust [1,1,0, [1,1,1,1], [0,0,0,0], [1,1,1,1], [1 - (_this select 0),1 - (_this select 0),0,0,0,0.2,2]];
		_effectCC ppEffectCommit (_this select 1);
	}, [_strength * 0.1, _interval * 0.2], _interval * 0.05, 0] call ace_common_fnc_waitAndExecute;
	[{
		_effectCC ppEffectAdjust [1,1,0, [1,1,1,1], [0,0,0,0], [1,1,1,1], [1 - (_this select 0),1 - (_this select 0),0,0,0,0.2,2]];
		_effectCC ppEffectCommit 0.01;
	}, [_strength * 0.7], _interval * 0.3, 0] call ace_common_fnc_waitAndExecute;
	[{
		_effectCC ppEffectAdjust [1,1,0, [1,1,1,1], [0,0,0,0], [1,1,1,1], [1 - (_this select 0),1 - (_this select 0),0,0,0,0.2,2]];
		_effectCC ppEffectCommit (_this select 1);
	}, [_strength * 0.1, _interval * 0.55], _interval * 0.4, 0] call ace_common_fnc_waitAndExecute;
}, 0, []] call CBA_fnc_addPerFrameHandler;
sleep 2;
[_effectHandler] call CBA_fnc_removePerFrameHandler
