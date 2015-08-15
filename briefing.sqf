switch (side player) do {

	case West:	{

		// =======================================================================================
		// Command
		// =======================================================================================

		_int = player createDiaryRecord ["diary", ["Command","
		<br/>
		Sunray ist die OPZ
		"]];

		// =======================================================================================
		// Mission
		// =======================================================================================

		_exe =  player createDiaryRecord ["diary", ["Mission","
		<br />Der MCIA hat eine Videoübertragung eines Gefangen Soldaten abgefangen.<br />Ziel der Übertragung ist eine bekannte IS Zelle, der Ursprung konnte lokalisiert und die Echtheit des Videos bestätigt werden.<br />Der MCIA geht davon aus, das es sich bei dem gezeigten Gefangenen um einen USMC Offizier handelt.<br /><br />

		Auftrag:
		<li>Eindringen in das Lager, Identifzierung und Befreiung des Marines.</li>
		<li>SOCOM wünscht eine nachrichtendienstliche Aufklärung des Lagers und der örtlichen Gruppierung</li>

		Teilaufträge
			Bullfrog Eindringen und sichern des Lagers.
			Foxhound Sicherheit von Arcon und Abholung von Bullfrog.
			Arcon nachrichtendienstliche Untersuchung
		"]];

		// =======================================================================================
		// Situation
		// =======================================================================================

		_brf = player createDiaryRecord ["diary", ["Situation","
		<br/>
		Bei der vorletzten Aufnahme war das Lager verwaist, in der letzten konnten bauliche Verstärkungen sowie Menschen identifiziert werden.
		Es ist nicht bekannt ob es noch mehrere Lager im Umfeld gibt, feindliche Verstärkung kann nicht ausgeschlossen werden.

		Die lokale Regierung leugnet vehement auch nur die Möglichkeit der Anwesendheit von US Gefangenen.

		Der MCIA vermutet nur leichte Bewaffnung der örtlichen Gruppierung.
		Die zivile Bevölkerung ist uns potenziell feindlich.
		"]];

	};


};