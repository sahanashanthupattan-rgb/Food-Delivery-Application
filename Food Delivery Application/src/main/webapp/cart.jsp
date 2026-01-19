<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.Cart, com.tap.model.CartItem" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>🍔 BloomBite | Cart</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:"Segoe UI", Arial, sans-serif;
}

body{
    min-height:100vh;
    background:linear-gradient(135deg,#ff512f,#f09819,#ff3d00);
    color:#fff;
    padding:20px;
}

/* HEADER */
header{
    background:linear-gradient(90deg,#ff3d00,#ff9800);
    padding:18px 32px;
    border-radius:16px;
    margin-bottom:30px;
}
.brand{
    font-size:1.9rem;
    font-weight:800;
}

.container{
    max-width:900px;
    margin:auto;
}

.cart-title{
    text-align:center;
    font-size:2.3rem;
    font-weight:800;
    margin-bottom:30px;
    color:#ffe0b2;
}

.cart-item{
    background:rgba(255,255,255,0.15);
    border-radius:18px;
    padding:26px;
    margin-bottom:24px;
}

.item-name{
    font-size:1.4rem;
    font-weight:800;
    color:#ffcc80;
}

.quantity-row{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-top:18px;
}

.quantity{
    display:flex;
    align-items:center;
    gap:12px;
}

.qty-btn{
    width:42px;
    height:42px;
    border:none;
    border-radius:12px;
    background:#ff9800;
    color:#fff;
    font-size:22px;
    font-weight:800;
    cursor:pointer;
}

.remove-btn{
    background:#d50000;
    color:#fff;
    border:none;
    padding:12px 26px;
    border-radius:14px;
    font-weight:700;
    cursor:pointer;
}

.total{
    margin-top:35px;
    padding:28px;
    background:rgba(0,0,0,0.2);
    border-radius:18px;
    font-size:1.6rem;
    font-weight:800;
    text-align:right;
}

.add-more-items{
    text-align:center;
    margin-top:20px;
}
.add-more-items a{
    color:#fff;
    text-decoration:none;
    font-weight:700;
}

.checkout-section{
    text-align:center;
    margin-top:30px;
}
.checkout-btn{
    background:#ff9800;
    color:#fff;
    border:none;
    padding:16px 56px;
    border-radius:40px;
    font-size:1.15rem;
    font-weight:800;
    cursor:pointer;
}

.empty-cart{
    background:rgba(255,255,255,0.18);
    border-radius:20px;
    padding:70px 30px;
    text-align:center;
}
</style>
</head>

<body>

<header>
    <div class="brand">🍔 BloomBite</div>
</header>

<div class="container">
<div class="cart-title">Your Cart</div>

<%
    Cart cart = (Cart) session.getAttribute("cart");

    Integer restaurantId = (Integer) session.getAttribute("restaurantId");
    if (restaurantId == null) {
        restaurantId = (Integer) session.getAttribute("oldRestaurantId");
    }
%>

<% if (cart != null && cart.getItems() != null && !cart.getItems().isEmpty()) { 
       for (CartItem item : cart.getItems().values()) { %>

<div class="cart-item">
    <div class="item-name"><%= item.getName() %></div>
    <div>Price: ₹<%= item.getPrice() %></div>
    <div>Total: ₹<%= item.getPrice() * item.getQuantity() %></div>

    <div class="quantity-row">
        <div class="quantity">

            <!-- DECREASE -->
            <form action="cart" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                <input type="hidden" name="quantity" value="<%= item.getQuantity() - 1 %>">
                <button class="qty-btn" <%= item.getQuantity() == 1 ? "disabled" : "" %>>-</button>
            </form>

            <span><%= item.getQuantity() %></span>

            <!-- INCREASE -->
            <form action="cart" method="post">
                <input type="hidden" name="action" value="add">
                <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                <input type="hidden" name="name" value="<%= item.getName() %>">
                <input type="hidden" name="price" value="<%= item.getPrice() %>">
                <input type="hidden" name="quantity" value="1">
                <button class="qty-btn">+</button>
            </form>
        </div>

        <!-- REMOVE -->
        <form action="cart" method="post">
            <input type="hidden" name="action" value="remove">
            <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
            <button class="remove-btn">Remove</button>
        </form>
    </div>
</div>

<% } %>

<div class="total">
    Grand Total: ₹<%= cart.getTotalPrice() %>
</div>

<div class="add-more-items">
    <a href="<%= request.getContextPath() %>/menu?restaurantId=<%= restaurantId %>">
    ➕ Add More Items
</a>
</div>

<div class="checkout-section">
    <form action="checkout.jsp" method="post">
        <button class="checkout-btn">Proceed to Checkout</button>
    </form>
</div>

<% } else { %>

<div class="empty-cart">
    <h2>Your cart is empty 😔</h2>
    <br>
    <a href="<%= request.getContextPath() %>/Menu.jsp?restaurantId=<%= restaurantId %>">
        Add Items
    </a>
</div>

<% } %>

</div>
</body>
</html>
