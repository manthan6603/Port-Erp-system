<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consumer Profile</title>

    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="style.css">
    <style>
        /* Add styles for the new update profile button */
        .update-profile-btn {
            display: block;
            margin: 30px auto;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .update-profile-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<header class="header">
    <section class="flex">
        <a href="consume_dashboard.jsp" class="logo">PortERP</a>

       

        <div class="icons">
            <div id="menu-btn" class="fas fa-bars"></div>
            <div id="search-btn" class="fas fa-search"></div>
            <div id="user-btn" class="fas fa-user"></div>
            <div id="toggle-btn" class="fas fa-sun"></div>
        </div>

        <div class="profile">
            <img src="images/pic-1.jpg" class="image" alt="">
            <h3 class="name"><%= consumerName %></h3>
            <p class="role"><%= role %></p>
            <a href="viewProfile.jsp" class="btn">View Profile</a>
        </div>
    </section>
</header>

<div class="side-bar">
    <div id="close-btn">
        <i class="fas fa-times"></i>
    </div>

    <div class="profile">
        <img src="images/pic-1.jpg" class="image" alt="">
        <h3 class="name"><%= consumerName %></h3>
        <p class="role"><%= role %></p>
        <a href="viewProfile.jsp" class="btn">View Profile</a>
    </div>

    <nav class="navbar">
        <a href="consumer_dashboard.jsp"><i class="fas fa-home"></i><span>Home</span></a>
        <a href="viewproducts.jsp"><i class="fa-brands fa-product-hunt"></i><span>View Products</span></a>
        <a href="Vieworders.jsp"><i class="fa-solid fa-cart-shopping"></i><span>View Orders</span></a>
        <a href="reportIssue.jsp"><i class="fa-solid fa-flag"></i><span>Report Issue</span></a>
        <a href="trackOrder.jsp"><i class="fa-solid fa-truck-front"></i><span>Track Order</span></a>
        <a href="updateProfile.jsp"><i class="fa-solid fa-user"></i><span>Profile Settings</span></a>
    </nav>
</div>

<section class="user-profile">
    <h1 class="heading">Consumer Profile</h1>

    <div class="info">
        <div class="user">
            <img src="images/pic-1.jpg" alt="">
            <h3><%= consumerName %></h3>
            <p><%= role %></p>
        </div>

        <div class="box-container">
            <div class="box">
                <div class="flex">
                    <i class="fas fa-map-marker-alt"></i>
                    <div>
                        <span>Location</span>
                        <p><%= location %></p>
                    </div>
                </div>
            </div>

            <div class="box">
    <div class="flex">
        <i class="fas fa-key"></i>
        <div>
            <span>Password</span>
            
            <input type="password" value="<%= password %>" readonly class="box" style="border:none; background:none;" />
        </div>
    </div>
</div>

            <div class="box">
                <div class="flex">
                    <i class="fas fa-id-card"></i>
                    <div>
                        <span>Consumer ID</span>
                        <p><%= consumerId %></p>  <!-- Display consumer ID here -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Update Profile Button at Bottom Center -->
    <a href="updateProfile.jsp" class="update-profile-btn">Update Profile</a>

</section>

<footer class="footer">
    &copy; copyright @ 2024 by <span>PortERP</span> | All rights reserved!
</footer>

<!-- Custom JS -->
<script src="script.js"></script>

</body>
</html>
