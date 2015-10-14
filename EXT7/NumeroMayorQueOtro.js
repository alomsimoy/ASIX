var num;
num[0] = window.prompt(Escribe el primer número,);
num[1] = window.prompt(Escribe el segundo número,);
num[2] = window.prompt(Escribe el tercer número,);

var mayor = num[0];
for (var i in num) {
	if (num[i] > mayor) mayor = num[i];
}

alert(mayor);
