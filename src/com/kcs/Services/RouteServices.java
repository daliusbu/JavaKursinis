package com.kcs.Services;

import com.kcs.Objects.TruckRoute;
import org.eclipse.persistence.annotations.Convert;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RouteServices {

    public static List<TruckRoute> getRoutesByUserDate(int Id, String DateStart, String DateEnd) {
        int id = Id;
        String dateStart = DateStart;
        String dateEnd = DateEnd;
        List<TruckRoute> truckRoutes = new ArrayList<>();

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vaztarastis",
             "root", "");

            if (con != null) {
                PreparedStatement ps = con.prepareStatement("SELECT * FROM routedata AS a INNER JOIN users AS b ON " +
                 "a.userId = b.id WHERE a.userId = ? AND a.date >= ? AND a.date <= ?");
                ps.setInt(1, id);
                ps.setString(2, dateStart);
                ps.setString(3, dateEnd);

                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    TruckRoute tr = new TruckRoute();
                    tr.settLicense(rs.getString("licenseNumber"));
                    tr.setDate(rs.getString("date"));
                    tr.setDestination(rs.getString("destination"));
                    tr.setDepartTime(rs.getTime("deparTime").toLocalTime());
                    tr.setDepartOdo(rs.getInt("deparOdo"));
                    tr.setArriveTime(rs.getTime("arriveTime").toLocalTime());
                    tr.setLoadTime(rs.getTime("loadTime").toLocalTime());
                    tr.setLeaveTime(rs.getTime("leaveTime").toLocalTime());
                    tr.setReturnTime(rs.getTime("returnTime").toLocalTime());
                    tr.setReturnOdo(rs.getInt("returnOdo"));
                    tr.setDistance(rs.getInt("distance"));
                    tr.setFuelUsed(rs.getDouble("fuelUsed"));
                    tr.setDriverName(rs.getString("name"));

                    truckRoutes.add(tr);
                }
            }
        } catch (SQLException e) {
            System.out.println("Shudas gaunasi su SQL prisijungimu" + e);
        }
        return truckRoutes;
    }
}
