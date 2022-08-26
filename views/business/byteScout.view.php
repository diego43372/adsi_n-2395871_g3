		<div class="tope"></div>
		<div class="titulo"><h1>Reportes Impresos</h1></div>
		<div class="migas color-gris-oscuro">
			<a href="?c=Landing&#nosotros">Nosotros</a>
			<p> &nbsp / &nbsp</p>
			<a href="?c=Landing&a=entity">Reportes Impresos</a>
		</div>
		<section class="paginas">			
			<h3 class="subtitulo">Plugin para Reportes Impresos con JS: ByteScout</h3>
			<div class="js-pdf">
				<div class="js-pdf-izq">
					<form class="form">
						<div class="form-cuerpo">
							<div class="form-control">
								<label class="label" for="pdf-nombre">Nombres</label>
								<input class="input" type="text" id="pdf-nombre">
							</div>
							<div class="form-control textarea">								
								<textarea class="textarea" id="pdf-mensaje"></textarea>
							</div> 
						</div>
						<div class="form-pie">							
							<input type="button" onclick="recargarPdf()" value="Vista Previa">
							<input type="button" onclick="imprimirPdf()" value="Descargar">
						</div>
					</form>					
				</div>				
				<div class="js-pdf-der">
					<iframe class="iframe" name="vista-previa" src="?c=Dashboard&a=verPdf"></iframe>
				</div>
			</div>
		</section>		