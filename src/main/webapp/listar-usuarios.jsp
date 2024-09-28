<%@ page import="java.util.List" %>
<%@ page import="com.daza.api.servlet.loginweb.models.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Listado de usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/sidebars.css">
</head>
<body>

    <div class="main-container">
        <div class="sidebar">
            <jsp:include page="sidebar.jsp"/>
        </div>
        <%
            List<Usuario> usuarios = (List<Usuario>) request.getAttribute("usuarios");
            if (usuarios != null){%>
        <div class="content">
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

                            <%
                                for (Usuario usuario : usuarios) {
                            %>
                            <tr>
                                <td><%=usuario.getId()%>
                                </td>
                                <!-- Mostrar imagen -->
                                <%
                                    try {
                                        byte[] imagenBytes = usuario.getImagen();
                                        if (imagenBytes != null) {
                                            String imagenBase64 = java.util.Base64.getEncoder().encodeToString(imagenBytes);
                                %>
                                <td><img src="data:image/jpeg;base64,<%= imagenBase64 %>" alt="Imagen de <%= usuario.getNombre() %>" width="100"/></td>
                                <%} else {
                                            System.out.println("Sin imagen");%>
                                            <td><img src="#" alt="imagen"></td>
                                        <%}
                                    } catch (Exception e) {
                                        System.out.println("Error al cargar la imagen");
                                    }
                                %>


                                <td><%=usuario.getNombre()%>
                                </td>
                                <td><%=usuario.getApellido()%>
                                </td>
                                <td><%=usuario.getUsername()%>
                                </td>
                                <td>*************</td> <!-- Password desaparecida -->
                                <td>
                                    <a href="usuario?action=editar&id=<%=usuario.getId()%>"
                                       class="btn btn-sm btn-warning">Editar</a>
                                    <a href="usuario?action=eliminar&id=<%=usuario.getId()%>"
                                       class="btn btn-sm btn-danger"
                                       onclick="return confirm('¿Estás seguro de que deseas eliminar a <%=usuario.getNombre()%> usuario?');">Eliminar</a>
                                </td>
                            </tr>
                            <%}%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <% } else { %>
        <h2 class="text-center">No hay usuarios registrados</h2>
    <%}%>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/sidebars.js"></script>
</body>
</html>
