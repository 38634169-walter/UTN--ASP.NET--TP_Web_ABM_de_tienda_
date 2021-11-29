
function confirmarDesicion(desicion) {

    if (desicion == "abrir") {
        $('#confirmarAgregar').removeClass('d-none');
        $('#confirmarAgregar').addClass('d-block');
    }
    if (desicion == "cerrar") {
        $('#confirmarAgregar').removeClass('d-block');
        $('#confirmarAgregar').addClass('d-none');
    }
}
