package com.kcs.servlets;

import com.kcs.utils.LoginDao;
import com.kcs.utils.Validation;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/truckInput")
public class TruckInput extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        String truckName = req.getParameter("tName");
        String truckLicense = req.getParameter("tLicense");

        if (Validation.checkTruck(truckName, truckLicense)){
            req.setAttribute("tName", truckName);
            req.setAttribute("tLicense", truckLicense);
            req.getRequestDispatcher("routeForm.jsp").forward(req, resp);
        }else {
            req.setAttribute("name", "Toks sunkvezimis NEEGZISTUOJA");
            req.getRequestDispatcher("welcome.jsp").forward(req, resp);
        }


    }
}
