package com.kcs.Services;

import com.kcs.Objects.TruckRoute;
import org.eclipse.persistence.annotations.Convert;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;

import static java.time.temporal.ChronoUnit.HOURS;
import static java.time.temporal.ChronoUnit.MINUTES;

public class Calculations {

//  Metodas nuvaziuoto atstumo paskaiciavimui pagal duomenis is TruckRoute objekto
    public static int calcDist(TruckRoute truckRoute) {
        int distance = 0;
        distance = truckRoute.getReturnOdo() - truckRoute.getDepartOdo();
        return distance;
    }


//  Metodas sunaudoto kuro paskaiciavimui pagal duomenis is TruckRoute objekto ir automobilio lenteles duombazeje
    public static double calcFuel(TruckRoute truckRoute, double fuelStand, double fuelDrive, double fuelLoad) {

        double fuelUsedStanding;
        double fuelUsedDriving;
        double fuelUsedLoading;
        double fuelUsedTotal = 0;

        LocalTime departTime = truckRoute.getDepartTime();
        LocalTime arriveTime = truckRoute.getArriveTime();
        LocalTime leaveTime = truckRoute.getLeaveTime();
        LocalTime returnTime = truckRoute.getReturnTime();
        LocalTime timeZero = LocalTime.MIDNIGHT; //Atskaitos taskas stovejimo trukmei paskaiciuoti

        double loadDuration = (double)(timeZero.until(truckRoute.getLoadTime(), MINUTES))/60;
        double driveDuration = (double)(departTime.until(arriveTime, MINUTES) + leaveTime.until(returnTime, MINUTES)) / 60;
        double standDuration = ((double)arriveTime.until(leaveTime, MINUTES) / 60 - loadDuration);

        fuelUsedDriving = fuelDrive * driveDuration;
        fuelUsedLoading = fuelLoad * loadDuration;
        fuelUsedStanding = fuelStand * standDuration;
        fuelUsedTotal = fuelUsedDriving + fuelUsedLoading + fuelUsedStanding;

        return fuelUsedTotal;
    }
}
