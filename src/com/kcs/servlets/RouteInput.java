package com.kcs.servlets;

import com.kcs.Services.DBAddRoute;
import com.kcs.utils.Validation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet("/routeInput")
public class RouteInput extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String driver = req.getParameter("driver");
        String destination = req.getParameter("destination");
        String date = req.getParameter("date");
        DBAddRoute dbAdd = new DBAddRoute();
        boolean updateSuccess = dbAdd.addRoute(driver, destination, date);
        if(updateSuccess){
            req.setAttribute("updateResult", updateSuccess);
            req.getRequestDispatcher("routeAddSuccess.jsp").forward(req, resp);
        }

    }
}
