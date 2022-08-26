function recargarPdf() {

    // let url = window.location.href;
    // window.alert(url);
}

// Recargar la página
// function recargarPdf(){
//     location.reload();
// }

// Imprimir
function imprimirPdf(){
    var doc = new jsPDF();
    var nombre = $('#pdf-nombre').val();
    var mensaje = $('#pdf-mensaje').val();
    var specialElementHandlers = {
        '#elementH': function (element, renderer) {
            return true;
        }
    };
    doc.setFontSize(20);
    doc.text(nombre, 10, 30);    
    doc.text(mensaje, 10, 45);
    doc.save('demo.pdf');

}