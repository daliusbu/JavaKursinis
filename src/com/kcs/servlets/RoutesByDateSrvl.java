package com.kcs.servlets;

import com.kcs.Objects.TruckRoute;
import com.kcs.Services.RouteServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/routesByDate")
public class RoutesByDateSrvl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int userId = Integer.parseInt(req.getParameter("userId"));
        String dateStart = req.getParameter("dateStart");
        String dateEnd = req.getParameter("dateEnd");
        List<TruckRoute> truckRoutes = new ArrayList<>();
//
//        LocalTime departTime = LocalTime.parse(req.getParameter("departTime"));
//        LocalTime arriveTime  = LocalTime.parse(req.getParameter("arriveTime"));
//        LocalTime loadTime = LocalTime.parse(req.getParameter("loadTime"));
//        LocalTime leaveTime = LocalTime.parse(req.getParameter("leaveTime"));
//        LocalTime returnTime = LocalTime.parse(req.getParameter("returnTime"));
//        int departOdo = Integer.parseInt(req.getParameter("departOdo"));
//        String destination = req.getParameter("destination");
//        int returnOdo = Integer.parseInt(req.getParameter("returnOdo"));

        truckRoutes = RouteServices.getRoutesByUserDate(userId, dateStart, dateEnd);

        req.setAttribute("routes", truckRoutes);
        req.setAttribute("driver", userId);
        req.setAttribute("dateStart", dateStart);
        req.setAttribute("dateEnd", dateEnd);
        resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        resp.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        resp.setHeader("Expires", "0"); // Proxies.
        req.getRequestDispatcher("WEB-INF/routesByDate.jsp").forward(req, resp);

    }
}
