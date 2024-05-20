<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">SOA</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
               
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#agregarEstudianteModal">
                    Agregar Estudiante
                </button>

                <!-- Modal de agregar estudiante -->
                <div class="modal fade" id="agregarEstudianteModal" tabindex="-1" role="dialog" aria-labelledby="agregarEstudianteModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="agregarEstudianteModalLabel">Agregar Estudiante</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                
                                <form id="formularioAgregarEstudiante" onsubmit="return agregarEstudiante()">
                                    <div class="form-group">
                                        <label for="cedula">Cedula</label>
                                        <input type="text" class="form-control" id="cedula" name="cedula" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="nombre">Nombre</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="apellido">Apellido</label>
                                        <input type="text" class="form-control" id="apellido" name="apellido" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="direccion">Dirección</label>
                                        <input type="text" class="form-control" id="direccion" name="direccion" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="telefono">Teléfono</label>
                                        <input type="text" class="form-control" id="telefono" name="telefono" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Agregar Estudiante</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <li class="nav-item">
                   <a class="nav-link" aria-current="page" href="buscar.jsp">Buscar Estudiante</a>
                </li>
                </li>
            </ul>
        </div>
    </div>
</nav>

<script>
    function agregarEstudiante() {
    var cedula = document.getElementById('cedula').value;
    var nombre = document.getElementById('nombre').value;
    var apellido = document.getElementById('apellido').value;
    var direccion = document.getElementById('direccion').value;
    var telefono = document.getElementById('telefono').value;

    var digitos = /^\d{10}$/;

    if (!digitos.test(cedula)) {
        alert('La cédula debe tener 10 dígitos');
        return false; // Evita que el formulario se envíe
    }

    if (!digitos.test(telefono)) {
        alert('El teléfono debe tener 10 dígitos');
        return false;
    }
    
    registrarEstudiante(cedula, nombre, apellido, direccion, telefono);
    
    $('#agregarEstudianteModal').modal('hide');

    return false;
}

function registrarEstudiante(cedula, nombre, apellido, direccion, telefono) {
    $.ajax({
        url: 'nuevoEstudiante.jsp',
        type: 'POST',
        data: {
            cedula: cedula,
            nombre: nombre,
            apellido: apellido,
            direccion: direccion,
            telefono: telefono
        },
        success: function(response) {
            console.log('Estudiante registrado con éxito');
            location.reload();
        },
        error: function(xhr, status, error) {
            console.error('Error al registrar estudiante:', error);
        }
    });
}

    </script>