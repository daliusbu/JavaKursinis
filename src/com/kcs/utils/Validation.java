package com.kcs.utils;

import java.sql.*;

public class Validation {

    public static boolean checkTruck(String tName, String tLicense){
        boolean status = false;
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vaztarastis",
             "root", "");
            System.out.println("Connection pavyko");

            if (con != null){
                System.out.println("Connected!");
                PreparedStatement ps = con.prepareStatement("SELECT * FROM truckdata WHERE truckModel = ? AND licenseNumber = ?");
                ps.setString(1, tName);
                ps.setString(2, tLicense);

                ResultSet rs = ps.executeQuery();
                status = rs.next();
            }
        } catch (SQLException e) {
            System.out.println("Shudas gaunasi su SQL prisijungimu");
        }

        return status;
    }
}
