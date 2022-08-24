hacerClic = document.getElementById("contenedor");
hacerClic.addEventListener('click', function (event){
	id = event.target.getAttribute("id");
	// Formulario de Contacto
	if (id === "submit-contac") {
		validarContac();	
	} else if (id === "cancelar-contac") {
		cancelarContac();	
	} else if (id === "submit-login") {
		validarLogin();
	} else if (id === "cancelar-login") {
		cancelarLogin();
	}	
});

// Formulario de Contacto: Validar Datos y Enviar
function validarContac(){
	// Captura de Datos
	nombres = document.getElementById('nombres').value;
	apellidos = document.getElementById('apellidos').value;
	correo = document.getElementById('correo-cont').value;
	asunto = document.getElementById('asunto').value;
	mensaje = document.getElementById('mensaje').value;
	// Expresión Regular de correo electrónico
	let patron_correo = /^\w+([.-_+]?\w+)*@\w+([.-]?\w+)*(\.\w{2,10})+$/;
	// Expresión Regular de Texto
	let patron_texto = /^[ a-zA-ZáéíóúÁÉÍÓÚäëïöüÄËÏÖÜàèìòùÀÈÌÒÙñÑ]+$/;	
	// Validación de nombres
	if (nombres === "") {
		alert("Verifique el campo Nombres\n" + 
			"Los Nombres NO pueden estar vacíos");
		document.getElementById('nombres').focus();
		event.preventDefault();
	} 
	else if (!patron_texto.test(nombres)){
		alert("Verifique el campo Nombres\n" + 
			"Los Nombres NO pueden contener números o caracteres especiales");
		document.getElementById('nombres').focus();
		event.preventDefault();
	} 
	else if (nombres.length < 2 || nombres.length > 50) {
		alert("Verifique el campo Nombres\n" + 
			"Los Nombres deben contener entre 2 y 50 caracteres");
		document.getElementById('nombres').focus();
		event.preventDefault();
	} 
	// Validación de Apellidos
	else if (apellidos === "") {
		alert("Verifique el campo Apellidos\n" + 
			"Los Apellidos NO pueden estar vacíos");
		document.getElementById('apellidos').focus();
		event.preventDefault();
	} 
	else if (!patron_texto.test(apellidos)){
		alert("Verifique el campo Apellidos\n" + 
			"Los Apellidos NO pueden contener números o caracteres especiales");
		document.getElementById('apellidos').focus();
		event.preventDefault();
	} 
	else if (apellidos.length < 2 || apellidos.length > 50) {
		alert("Verifique el campo Apelllidos\n" + 
			"Los Apelllidos deben contener entre 2 y 50 caracteres");
		document.getElementById('apellidos').focus();
		event.preventDefault();
	} 
	// Validación de Correo
	else if (correo === "") {
		alert("Verifique el campo Correo\n" + 
			"El Correo NO puede estar vacío");
		document.getElementById('correo-cont').focus();
		event.preventDefault();
	} 
	else if (!patron_correo.test(correo)) {
		alert("Verifique el Correo\n" + 
			"NO es un correo electrónico válido");
		document.getElementById('correo-cont').focus();
		event.preventDefault();	
	}	 	
	// Validación Asunto
	else if (asunto === "") {
		alert("Verifique el campo Asunto\n" + 
			"El Asunto NO puede estar vacío");
		document.getElementById('asunto').focus();
		event.preventDefault();
	} 	
	else if (!patron_texto.test(asunto)) {
		alert("Verifique el Asunto\n" + 
			"El Asunto NO puede contener números o caracteres especiales");
		document.getElementById('asunto').focus();
		event.preventDefault();	
	}
	else if (asunto.length < 2 || asunto.length > 50) {
		alert("Verifique el campo Asunto\n" + 
			"El Asunto debe contener entre 2 y 50 caracteres");
		document.getElementById('asunto').focus();
		event.preventDefault();
	}
	// Validación Mensaje	
	else if (mensaje === "") {
		alert("Verifique el campo Mensaje\n" + 
			"El Mensaje NO puede estar vacío");
		document.getElementById('mensaje').focus();
		event.preventDefault();
	}
	else if (mensaje.length < 50 || mensaje.length > 300) {
		alert("Verifique el campo Mensaje\n" + 
			"El Mensaje debe contener entre 50 y 300 caracteres");
		document.getElementById('mensaje').focus();
		event.preventDefault();
	}
	else {
		alert("!Felicitaciones!\n" + 
			"El Mensaje se ha enviado satisfactoriamente");
	}
}
// Formulario de Contacto: Cancelar
function cancelarContac(){
	alert("Se canceló el Envío del Mensaje\n" + 
		"No se ha guardado ningún dato");
	window.location = '?c=Landing&#contactenos';
}
// Formulario de Inicio de Sesión: Validar Datos y Enviar
function validarLogin(){
	// Captura de Datos
	correo  = document.getElementById('correo').value;	
	pass  = document.getElementById('pass').value;
	// Expresión Regular de correo electrónico
	let correoPatron = /^\w+([.-_+]?\w+)*@\w+([.-]?\w+)*(\.\w{2,10})+$/;
	// Validación del correo electrónico
	if (correo === "") {
		alert("Verifique el Correo\n" + 
			"El Correo NO puede estar vacío");
		document.getElementById('correo').focus();
		event.preventDefault();
	} else if (!correoPatron.test(correo)) {
		alert("Verifique el Correo\n" + 
			"NO es un correo electrónico válido");
		document.getElementById('correo').focus();
		event.preventDefault();	
	}
	// Validación de contraseña
	else if (pass === "") {
		alert("Verifique la Contraseña\n" + 
			"La Contraseña NO puede estar vacía");
		document.getElementById('pass').focus();
		event.preventDefault();	
	}
	else if (pass.length < 5 || pass.length > 8) {
		alert("Verifique la Contraseña\n" + 
			"La Contraseña debe tener entre 5 y 8 caracteres");
		document.getElementById('pass').focus();
		event.preventDefault();			
	}
	// Validación de Datos (Se sugiere hacerlo por AJAX o NodeJS)
	else if (correo == "admin@correo.com" && pass == 12345) {
		alert("Datos correctos:\n" + "Superó la validación Front-End: HTML, CSS y JS.\n" + 
			"Ahora falta la validación Back-End.");
	} 
	// Si no coinciden con los Datos
	else {
		alert("Datos Incorrectos:\n" + 
			"No ha superado la validación Fron-End: HTML, CSS y JS.");
		document.getElementById('correo').value = "";
		document.getElementById('correo').focus();
		document.getElementById('pass').value = "";
		event.preventDefault();
	}
}
// Formulario de Inicio de Sesión: Cancelar
function cancelarLogin(){
	alert("Se canceló el Inicio de Sesión\n" + 
		"No se ha guardado ningún dato");
	window.location = '?c=Landing&#';
}