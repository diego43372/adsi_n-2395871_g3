// Vuelve al Formulario de Inicio de Sesión
const cancelar = function (evento) {
	window.location = '?c=Login';
}
const cancelados = document.querySelectorAll(".cancelar");
cancelados.forEach(boton => {	
	boton.addEventListener("click", cancelar);
});
// Vuelve a la Página de la Empresa
const volver = function (evento) {
	window.location = '?c=Landing&#';
}
const regresar = document.querySelectorAll(".volver");
regresar.forEach(boton => {	
	boton.addEventListener("click", volver);
});
// Iniciar Sesión
form  = document.getElementById('form-login');
form.addEventListener('submit', function (event) {
	correo  = document.getElementById('correo').value;	
	pass  = document.getElementById('pass').value;
	// Validación de Datos (Se sugiere hacerlo por AJAX o NodeJS)
	if (correo == "admin@correo.com" && pass == 12345) {
		alert("Datos correctos:\n" + "Superó la validación Front-End: HTML, CSS y JS.\n" + 
			"Ahora falta la validación Back-End.");
	} else {
		alert("Datos Incorrectos:\n" + 
			"No ha superado la validación Fron-End: HTML, CSS y JS.");
		document.getElementById('correo').value = "";
		document.getElementById('correo').focus();
		document.getElementById('pass').value = "";
		event.preventDefault();		
	}		
});