function validar_compra() {
    var validar = true;
    if ($("#txbLocalidad").val().trim() === "") {
        $("#txbLocalidad").removeClass("is-valid");
        $("#txbLocalidad").addClass("is-invalid");
        validar = false;
    }
    else {
        $("#txbLocalidad").removeClass("is-invalid");
        $("#txbLocalidad").addClass("is-valid");
    }
    if ($("#txbCalle").val().trim() === "") {
        $("#txbCalle").removeClass("is-valid");
        $("#txbCalle").addClass("is-invalid");
        validar = false;
    }
    else {
        $("#txbCalle").removeClass("is-invalid");
        $("#txbCalle").addClass("is-valid");
    }
    if ($("#txbNumero").val().trim() === "") {
        $("#txbNumero").removeClass("is-valid");
        $("#txbNumero").addClass("is-invalid");
        validar = false;
    }
    else {
        $("#txbNumero").removeClass("is-invalid");
        $("#txbNumero").addClass("is-valid");
    }
    if ($("#txbTelefono").val().trim() === "") {
        $("#txbTelefono").removeClass("is-valid");
        $("#txbTelefono").addClass("is-invalid");
        validar = false;
    }
    else {
        $("#txbTelefono").removeClass("is-invalid");
        $("#txbTelefono").addClass("is-valid");
    }
    if ($("#txbComentario").val().trim() === "") {
        $("#txbComentario").removeClass("is-valid");
        $("#txbComentario").addClass("is-invalid");
        validar = false;
    }
    else {
        $("#txbComentario").removeClass("is-invalid");
        $("#txbComentario").addClass("is-valid");
    }
    return validar;
}