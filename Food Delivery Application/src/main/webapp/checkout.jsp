<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.Cart, com.tap.model.CartItem" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout - 🍔 BloomBite</title>

<style>
*{margin:0;padding:0;box-sizing:border-box;font-family:'Segoe UI',sans-serif;}
body{background:linear-gradient(135deg,#ff6a00,#ee0979);min-height:100vh;padding:30px;}
.checkout-container{max-width:1100px;margin:auto;background:#fff;border-radius:18px;padding:35px;box-shadow:0 20px 60px rgba(0,0,0,.25);animation:fadeUp .8s ease;}
@keyframes fadeUp{from{opacity:0;transform:translateY(40px);}to{opacity:1;transform:translateY(0);}}
.back-link{text-decoration:none;color:#ee0979;font-weight:700;display:inline-block;margin-bottom:25px;}
h1{text-align:center;color:#ff6a00;margin-bottom:35px;}
.checkout-grid{display:grid;grid-template-columns:1.2fr 1fr;gap:35px;}
.order-summary{background:linear-gradient(135deg,#fff3e0,#ffe0e9);border-radius:16px;padding:25px;}
.order-summary h2{color:#ee0979;margin-bottom:20px;}
.cart-item{display:flex;justify-content:space-between;margin-bottom:15px;background:#fff;padding:15px;border-radius:12px;box-shadow:0 6px 18px rgba(0,0,0,.15);}
.item-name{font-weight:700;}
.item-price{font-weight:800;color:#ff6a00;}
.total{border-top:3px solid #ff6a00;margin-top:20px;padding-top:15px;display:flex;justify-content:space-between;font-size:1.4rem;font-weight:800;color:#ee0979;}
.form-card{background:#fff;border-radius:16px;padding:25px;box-shadow:0 10px 30px rgba(0,0,0,.15);}
.form-section{margin-bottom:22px;}
.form-section h3{color:#ff6a00;margin-bottom:10px;border-bottom:2px solid #ee0979;padding-bottom:6px;}
input, textarea, select{width:100%;padding:14px;border:2px solid #ddd;border-radius:10px;font-size:1rem;}
input:focus, textarea:focus, select:focus{outline:none;border-color:#ff6a00;box-shadow:0 0 10px rgba(255,106,0,.35);}
textarea{resize:none;height:90px;}
.btn-place-order{width:100%;padding:16px;background:linear-gradient(135deg,#ff6a00,#ee0979);color:#fff;font-size:1.25rem;font-weight:800;border:none;border-radius:14px;cursor:pointer;box-shadow:0 8px 30px rgba(255,106,0,.55);transition:.3s;}
.btn-place-order:hover{transform:translateY(-3px);box-shadow:0 12px 40px rgba(238,9,121,.7);}
#congratsMessage{
    display:none;
    position:fixed;
    top:50%;
    left:50%;
    transform:translate(-50%,-50%);
    background:white;
    padding:40px 60px;
    border-radius:20px;
    text-align:center;
    font-size:1.8rem;
    color:#ff4d4f;
    box-shadow:0 10px 30px rgba(0,0,0,0.25);
    z-index:9999;
}
@media(max-width:900px){.checkout-grid{grid-template-columns:1fr;}}
</style>

<!-- Confetti library -->
<script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.6.0/dist/confetti.browser.min.js"></script>

</head>
<body>

<%
Cart cart = (Cart) session.getAttribute("cart");
Integer restaurantId = (Integer) session.getAttribute("restaurantId");

if(cart==null || cart.getItems().isEmpty()){
    response.sendRedirect("cart.jsp");
    return;
}

double total=0;
for(CartItem item:cart.getItems().values()){
    total+=item.getQuantity()*item.getPrice();
}
%>

<div class="checkout-container">

<a href="cart.jsp" class="back-link">← Back to Cart</a>

<h1>Checkout</h1>

<div class="checkout-grid">

<!-- ===== LEFT: ORDER SUMMARY ===== -->
<div class="order-summary">
<h2>Your Order</h2>

<% for(CartItem item:cart.getItems().values()){ %>
<div class="cart-item">
    <div>
        <div class="item-name"><%= item.getName() %></div>
        <small>Qty: <%= item.getQuantity() %></small>
    </div>
    <div class="item-price">₹<%= item.getQuantity()*item.getPrice() %></div>
</div>
<% } %>

<div class="total">
    <span>Total</span>
    <span>₹<%= total %></span>
</div>
</div>

<!-- ===== RIGHT: FORM ===== -->
<div class="form-card">
<form id="checkoutForm" action="login.jsp" method="post">


<input type="hidden" name="restaurantId" value="<%= restaurantId %>">

<!-- ===== NAME SECTION ===== -->
<div class="form-section">
<h3>Full Name</h3>
<input type="text" name="fullName" required placeholder="👤 Enter your full name">
</div>

<div class="form-section">
<h3>Contact Details</h3>
<input type="text" name="phone" required placeholder="📞 Phone Number">
</div>

<div class="form-section">
<h3>Delivery Address</h3>
<textarea name="address" required placeholder="🏠 Enter delivery address"></textarea>
</div>

<div class="form-section">
<h3>Payment Method</h3>
<select name="paymentMethod" id="paymentMethod" required onchange="toggleUPIOptions()">
<option value="">-- Select Payment --</option>
<option value="COD">Cash on Delivery</option>
<option value="UPI">UPI</option>
<option value="Card">Card</option>
</select>
</div>

<!-- UPI OPTIONS (HIDDEN BY DEFAULT) -->
<div class="form-section" id="upiOptions" style="display:none;">
<h3>Choose UPI App</h3>
<select name="upiApp" id="upiApp">
<option value="">-- Select UPI App --</option>
<option>Google Pay</option>
<option>PhonePe</option>
<option>Paytm</option>
<option>BHIM UPI</option>
</select>

<h3>Enter UPI ID</h3>
<input type="text" name="upiId" id="upiId" placeholder="example@upi">
</div>

<button type="submit" class="btn-place-order">Place Order</button>
</form>
</div>

</div>
</div>

<!-- Congratulation message -->
<div id="congratsMessage">
🎉 Congrats!<br>Your order will be delivered in 30 minutes! 🚀
</div>

<script>
function toggleUPIOptions(){
    const payment = document.getElementById("paymentMethod").value;
    const upiSection = document.getElementById("upiOptions");
    const upiIdInput = document.getElementById("upiId");
    const upiAppSelect = document.getElementById("upiApp");

    if(payment === "UPI"){
        upiSection.style.display = "block";
        upiIdInput.required = true;
        upiAppSelect.required = true;
    } else {
        upiSection.style.display = "none";
        upiIdInput.required = false;
        upiIdInput.value = "";
        upiAppSelect.required = false;
        upiAppSelect.value = "";
    }
}

/
    // Launch confetti
    confetti({
        particleCount: 150,
        spread: 70,
        origin: { y: 0.6 }
    });

    // After 4 seconds, redirect to a confirmation page (optional)
    setTimeout(function(){
        // redirect to a confirmation page or homepage
        window.location.href = "orderConfirmation.jsp";
    }, 4000);
});
</script>

</body>
</html>
