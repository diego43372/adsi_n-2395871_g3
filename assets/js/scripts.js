hacerClic = document.getElementById("contenedor");
hacerClic.addEventListener('click', function (event){
	id = event.target.getAttribute("id");
	// Mensaje: Correcto
	if (id === "mensajeCorrecto") {
		event.preventDefault();
		swal({
			title: "Es Correcto!",
			text: "Los Datos se han enviado a la Base de Datos",
			icon: "success",
			button: "Aceptar",
		})
	}
	// Mensaje: Incorrecto
	else if (id === "mensajeIncorrecto") {
		event.preventDefault();
		swal({
			title: "Es Incorrecto!",
			text: "Revise los campos del Formulario",
			icon: "error",
			button: "Aceptar",
		})	
	}
	// Mensaje: Advertencia
	else if (id === "mensajeAdvertencia-nav" || id === "mensajeAdvertencia-icon") {
		swal({
            title: "Está seguro de eliminar el registro",
            text: "Si elimina el registro, ya no podrá ser recuperado de la memoria!",
            icon: "warning",
            buttons: [true, "Aceptar"],
            dangerMode: true,
        })
        .then((willDelete) => {            
            if (willDelete) {
                swal("El registro ha sido eliminado!", {
                    icon: "success",
                });                
                tabla.deleteRow(i);
            } else {
                swal("El registro se ha convervado");
            }
        });
	}
	// Validar Contacto
	else if (id === "submit-contac") {
		validarContac();	
	} 
	// Cancelar Envío Contacto
	else if (id === "cancelar-contac") {
		cancelarContac();	
	} 
	// Validar Login
	else if (id === "submit-login") {
		validarLogin();
	} 
	// Cancelar Envío Login
	else if (id === "cancelar-login") {
		cancelarLogin();
	} 
	// Validar Registro
	else if (id === "submit-register") {
		validarRegister();
	}  
	// Cancelar Envío Registro
	else if (id === "cancelar-register") {
		cancelarRegister();
	} 
	// Validar Olvido de Contraseña
	else if (id === "submit-olvido") {
		validarOlvido();
	}  
	// Cancelar Olvido de Contraseña
	else if (id === "cancelar-olvido") {
		cancelarOlvido();
	}
	// Cargar pdf
	else if (id === "submit-pdf") {
		generarPdf();
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
		event.preventDefault();
		swal({
			title: "Verifique el campo Nombres",
			text: "Los Nombres NO pueden estar vacíos",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {
			document.getElementById('nombres').focus();
		});
	} 
	else if (!patron_texto.test(nombres)){
		event.preventDefault();
		swal({
			title: "Verifique el campo Nombres",
			text: "Los Nombres NO pueden contener números o caracteres especiales",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {
			document.getElementById('nombres').focus();
		});		
	} 
	else if (nombres.length < 2 || nombres.length > 50) {
		event.preventDefault();
		swal({
			title: "Verifique el campo Nombres",
			text: "Los Nombres deben contener entre 2 y 50 caracteres",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {
			document.getElementById('nombres').focus();
		});
	} 
	// Validación de Apellidos
	else if (apellidos === "") {
		event.preventDefault();
		swal({
			title: "Verifique el campo Apellidos",
			text: "Los Apellidos NO pueden estar vacíos",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('apellidos').focus();
		});
	} 
	else if (!patron_texto.test(apellidos)){
		event.preventDefault();
		swal({
			title: "Verifique el campo Apellidos",
			text: "Los Apellidos NO pueden contener números o caracteres especiales",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('apellidos').focus();
		});
	} 
	else if (apellidos.length < 2 || apellidos.length > 50) {
		event.preventDefault();
		swal({
			title: "Verifique el campo Apellidos",
			text: "Los Apelllidos deben contener entre 2 y 50 caracteres",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('apellidos').focus();
		});
	} 
	// Validación de Correo
	else if (correo === "") {
		event.preventDefault();
		swal({
			title: "Verifique el campo Correo",
			text: "El Correo NO puede estar vacío",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('correo-cont').focus();			
		});
	} 
	else if (!patron_correo.test(correo)) {
		event.preventDefault();
		swal({
			title: "Verifique el campo Correo",
			text: "El Correo NO es un correo electrónico válido",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('correo-cont').focus();			
		});
	}	 	
	// Validación Asunto
	else if (asunto === "") {
		event.preventDefault();
		swal({
			title: "Verifique el campo Asunto",
			text: "El Asunto NO puede estar vacío",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('asunto').focus();
		});		
	} 	
	else if (!patron_texto.test(asunto)) {
		event.preventDefault();
		swal({
			title: "Verifique el campo Asunto",
			text: "El Asunto NO puede contener números o caracteres especiales",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('asunto').focus();
		});
	}
	else if (asunto.length < 2 || asunto.length > 50) {
		event.preventDefault();
		swal({
			title: "Verifique el campo Asunto",
			text: "El Asunto debe contener entre 2 y 50 caracteres",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('asunto').focus();
		});		
	}
	// Validación Mensaje	
	else if (mensaje === "") {
		event.preventDefault();
		swal({
			title: "Verifique el campo Mensaje",
			text: "El Mensaje NO puede estar vacío",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('mensaje').focus();			
		});		
	}
	else if (mensaje.length < 50 || mensaje.length > 300) {
		event.preventDefault();
		swal({
			title: "Verifique el campo Mensaje",
			text: "El Mensaje debe contener entre 50 y 300 caracteres",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('mensaje').focus();
		});		
	}
	// Se envía el mensaje
	else {
		event.preventDefault();
		swal({
			title: "Mensaje Enviado!",
			text: "El mensaje se ha enviado correctamente. En menos de 24 horas el Administrador se comunicará con Usted por medio de su Correo Electrónico",
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
		event.preventDefault();
		swal({
			title: "Verifique el campo Nombres",
			text: "Los Nombres NO pueden estar vacíos",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('nombres-reg').focus();			
		});
	} 
	else if (!patron_texto.test(nombres)){
		event.preventDefault();
		swal({
			title: "Verifique el campo Nombres",
			text: "Los Nombres NO pueden contener números o caracteres especiales",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('nombres-reg').focus();			
		});		
	} 
	else if (nombres.length < 2 || nombres.length > 50) {
		event.preventDefault();
		swal({
			title: "Verifique el campo Nombres",
			text: "Los Nombres deben contener entre 2 y 50 caracteres",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('nombres-reg').focus();			
		});		
	} 
	// Validación de Apellidos
	else if (apellidos === "") {
		event.preventDefault();
		swal({
			title: "Verifique el campo Apellidos",
			text: "Los Apellidos NO pueden estar vacíos",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('apellidos-reg').focus();
		});		
	} 
	else if (!patron_texto.test(apellidos)){
		event.preventDefault();
		swal({
			title: "Verifique el campo Apellidos",
			text: "Los Apellidos NO pueden contener números o caracteres especiales",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('apellidos-reg').focus();
		});		
	} 
	else if (apellidos.length < 2 || apellidos.length > 50) {
		event.preventDefault();
		swal({
			title: "Verifique el campo Apellidos",
			text: "Los Apelllidos deben contener entre 2 y 50 caracteres",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('apellidos-reg').focus();
		});		
	} 
	// Validación de Correo
	else if (correo === "") {
		event.preventDefault();
		swal({
			title: "Verifique el campo Correo",
			text: "El Correo NO puede estar vacío",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('correo-reg').focus();
		});
	} 
	else if (!patron_correo.test(correo)) {
		event.preventDefault();
		swal({
			title: "Verifique el campo Correo",
			text: "El Correo NO es un correo electrónico válido",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('correo-reg').focus();
		});		
	}
	// Validación de contraseña
	else if (pass === "") {
		event.preventDefault();
		swal({
			title: "Verifique el campo Contraseña",
			text: "La Contraseña NO puede estar vacía",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('pass-reg').focus();
		});
	}
	else if (pass.length < 5 || pass.length > 8) {
		event.preventDefault();
		swal({
			title: "Verifique el campo Contraseña",
			text: "La Contraseña debe tener entre 5 y 8 caracteres",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('pass-reg').focus();
		});		
	}
	// Validación de confirmación
	else if (confirm === "") {
		event.preventDefault();
		swal({
			title: "Verifique el campo Confirmación Contraseña",
			text: "La Confirmación de Contraseña NO puede estar vacía",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('conf-pass-reg').focus();			
		});		
	}
	else if (confirm.length < 5 || confirm.length > 8) {
		event.preventDefault();
		swal({
			title: "Verifique el campo Confirmación Contraseña",
			text: "La Confirmañción de Contraseña debe tener entre 5 y 8 caracteres",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('conf-pass-reg').focus();
		});
	}
	// Comprobación de igualdad entre contraseñas
	else if (pass !== confirm) {
		event.preventDefault();
		swal({
			title: "Verifique los campos Contraseña y Confirmación",
			text: "La Contraseña y la Confirmación debe ser iguales",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {
			document.getElementById('pass-reg').value = "";
			document.getElementById('conf-pass-reg').value = "";
			document.getElementById('pass-reg').focus();			
		});		
	}
	// Se crea el Usuario
	else {		
		event.preventDefault();
		swal({
			title: "Usuario Creado correctamente!",
			text: "El Administrador se comunicará con Usted por medio de su Correo Electrónico para asignarle el ROL",
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
		event.preventDefault();
		swal({
			title: "Verifique el campo Correo",
			text: "El Correo NO puede estar vacío",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('correo').focus();
		});
	} else if (!correoPatron.test(correo)) {
		event.preventDefault();
		swal({
			title: "Verifique el campo Correo",
			text: "El Correo NO es un correo electrónico válido",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('correo').focus();
		});		
	}
	// Validación de contraseña
	else if (pass === "") {
		event.preventDefault();
		swal({
			title: "Verifique el campo Contraseña",
			text: "La Contraseña NO puede estar vacía",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('pass').focus();			
		});		
	}
	else if (pass.length < 5 || pass.length > 8) {
		event.preventDefault();
		swal({
			title: "Verifique el campo Contraseña",
			text: "La Contraseña debe tener entre 5 y 8 caracteres",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('pass').focus();			
		});
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
		event.preventDefault();
		swal({
			title: "Datos Incorrectos!",
			text: "No ha superado la validación Front-End: HTML, CSS y JS",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('correo').value = "";
			document.getElementById('pass').value = "";			
			document.getElementById('correo').focus();
		});
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
		event.preventDefault();
		swal({
			title: "Verifique el campo Correo",
			text: "El Correo NO puede estar vacío",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('correo-olv').focus();
		});
	} 
	else if (!patron_correo.test(correo)) {
		event.preventDefault();
		swal({
			title: "Verifique el campo Correo",
			text: "El Correo NO es un correo electrónico válido",
			icon: "error",
			button: "Aceptar",
		})
		.then((value) => {			
			document.getElementById('correo-olv').focus();
		});		
	}	
	// La contraseña se ha restaurado
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
// Generar pdf
function generarPdf() {
    event.preventDefault();
    let doc = new jsPDF();
    doc.setProperties({
        title: "Report",
        orientation: 'p',
        unit: 'mm',
        format: 'letter'    
    });
    // Variables pdf    
    cert_apellidos = document.getElementById('pdf-apellidos').value;
    cert_nombres = document.getElementById('pdf-nombres').value;
    cert_documento = document.getElementById('pdf-documento').value;
    // Documento pdf
    doc.text(80, 20, 'Datos Personales');
    doc.text(45, 25, '_______________________________');    
    doc.setFontSize(14);
    doc.text(20, 50, '# de Usuario:          ' + cert_num);    
    doc.text(20, 60, 'Apellidos:                ' + cert_apellidos);
    doc.text(20, 70, 'Nombres:                ' + cert_nombres);
    doc.text(20, 80, 'Documento:            ' + cert_documento);
    // Salida pdf
    $("#pdf_preview").attr("src", doc.output('datauristring'));    
}