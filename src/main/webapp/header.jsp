<%@ page import="com.daza.api.servlet.loginweb.models.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="inicio.jsp">Logo</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="inicio.jsp">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="usuario?action=agregar">Agregar Usuario</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="usuario?action=listar">Listar Usuarios</a>
                </li>
            </ul>
            <div class="ml-auto">
                <% Usuario usuario = (Usuario) session.getAttribute("usuario");
                    if (usuario != null) { %>
                <span class="navbar-text">
                        Hola, <%= usuario.getNombre() %>
                    </span>
                <a class="btn btn-danger btn-sm" href="logout">Logout</a>
                <% } else { %>
                <a class="btn btn-primary" href="inicio.jsp">Login</a>
                <% } %>
            </div>
        </div>
    </nav>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
