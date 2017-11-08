package com.kcs.utils;

import java.sql.*;

public class Validation {

    public static String checkTruck(String tLicense){
        String tName = null;
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vaztarastis",
             "root", "");
            System.out.println("Connection pavyko");

            if (con != null){
                System.out.println("Connected!");
                PreparedStatement ps = con.prepareStatement("SELECT * FROM truckdata WHERE licenseNumber = ?");
                ps.setString(1, tLicense);

                ResultSet rs = ps.executeQuery();
                rs.next();
                tName = rs.getString("truckModel");
            }
        } catch (SQLException e) {
            System.out.println("Shudas gaunasi su SQL prisijungimu");
        }

        return tName;
    }
}
