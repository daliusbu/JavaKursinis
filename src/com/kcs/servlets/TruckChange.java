package com.kcs.servlets;

import com.kcs.Objects.Truck;
import com.kcs.Services.TruckServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/truckChange")
public class TruckChange extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        resp.setContentType("text/html");
        int id = Integer.parseInt(req.getParameter("truckId"));

        List<Truck> trucks = TruckServices.getTruckById(id);
        req.setAttribute("trucks", trucks);
        req.getRequestDispatcher("WEB-INF/truckChange.jsp").forward(req, resp);
    }

}
