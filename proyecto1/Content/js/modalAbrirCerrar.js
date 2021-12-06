
function confirmarDesicion(desicion) {

    if (desicion == "abrir") {
        $('#modal').removeClass('d-none');
        $('#modal').addClass('d-block');
    }
    if (desicion == "cerrar") {
        $('#modal').removeClass('d-block');
        $('#modal').removeClass('modal');
    }
}
