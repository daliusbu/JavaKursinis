package com.kcs.servlets;

import com.kcs.Objects.Truck;
import com.kcs.Services.TruckServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/truckChangeApply")
public class TruckChangeApplySrvl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String brand = req.getParameter("brand");
        String license = req.getParameter("license");
        double fuelStanding = Double.valueOf(req.getParameter("fuelStanding"));
        double fuelDriving = Double.valueOf(req.getParameter("fuelDriving"));
        double fuelLoading = Double.valueOf(req.getParameter("fuelLoading"));
        int id = Integer.valueOf(req.getParameter("truckId"));
        Truck truck = new Truck(id, brand, license, fuelStanding, fuelDriving, fuelLoading);

        Boolean result = TruckServices.truckChange(truck);

        String message = "Klaida - duomenu ivesti nepavyko";
        if (result) {
            message = "Automobilio duomenys ivesti sekmingai";
        }
        req.setAttribute("message", message);
        List<Truck> trucks = TruckServices.getAllTrucks();
        req.setAttribute("trucks", trucks);
        resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        resp.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        resp.setHeader("Expires", "0"); // Proxies.
        req.getRequestDispatcher("WEB-INF/trucksDisplay.jsp").forward(req, resp);
    }
}
