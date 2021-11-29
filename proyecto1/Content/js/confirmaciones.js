function agregado() {
    Swal.fire({
        position: 'top-end',
        icon: 'success',
        title: 'Agregado con exito',
        showConfirmButton: false,
        timer:1500,
        target: document.getElementById('myDiv')
    })
}

function eliminado() {
    Swal.fire({
        position: 'top-end',
        icon: 'success',
        title: 'Quitado con exito',
        showConfirmButton: false,
        timer: 1500,
        target: document.getElementById('myDiv')
    })
}