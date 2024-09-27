package com.daza.api.servlet.loginweb.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConexion {

    //TODO: constantes de uso
    private static final String URL = "jdbc:mysql://localhost:3306/db_login";
    private static final String USER = "root";
    private static final String PASSWORD = "mysql";

    public static Connection getConexion(){
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
}
