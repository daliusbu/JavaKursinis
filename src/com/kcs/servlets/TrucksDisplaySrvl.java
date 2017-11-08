package com.kcs.servlets;

import com.kcs.Objects.Truck;
import com.kcs.Objects.User;
import com.kcs.Services.TruckServices;
import com.kcs.Services.UserServices;
import com.kcs.utils.LoginDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(value = "/trucksDisplay")
public class TrucksDisplaySrvl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        resp.setContentType("text/html");

        List<Truck> trucks = TruckServices.getAllTrucks();
        req.setAttribute("trucks", trucks);
        req.getRequestDispatcher("WEB-INF/trucksDisplay.jsp").forward(req, resp);
    }

}
