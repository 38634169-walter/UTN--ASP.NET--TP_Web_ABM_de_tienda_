function agregado() {
    Swal.fire({
        position: 'top-end',
        icon: 'success',
        title: 'Agregado con exito',
        showConfirmButton: false,
        timer:1500
    })
}

function eliminado() {
    Swal.fire({
        position: 'top-end',
        icon: 'success',
        title: 'Quitado con exito',
        showConfirmButton: false,
        timer: 1500
    })
}

function comprado() {
    Swal.fire({
        position: 'top-end',
        icon: 'success',
        title: 'Su compra se encuentra en estado procesando',
        showConfirmButton: false,
        timer: 3500
    })
}