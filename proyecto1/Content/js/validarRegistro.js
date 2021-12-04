function validar_registro() {

    var validar = true;
    if ($('#txbNombre').val().trim() === "") {
        $('#txbNombre').removeClass('is-valid');
        $('#txbNombre').addClass('is-invalid');
        $('#nombre div').addClass('invalid-feedback');
        $('#nombre div').html('*Campo requerido');
        validar = false;
    }
    else {
        $('#txbNombre').removeClass('is-invalid');
        $('#txbNombre').addClass('is-valid');
    }

    if ($('#txbApellido').val().trim() === "") {
        $('#txbApellido').removeClass('is-valid');
        $('#txbApellido').addClass('is-invalid');
        $('#apellido div').addClass('invalid-feedback');
        $('#apellido div').html('*Campo requerido');
        validar = false;
    }
    else {
        $('#txbApellido').removeClass('is-invalid');
        $('#txbApellido').addClass('is-valid');
    }



    if ($('#txbDni').val().trim() === "") {
        $('#txbDni').removeClass('is-valid');
        $('#txbDni').addClass('is-invalid');
        $('#dni div').addClass('invalid-feedback');
        $('#dni div').html('*Campo requerido');
        validar = false;
    }
    else {
        $('#txbDni').removeClass('is-invalid');
        $('#txbDni').addClass('is-valid');
    }


    if ($('#txbFechaNacimiento').val().trim() === "") {
        $('#txbFechaNacimiento').removeClass('is-valid');
        $('#txbFechaNacimiento').addClass('is-invalid');
        $('#fechaNacimiento div').addClass('invalid-feedback');
        $('#fechaNacimiento div').html('*Campo requerido');
        validar = false;
    }
    else {
        $('#txbFechaNacimiento').removeClass('is-invalid');
        $('#txbFechaNacimiento').addClass('is-valid');
        $('#fechaNacimiento div').html('');
    }


    if ($('#dropSexo').val().trim() === "") {
        $('#dropSexo').removeClass('is-valid');
        $('#dropSexo').addClass('is-invalid');
        $('#sexo div').addClass('invalid-feedback');
        $('#sexo div').html('*Campo requerido');
        validar = false;
    }
    else {
        $('#dropSexo').removeClass('is-invalid');
        $('#dropSexo').addClass('is-valid');
    }


    if ($('#txbCodigoPostal').val().trim() === "") {
        $('#txbCodigoPostal').removeClass('is-valid');
        $('#txbCodigoPostal').addClass('is-invalid');
        $('#codigoPostal div').addClass('invalid-feedback');
        $('#codigoPostal div').html('*Campo requerido');
        validar = false;
    }
    else {
        $('#txbCodigoPostal').removeClass('is-invalid');
        $('#txbCodigoPostal').addClass('is-valid');
    }


    if ($('#txbEmail').val().trim() === "") {
        $('#txbEmail').removeClass('is-valid');
        $('#txbEmail').addClass('is-invalid');
        $('#emailError').addClass('invalid-feedback');
        $('#emailError').html('*Campo requerido');
        validar = false;
    }
    else {
        $('#txbEmail').removeClass('is-invalid');
        $('#txbEmail').addClass('is-valid');
    }

    if ($('#txbUsuario').val().trim() === "") {
        $('#txbUsuario').removeClass('is-valid');
        $('#txbUsuario').addClass('is-invalid');
        $('#usuarioError').addClass('invalid-feedback');
        $('#usuarioError').html('*Campo requerido');
        validar = false;
    }
    else {
        $('#txbUsuario').removeClass('is-invalid');
        $('#txbUsuario').addClass('is-valid');
    }





    var cla = $('#txbClave').val();
    var claRep = $('#txbClaveRepetir').val();

    if (cla != claRep) {
        $('#erroresClave p1').html('*Las contraseñas no coinciden');
    }
    else {
        $('#erroresClave p1').html('');
    }
    var validarClave = true;
    for (var i = 0; i < cla.length; i++) {
        if (cla[i] == "=" || cla[i] == "?") {
            validarClave = false;
        }
    }
    for (var i = 0; i < claRep.length; i++) {
        if (claRep[i] == "=" || claRep[i] == "?") {
            validarClave = false;
        }
    }

    if (validarClave == false) $('#erroresClave p2').html('*Caracteres no permitidos   \' = ? \' ');
    if (validarClave == true) $('#erroresClave p2').html('');

    if ($('#txbClave').val() === "") $('#clave div').html('*Campo requerido');
    if ($('#txbClave').val() !== "") $('#clave div').html('');

    if ($('#txbClaveRepetir').val() === "") $('#claveRepetir div').html('*Campo requerido');
    if ($('#txbClaveRepetir').val() !== "") $('#claveRepetir div').html('');


    if ($('#txbClave').val() === "" || validarClave == false || cla != claRep) {
        $('#txbClave').removeClass('is-valid');
        $('#txbClave').addClass('is-invalid');
        $('#clave div').addClass('invalid-feedback');
        validar = false;
    }
    else {
        $('#txbClave').removeClass('is-invalid');
        $('#txbClave').addClass('is-valid');
    }


    if ($('#txbClaveRepetir').val() === "" || validarClave == false || cla != claRep) {
        $('#txbClaveRepetir').removeClass('is-valid');
        $('#txbClaveRepetir').addClass('is-invalid');
        $('#claveRepetir div').addClass('invalid-feedback');
        validar = false;
    }
    else {
        $('#txbClaveRepetir').removeClass('is-invalid');
        $('#txbClaveRepetir').addClass('is-valid');
    }

    return validar;
}