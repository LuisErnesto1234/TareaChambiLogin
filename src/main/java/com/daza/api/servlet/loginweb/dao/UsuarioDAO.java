package com.daza.api.servlet.loginweb.dao;

import com.daza.api.servlet.loginweb.models.Usuario;
import com.daza.api.servlet.loginweb.utils.MySQLConexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    //TODO: constantes de consulta a la base de datos
    // TODO: métodos para interactuar con la base de datos (insertar, actualizar, eliminar, listar)
    private static final String SQL_SELECT = "SELECT * FROM tb_usuario";
    private static final String SQL_INSERT = "INSERT INTO tb_usuario (nombre, apellido, usuario, clave, imagen) VALUES (?, ?, ?, ?, ?);";
    private static final String SQL_UPDATE = "UPDATE tb_usuario SET nombre=?, apellido=?, usuario=?, clave=?, imagen=? WHERE id=?;";
    private static final String SQL_DELETE = "DELETE FROM tb_usuario WHERE id=?;";
    private static final String SQL_SELECT_BY_ID = "SELECT * FROM tb_usuario WHERE id=?;";
    private static final String SQL_SELECT_BY_USERNAME_PASSWORD = "SELECT * FROM tb_usuario WHERE usuario=? AND clave=?;";

    //TODO: métodos para obtener todos los resultados de la tabla en la base de datos
    public List<Usuario> getUsuarios() {
        List<Usuario> lista = new ArrayList<>();

        try(Connection cn = MySQLConexion.getConexion();
            PreparedStatement ps = cn.prepareStatement(SQL_SELECT);
            ResultSet rs = ps.executeQuery()){

            while (rs.next()){
                Usuario usuario = new Usuario(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("apellido"),
                        rs.getString("usuario"),
                        rs.getString("clave"),
                        rs.getBytes("imagen"));

                lista.add(usuario);
            }


    }catch (SQLException e){
        e.printStackTrace();
    }
        return lista;
    }

    public void insertUsuario(Usuario usuario){
        try (Connection cn = MySQLConexion.getConexion();
            PreparedStatement ps = cn.prepareStatement(SQL_INSERT)){

            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getApellido());
            ps.setString(3, usuario.getUsername());
            ps.setString(4, usuario.getPassword());
            ps.setBytes(5, usuario.getImagen());

            ps.executeUpdate();

        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void updateUsuario(Usuario usuario){
        try (Connection cn = MySQLConexion.getConexion();
        PreparedStatement ps = cn.prepareStatement(SQL_UPDATE)){
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getApellido());
            ps.setString(3, usuario.getUsername());
            ps.setString(4, usuario.getPassword());
            ps.setBytes(5, usuario.getImagen());
            ps.setInt(6, usuario.getId());
            ps.executeUpdate();

        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void deleteUsuario(int id){
        try (Connection cn = MySQLConexion.getConexion();
        PreparedStatement ps = cn.prepareStatement(SQL_DELETE)){
            ps.setInt(1, id);
            ps.executeUpdate();

        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public Usuario getUsuarioById(int id){
        Usuario usuario = null;

        try (Connection cn = MySQLConexion.getConexion();
             PreparedStatement ps = cn.prepareStatement(SQL_SELECT_BY_ID)){

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()){
                usuario = new Usuario(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("apellido"),
                        rs.getString("usuario"),
                        rs.getString("clave"),
                        rs.getBytes("imagen"));
            }

        }catch (SQLException e){
            e.printStackTrace();
        }

        return usuario;
    }

    public Usuario getUsuarioByUsernamePassword(String username, String password){

        Usuario usuario = null;

        try(Connection cn = MySQLConexion.getConexion();
        PreparedStatement ps = cn.prepareStatement(SQL_SELECT_BY_USERNAME_PASSWORD)){
            ps.setString(1, username);
            ps.setString(2, password);
            try(ResultSet rs = ps.executeQuery()){
                if (rs.next()){
                    usuario = new Usuario(
                            rs.getInt("id"),
                            rs.getString("nombre"),
                            rs.getString("apellido"),
                            rs.getString("usuario"),
                            rs.getString("clave"),
                            rs.getBytes("imagen"));
                }
            }

        }catch (SQLException e){
            e.printStackTrace();
        }

        return usuario;
    }

}
