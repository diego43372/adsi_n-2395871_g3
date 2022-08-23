		<div class="tope"></div>
		<div class="titulo"><h1>Iniciar Sesión</h1></div>
		<div class="migas color-gris-oscuro">
			<a href="?">Inicio</a>
			<p> &nbsp / &nbsp</p>
			<a href="?c=Landing&a=login">Iniciar Sesión</a>
		</div>
		<section class="paginas forms color-gris-claro">			
			<form class="form form-login" id="form-login" action="?c=Login&a=routeSesion" method="POST">
				<a class="enlace-registro" href="?c=Landing&a=register">Registro</a>
				<h2 class="form-subtitulo">Iniciar Sesión</h2>
				<div class="form-cuerpo color-blanco">
					<div class="form-control">
						<label class="label" for="correo">Correo</label>
						<input class="input" type="email" name="correo" id="correo" placeholder="Correo Usuario">
					</div>
					<div class="form-control">
						<label class="label" for="pass">Contraseña</label>
						<input class="input" type="password" name="pass" id="pass" placeholder="Contraseña: 5 a 8 caracteres">
					</div>
				</div>
				<div class="form-pie">
					<input type="reset" value="Cancelar">
					<input type="submit" value="Enviar">
				</div>				
				<a class="enlace-olvido" href="?c=Landing&a=forgot">¿Olvidó su Contraseña?</a>
			</form>
		</section>