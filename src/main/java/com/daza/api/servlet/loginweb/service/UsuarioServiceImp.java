package com.daza.api.servlet.loginweb.service;

import com.daza.api.servlet.loginweb.dao.UsuarioDAO;
import com.daza.api.servlet.loginweb.models.Usuario;

import java.util.List;

public class UsuarioServiceImp implements UsuarioService{

    //TODO: Instancia de un dao
    UsuarioDAO dao = new UsuarioDAO();

    @Override
    public List<Usuario> obtenerUsuarios() {
        return dao.getUsuarios();
    }

    @Override
    public void insertarUsuario(Usuario usuario) {
        dao.insertUsuario(usuario);
    }

    @Override
    public void actualizarUsuario(Usuario usuario) {
        dao.updateUsuario(usuario);
    }

    @Override
    public void eliminarUsuario(int id) {
        dao.deleteUsuario(id);
    }

    @Override
    public Usuario obtenerUsuarioPorUsernamePorPassword(String username, String password) {
        return dao.getUsuarioByUsernamePassword(username, password);
    }

    @Override
    public Usuario obtenerUsuarioPorId(int id) {
        return dao.getUsuarioById(id);
    }
}
