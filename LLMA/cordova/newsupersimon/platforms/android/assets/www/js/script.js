function nuevoJuego() {
	toggleVisibility("dialog"); //Oculta el cuadro de dialogo.
	Simon = []; //Almacena todas las iteracciones.
	turnoSimon();
}

function intro() {
	document.getElementById("dialog").style.display = 'block';
	toggleVisibility("dialog"); 
	Simon = ["tile0", "tile1", "tile2", "tile3", "tile4"];
	setTimeout(function() {reproducir();}, 200);
	setTimeout(function() {apagar("all");}, getTime() * 6 + 200); 
	setTimeout(function() {toggleVisibility("dialog");}, getTime() * 6 + 400);
}

function finJuego(){
	turnoJugador = false; //Con turno Jugador en false, el jugador no puede interactuar.
	toggleVisibility("dialog");
	if (Simon.length == 2) {
		var texto = "Has conseguido " + (Simon.length - 1) + " punto.";
	} else {
		var texto = "Has conseguido " + (Simon.length - 1) + " puntos.";
	}
	document.getElementById("text").innerHTML = texto;
}

function turnoSimon() {
	Jugador = [];
	turnoJugador = false;
	addTile();
	reproducir();
	setTimeout(function() {turnoJugador = true;}, (getTime()) * Simon.length); 
}

function clickHandler(tile) {
	if (turnoJugador) {
		Jugador.push(tile);
		playSound(tile);
		if (Jugador[-2] == Jugador[-1]) {
			iluminar(tile, 0.1);
		} else {
			iluminar(tile, 0);
		}
		apagar("all");
		if (compareArray(Jugador, Simon)) {
			if (Jugador.length == Simon.length) {
				setTimeout(function() {turnoSimon();}, 900);
			}
		} else {
			finJuego();
		}

	}
}

function compareArray(array1, array2) {
	for (var i = 0; i < array1.length; i++) {
		if (array1[i] != array2[i]) return false;
	};
	return true;
}

function addTile(){
	var tile = Math.floor(Math.random() * (5));
	switch (tile) {
		case 0:
			Simon.push("tile0");
			break;
		case 1:
			Simon.push("tile1");
			break;
		case 2:
			Simon.push("tile2");
			break;
		case 3:
			Simon.push("tile3");
			break;
		case 4:
			Simon.push("tile4");
			break;

	}
}

function toggleVisibility(id) {
	var state = document.getElementById(id).style.display;
    if (state == 'block') {
        document.getElementById(id).style.display = 'none';
    } else {
        document.getElementById(id).style.display = 'block';
    }
}

function toggleColor(id, color) {
	document.getElementById(id).style.background = color;
}

function reproducir() {
	for (var i = 0; i < Simon.length; i++) {
		iluminar(Simon[i], i);
	};
}

function iluminar(id, time) {
	time *= getTime();
	switch (id) {
		case "tile0":
			setTimeout(function() {document.getElementById(id).style.backgroundColor = "#C000FF";}, time); 
			break;
		case "tile1":
			setTimeout(function() {document.getElementById(id).style.backgroundColor = "#00FF33";}, time); 
			break;
		case "tile2":
			setTimeout(function() {document.getElementById(id).style.backgroundColor = "#FF0000";}, time); 
			break;
		case "tile3":
			setTimeout(function() {document.getElementById(id).style.backgroundColor = "#EBFF00";}, time); 
			break;
		case "tile4":
			setTimeout(function() {document.getElementById(id).style.backgroundColor = "#0015FF";}, time); 
			break;
	}
	setTimeout(function() {playSound(id);}, time); 
	setTimeout(function(){apagar(id);}, time + getTime() - 100);
}

function getTime() {
	var time = 600
	time -= Simon.length * 20;
	if (time < 200) {
		time = 200;
	}
	return time;
}

function apagar(id) {
	switch (id) {
		case "tile0":
			document.getElementById(id).style.backgroundColor = "#430059";
			break;
		case "tile1":
			document.getElementById(id).style.backgroundColor = "#005D13";
			break;
		case "tile2":
			document.getElementById(id).style.backgroundColor = "#7A0000";
			break;
		case "tile3":
			document.getElementById(id).style.backgroundColor = "#666F00";
			break;
		case "tile4":
			document.getElementById(id).style.backgroundColor = "#000864";
			break;
		case "all":
			document.getElementById("tile0").style.backgroundColor = "#430059";
			document.getElementById("tile1").style.backgroundColor = "#005D13";
			document.getElementById("tile2").style.backgroundColor = "#7A0000";
			document.getElementById("tile3").style.backgroundColor = "#666F00";
			document.getElementById("tile4").style.backgroundColor = "#000864";
	}
}

function playSound(tile) {
	var nota;
	switch(tile) {
		case "tile0":
			nota = "do";
			break;
		case "tile1":
			nota = "re";
			break;
		case "tile2":
			nota = "mi";
			break;
		case "tile3":
			nota = "fa";
			break;
		case "tile4":
			nota = "sol";
			break;

	}
	document.getElementById(nota).pause();
	document.getElementById(nota).currentTime = 0;
	document.getElementById(nota).play();
}

setTimeout(function() {intro();}, 4000);