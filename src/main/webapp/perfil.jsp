<%@ page import="com.daza.api.servlet.loginweb.models.Usuario" %>
<%@ page import="java.util.Base64" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Perfil de Usuario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/sidebars.css">
</head>
<body>

<div class="main-container">

    <div class="sidebar">
        <jsp:include page="sidebar.jsp"/>
    </div>
    <div class="content">
        <%
            Usuario usuario = (Usuario) session.getAttribute("usuario");
            if (usuario != null) {%>
        <section class="vh-100" style="background-color: #f4f5f7;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-lg-6 mb-4 mb-lg-0">
                        <div class="card mb-3" style="border-radius: .5rem;">
                            <div class="row g-0">
                                <div class="col-md-4 gradient-custom text-center text-white"
                                     style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
                                    <%
                                        byte[] imagenBytes = usuario.getImagen();
                                        String base64Image = Base64.getEncoder().encodeToString(imagenBytes);
                                    %>
                                    <img src="data:image/jpeg;base64,<%=base64Image%>"
                                         alt="Avatar" class="img-fluid my-5" style="width: 80px;"/>
                                    <h5><%=usuario.getNombre()%>
                                    </h5>
                                    <p>Usuario Registrado</p>
                                    <i class="far fa-edit mb-5"></i>
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body p-4">
                                        <h6>Información</h6>
                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Nombres</h6>
                                                <p class="text-muted"><%=usuario.getNombre()%>
                                                </p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>Apellidos</h6>
                                                <p class="text-muted"><%=usuario.getApellido()%>
                                                </p>
                                            </div>
                                        </div>
                                        <h6>Adicionales</h6>
                                        <hr class="mt-0 mb-4">
                                        <div class="row pt-1">
                                            <div class="col-6 mb-3">
                                                <h6>Usuario</h6>
                                                <p class="text-muted"><%=usuario.getUsername()%>
                                                </p>
                                            </div>
                                            <div class="col-6 mb-3">
                                                <h6>ID</h6>
                                                <p class="text-muted"><%=usuario.getId()%>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-start">
                                            <a href="#"><i class="fab fa-facebook-f fa-lg me-3"></i></a>
                                            <a href="#"><i class="fab fa-twitter fa-lg me-3"></i></a>
                                            <a href="#"><i class="fab fa-instagram fa-lg"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%}%>
    </div>
</div>
</body>
</html>
