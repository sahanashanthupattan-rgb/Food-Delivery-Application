<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.tap.model.Restaurant" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>🍔 BloomBite | Restaurants</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- AOS Animation Library -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:"Segoe UI", Arial, sans-serif;
}

/* ===== THEME COLORS ===== */
:root{
    --primary:#ff4d4f;
    --secondary:#ffb703;
    --bg:#f8fafc;
    --dark:#111827;
    --gray:#6b7280;
}

body{
    background:var(--bg);
    color:var(--dark);
}

/* ===== HEADER ===== */
header{
    background: linear-gradient(90deg, #ff512f, #f09819);
    padding:16px 30px;
    box-shadow:0 6px 22px rgba(255, 81, 47, 0.45);
}

.nav-container{
    max-width:1300px;
    margin:auto;
    display:flex;
    align-items:center;
    justify-content:space-between;
    position:relative;
}

.logo{
    font-size:1.8rem;
    font-weight:800;
    color:#fff;
}

nav ul{
    display:flex;
    list-style:none;
    gap:24px;
}

nav ul li a{
    color:#fff;
    text-decoration:none;
    font-weight:600;
    transition: color 0.3s;
}

nav ul li a:hover{
    color:#ffe0b2; /* light orange highlight */
}

/* 🔍 Search */
.search-bar{
    position:absolute;
    left:50%;
    transform:translateX(-50%);
    width:380px;
}

.search-bar input{
    width:100%;
    padding:10px 16px;
    border-radius:30px;
    border:none;
    outline:none;
    transition: box-shadow 0.3s;
}

.search-bar input:focus{
    box-shadow:0 0 0 4px rgba(255, 81, 47, 0.35);
}


/* ===== HERO ===== */
.hero{
    background:url("Images/homepagebac.png") center/cover no-repeat;
    min-height:100vh;
    display:flex;
    align-items:center;
    justify-content:center;
    text-align:center;
    color:white;
    background-size:200% 200%;
    animation:gradientMove 8s ease infinite;
}

.hero-text{
    animation:floatAI 6s ease-in-out infinite;
}

.hero-text h1{
    font-size:3rem;
    font-weight:800;
}

.hero-text h2{
    font-size:1.2rem;
    margin-top:16px;
}

.hero-text button{
    margin-top:30px;
    padding:14px 34px;
    border:none;
    border-radius:30px;
    background:var(--secondary);
    font-weight:700;
    cursor:pointer;
}

/* ===== ANIMATIONS ===== */
@keyframes floatAI{
    0%{transform:translateY(0)}
    50%{transform:translateY(-12px)}
    100%{transform:translateY(0)}
}

@keyframes gradientMove{
    0%{background-position:0% 50%}
    50%{background-position:100% 50%}
    100%{background-position:0% 50%}
}

/* ===== SERVICES ===== */
.service-card{
    background:#fff;
    padding:30px;
    border-radius:14px;
    box-shadow:0 6px 16px rgba(0,0,0,0.1);
    text-align:center;
}

/.container{
    max-width:1300px;
    margin:60px auto;
    padding:0 30px;
}

.section-title{
    text-align:center;
    font-size:2.2rem;
    font-weight:800;
    background:linear-gradient(135deg, #ff512f, #f09819);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
    margin-bottom:40px;
}

.restaurant-grid{
    display:grid;
    grid-template-columns:repeat(auto-fill, minmax(280px, 1fr));
    gap:30px;
}

.restaurant-link{
    text-decoration:none;
    color:inherit;
}

.restaurant-card{
    background:#fff;
    border-radius:18px;
    overflow:hidden;
    box-shadow:0 10px 30px rgba(0,0,0,0.15);
    transition:transform 0.35s, box-shadow 0.35s;
}

.restaurant-card:hover{
    transform:translateY(-10px);
    box-shadow:0 18px 40px rgba(255,81,47,0.45);
}

.image-box{
    position:relative;
    height:280px;
}

.image-box img{
    width:100%;
    height:100%;
    object-fit:cover;
    transition:transform 0.5s ease;
}

.restaurant-card:hover .image-box img{
    transform:scale(1.08);
}


.availability{
    position:absolute;
    top:12px;
    left:12px;
    background:linear-gradient(135deg,#ff512f,#f09819);
    color:#fff;
    padding:6px 12px;
    border-radius:20px;
    font-size:0.8rem;
    font-weight:700;
}

/* CARD BODY */
.card-body{
    padding:18px;
}

.card-body h2{
    font-size:1.3rem;
    font-weight:700;
    margin-bottom:6px;
    color:#333;
}

.cuisine{
    color:#777;
    font-size:0.95rem;
    margin-bottom:14px;
}

/* FOOTER */
.card-footer{
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.rating{
    background:#ffe1d6;
    color:#e23744;
    padding:5px 10px;
    border-radius:12px;
    font-weight:700;
    font-size:0.9rem;
}

.view-btn{
    color:#ff512f;
    font-weight:700;
    font-size:0.9rem;
}

/* ===== FOOTER ===== */
footer {
    background: linear-gradient(135deg, #ff7f50, #e23744); /* orange → red mix */
    color: #fff;              /* white text for better contrast */
    padding: 40px;
    text-align: center;
}
</style>
</head>

<body>

<header>
    <div class="nav-container">
        <div class="logo">🍔 BloomBite</div>

        <div class="search-bar">
            <input type="text" placeholder="Search restaurants or cuisines">
        </div>
<nav>
    <ul>
        <li><a href="login.jsp">🏠 Home</a></li>
        <li><a href="login.jsp">🔑 Login</a></li>
        <li><a href="cart.jsp">🛒 Cart</a></li>
        <li><a href="profile.jsp">👤 Register</a></li>
    </ul>
</nav>

        
    </div>
</header>

<!-- HERO -->
<section class="hero">
    <div class="hero-text" data-aos="zoom-in">
        <h1 data-aos="fade-right">Enjoy Your <br> Delicious Food!!!</h1>
        <h2 data-aos="fade-left">Fast • Fresh • Smart Delivery</h2>
        <button data-aos="fade-up">Order Now</button>
    </div>
</section>



<!-- ===== Our Services Section ===== -->
<div style="
    max-width:1300px;
    margin:60px auto 40px;
    padding:0 30px;
">

    <h2 style="
        font-size:2.2rem;
        font-weight:800;
        background:linear-gradient(135deg, #ff512f, #f09819);
        -webkit-background-clip:text;
        -webkit-text-fill-color:transparent;
        text-align:center;
        margin-bottom:12px;
    ">
        Our Services
    </h2>

    <p style="
        text-align:center;
        font-size:1.1rem;
        color:#7a2e1d;
        margin-bottom:45px;
    ">
        How Does It Work?
    </p>

    <div style="
        display:flex;
        flex-wrap:wrap;
        justify-content:space-between;
        gap:30px;
    ">


        <!-- Easy To Order -->
        <div style="flex: 1; min-width: 280px; 
                    background: linear-gradient(135deg, #ff6a00, #e23744); 
                    border-radius: 12px; 
                    box-shadow: 0 4px 12px rgba(0,0,0,0.08); 
                    padding: 30px; 
                    text-align: center; 
                    color: #fff;">
            <img src="Images/easytoorder.png" alt="Easy To Order" style="width: 60px; margin-bottom: 20px;">
            <h3 style="font-size: 1.2rem; margin-bottom: 10px;">Easy To Order</h3>
            <p style="font-size: 0.95rem;">You only need a few steps to order your favorite food.</p>
        </div>

        <!-- Fast Delivery -->
        <div style="flex: 1; min-width: 280px; 
                    background: linear-gradient(135deg, #ff6a00, #e23744); 
                    border-radius: 12px; 
                    box-shadow: 0 4px 12px rgba(0,0,0,0.08); 
                    padding: 30px; 
                    text-align: center; 
                    color: #fff;">
            <img src="Images/fastdelivary.png" alt="Fast Delivery" style="width: 60px; margin-bottom: 20px;">
            <h3 style="font-size: 1.2rem; margin-bottom: 10px;">Fast Delivery</h3>
            <p style="font-size: 0.95rem;">Delivery that’s always on time — or even faster!</p>
        </div>

        <!-- Best Quality -->
        <div style="flex: 1; min-width: 280px; 
                    background: linear-gradient(135deg, #ff6a00, #e23744); 
                    border-radius: 12px; 
                    box-shadow: 0 4px 12px rgba(0,0,0,0.08); 
                    padding: 30px; 
                    text-align: center; 
                    color: #fff;">
            <img src="Images/bestquality.png" alt="Best Quality" style="width: 60px; margin-bottom: 20px;">
            <h3 style="font-size: 1.2rem; margin-bottom: 10px;">Best Quality</h3>
            <p style="font-size: 0.95rem;">Not just fast — we deliver top-notch quality every time.</p>
        </div>
    </div>
</div>


<!-- ===== RESTAURANTS ===== -->
<div class="container">
    <h1 class="section-title">Restaurants You May Like</h1>

    <div class="restaurant-grid">
        <%
        List<Restaurant> restaurants = (List<Restaurant>)request.getAttribute("restaurants");
        for(Restaurant r : restaurants){
        %>

        <a href="menu?restaurantId=<%=r.getRestaurantId()%>" class="restaurant-link">
            <div class="restaurant-card" data-aos="zoom-in">
                
                <div class="image-box">
                    <img src="<%=r.getImageUrl()%>" alt="Restaurant Image">
                    <span class="availability">OPEN</span>
                </div>

                <div class="card-body">
                    <h2><%=r.getRestaurantName()%></h2>
                    <p class="cuisine"><%=r.getCuisineType()%></p>

                    <div class="card-footer">
                        <span class="rating">⭐ <%=r.getRating()%></span>
                        <span class="view-btn">View Menu →</span>
                    </div>
                </div>

            </div>
        </a>

        <% } %>
    </div>
</div>



<footer data-aos="fade-up">
       <!-- ===== Footer Section ===== -->
<div style="background-color: #fdf3e7; padding: 40px 30px 20px; font-family: 'Segoe UI', sans-serif; color: #333;">

    <!-- Subscription Bar -->
    <div style="max-width: 1300px; margin: auto; display: flex; flex-wrap: wrap; justify-content: space-between; align-items: center; margin-bottom: 40px;">
        <h2 style="font-size: 1.4rem; font-weight: 600;">Subscribe for tasty updates</h2>
        <div style="display: flex; gap: 12px; margin-top: 12px;">
            <input type="email" placeholder="Enter your email address" style="padding: 10px 14px; border-radius: 6px; border: 1px solid #ccc; width: 280px;">
            <button style="background-color: #ffc107; border: none; padding: 10px 20px; border-radius: 6px; font-weight: 600; cursor: pointer;">Subscribe</button>
        </div>
    </div>

    <!-- Footer Columns -->
    <div style="max-width: 1300px; margin: auto; display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 40px;">

        <!-- Brand Info -->
        <div>
            <h3 style="font-size: 1.2rem; font-weight: 700; color: #e23744;">BloomBite</h3>
            <p style="margin: 12px 0;">We fill your tummy with delicious food and fast delivery.</p>
            <div style="display: flex; gap: 12px; margin-top: 10px;">
                <span style="font-size: 1.2rem;">🔗</span>
                <span style="font-size: 1.2rem;">📸</span>
                <span style="font-size: 1.2rem;">📘</span>
                <span style="font-size: 1.2rem;">🟢</span>
            </div>
        </div>

        <!-- Our Menu -->
        <div>
            <h4 style="font-weight: 600; margin-bottom: 12px;">Our Menu</h4>
            <ul style="list-style: none; padding: 0;">
                <li>Special</li>
                <li>Popular</li>
                <li>Category</li>
            </ul>
        </div>

        <!-- Company -->
        <div>
            <h4 style="font-weight: 600; margin-bottom: 12px;">Company</h4>
            <ul style="list-style: none; padding: 0;">
                <li>Why BloomBite</li>
                <li>Partner with us</li>
                <li>About us</li>
                <li>FAQs</li>
            </ul>
        </div>

        <!-- Support -->
        <div>
            <h4 style="font-weight: 600; margin-bottom: 12px;">Support</h4>
            <ul style="list-style: none; padding: 0;">
                <li>Account</li>
                <li>Support Center</li>
                <li>Feedback</li>
                <li>Contacts</li>
            </ul>
        </div>

    </div>

    <!-- Bottom Note -->
    <div style="text-align: center; margin-top: 40px; font-size: 0.85rem; color: #777;">
        © <%= java.time.Year.now() %> BloomBite — Designed with flavor
    </div>
</div>
</footer>

<!-- AOS Script -->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
AOS.init({
    duration:1200,
    once:true,
    easing:"ease-out-cubic"
});
</script>

</body>
</html>
