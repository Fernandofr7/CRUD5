<%@page import="CrudJavaWeb.ApiClient"%>
<%@page import="CrudJavaWeb.api"%>
<%@page import="java.net.http.HttpResponse"%>
<%@page import="java.net.URI"%>
<%@page import="java.net.http.HttpRequest"%>
<%@page import="java.net.http.HttpClient"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<!DOCTYPE html>
<html lang="es">
    <jsp:include page="head.jsp" />

    <body style="width: 80%; margin: auto;">
        <div>
            <jsp:include page="navbar.jsp" />
        </div>

        <form method="POST" autocomplete="off">
            <div class="mb-3">
                <label for="cedula" class="form-label">Cedula requerida</label>
                <input type="text" class="form-control" id="cedula" name="cedula">
            </div>
            <button type="submit" class="btn btn-primary">Buscar</button>
        </form>
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
                if (!(request.getMethod().equals("POST"))) {
                    return;
                }
                String id = "";
                try {
                    id = request.getParameter("cedula");
                    ApiClient apiClient = new ApiClient();
                    JSONObject jsonObject = apiClient.getUserById(id);

                    if (jsonObject == null) {
                        out.print("<br>");
                        out.print("<div class='alert alert-danger'" + "role='alert'>No encontrado</div>");
                        return;
                    } else {
                        out.print("<br>");
                        out.print("<div class='alert alert-success'" + "role='alert'>Buscados con exito</div>");
                    }
                    
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
            </tr>
            <%
                } catch (Exception e) {
                    out.print("<br>");
                    out.print("<div class='alert alert-success'" + "role='alert'>ERROR AL BUSCAR</div>"+e);
                }
            %>

            </tbody>

        </table>
    </body>

</html>
