package com.tap.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.tap.DAOimplementation.MenuDAOImpl;
import com.tap.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        System.out.println("MenuServlet called");

        HttpSession session = req.getSession();

        // Get restaurantId from request or session
        String ridParam = req.getParameter("restaurantId");
        Integer restaurantId = null;

        if (ridParam != null && !ridParam.isEmpty() && !ridParam.equals("null")) {
            restaurantId = Integer.parseInt(ridParam);
            session.setAttribute("restaurantId", restaurantId); // keep in session
        } else {
            restaurantId = (Integer) session.getAttribute("restaurantId");
        }

        // If still null, redirect to home
        if (restaurantId == null) {
            resp.sendRedirect(req.getContextPath() + "/Home.jsp");
            return;
        }
        // Fetch menu items from DB
        MenuDAOImpl daoImpl = new MenuDAOImpl();
        List<Menu> menuList = null;
        menuList = daoImpl.getAllMenusByRestaurant(restaurantId);

        // Set attribute and forward to JSP
        req.setAttribute("menus", menuList);
        RequestDispatcher rd = req.getRequestDispatcher("Menu.jsp");
        rd.forward(req, resp);
    }
}