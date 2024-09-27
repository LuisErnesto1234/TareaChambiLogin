<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h1>Login</h1>
    <form action="login" method="post">
        <div>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div>
            <input type="submit" value="Login">
        </div>
    </form>

    <div>
        <a href="agregar-usuario.jsp">No tienes una cuenta? Regístrate aquí.</a>
    </div>

    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {%>
           <h3 style="color: darkred">*<%=error%></h3>
        <%}%>

</body>
</html>
