// $(document).ready(function() {
//     $("#btnConsulta").click(function(){
//         $.ajax({
//             url: "consulta.php",
//             Type: "GET",
//             dataType: "json",
//             success: function(data) {
//                 console.log(data);
//             }
//         })
//     })
// });

function cargarDatos(){
    $.ajax({
        url: 'http://localhost/SOA/controller/apiRest.php',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            const datosEstudiantes = $('#datosEstudiantes');
            let nFila = 1;
            datosEstudiantes.html('');
  
            data.forEach(resultado => {
                const row = $('<tr>');
                row.html(`
                    <td class="ced_est">${resultado.ced_est}</td>
                  <td class="nom_est">${resultado.nom_est}</td>
                  <td class="ape_est">${resultado.ape_est}</td>
                  <td class="dir_est">${resultado.dir_est}</td>
                  <td class="tel_est">${resultado.tel_est}</td>
                  <td>
                  <button class= "eliminarEstudiante">Eliminar</button>
                  <button class= "modificarEstudiante">Editar</button>
                  </td>
                `);
                datosEstudiantes.append(row);
                nFila++;
            });
        },
        error: function(error) {
            console.error('Error:', error);
        }
    });
};

$(document).ready(function(){
    cargarDatos();

    $("#newEstudiante").submit(function(event){
        event.preventDefault();
        var formData = $(this).serialize();
        var formulario = this;
        $.ajax({
            url:'http://localhost/SOA/controller/apiRest.php',
            type:'POST',
            data: formData,
            dataType:'json',
            success: function(response){
                alert('Estudiante Creado con Exito');
                cargarDatos();
                formulario.reset();
                document.getElementById("popup").style.display = "none";
            },
            error: function(xhr, status, error) {
                console.error('Error al enviar los datos:', error);

            }
        })
    });

    $(document).on("click", ".eliminarEstudiante", function() {
        var fila = $(this).closest("tr");
        var cedula = fila.find(".ced_est").text(); 
        console.log(cedula);
        if (confirm("¿Estás seguro de que quieres eliminar este estudiante?")) {
            $.ajax({
                url: "http://localhost/SOA/controller/apiRest.php?var=" + cedula,
                type: "DELETE",
                dataType: "json",
                success: function(response) {
                    cargarDatos();
                    alert("Estudiante eliminado con éxito");
                },
                error: function(xhr, status, error) {
                    console.error("Error al eliminar el estudiante:", error);
                    alert("Error al eliminar el estudiante");
                }
            });
        }
    });

    $("#modificarEstudianteForm").submit(function(event) {
        event.preventDefault();
    
        var formData = {
            ced_est: $("#cedula_modificar").val(),
            nom_est: $("#nom_est_modificar").val(),
            ape_est: $("#ape_est_modificar").val(),
            dir_est: $("#dir_est_modificar").val(),
            tel_est: $("#tel_est_modificar").val()
        };

        $.ajax({
            url: 'http://localhost/SOA/controller/apiRest.php',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(formData),
            dataType: 'json',
            success: function(response) {
                alert('Estudiante modificado con éxito');
                cargarDatos();
                $("#modificarPopup").css("display", "none");
            },
            error: function(xhr, status, error) {
                console.error('Error al modificar los datos:', error);
                alert('Error al modificar el estudiante.');
            }
        });
    });
});