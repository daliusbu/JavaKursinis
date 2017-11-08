package com.kcs.utils;

import com.kcs.Objects.User;

import java.sql.*;

public class LoginDao {

    public static User validate(String name, String pass){
        int userId;
        String userRole;
        User user = new User();

        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vaztarastis",
             "root", "");
            System.out.println("Connection pavyko");

            if (con != null){
                System.out.println("Connected!");
                PreparedStatement ps = con.prepareStatement("SELECT id, role FROM users WHERE name = ? AND pass = ?");
                ps.setString(1, name);
                ps.setString(2, pass);

                ResultSet rs = ps.executeQuery();
                while (rs.next()){
                    user.setId(rs.getInt("id"));
                    user.setRole(rs.getString("role"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Shudas gaunasi su SQL prisijungimu");
        }

        return user;
    }
}
