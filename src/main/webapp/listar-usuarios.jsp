<%@ page import="java.util.List" %>
<%@ page import="com.daza.api.servlet.loginweb.models.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Listado de usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<jsp:include page="header.jsp"/>

    <%
        List<Usuario> usuarioList = (List<Usuario>) request.getAttribute("usuarios");
        if (usuarioList.isEmpty()){%>
            <h2>No hay usuarios registrados</h2>
        <% } else { %>
<!-- Table section -->
<div class="contenedor">

    <h2 class="text-center">Listado de usuarios</h2>
<div class="row">
    <div class="col">
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Imagen</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Usuario</th>
                    <th>Password</th>
                    <th>Acciones</th>
                </tr>
                </thead>
                <tbody>

                    <%for (Usuario usuario : usuarioList){
                    byte[] imagen = usuario.getImagen();
                    String imagenBase64 = java.util.Base64.getEncoder().encodeToString(imagen);%>
                    <tr>
                    <td><%=usuario.getId()%></td>
                    <td><img src="data:image/jpeg;base64,<%= imagenBase64 %>" alt="Imagen del libro" width="100"/></td>
                    <td><%=usuario.getNombre()%></td>
                    <td><%=usuario.getApellido()%></td>
                    <td><%=usuario.getUsername()%></td>
                    <td>*************</td> <!-- Password desaparecida -->
                        <td>
                            <a href="usuario?action=editar&id=<%=usuario.getId()%>" class="btn btn-sm btn-warning">Editar</a>
                            <a href="usuario?action=eliminar&id=<%=usuario.getId()%>" class="btn btn-sm btn-danger" onclick="return confirm('¿Estás seguro de que deseas eliminar a <%=usuario.getNombre()%> usuario?');">Eliminar</a>
                        </td>
                </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </div>
    <%}%>
</div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
