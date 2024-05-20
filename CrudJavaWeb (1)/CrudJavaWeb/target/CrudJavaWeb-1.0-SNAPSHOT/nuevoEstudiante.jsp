<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.net.http.HttpResponse" %>
<%@ page import="CrudJavaWeb.ApiClient" %>

<%
    if (request.getMethod().equals("POST")) {
        // Obtiene los parámetros del formulario
        String cedula = request.getParameter("cedula");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");

        // Crea una instancia de UserService
        ApiClient userService = new ApiClient();

        try {
            // Llama a registerUser
            HttpResponse<String> respuesta = userService.registerUser(cedula, nombre, apellido, direccion, telefono);

            // Maneja la respuesta
            if (userService.getResponseStatusCode(respuesta) == 200) {
                out.println("<script>");
                out.println("alert('Estudiante registrado exitosamente.');");
                // Recarga la página del índice
                out.println("window.location.href = 'index.jsp';");
                out.println("</script>");
                //response.sendRedirect("index.jsp");
                //out.print("<br>");
                //out.print("<div class='alert alert-success' role='alert'>Registrado con exito</div>");
            } else {
                out.print("<br>");
                out.print("<div class='alert alert-danger' role='alert'>Error al registrar</div>");
            }
        } catch (IOException | InterruptedException e) {
            // Manejo de errores
            e.printStackTrace();
            out.print("<br>");
            out.print("<div class='alert alert-danger' role='alert'>Error al registrar</div>");
        }
    }
%>
