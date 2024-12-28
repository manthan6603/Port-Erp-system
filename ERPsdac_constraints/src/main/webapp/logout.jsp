<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logged Out</title>

    <!-- Optional: Redirect after a few seconds -->
    <meta http-equiv="refresh" content="2;url=<%= request.getContextPath() %>/login.jsp">

    <!-- Bootstrap CSS (Optional for styling) -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <div class="alert alert-success text-center">
            <h3><%= request.getAttribute("message") %></h3>
            <p>You will be redirected to the login page in a few seconds...</p>
        </div>
    </div>
</body>
</html>
