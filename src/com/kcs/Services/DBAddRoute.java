package com.kcs.Services;

import java.sql.*;

public class DBAddRoute {

    public boolean addRoute(String driver, String destination, String date){
        boolean updateSuccess = false;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vaztarastis",
             "root", "");

            if (con != null){
                System.out.println("Prisijungimas prie duomenu bazes pavyko");
                Statement st = con.createStatement();

//               st.execute("INSERT INTO routeData (destination, driver) VALUES ('" +
//                destination + "', '" + driver + ")");
                st.execute("INSERT INTO routeData (destination, driver, date) " +
                  "VALUES ('" + destination+ "', '" + driver + "', '" + date + "')");
                System.out.println("Rute sent to the database, driver: " + driver +
                 ", Detination: " + destination);
                updateSuccess = true;
            }
        } catch (SQLException e) {
            System.out.println("Shudas gaunasi su SQL prisijungimu" + e);
        }
        return updateSuccess;
    }
}
