package com.kcs.Services;

import com.kcs.Objects.TruckRoute;
import com.sun.org.apache.bcel.internal.generic.Select;

import java.sql.*;
import java.time.LocalTime;

public class DBAddRoute {

    public boolean addRoute(TruckRoute truckRoute) {
        boolean updateSuccess = false;
        double fuelStand;
        double fuelDrive;
        double fuelLoad;
        double fuelUsed = 0;
        int distance;

//      Paskaiciuojam nuvaziuota atstuma marsruto metu
        distance = Calculations.calcDist(truckRoute);

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

                ResultSet rs = st.executeQuery("SELECT fuelStanding,fuelDriving, fuelLoading FROM truckdata " +
                 "WHERE licenseNumber = '" + truckRoute.gettLicense() + "'");

                if (rs.next()) {
//                  Gaunam kuro sanaudas vairuotojo pasirinktam automobiliui is automobiliu lenteles auombazeje
                    fuelStand = rs.getDouble("fuelStanding");
                    fuelDrive = rs.getDouble("fuelDriving");
                    fuelLoad = rs.getDouble("fuelLoading");
//                  Paskaicuojam sunaudota kura marsruto metu
                    fuelUsed = Calculations.calcFuel(truckRoute, fuelStand, fuelDrive, fuelLoad);
                }
//              Siunciam visus duomenis i marsrutu lentele
                st.execute("INSERT INTO routeData (licenseNumber, userId, date, deparTime, deparOdo," +
                 " destination, arriveTime, loadTime, leaveTime, returnTime, returnOdo, distance, fuelUsed) " +
                 "VALUES ('" + truckRoute.gettLicense() + "', '" + truckRoute.getUserId() + "', '" +
                 truckRoute.getDate() + "', '" + truckRoute.getDepartTime() + "', '" + truckRoute.getDepartOdo() +
                 "', '" + truckRoute.getDestination() + "', '" + truckRoute.getArriveTime() + "', '" +
                 truckRoute.getLoadTime() + "', '" + truckRoute.getLeaveTime() + "', '" +
                 truckRoute.getReturnTime() + "', '" + truckRoute.getReturnOdo() + "', '" + distance + "', '" + fuelUsed + "')");
//              Jeigu SQL komanda pavyko - nustatom metodo grazinama rezultata TRUE
                updateSuccess = true;
            }
        } catch (SQLException e) {
            System.out.println("Shudas gaunasi su SQL prisijungimu" + e);
        }
        return updateSuccess;
    }
}
