package com.kcs.servlets;

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

@WebServlet (value = "/login")
public class servlet1 extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//    resp.getWriter().print("Hello World!");
//        String name = "Dalius";
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        String name = req.getParameter("username");
        String pass = req.getParameter("password");

        HttpSession session = req.getSession();
        String username = (String)req.getAttribute("userId");

        int userId = LoginDao.validate(name, pass);

        if (userId != 0){
            req.setAttribute("name", name + pass);
            req.getRequestDispatcher("welcome.jsp").forward(req, resp);
            session.setAttribute("UserName", username);
        }else {
            out.print("Sorry - user name or name is wrong");
            RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
            rd.include(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
