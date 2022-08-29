let doc = new jsPDF();
doc.setProperties({
    title: "Report",
    orientation: 'p',
    unit: 'mm',
    format: 'letter'    
});
// Variables pdf
cert_num = Math.floor(Math.random()*500);
// Documento pdf
doc.setFontSize(20);
doc.text(80, 20, 'Datos Personales');
doc.text(45, 25, '_______________________________');
doc.setFontSize(14);
doc.text(20, 50, '# de Usuario:         ');
doc.text(20, 60, 'Apellidos:');
doc.text(20, 70, 'Nombres:');
doc.text(20, 80, 'Documento:');
/*
doc.text(10, 55, 'Especie vendida: Sophronitis coccinea');
doc.text(10, 60, 'Valor: 35.00');
doc.text(10, 65, 'TBX: 242985290');
doc.text(10, 70, 'Fecha/Hora: 2019-11-05 12:28:21');
doc.text(10, 90, '_______________________________');
doc.text(10, 95, 'Recibí conforme');
*/

$("#pdf_preview").attr("src", doc.output('datauristring'));

function creaComprobante() {
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
    $("#pdf_preview").attr("src", doc.output('datauristring'));    
}
