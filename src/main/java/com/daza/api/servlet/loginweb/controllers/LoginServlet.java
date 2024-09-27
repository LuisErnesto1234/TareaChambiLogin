package com.daza.api.servlet.loginweb.controllers;

import com.daza.api.servlet.loginweb.dao.UsuarioDAO;
import com.daza.api.servlet.loginweb.models.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    UsuarioDAO dao = new UsuarioDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if (username != null && password != null) {
            Usuario usuario = dao.getUsuarioByUsernamePassword(username, password);
            if (usuario == null){
               req.setAttribute("error", "Usuario o contraseña incorrectos.");
               req.getRequestDispatcher("index.jsp").forward(req, resp);
            }else {
                HttpSession session = req.getSession();
                session.setAttribute("usuario", usuario);
                resp.sendRedirect("inicio.jsp");
            }
        }else {
            req.setAttribute("error", "Debe ingresar un nombre de usuario y una contraseña.");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }
}
