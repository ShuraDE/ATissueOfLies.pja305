
if (!isNil "SKEET_TEST") then {deleteVehicle SKEET_TEST;};
["skeet test"] call ADL_DEBUG;


SKEET_TEST = createVehicle ["SkeetDisk", getPos TTWerfer, [], 0, "FLY"];
SKEET_TEST setDir (direction TTWerfer - 180 % 360);
SKEET_TEST attachTo [TTWerfer , [0,-0.4,0.15]];
publicVariable "SKEET_TEST";