package com.kcs.servlets;

import com.kcs.Objects.Truck;
import com.kcs.Objects.User;
import com.kcs.Services.TruckServices;
import com.kcs.Services.UserServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/userAdd")
public class UserAddSrvl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String name = req.getParameter("name");
        String pass = req.getParameter("pass");
        String role = req.getParameter("role");

        User user = new User( name,  pass,  role);
        Boolean result = UserServices.userAdd(user);

        String message = "Klaida - duomenu ivesti nepavyko";
        if (result) {
            message = "Vartotojo duomenys ivesti sekmingai";
        }
        req.setAttribute("message", message);
        resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        resp.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        resp.setHeader("Expires", "0"); // Proxies.
        req.getRequestDispatcher("/WEB-INF/userAdd.jsp").forward(req, resp);
    }
}
