package com.daza.api.servlet.loginweb.service;

import com.daza.api.servlet.loginweb.models.Usuario;

import java.util.List;

public interface UsuarioService {
    List<Usuario> obtenerUsuarios();
    void insertarUsuario(Usuario usuario);
    void actualizarUsuario(Usuario usuario);
    void eliminarUsuario(int id);
    Usuario obtenerUsuarioPorUsernamePorPassword(String username, String password);
    Usuario obtenerUsuarioPorId(int id);
}
