package com.daza.api.servlet.loginweb.controllers;

import com.daza.api.servlet.loginweb.models.Usuario;
import com.daza.api.servlet.loginweb.service.UsuarioService;
import com.daza.api.servlet.loginweb.service.UsuarioServiceImp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.util.List;

@WebServlet("/usuario")
@MultipartConfig
public class UsuarioServlet extends HttpServlet {

    //TODO: Instancia de un service 🍵
    UsuarioService service = new UsuarioServiceImp();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action != null) {
            switch (action) {
                case "listar":
                    listar(req, resp);
                    break;
                case "eliminar":
                    eliminar(req, resp);
                    break;
                case "editar":
                    mostrarFormulario(req, resp);
                    break;
                default:
                    resp.sendRedirect("inicio.jsp");
                    break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action != null) {
            switch (action) {
                case "agregar":
                    agregar(req, resp);
                    break;
                case "editar":
                    editar(req, resp);
                    break;
                default:
                    resp.sendRedirect("inicio.jsp");
                    break;
            }
        }
    }

    private void editar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String nombre = req.getParameter("nombre");
        String apellido = req.getParameter("apellido");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Part imagenPart = req.getPart("imagen");
        byte [] imagenBytes = null;

        if (imagenPart != null && imagenPart.getSize() > 0){
            imagenBytes = imagenPart.getInputStream().readAllBytes();
        }

        Usuario usuario = new Usuario(id, nombre, apellido, username, password, imagenBytes);
        service.actualizarUsuario(usuario);
        resp.sendRedirect("usuario?action=listar");

    }

    private void agregar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nombre = req.getParameter("nombre");
        String apellido = req.getParameter("apellido");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Part imagenPart = req.getPart("imagenPart");
        byte [] imagenBytes = imagenPart.getInputStream().readAllBytes();

        Usuario usuario = new Usuario(0, nombre, apellido, username, password, imagenBytes);
        service.insertarUsuario(usuario);
        resp.sendRedirect("usuario?action=listar");
    }

    private void mostrarFormulario(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Usuario usuario = service.obtenerUsuarioPorId(id);
        req.setAttribute("usuario", usuario);
        req.getRequestDispatcher("editar-usuario.jsp").forward(req, resp);
    }

    private void eliminar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        int id = Integer.parseInt(req.getParameter("id"));
        service.obtenerUsuarioPorId(id);
        resp.sendRedirect("usuario?action=listar");

    }

    private void listar(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        List<Usuario> usuarioList = service.obtenerUsuarios();
        req.setAttribute("usuarios", usuarioList);
        req.getRequestDispatcher("listar-usuarios.jsp");
    }
}
