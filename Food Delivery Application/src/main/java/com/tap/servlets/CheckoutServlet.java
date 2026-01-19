package com.tap.servlets;

import java.io.IOException;
import java.util.Map;

import com.tap.model.Cart;
import com.tap.model.CartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null || cart.getItems().isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        // Get form data
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String paymentMethod = request.getParameter("paymentMethod");
        String upiApp = request.getParameter("upiApp");
        String upiId = request.getParameter("upiId");

        // TODO: Save order to database
        System.out.println("Order Placed by: " + fullName);
        System.out.println("Cart Items:");
        for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
            CartItem item = entry.getValue();
            System.out.println(item.getName() + " x " + item.getQuantity() + " = ₹" + (item.getPrice() * item.getQuantity()));
        }

        // Clear cart
        cart.clear();
        session.setAttribute("cart", cart);

        // Redirect to order confirmation page
        response.sendRedirect("order-confirmation.jsp");
    }
}
