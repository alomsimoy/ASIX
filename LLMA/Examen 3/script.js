function showValue(newValue, field)
{
	document.getElementById(field).innerHTML=newValue;
	cercaJugador();	
}

function cargarXML(archivoXML) {
	var xmlDoc;

	if (window.XMLHttpRequest) {
	xmlDoc = new window.XMLHttpRequest();
	xmlDoc.open("GET", archivoXML, false);
	xmlDoc.send("");
	return xmlDoc.responseXML;
	}
	// para IE 5 y IE 6
	else if (ActiveXObject("Microsoft.XMLDOM"))
	{
	xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
	xmlDoc.async = false;
	xmlDoc.load(archivoXML);
	return xmlDoc;
	}

	alert("Error cargando el documento.");

	return null;
}

function cargarArray(archivoXML) {
	var xmlDoc = cargarXML(archivoXML);

	if (xmlDoc != null) {
		var links_tag = xmlDoc.getElementsByTagName("jugadors")[0].getElementsByTagName("jugador");
		var array = new Array();

		for (var i = 0; i < links_tag.length; i++) {
			array.push( [] ) ;
			//array[i][0]
			array[i].push(links_tag[i].getElementsByTagName("nom")[0].childNodes[0].nodeValue);
			//array[i][1]
			array[i].push(links_tag[i].getElementsByTagName("edat")[0].childNodes[0].nodeValue);
			//array[i][2]
			array[i].push(links_tag[i].getElementsByTagName("altura")[0].childNodes[0].nodeValue);
			//array[i][3]
			array[i].push(links_tag[i].getElementsByTagName("descripcio")[0].childNodes[0].nodeValue);
		}
		return array;
	}
}

function showJugador(index) {
	var html = "";
	html += "<h2>" + array[index][0] + "</h2><h3/>" + array[index][1] + " anys, " + array[index][2] + "cm</h3>";
	html += "<p>" + array[index][3] + "</p>";
	document.getElementById("sidebar").innerHTML = html;
	cercaJugador();
}

function cercaJugador() {
	var edat = document.getElementById("edat").innerHTML;
	var altura = document.getElementById("altura").innerHTML;
	var resultats = cargarArray("data.xml");
	for (var i = resultats.length - 1; i >= 0; i--) {
		if ((resultats[i][1] < edat) || (resultats[i][2] < altura)) {
			resultats.splice(i, 1);
		}
	}
	mostraResultats(resultats);
}

function mostraResultats(resultats) {
	var html = "<h2>Resultats</h2>";
	for (var i = 0; i < resultats.length; i++) {
		html += "<h4 onclick='showJugador(" + i + ")' >" + resultats[i][0] + ", " + resultats[i][1] + " anys</h4>"
	}
	document.getElementById("middle").innerHTML = html;
}

array = cargarArray("data.xml");
cercaJugador();
