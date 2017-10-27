package com.kcs.utils;

import java.sql.*;

public class LoginDao {

    public static int validate(String name, String pass){
        int userId = 0;
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vaztarastis",
             "root", "");
            System.out.println("Connection pavyko");

            if (con != null){
                System.out.println("Connected!");
                PreparedStatement ps = con.prepareStatement("SELECT id FROM users WHERE name = ? AND pass = ?");
                ps.setString(1, name);
                ps.setString(2, pass);

                ResultSet rs = ps.executeQuery();
                while (rs.next()){
                    userId = rs.getInt("id");
                }
            }
        } catch (SQLException e) {
            System.out.println("Shudas gaunasi su SQL prisijungimu");
        }

        return userId;
    }
}
