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
// Salida pdf
$("#pdf_preview").attr("src", doc.output('datauristring'));
