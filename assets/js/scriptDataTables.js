$(document).ready(function() {
    var table = $('#table-data-tables').DataTable( {
        dom: 'Bfrtip',
        buttons: [
        'copy',
        'csv',
        'excel',
        'pdf',            
        {
            extend: 'print',
            text: 'Imprimir Todo',
            exportOptions: {
                modifier: {
                    selected: null
                }
            }
        }
        ],
        select: true,        
        rowReorder: {
            selector: 'td:nth-child(2)'
        },
        responsive: true,
        language: {
            search: 'Buscar',
            zeroRecords: 'No hay registros para mostrar.',
            emptyTable: 'La tabla está vacia.',
            info: "Mostrando _START_ de _END_ de _TOTAL_ Registros.",
            infoFiltered: "(Filtrados de _MAX_ Registros.)",
            paginate: {
                first: 'Primero',
                previous: 'Anterior',
                next: 'Siguiente',
                last: 'Último'
            }
        }       
    } );
} );