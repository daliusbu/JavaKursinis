package com.kcs.Objects;

import java.time.LocalTime;

public class TruckRoute {
    String tLicense;
    int userId;
    String date;
    String destination;
    String driverName;
    LocalTime departTime;
    LocalTime arriveTime;
    LocalTime loadTime;
    LocalTime leaveTime;
    LocalTime returnTime;
    int departOdo;
    int returnOdo;
    int distance;
    double fuelStand;
    double fuelLoad;
    double fuelDrive;
    double fuelUsed;

    public TruckRoute() {
    }

    public TruckRoute(String tLicense, int userId, String date, LocalTime departTime, int departOdo,
                      String destination, LocalTime arriveTime, LocalTime loadTime, LocalTime leaveTime,
                      LocalTime returnTime, int returnOdo) {
        this.tLicense = tLicense;
        this.userId = userId;
        this.date = date;
        this.departTime = departTime;
        this.departOdo = departOdo;
        this.destination = destination;
        this.arriveTime = arriveTime;
        this.loadTime = loadTime;
        this.leaveTime = leaveTime;
        this.returnTime = returnTime;
        this.returnOdo = returnOdo;
    }

    public TruckRoute(String tLicense, int userId, String date, LocalTime departTime, int departOdo,
                      String destination, LocalTime arriveTime, LocalTime loadTime, LocalTime leaveTime,
                      LocalTime returnTime, int returnOdo, int distance, double fuelStand, double fuelLoad,
                      double fuelDrive, double fuelUsed) {
        this.tLicense = tLicense;
        this.userId = userId;
        this.date = date;
        this.departTime = departTime;
        this.departOdo = departOdo;
        this.destination = destination;
        this.arriveTime = arriveTime;
        this.loadTime = loadTime;
        this.leaveTime = leaveTime;
        this.returnTime = returnTime;
        this.returnOdo = returnOdo;
        this.distance = distance;
        this.fuelStand = fuelStand;
        this.fuelLoad = fuelLoad;
        this.fuelDrive = fuelDrive;
        this.fuelUsed = fuelUsed;
    }

    public String gettLicense() {
        return tLicense;
    }

    public void settLicense(String tLicense) {
        this.tLicense = tLicense;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public LocalTime getDepartTime() {
        return departTime;
    }

    public void setDepartTime(LocalTime departTime) {
        this.departTime = departTime;
    }

    public int getDepartOdo() {
        return departOdo;
    }

    public void setDepartOdo(int departOdo) {
        this.departOdo = departOdo;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getDriverName() { return driverName; }

    public void setDriverName(String driverName) { this.driverName = driverName; }

    public LocalTime getArriveTime() {
        return arriveTime;
    }

    public void setArriveTime(LocalTime arriveTime) {
        this.arriveTime = arriveTime;
    }

    public LocalTime getLoadTime() {
        return loadTime;
    }

    public void setLoadTime(LocalTime loadTime) {
        this.loadTime = loadTime;
    }

    public LocalTime getLeaveTime() {
        return leaveTime;
    }

    public void setLeaveTime(LocalTime leaveTime) {
        this.leaveTime = leaveTime;
    }

    public LocalTime getReturnTime() {
        return returnTime;
    }

    public void setReturnTime(LocalTime returnTime) {
        this.returnTime = returnTime;
    }

    public int getReturnOdo() {
        return returnOdo;
    }

    public void setReturnOdo(int returnOdo) {
        this.returnOdo = returnOdo;
    }

    public int getDistance() {
        return distance;
    }

    public void setDistance(int distance) {
        this.distance = distance;
    }

    public double getFuelStand() {
        return fuelStand;
    }

    public void setFuelStand(double fuelStand) {
        this.fuelStand = fuelStand;
    }

    public double getFuelLoad() {
        return fuelLoad;
    }

    public void setFuelLoad(double fuelLoad) {
        this.fuelLoad = fuelLoad;
    }

    public double getFuelDrive() {
        return fuelDrive;
    }

    public void setFuelDrive(double fuelDrive) {
        this.fuelDrive = fuelDrive;
    }

    public double getFuelUsed() {
        return fuelUsed;
    }

    public void setFuelUsed(double fuelUsed) {
        this.fuelUsed = fuelUsed;
    }
}
