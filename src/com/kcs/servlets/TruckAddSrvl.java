package com.kcs.servlets;

import com.kcs.Objects.Truck;
import com.kcs.Services.TruckServices;
import com.kcs.utils.Validation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/truckAdd")
public class TruckAddSrvl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String brand = req.getParameter("brand");
        String license = req.getParameter("license");
        double fuelStanding = Double.valueOf(req.getParameter("fuelStanding"));
        double fuelDriving = Double.valueOf(req.getParameter("fuelDriving"));
        double fuelLoading = Double.valueOf(req.getParameter("fuelLoading"));
        Truck truck = new Truck(brand, license, fuelStanding, fuelDriving, fuelLoading);

        Boolean result = TruckServices.truckAdd(truck);

        String message = "Klaida - duomenu ivesti nepavyko";
        if (result) {
            message = "Automobilio duomenys ivesti sekmingai";
        }
        req.setAttribute("message", message);
        resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        resp.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        resp.setHeader("Expires", "0"); // Proxies.
        req.getRequestDispatcher("WEB-INF/truckAdd.jsp").forward(req, resp);
    }
}
