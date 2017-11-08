package com.kcs.Services;

import com.kcs.Objects.Truck;
import com.kcs.Objects.User;
import com.kcs.utils.ConnectToDB;
import com.sun.org.apache.xpath.internal.operations.Bool;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TruckServices {

    public static List<Truck> getAllTrucks() {
        List<Truck> allTrucks = new ArrayList<>();
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
                ResultSet rs = st.executeQuery("SELECT * FROM truckdata");
                while (rs.next()) {
                    Truck truck = new Truck(rs.getInt("id"), rs.getString("truckModel"),
                     rs.getString("licenseNumber"), rs.getDouble("fuelStanding"),
                     rs.getDouble("fuelDriving"), rs.getDouble("fuelLoading"));
                    allTrucks.add(truck);
                }
            }
        } catch (SQLException e) {
            System.out.println("Shudas gaunasi su SQL prisijungimu");
        }
        return allTrucks;
    }

    public static List<Truck> getTruckById(int id) {
        List<Truck> allTrucks = new ArrayList<>();
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
                ResultSet rs = st.executeQuery("SELECT * FROM truckdata WHERE id = '" + id + "'");
                while (rs.next()) {
                    Truck truck = new Truck(rs.getInt("id"), rs.getString("truckModel"),
                     rs.getString("licenseNumber"), rs.getDouble("fuelStanding"),
                     rs.getDouble("fuelDriving"), rs.getDouble("fuelLoading"));
                    allTrucks.add(truck);
                }
            }
        } catch (SQLException e) {
            System.out.println("Shudas gaunasi su SQL prisijungimu");
        }
        return allTrucks;
    }

    public static Boolean truckAdd(Truck truck) {
        Statement st = ConnectToDB.connect();
        String brand = truck.getBrand();
        Boolean updateSuccess = false;

        if (st != null) {
            try {
                st.execute("INSERT INTO truckdata (truckModel, licenseNumber, fuelStanding, fuelDriving," +
                 " fuelLoading) " +
                 "VALUES ('" + truck.getBrand() + "', '" + truck.getLicense() + "', '" + truck.getFuelStanding() +
                 "', '" + truck.getFuelDriving() + "', '" + truck.getFuelLoading() + "')");
                updateSuccess = true;
            } catch (SQLException e) {
                e.printStackTrace();
            }
//              Jeigu SQL komanda pavyko - nustatom metodo grazinama rezultata TRUE

        }
        return updateSuccess;
    }

    public static Boolean truckChange(Truck truck) {
        Statement st = ConnectToDB.connect();
        Boolean updateSuccess = false;

        if (st != null) {
            try {
                st.execute("UPDATE truckdata " +
                 "SET truckModel = '" + truck.getBrand() + "', licenseNumber = '" + truck.getLicense() +
                 "', fuelStanding = '" + truck.getFuelStanding() + "', fuelDriving = '" + truck.getFuelDriving() +
                 "', fuelLoading = '" + truck.getFuelLoading() + "' WHERE id = '" + truck.getId() + "'");
                updateSuccess = true;
            } catch (SQLException e) {
                e.printStackTrace();
            }
//              Jeigu SQL komanda pavyko - nustatom metodo grazinama rezultata TRUE

        }
        return updateSuccess;
    }

}
