package com.techblog.helper;

import java.sql.*;

public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnect() {
        try {
            if (con == null) {
                Class.forName("com.mysql.jdbc.Driver");

                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "123456");
                return con;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
