<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Estudiantes</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="../miAjax.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../css/styles.css" type=text/css>
</head>
<body>
    <div>
    <h2>Lista de Estudiantes</h2>
    </div>
    <div class="btn-seccion">
    <button id="crearEstudiante">Crear Estudiante</button>
    </div>
    <table class= "tabla-estudiantes">
        <thead class="encabezado">
            <tr>
            <th>Cedula</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Dirección</th>
            <th>Telefono</th>
            <th>Acción</th>
            </tr>
        </thead>
        <tbody id="datosEstudiantes">

        </tbody>
    </table>

    <div id="popup" class="popup">
        <div class="popup-contenido">
            <span class="cerrar" id="cerrarPopup">&times;</span>
            <h2>Nuevo Estudiante</h2>
            <form id="newEstudiante">
                <label for="ced_est">Cedula: </label>
                <input type="text" id="ced_est" name="ced_est" required="true"><br><br>
                <label for="nom_est">Nombre:</label>
                <input type="text" id="nom_est" name="nom_est" required="true"><br><br>
                <label for="ape_est">Apellido:</label>
                <input type="text" id="ape_est" name="ape_est" required="true"><br><br>
                <label for="dir_est">Dirección:</label>
                <input type="text" id="dir_est" name="dir_est" required="true"><br><br>
                <label for="tel_est">Telefono:</label>
                <input type="text" id="tel_est" name="tel_est" required="true"><br><br>
                <button type="submit">Aceptar</button>
            </form>
        </div>
    </div>

    <div id="modificarPopup" class="popup">
    <div class="popup-contenido">
        <span class="cerrar" id="cerrarModificarPopup">&times;</span>
        <h2>Modificar Estudiante</h2>
        <form id="modificarEstudianteForm"  style="display: none;">
            <input type="hidden" id="cedula_modificar" name="cedula_modificar">
            <label for="nom_est_modificar">Nombre:</label>
            <input type="text" id="nom_est_modificar" name="nom_est_modificar" required><br><br>
            <label for="ape_est_modificar">Apellido:</label>
            <input type="text" id="ape_est_modificar" name="ape_est_modificar" required><br><br>
            <label for="dir_est_modificar">Dirección:</label>
            <input type="text" id="dir_est_modificar" name="dir_est_modificar" required><br><br>
            <label for="tel_est_modificar">Teléfono:</label>
            <input type="text" id="tel_est_modificar" name="tel_est_modificar" required><br><br>
            <button type="submit">Aceptar</button>
        </form>
    </div>
</div>
</body>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        var botonMostrarPopup = document.getElementById("crearEstudiante");
        var popup = document.getElementById("popup");
        var botonCerrarPopup = document.getElementById("cerrarPopup");

        botonMostrarPopup.addEventListener("click", function() {
            popup.style.display = "block";
        });

        botonCerrarPopup.addEventListener("click", function() {
            popup.style.display = "none";
        });

        window.addEventListener("click", function(event) {
            if (event.target == popup) {
                popup.style.display = "none";
            }
        });
    });

    $(document).on("click", ".modificarEstudiante", function() {
            var fila = $(this).closest("tr");
            var cedula = fila.find(".ced_est").text();
            var nombre = fila.find(".nom_est").text();
            var apellido = fila.find(".ape_est").text();
            var direccion = fila.find(".dir_est").text();
            var telefono = fila.find(".tel_est").text();

            $("#cedula_modificar").val(cedula);
            $("#nom_est_modificar").val(nombre);
            $("#ape_est_modificar").val(apellido);
            $("#dir_est_modificar").val(direccion);
            $("#tel_est_modificar").val(telefono);

            $("#modificarPopup").css("display", "block");
        });

        $("#cerrarModificarPopup").click(function() {
            $("#modificarPopup").css("display", "none");
        });

        $(window).click(function(event) {
            if (event.target == document.getElementById("modificarPopup")) {
                $("#modificarPopup").css("display", "none");
            }
        });
</script>

</html>