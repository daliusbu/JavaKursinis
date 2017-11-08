package com.kcs.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet (value="/logout")
public class LogoutSrvl extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");

        String message = "Sekmingai atsijungete!";
        HttpSession session = req.getSession();
        session.invalidate();

        req.setAttribute("message", message);
        resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        resp.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        resp.setHeader("Expires", "0"); // Proxies.
        req.getRequestDispatcher("index.jsp").include(req, resp);




    }
}
