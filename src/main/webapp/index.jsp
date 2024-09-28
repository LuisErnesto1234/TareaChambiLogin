<%@ page import="java.util.List" %>
<%@ page import="com.daza.api.servlet.loginweb.models.Usuario" %>
<%@ page import="com.daza.api.servlet.loginweb.service.UsuarioService" %>
<%@ page import="com.daza.api.servlet.loginweb.service.UsuarioServiceImp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Inicio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/sidebars.css" type="text/css">
</head>
<body>

<div class="main-container">
    <div class="sidebar">
        <%@ include file="sidebar.jsp" %>
    </div>

    <div class="content" id="content">
        <%
            UsuarioService service = new UsuarioServiceImp();
            List<Usuario> listaUsuarios = service.obtenerUsuarios();
        %>

        <div class="row bg-dark text-white p-3 mb-4">
            <div class="col">
                <h1 class="text-center">Dashboard de Usuarios</h1>
            </div>
        </div>

        <!-- Cards section -->
        <div class="row mb-4" style="justify-content: center; align-items: center">
            <div class="col-lg-3 col-md-6 mb-3">
                <div class="card text-white bg-primary">
                    <div class="card-body">
                        <h5 class="card-title">Total de Usuarios</h5>
                        <p class="card-text"><%=listaUsuarios.size()%>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-3">
                <div class="card text-white bg-success">
                    <div class="card-body">
                        <h5 class="card-title">Usuarios Activos</h5>
                        <p class="card-text"><%=listaUsuarios.size()%>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-3">
                <div class="card text-white bg-warning">
                    <div class="card-body">
                        <h5 class="card-title">Usuarios Inactivos</h5>
                        <p class="card-text">2</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-3">
                <div class="card text-white bg-primary">
                    <div class="card-body">
                        <h5 class="card-title">Inicia sesión</h5>
                        <a style="color: #f4f4f4" href="login.jsp" class="card-text">Clic</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>