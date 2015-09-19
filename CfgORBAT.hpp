class CfgORBAT
{
	class bullfrog
	{
		id = 6; // Unit ID
		idType = 0; // Unit ID type
		 // 0 - show as ordinal number, e.g. "7th" (default)
		 // 1 - show as roman numeral, e.g. "VII"
		 // 2 - show as NATO phonetical alphabet word, e.g. "Golf"
                // 3 - show as color, e.g. "Red"

		side = "West"; // Unit side from CfgChainOfCommand >> Sides
		size = "FireTeam"; // Unit size from CfgChainOfCommand >> Sizes
		type = "Airborne"; // Unit type from CfgChainOfCommand >> Types
		insignia = "\pic\orbat\devgru.paa"; // Unit insignia, displayed in ORBAT background and in tooltip
		colorInsignia[] = {0,0,1,1}; // Insignia image color (white default), can be either RGBA array, or class from CfgMarkerColors
		commander = "Armstrong"; // Name of unit commander. Can be either direct name, or class from CfgWorlds >> GenericNames (random name from the list is then selected)
		commanderRank = "Lieutenant"; // Rank of unit commander (by default selected based on unit size)
		tags[] = {}; // Group tags. When opening ORBAT viewer, user can define what tags will be accepted.
		text = "Seal Team %1"; // Custom text and short text, can still use some arguments when defined:
		// 	%1 - ID (e.g. "7th")
		// 	%2 - Type (e.g. "Infantry")
		// 	%3 - Size (e.g. "Division")
		textShort = "STS";
		texture = "\ca\missions_f\data\orbat\customTexture_ca.paa"; // Custom texture, will replace icon set by 'type' param.
		color[] = {0,0,1,1}; // Custom color, will replace color set by 'side' param. Can be either RGBA array, or class from CfgMarkerColors
		description= "Seal Team Six"; // A brief description of the group or unit.
		assets[] = {}; // Will display pictures of all available assets to the unit commander
		subordinates[] = {}; // Subordinates, searched on the same level as this class.

	};
	class foxhound
	{
		id = 1; // Unit ID
		idType = 3; // Unit ID type
		 // 0 - show as ordinal number, e.g. "7th" (default)
		 // 1 - show as roman numeral, e.g. "VII"
		 // 2 - show as NATO phonetical alphabet word, e.g. "Golf"
         // 3 - show as color, e.g. "Red"

		side = "West"; // Unit side from CfgChainOfCommand >> Sides
		size = "Troop"; // Unit size from CfgChainOfCommand >> Sizes
		type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
		insignia = "\pic\orbat\marsoc.paa"; // Unit insignia, displayed in ORBAT background and in tooltip
		colorInsignia[] = {0,0,1,1}; // Insignia image color (white default), can be either RGBA array, or class from CfgMarkerColors
		commander = "xy"; // Name of unit commander. Can be either direct name, or class from CfgWorlds >> GenericNames (random name from the list is then selected)
		commanderRank = "Lieutenant"; // Rank of unit commander (by default selected based on unit size)
		tags[] = {}; // Group tags. When opening ORBAT viewer, user can define what tags will be accepted.
		text = "MSOR"; // Custom text and short text, can still use some arguments when defined:
		// 	%1 - ID (e.g. "7th")
		// 	%2 - Type (e.g. "Infantry")
		// 	%3 - Size (e.g. "Division")
		textShort = "MSOR";
		texture = "\ca\missions_f\data\orbat\customTexture_ca.paa"; // Custom texture, will replace icon set by 'type' param.
		color[] = {0,0,1,1}; // Custom color, will replace color set by 'side' param. Can be either RGBA array, or class from CfgMarkerColors
		description= "Foxhound Leader"; // A brief description of the group or unit.
		assets[] = {}; // Will display pictures of all available assets to the unit commander
		subordinates[] = {}; // Subordinates, searched on the same level as this class.

        // When 'subordinates' are missing, child classes will be used. They can have their own subs - number of tiers is not limited.
		class foxhound_1
		{
			id = 1;
			type = "Infantry";
			size = "Squad";
			side = "West";
			commander = "NATOMen";
			tags[] = {"BLUFOR", "USMC"};
 		};
		class foxhound_2
		{
			id = 2;
			type = "Infantry";
			size = "Squad";
			side = "West";
			commander = "NATOMen";
			tags[] = {"BLUFOR", "USMC"};
 		};
	};
	class acorn
	{
		id = 1; // Unit ID
		idType = 3; // Unit ID type
		 // 0 - show as ordinal number, e.g. "7th" (default)
		 // 1 - show as roman numeral, e.g. "VII"
		 // 2 - show as NATO phonetical alphabet word, e.g. "Golf"
         // 3 - show as color, e.g. "Red"

		side = "West"; // Unit side from CfgChainOfCommand >> Sides
		size = "Troop"; // Unit size from CfgChainOfCommand >> Sizes
		type = "Infantry"; // Unit type from CfgChainOfCommand >> Types
		insignia = "\pic\orbat\marsoc.paa"; // Unit insignia, displayed in ORBAT background and in tooltip
		colorInsignia[] = {0,0,1,1}; // Insignia image color (white default), can be either RGBA array, or class from CfgMarkerColors
		commander = "gha"; // Name of unit commander. Can be either direct name, or class from CfgWorlds >> GenericNames (random name from the list is then selected)
		commanderRank = "Lieutenant"; // Rank of unit commander (by default selected based on unit size)
		tags[] = {}; // Group tags. When opening ORBAT viewer, user can define what tags will be accepted.
		text = "MSOG"; // Custom text and short text, can still use some arguments when defined:
		// 	%1 - ID (e.g. "7th")
		// 	%2 - Type (e.g. "Infantry")
		// 	%3 - Size (e.g. "Division")
		textShort = "MSOG";
		texture = "\ca\missions_f\data\orbat\customTexture_ca.paa"; // Custom texture, will replace icon set by 'type' param.
		color[] = {0,0,1,1}; // Custom color, will replace color set by 'side' param. Can be either RGBA array, or class from CfgMarkerColors
		description= "MSOG Officer"; // A brief description of the group or unit.
		assets[] = {}; // Will display pictures of all available assets to the unit commander
		subordinates[] = {}; // Subordinates, searched on the same level as this class.
	};
};
