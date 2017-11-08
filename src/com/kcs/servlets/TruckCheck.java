package com.kcs.servlets;

import com.kcs.utils.LoginDao;
import com.kcs.utils.Validation;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/truckCheck")
public class TruckCheck extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        String truckName = req.getParameter("tName");
        String truckLicense = req.getParameter("truckLicense");
        truckName = Validation.checkTruck(truckLicense);

        if (truckName != null){
            HttpSession session = req.getSession();
            session.setAttribute("tName", truckName);
            session.setAttribute("tLicense", truckLicense);
            req.getRequestDispatcher("WEB-INF/routeAddForm.jsp").forward(req, resp);
        }else {
            req.setAttribute("name", "Toks sunkvezimis NEEGZISTUOJA");
            req.getRequestDispatcher("WEB-INF/welcomeDriver.jsp").forward(req, resp);
        }
    }
}
