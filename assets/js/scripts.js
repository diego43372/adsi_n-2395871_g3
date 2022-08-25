hacerClic = document.getElementById("contenedor");
hacerClic.addEventListener('click', function (event){
	id = event.target.getAttribute("id");	
	if (id === "submit-contac") {
		validarContac();	
	} else if (id === "cancelar-contac") {
		cancelarContac();	
	} else if (id === "submit-login") {
		validarLogin();
	} else if (id === "cancelar-login") {
		cancelarLogin();
	} else if (id === "submit-register") {
		validarRegister();
	}  else if (id === "cancelar-register") {
		cancelarRegister();
	} else if (id === "submit-olvido") {
		validarOlvido();
	}  else if (id === "cancelar-olvido") {
		cancelarOlvido();
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
		event.preventDefault();
		swal({
			title: "Mensaje Enviado!",
			text: "El mensaje enviado correctamente, en 24 horas el Administrador se comunicará con Usted por medio de su Correo Electrónico",
			icon: "success",
			button: "Aceptar",
		})
		.then((value) => {
			document.formContact.submit();
		});		
	}
}
// Formulario de Contacto: Cancelar
function cancelarContac(){
	event.preventDefault();
	swal({
		title: "Cancelación de Mensaje!",
		text: "No se ha guardado ningún dato",
		icon: "error",
		button: "Aceptar",
	})
	.then((value) => {
		document.formContact.reset();
		window.location = '?c=Landing&#contactenos';
	});	
}
function validarRegister(){
	// Captura de Datos
	nombres = document.getElementById('nombres-reg').value;
	apellidos = document.getElementById('apellidos-reg').value;
	correo = document.getElementById('correo-reg').value;
	pass = document.getElementById('pass-reg').value;
	confirm = document.getElementById('conf-pass-reg').value;
	// Expresión Regular de correo electrónico
	let patron_correo = /^\w+([.-_+]?\w+)*@\w+([.-]?\w+)*(\.\w{2,10})+$/;
	// Expresión Regular de Texto
	let patron_texto = /^[ a-zA-ZáéíóúÁÉÍÓÚäëïöüÄËÏÖÜàèìòùÀÈÌÒÙñÑ]+$/;	
	// Validación de nombres
	if (nombres === "") {
		alert("Verifique el campo Nombres\n" + 
			"Los Nombres NO pueden estar vacíos");
		document.getElementById('nombres-reg').focus();
		event.preventDefault();
	} 
	else if (!patron_texto.test(nombres)){
		alert("Verifique el campo Nombres\n" + 
			"Los Nombres NO pueden contener números o caracteres especiales");
		document.getElementById('nombres-reg').focus();
		event.preventDefault();
	} 
	else if (nombres.length < 2 || nombres.length > 50) {
		alert("Verifique el campo Nombres\n" + 
			"Los Nombres deben contener entre 2 y 50 caracteres");
		document.getElementById('nombres-reg').focus();
		event.preventDefault();
	} 
	// Validación de Apellidos
	else if (apellidos === "") {
		alert("Verifique el campo Apellidos\n" + 
			"Los Apellidos NO pueden estar vacíos");
		document.getElementById('apellidos-reg').focus();
		event.preventDefault();
	} 
	else if (!patron_texto.test(apellidos)){
		alert("Verifique el campo Apellidos\n" + 
			"Los Apellidos NO pueden contener números o caracteres especiales");
		document.getElementById('apellidos-reg').focus();
		event.preventDefault();
	} 
	else if (apellidos.length < 2 || apellidos.length > 50) {
		alert("Verifique el campo Apelllidos\n" + 
			"Los Apelllidos deben contener entre 2 y 50 caracteres");
		document.getElementById('apellidos-reg').focus();
		event.preventDefault();
	} 
	// Validación de Correo
	else if (correo === "") {
		alert("Verifique el campo Correo\n" + 
			"El Correo NO puede estar vacío");
		document.getElementById('correo-reg').focus();
		event.preventDefault();
	} 
	else if (!patron_correo.test(correo)) {
		alert("Verifique el Correo\n" + 
			"NO es un correo electrónico válido");
		document.getElementById('correo-reg').focus();
		event.preventDefault();	
	}
	// Validación de contraseña
	else if (pass === "") {
		alert("Verifique la Contraseña\n" + 
			"La Contraseña NO puede estar vacía");
		document.getElementById('pass-reg').focus();
		event.preventDefault();	
	}
	else if (pass.length < 5 || pass.length > 8) {
		alert("Verifique la Contraseña\n" + 
			"La Contraseña debe tener entre 5 y 8 caracteres");
		document.getElementById('pass-reg').focus();
		event.preventDefault();			
	}
	// Validación de confirmación
	else if (confirm === "") {
		alert("Verifique la Confirmación de Contraseña\n" + 
			"La Confirmación de Contraseña NO puede estar vacía");
		document.getElementById('conf-pass-reg').focus();
		event.preventDefault();	
	}
	else if (confirm.length < 5 || confirm.length > 8) {
		alert("Verifique la Confirmañción de Contraseña\n" + 
			"La Confirmañción de Contraseña debe tener entre 5 y 8 caracteres");
		document.getElementById('conf-pass-reg').focus();
		event.preventDefault();			
	}
	// Comprobación de igualdad entre contraseñas
	else if (pass !== confirm) {
		alert("Verifique la Contraseña y la Confirmación\n" + 
			"La Contraseña y la Confirmañción debe tener ser iguales");
		document.getElementById('pass-reg').value = "";
		document.getElementById('conf-pass-reg').value = "";
		document.getElementById('pass-reg').focus();
		event.preventDefault();			
	}
	else {		
		event.preventDefault();
		swal({
			title: "Usuario Creado correctamente!",
			text: "El Administrador se comunicará con Usted por medio de su Correo Electrónico",
			icon: "success",
			button: "Aceptar",
		})
		.then((value) => {
			document.formRegister.submit();
		});
	}
}
// Formulario de Registro: Cancelar
function cancelarRegister(){
	event.preventDefault();
	swal({
		title: "Se canceló el Registro!",
		text: "No se ha guardado ningún dato",
		icon: "error",
		button: "Aceptar",
	})
	.then((value) => {
		document.formRegister.reset();
		window.location = '?c=Login';		
	});
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
		event.preventDefault();
		swal({
			title: "Datos Correctos!",
			text: "Superó la validación Front-End: HTML, CSS y JS. Ahora falta la validación Back-End",
			icon: "success",
			button: "Aceptar",
		})
		.then((value) => {
			document.formLogin.submit();
		});		
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
	event.preventDefault();
	swal({
		title: "Se canceló el Inicio de Sesión!",
		text: "No se ha guardado ningún dato",
		icon: "error",
		button: "Aceptar",
	})
	.then((value) => {
		document.formLogin.reset();
		window.location = '?c=Landing&#';
	});
}
// Formulario de Olvido Contraseña: Validar Datos y Enviar
function validarOlvido(){
	// Captura de Datos		
	correo = document.getElementById('correo-olv').value;	
	// Expresión Regular de correo electrónico
	let patron_correo = /^\w+([.-_+]?\w+)*@\w+([.-]?\w+)*(\.\w{2,10})+$/;
	// Validación de Correo
	if (correo === "") {
		alert("Verifique el campo Correo\n" + 
			"El Correo NO puede estar vacío");
		document.getElementById('correo-olv').focus();
		event.preventDefault();
	} 
	else if (!patron_correo.test(correo)) {
		alert("Verifique el Correo\n" + 
			"NO es un correo electrónico válido");
		document.getElementById('correo-reg').focus();
		event.preventDefault();	
	}	
	// 
	else {
		event.preventDefault();
		swal({
			title: "Contraseña Restaurada!",
			text: "La contraseña ha sido restaurada. Revise su correo electrónico y siga los pasos sugeridos",
			icon: "success",
			button: "Aceptar",
		})
		.then((value) => {
			document.formForgot.submit();
		});
	}
}
// Formulario de Olvido Contraseña: Cancelar
function cancelarOlvido(){
	event.preventDefault();
	swal({
		title: "Se canceló la Recuperación de Contraseña!",
		text: "No se ha guardado ningún dato",
		icon: "error",
		button: "Aceptar",
	})
	.then((value) => {
		document.formForgot.reset();
		window.location = '?c=Login';
	});
}