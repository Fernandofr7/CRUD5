<%@page import="CrudJavaWeb.ApiClient"%>
<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="java.io.IOException" %>

<!DOCTYPE html>
<html lang="es">
    <jsp:include page="head.jsp" />

    <body style="width: 80%; margin: auto;">
        <div>
            <jsp:include page="navbar.jsp" />
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">CEDULA</th>
                    <th scope="col">NOMBRE</th>
                    <th scope="col">APELLIDO</th>
                    <th scope="col">DIRECCION</th>
                    <th scope="col">TELEFONO</th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                </tr>
            </thead>

            <tbody>
                <%
                    ApiClient apiClient = new ApiClient();
                    try {
                        JSONArray jsonArray = apiClient.getDataFromApi();
                        // Itera a través del JSONArray e imprime en la tabla
                        for (int i = 0; i < jsonArray.length(); i++) {
                            JSONObject jsonObject = jsonArray.getJSONObject(i);
                            String cedula = jsonObject.getString("cedula");
                            String nombre = jsonObject.getString("nombre");
                            String apellido = jsonObject.getString("apellido");
                            String direccion = jsonObject.getString("direccion");
                            String telefono = jsonObject.getString("telefono");
                %>
                <tr>
                    <td><%= cedula%></td>
                    <td><%= nombre%></td>
                    <td><%= apellido%></td>
                    <td><%= direccion%></td>
                    <td><%= telefono%></td>
                    <td>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#editModal<%= cedula%>">
                            EDITAR
                        </button>


                        <!-- Ventana modal -->
                        <div class="modal fade" id="editModal<%= cedula%>" tabindex="-1" role="dialog" aria-labelledby="editModalLabel<%= cedula%>" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="editModalLabel<%= cedula%>">Editar Estudiante</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <!-- Aquí coloca los campos para editar -->
                                        <input type="text" class="form-control" id="cedulaEditar_<%= i%>" value="<%= cedula%>" readonly>
                                        <input type="text" class="form-control" id="nombreEditar_<%= i%>" value="<%= nombre%>">
                                        <input type="text" class="form-control" id="apellidoEditar_<%= i%>" value="<%= apellido%>">
                                        <input type="text" class="form-control" id="direccionEditar_<%= i%>" value="<%= direccion%>">
                                        <input type="text" class="form-control telefono" id="telefonoEditar_<%= i%>" value="<%= telefono%>">

                                        <div id="telefonoError_<%= i%>" class="error-message" style="display: none;">Debe tener 10 dígitos.</div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                        <button type="button" class="btn btn-primary guardarCambiosButton" data-index="<%= i%>">Guardar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td><a href="delete_person.jsp?cedula=<%= cedula%>" class="btn btn-danger">ELIMINAR</a></td>
                </tr>

            <script>
                $(document).ready(function () {
    $('.guardarCambiosButton').click(function () {
        var index = $(this).data('index');
        var telefono = $('#telefonoEditar_' + index).val();
        var cedula = $('#cedulaEditar_' + index).val();
        var nombre = $('#nombreEditar_' + index).val();
        var apellido = $('#apellidoEditar_' + index).val();
        var direccion = $('#direccionEditar_' + index).val();

        // Validar que ningún campo esté vacío
        if (telefono.trim() !== '' && cedula.trim() !== '' && nombre.trim() !== '' && apellido.trim() !== '' && direccion.trim() !== '') {
            // Validar el teléfono
            if (telefono.length === 10 && /^\d+$/.test(telefono)) {
                // Enviar los datos al servidor mediante una solicitud AJAX
                $.ajax({
                    url: 'actualizarEstudiante.jsp',
                    type: 'POST',
                    data: {
                        cedula: cedula,
                        nombre: nombre,
                        apellido: apellido,
                        direccion: direccion,
                        telefono: telefono
                    }, // Datos que se envían al servidor
                    success: function (response) {
                        console.log('Cambios guardados con éxito');
                        // Puedes cerrar la ventana modal si lo deseas
                        $('#editModal<%= cedula%>').modal('hide');
                        // Recargar la página para reflejar los cambios en la tabla, si es necesario
                        location.reload();
                    },
                    error: function (xhr, status, error) {
                        // Manejar errores si ocurren
                        console.error('Error al guardar cambios:', error);
                    }
                });
            } else {
                // Mostrar mensaje de error si el teléfono no cumple con los requisitos
                $('#telefonoError_' + index).show();
            }
        } else {
            // Mostrar mensaje de error si algún campo está vacío
            console.error('Por favor, completa todos los campos.');
        }
    });
});

            </script>

             <script>
                $(document).ready(function () {
                    $('.telefono').on('input', function () {
                        var index = $(this).attr('id').split('_')[1];
                        $('#telefonoError_' + index).hide();
                    });
                });
            </script>

            <%
                    }
                } catch (IOException | InterruptedException e) {
                    // Manejo de errores
                    e.printStackTrace();
                }%>
        </tbody>
    </table>
</body>
</html>
