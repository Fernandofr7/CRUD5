<%-- 
    Document   : guardarCambios
    Created on : 13 may 2024, 18:46:05
    Author     : stalin
--%>
<%@ page import="CrudJavaWeb.ApiClient" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.net.http.HttpResponse" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    
    String cedula = request.getParameter("cedula");
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String direccion = request.getParameter("direccion");
    String telefono = request.getParameter("telefono");

    // Crear una instancia 
    ApiClient apiClient = new ApiClient();

    try {

        HttpResponse<String> responsee = apiClient.updateUser(cedula, nombre, apellido, direccion, telefono);

        int statusCode = apiClient.getResponseStatusCode(responsee);
        if (statusCode == 200) {

            response.getWriter().println("Cambios guardados con éxito");
        } else {

            response.getWriter().println("Error al guardar los cambios");
        }
    } catch (IOException | InterruptedException e) {
        e.printStackTrace();
        response.getWriter().println("Error al procesar la solicitud");
    }
%>
