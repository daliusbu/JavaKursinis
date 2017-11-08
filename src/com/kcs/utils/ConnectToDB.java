package com.kcs.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectToDB {

    public static Statement connect() {
        Statement st = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vaztarastis",
             "root", "");
            if (con != null) {
                System.out.println("Prisijungimas prie duomenu bazes pavyko");
                st = con.createStatement();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return st;
    }
}
