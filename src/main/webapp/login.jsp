<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <h1 class="text-center mb-4">Login</h1>
            <form action="login" method="post" class="card p-4 shadow-sm">
                <!-- Username -->
                <div class="mb-3">
                    <label for="username" class="form-label">Username:</label>
                    <input type="text" id="username" name="username" class="form-control" required>
                </div>

                <!-- Password -->
                <div class="mb-3">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" id="password" name="password" class="form-control" required>
                </div>

                <!-- Submit button -->
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Login</button>
                </div>
            </form>

            <!-- Register link -->
            <div class="mt-3 text-center">
                <a href="agregar-usuario.jsp" class="text-decoration-none">No tienes una cuenta? Regístrate aquí.</a>
            </div>
        </div>
    </div>
</div>

    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {%>
           <h3 style="color: darkred">*<%=error%></h3>
        <%}%>

</body>
</html>
