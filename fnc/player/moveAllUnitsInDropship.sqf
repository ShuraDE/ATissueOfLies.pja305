_i = 25;
IntelOfficer moveInCargo [dropship, _i]; 

_i = 24;
{
	_x moveInCargo [dropship, _i]; 
	_i = _i -1;
} forEach units group Foxhound_0_0;

{
	_x moveInCargo [dropship, _i]; 
	_i = _i -1;
} forEach units group Foxhound_1_0;

{
	_x moveInCargo [dropship, _i]; 
	_i = _i -1;
} forEach units group Foxhound_2_0;

