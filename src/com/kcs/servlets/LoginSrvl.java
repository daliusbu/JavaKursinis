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

@WebServlet (value = "/login")
public class LoginSrvl extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        String name = req.getParameter("username");
        String pass = req.getParameter("password");
        int id;
        String role;
        List<User> drivers = new ArrayList<>();
        List<Truck> trucks = new ArrayList<>();


        HttpSession session = req.getSession();

        User user = LoginDao.validate(name, pass);
        id = user.getId();
        role = user.getRole();
        String message = "Neteisingas vardas arba slaptazodis!";


        if (user.getId() != 0){
            session.setAttribute("UserRole", role);
            session.setAttribute("UserName", name);
            session.setAttribute("UserId", id);
            if (role.equals("admin")){
                UserServices userServices = new UserServices();
                drivers = userServices.getAllDrivers();
                session.setAttribute("drivers", drivers);

                resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
                resp.setHeader("Pragma", "no-cache"); // HTTP 1.0.
                resp.setHeader("Expires", "0"); // Proxies.

                req.getRequestDispatcher("WEB-INF/welcomeAdmin.jsp").forward(req, resp);
            }else{

                trucks = TruckServices.getAllTrucks();
                session.setAttribute("trucks", trucks);
                req.getRequestDispatcher("WEB-INF/welcomeDriver.jsp").forward(req, resp);
            }
        }else {
            req.setAttribute("message", message);
            RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
            rd.include(req, resp);
        }
    }

 }
