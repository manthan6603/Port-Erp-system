<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
session = request.getSession(false); // Get the existing session, do not create a new one

if (session == null || session.getAttribute("userId") == null || !session.getAttribute("role").equals("Consumer")) {
	// Redirect to login page if no session exists or user is not a consumer
	response.sendRedirect("login.jsp");
	return;
}

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires",0);// Proxies
    
// Retrieve session details
String userId = (String) session.getAttribute("userId");
String role = (String) session.getAttribute("role");
String location = (String) session.getAttribute("location");
%>

<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Dashboard | PortERP</title>

<!-- Font Awesome CDN Link -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" />

<!-- Custom CSS File Link -->
<link href="<%=request.getContextPath()%>/css/styles.css"
	rel="stylesheet" />

<!-- Additional Style for Data Tables -->
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />

<!-- FontAwesome for Icons -->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>

<style>
.alert-dismissible .btn-close {
	position: absolute;
	top: 0;
	right: 10px;
	padding: 1.25rem;
	color: inherit;
}
</style>

<script>
    // Auto-dismiss alert after 3 seconds
    setTimeout(() => {
        const alert = document.getElementById('alert-success');
        if (alert) {
            alert.classList.remove('show');  // Remove 'show' class to start fading
            alert.classList.add('fade');     // Add 'fade' class to fade it out

            // Remove from DOM after fade transition (waits 500ms to complete the fade)
            setTimeout(() => alert.remove(), 500); 
        }
    }, 3000); // 3-second delay before starting to fade out
</script>


</head>

<body class="sb-nav-fixed">
	<!-- Navigation Bar -->
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand ps-3"
			href="<%=request.getContextPath()%>/consumer_dashboard.jsp"><center>PortERP</center></a>

		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle">
			<i class="fas fa-bars"></i>
		</button>

		<!-- Navbar User Options -->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"> <i
					class="fas fa-user fa-fw"></i>
			</a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item"
						href="<%=request.getContextPath()%>/LogoutServlet">Logout</a></li>
				</ul></li>
		</ul>
	</nav>

	<!-- Side Navigation -->
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Core</div>
						<a class="nav-link active"
							href="<%=request.getContextPath()%>/consumer_dashboard.jsp">
							<i class="fas fa-home"></i> Dashboard
						</a>

						<div class="sb-sidenav-menu-heading">Products</div>
						<a class="nav-link"
							href="<%=request.getContextPath()%>/ProductsServlet?action=viewProducts&role=Consumer">
							<i class="fa-brands fa-product-hunt"></i> View Products
						</a>

						<div class="sb-sidenav-menu-heading">Orders</div>
						<a class="nav-link"
							href="<%=request.getContextPath()%>/OrdersServlet?action=viewOrders&role=Consumer">
							<i class="fa-solid fa-cart-shopping"></i> View Orders
						</a>

						<div class="sb-sidenav-menu-heading">Issues</div>
						<a class="nav-link" href="reportIssue.jsp"> <i
							class="fas fa-exclamation-triangle"></i> Report Issues
						</a>

						<div class="sb-sidenav-menu-heading">Track Order</div>
						<a class="nav-link" href="trackOrder.jsp"> <i
							class="fa-solid fa-truck-front"></i> Track Order
						</a>


						<div class="sb-sidenav-menu-heading">Settings</div>
						<a class="nav-link" href="ConsumerProfileSettings.jsp"> <i
							class="fa-solid fa-user"></i> Update Profile
						</a>
					</div>
				</div>
			</nav>
		</div>

		<!-- Main Content Area -->
		<div id="layoutSidenav_content">
			<main>
				<%
				String successMessage = (String) session.getAttribute("successMessage");
				if (successMessage != null) {
				%>
				<div id="alert-success"
					class="alert alert-success alert-dismissible fade show"
					role="alert">
					<%=successMessage%>
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
				<%
				session.removeAttribute("successMessage");
				}
				%>


				<div class="container-fluid px-4">
					<h1 class="mt-4">Consumer Dashboard</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item active">Dashboard</li>
					</ol>

					<!-- Displaying user details from session -->
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-user"></i> User Details
						</div>
						<div class="card-body">
							<p>
								<strong>Port ID: </strong>
								<%=userId%></p>
							<p>
								<strong>Role: </strong>
								<%=role%></p>
							<p>
								<strong>Location: </strong><%=location%></p>
						</div>
					</div>
				</div>
			</main>

			<!-- Footer Section -->
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">&copy; PortERP 2024</div>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<!-- JS Scripts -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script
		src="<%=request.getContextPath()%>/assets/demo/chart-area-demo.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="<%=request.getContextPath()%>/js/datatables-simple-demo.js"></script>
</body>
</html>
