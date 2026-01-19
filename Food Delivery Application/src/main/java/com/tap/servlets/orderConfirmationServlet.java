package com.tap.servlets;

import java.io.IOException;

import com.tap.model.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/placeOrder")
public class orderConfirmationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect("home.jsp");
            return;
        }

        // OPTIONAL: Get order details if needed
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String paymentMethod = request.getParameter("paymentMethod");

        // Clear cart after successful order
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null) {
            cart.clear();
            session.removeAttribute("cart");
        }

        // Redirect to order confirmation page
        response.sendRedirect("orderConfirmation.jsp");
    }
}




