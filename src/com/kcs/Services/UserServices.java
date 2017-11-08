package com.kcs.Services;

import com.kcs.Objects.Truck;
import com.kcs.Objects.User;
import com.kcs.utils.ConnectToDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserServices {
    int id;
    String name;
    String password;
    String role;

    public List<User> getAllDrivers() {
        List<User> allDrivers = new ArrayList<User>();


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
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT id, name FROM users WHERE role = 'driver'");
                while (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    allDrivers.add(user);
                }
            }
        } catch (SQLException e) {
            System.out.println("Shudas gaunasi su SQL prisijungimu");
        }
        return allDrivers;
    }

    public static Boolean userAdd(User user) {
        Statement st = ConnectToDB.connect();
        Boolean updateSuccess = false;
        if (st != null) {
            try {
                st.execute("INSERT INTO users (name, pass, role) " +
                 "VALUES ('" + user.getName() + "', '" + user.getPassword() + "', '" + user.getRole()
                 + "')");
                updateSuccess = true;
            } catch (SQLException e) {
                e.printStackTrace();
            }
//              Jeigu SQL komanda pavyko - nustatom metodo grazinama rezultata TRUE
        }
        return updateSuccess;
    }
}
