package com.kcs.servlets;

import com.kcs.Objects.TruckRoute;
import com.kcs.Services.Calculations;
import com.kcs.Services.DBAddRoute;
import com.kcs.utils.Validation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalTime;
import java.util.Date;

@WebServlet("/routeInput")
public class RouteInputSrvl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String tLicense = req.getParameter("tLicense");
        int userId = Integer.parseInt(req.getParameter("userId"));
        String date = req.getParameter("date");
        LocalTime departTime = LocalTime.parse(req.getParameter("departTime"));
        LocalTime arriveTime  = LocalTime.parse(req.getParameter("arriveTime"));
        LocalTime loadTime = LocalTime.parse(req.getParameter("loadTime"));
        LocalTime leaveTime = LocalTime.parse(req.getParameter("leaveTime"));
        LocalTime returnTime = LocalTime.parse(req.getParameter("returnTime"));
        int departOdo = Integer.parseInt(req.getParameter("departOdo"));
        String destination = req.getParameter("destination");
        int returnOdo = Integer.parseInt(req.getParameter("returnOdo"));

        TruckRoute truckRoute = new TruckRoute(tLicense, userId, date, departTime, departOdo, destination,
         arriveTime, loadTime, leaveTime, returnTime, returnOdo);

        DBAddRoute dbAdd = new DBAddRoute();
        boolean updateSuccess = dbAdd.addRoute(truckRoute);

        req.setAttribute("updateResult", updateSuccess);
        req.setAttribute("routeObject", truckRoute);
        resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        resp.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        resp.setHeader("Expires", "0"); // Proxies.
        req.getRequestDispatcher("WEB-INF/routeAddSuccess.jsp").forward(req, resp);

    }
}
