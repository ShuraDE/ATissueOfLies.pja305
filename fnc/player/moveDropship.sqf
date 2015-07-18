_i = 25;
{
	_x moveInCargo [dropship, _i]; 
	_i = _i -1;
} forEach units group Foxhound_1_0;

{
	_x moveInCargo [dropship, _i]; 
	_i = _i -1;
} forEach units group Foxhound_2_0;

{
	_x moveInCargo [dropship, _i]; 
	_i = _i -1;
} forEach units group Foxhound_0_0;

IntelOfficer moveInCargo [dropship, _i]; 
