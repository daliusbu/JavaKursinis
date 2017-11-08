package com.kcs.Objects;

public class Truck {
    int id;
    String brand;
    String license;
    double fuelStanding;
    double fuelDriving;
    double fuelLoading;

    public Truck() {
    }

    public Truck(String brand, String license, double fuelStanding, double fuelDriving, double fuelLoading) {
        this.brand = brand;
        this.license = license;
        this.fuelStanding = fuelStanding;
        this.fuelDriving = fuelDriving;
        this.fuelLoading = fuelLoading;
    }

    public Truck(int id, String brand, String license, double fuelStanding, double fuelDriving, double fuelLoading) {
        this.id = id;
        this.brand = brand;
        this.license = license;
        this.fuelStanding = fuelStanding;
        this.fuelDriving = fuelDriving;
        this.fuelLoading = fuelLoading;
    }

    public int getId() {
        return id;
    }

    public String getBrand() {
        return brand;
    }

    public String getLicense() {
        return license;
    }

    public double getFuelStanding() {
        return fuelStanding;
    }

    public double getFuelDriving() {
        return fuelDriving;
    }

    public double getFuelLoading() {
        return fuelLoading;
    }
}
