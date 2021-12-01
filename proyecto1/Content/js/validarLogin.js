
function validar_login() {
    var usu = $('#txbUsuario').val().trim();
    var validar = true;
    var validarCampo = true;
    for (var i = 0; i < usu.length; i++) {
        if (usu[i] == "=" || usu[i] == "?") {
            validarCampo = false;
            $('#usuario div').html('*Caracteres no permitidos \' = ? \' ');
        }
    }
    if (usu === "" || validarCampo == false) {
        $('#txbUsuario').removeClass('is-valid');
        $('#txbUsuario').addClass('is-invalid');
        $('#usuario div').addClass('invalid-feedback');
        if (validarCampo == true) $('#usuario div').html('');
        validar = false;
    }
    else {
        $('#txbUsuario').removeClass('is-invalid');
        $('#txbUsuario').addClass('is-valid');
        $('#usuario div').html('');
    }


    validarCampo = true;
    var cla = $('#txbClave').val().trim();
    for (var i = 0; i < cla.length; i++) {
        if (cla[i] == "=" || cla[i] == "?") {
            validarCampo = false;
            $('#clave div').html('*Caracteres no permitidos');
        }
    }
    if (cla === "" || validarCampo == false) {
        $('#txbClave').removeClass('is-valid');
        $('#txbClave').addClass('is-invalid');
        $('#clave div').addClass('invalid-feedback');
        if (validarCampo == true) $('#clave div').html('');
        validar = false;
    }
    else {
        $('#txbClave').removeClass('is-invalid');
        $('#txbClave').addClass('is-valid');
        $('#clave div').html('');
    }
    return validar;
}