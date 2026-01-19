<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List, com.tap.model.Menu" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> 🍔BloomBite | Menu</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Segoe UI", Roboto, Arial, sans-serif;
        }

        /* ===== AI ANIMATED BACKGROUND ===== */
        body {
            min-height: 100vh;
            background: linear-gradient(120deg, #ff512f, #f09819, #ff512f);
            background-size: 300% 300%;
            animation: aiGradient 10s ease infinite;
            color: #222;
        }

        @keyframes aiGradient {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* ===== HEADER ===== */
        header {
            background: linear-gradient(90deg, #ff512f, #f09819);
            padding: 18px 30px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.25);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .header-container {
            max-width: 1200px;
            margin: auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .brand {
            font-size: 1.8rem;
            font-weight: 800;
            color: #fff;
        }

        header h3 {
            color: #fff;
            font-weight: 600;
        }

        /* ===== CONTAINER ===== */
        .container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 20px;
        }

        /* ===== MENU CARD ===== */
        .menu-item {
            display: flex;
            justify-content: space-between;
            background: rgba(255,255,255,0.95);
            border-radius: 20px;
            padding: 20px;
            margin-bottom: 24px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.18);
            transition: transform 0.4s ease, box-shadow 0.4s ease;
        }

        .menu-item:hover {
            transform: translateY(-6px);
            box-shadow: 0 18px 40px rgba(0,0,0,0.25);
        }

        .item-details {
            flex: 1;
            padding-right: 25px;
        }

        .item-name {
            font-size: 1.25rem;
            font-weight: 700;
            color: #ff512f;
            margin-bottom: 8px;
        }

        .item-desc {
            font-size: 0.9rem;
            color: #555;
            margin-bottom: 12px;
        }

        .item-price {
            font-size: 1.1rem;
            font-weight: 700;
            color: #222;
            margin-bottom: 14px;
        }

        /* ===== ADD TO CART BUTTON ===== */
        .cart-form button {
            border: none;
            background: linear-gradient(135deg, #ff512f, #f09819);
            color: #fff;
            font-weight: 700;
            padding: 10px 28px;
            border-radius: 25px;
            cursor: pointer;
            letter-spacing: 0.5px;
            box-shadow: 0 6px 18px rgba(255,81,47,0.5);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .cart-form button:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 28px rgba(255,81,47,0.7);
        }

        /* ===== IMAGE ===== */
        .item-image {
            width: 160px;
            height: 130px;
            flex-shrink: 0;
        }

        .item-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 16px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.25);
        }

        /* ===== EMPTY TEXT ===== */
        .empty-text {
            text-align: center;
            font-size: 1.2rem;
            color: #fff;
            margin-top: 60px;
            font-weight: 600;
        }

        @media (max-width: 768px) {
            .menu-item {
                flex-direction: column;
            }

            .item-image {
                width: 100%;
                height: 180px;
                margin-top: 16px;
            }
        }
    </style>
</head>

<body>

<header>
    <div class="header-container">
        <div class="brand"> 🍔BloomBite</div>
        <h3>Menu</h3>
    </div>
</header>

<div class="container">

<%
    List<Menu> menuList = (List<Menu>) request.getAttribute("menus");

    if (menuList != null) {
        for (Menu m : menuList) {
%>

    <div class="menu-item">

        <div class="item-details">
            <div class="item-name"><%= m.getName() %></div>
            <div class="item-desc"><%= m.getDescription() %></div>
            <div class="item-price">₹ <%= m.getPrice() %></div>

            <!-- LOGIC UNCHANGED -->
            <form action="cart" method="post" class="cart-form">
                <input type="hidden" name="action" value="add">
                <input type="hidden" name="restaurantId" value="<%= m.getRestaurantId() %>">
                <input type="hidden" name="itemId" value="<%= m.getMenuId() %>">
                <input type="hidden" name="name" value="<%= m.getName() %>">
                <input type="hidden" name="price" value="<%= m.getPrice() %>">
                <input type="hidden" name="quantity" value="1">
                <button type="submit">ADD</button>
            </form>
        </div>

        <div class="item-image">
            <img src="<%= m.getImageUrl() %>" alt="<%= m.getName() %>">
        </div>

    </div>

<%
        }
    } else {
%>

    <div class="empty-text">No menu items available.</div>

<%
    }
%>

</div>

</body>
</html>
