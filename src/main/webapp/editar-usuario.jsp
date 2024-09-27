<%@ page import="com.daza.api.servlet.loginweb.models.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edita el Usuario</title>
</head>
<body>
<jsp:include page="header.jsp"/>

<%
    Usuario usuario = (Usuario) request.getAttribute("usuario");
%>

<div class="contenedor" style="width: 80%">
    <h1>Edita el Usuario</h1>
    <form action="usuario?action=editar" method="post">
        <input type="hidden" value="<%=usuario.getId()%>">
        <div>
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" value="<%= usuario.getNombre() %>" required>
        </div>
        <div>
            <label for="apellido">Apellido:</label>
            <input type="text" id="apellido" name="apellido" value="<%= usuario.getApellido() %>" required>
        </div>
        <div>
            <label for="usuario">Usuario:</label>
            <input type="text" id="usuario" name="username" value="<%= usuario.getUsername()%>" required>
        </div>
        <div>
            <label for="password">Contraseña:</label>
            <input type="password" id="password" name="password" value="<%= usuario.getPassword() %>" required>
        </div>
        <div>
            <label for="imagen">Imagen: </label>
            <input type="image" name="imagen" id="imagen" value="<%= usuario.getImagen() %>" alt="imagen" required>
        </div>
        <input type="submit" value="Actualizar">
    </form>
</div>
<a href="usuario?action=listar">Volver al listado</a>
</body>
</html>
