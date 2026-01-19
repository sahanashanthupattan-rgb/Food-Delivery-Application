<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>🍔BloomBite | Profile</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Segoe UI", Roboto, Arial, sans-serif;
        }

        body {
            background-color: #fafafa;
            color: #222;
        }

        header {
            background: linear-gradient(90deg, #e23744, #ff6f61);
            padding: 14px 30px;
            color: #fff;
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .nav-container {
            max-width: 1300px;
            margin: auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: 700;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 22px;
        }

        nav ul li a {
            text-decoration: none;
            font-weight: 500;
            color: #fff;
            transition: 0.3s;
        }

        nav ul li a:hover {
            color: #ffe082;
        }

        .profile-container {
            max-width: 900px;
            margin: 40px auto;
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .profile-banner {
            height: 180px;
            background: url("Images/food-banner.jpg") center/cover no-repeat;
        }

        .profile-header {
            display: flex;
            align-items: center;
            gap: 20px;
            padding: 20px;
            margin-top: -60px;
        }

        .profile-avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background: #e23744;
            color: #fff;
            font-size: 2rem;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 4px solid #fff;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }

        .profile-info h2 {
            font-size: 1.6rem;
            font-weight: 600;
            color: #333;
        }

        .profile-info p {
            font-size: 0.95rem;
            color: #666;
        }

        .profile-actions {
            margin: 30px 20px;
            display: flex;
            gap: 16px;
        }

        .btn {
            padding: 12px 20px;
            border-radius: 30px;
            border: none;
            cursor: pointer;
            font-weight: 600;
            transition: 0.3s;
        }

        .btn-edit {
            background-color: #ffc107;
            color: #333;
        }

        .btn-edit:hover {
            background-color: #ffb300;
        }

        .btn-logout {
            background-color: #dc3545;
            color: #fff;
        }

        .btn-logout:hover {
            background-color: #c82333;
        }

        footer {
            background: #f5f5f5;
            text-align: center;
            padding: 20px;
            font-size: 0.85rem;
            color: #777;
            margin-top: 40px;
        }
    </style>
</head>
<body>

<header>
    <div class="nav-container">
        <div class="logo">BloomBite</div>
        <nav>
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="restaurants.jsp">Restaurants</a></li>
                <li><a href="cart.jsp">Cart</a></li>
                <li><a href="profile.jsp">Profile</a></li>
            </ul>
        </nav>
    </div>
</header>

<div class="profile-container">
    <div class="profile-banner"></div>
    <div class="profile-header">
        <%
            String username = (String) session.getAttribute("user");
        %>
        <!-- Avatar with first letter of username -->
        <div class="profile-avatar">
            <%= (username != null && !username.isEmpty()) 
                ? username.substring(0,1).toUpperCase() 
                : "G" %>
        </div>
        <div class="profile-info">
            <h2><%= (username != null && !username.isEmpty()) ? username : "Guest" %></h2>
            <p><%= (username != null) 
                ? "Welcome to your BloomBite profile!" 
                : "Please login to view your profile." %></p>
        </div>
    </div>

    <div class="profile-actions">
        <button class="btn btn-edit" onclick="window.location.href='editProfile.jsp'">Edit Profile</button>
        <button class="btn btn-logout" onclick="window.location.href='logout'">Logout</button>
    </div>
</div>

<footer>
    © <%= java.time.Year.now() %> BloomBite — Your favorite food, delivered fast
</footer>

</body>
</html>