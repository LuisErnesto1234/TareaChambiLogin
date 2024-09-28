<%@ page import="com.daza.api.servlet.loginweb.models.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edita el Usuario</title>
</head>
<body>
<%
    Usuario usuario = (Usuario) request.getAttribute("usuario");
%>
<div class="main-container">
    <div class="sidebar">
        <jsp:include page="sidebar.jsp"/>
    </div>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h1 class="text-center mb-4">Edita el Usuario</h1>
                <form action="usuario?action=editar" method="post" enctype="multipart/form-data" class="card p-4 shadow-sm">
                    <!-- Campo oculto: ID -->
                    <input type="hidden" name="id" value="<%=usuario.getId()%>">

                    <!-- Nombre -->
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre:</label>
                        <input type="text" id="nombre" name="nombre" class="form-control" value="<%= usuario.getNombre() %>" required>
                    </div>

                    <!-- Apellido -->
                    <div class="mb-3">
                        <label for="apellido" class="form-label">Apellido:</label>
                        <input type="text" id="apellido" name="apellido" class="form-control" value="<%= usuario.getApellido() %>" required>
                    </div>

                    <!-- Usuario -->
                    <div class="mb-3">
                        <label for="usuario" class="form-label">Usuario:</label>
                        <input type="text" id="usuario" name="username" class="form-control" value="<%= usuario.getUsername() %>" required>
                    </div>

                    <!-- Contraseña -->
                    <div class="mb-3">
                        <label for="password" class="form-label">Contraseña:</label>
                        <input type="password" id="password" name="password" class="form-control" value="<%= usuario.getPassword() %>" required>
                    </div>

                    <!-- Imagen -->
                    <div class="mb-3">
                        <label for="imagen" class="form-label">Imagen:</label>
                        <input type="file" id="imagen" name="imagen" class="form-control">
                    </div>

                    <!-- Botón de actualizar -->
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">Actualizar</button>
                    </div>
                </form>

                <!-- Enlace para volver al listado -->
                <div class="mt-3 text-center">
                    <a href="usuario?action=listar" class="btn btn-link">Volver al listado</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
