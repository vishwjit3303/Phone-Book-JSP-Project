<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ page import="com.entity.User"%>

<!Doctype html>
<html>
<head>
<title>nav bar</title>
<style>
/* Internal CSS for Transparent Navbar */
.navbar {
	background-color: rgba(255,157,14); 
	
	/* Black background with 50% transparency */
	border: none;
}

.navbar .navbar-brand, .navbar .nav-link {
	color: #ffffff !important; /* White text for navbar items */
	transition: color 0.3s;
}

.navbar .nav-link:hover {
	color: #ffcc00 !important; /* Hover effect for navbar items */
}

.navbar-toggler {
	border: none;
}

.modal-content {
	background-color: rgba(255, 255, 255, 0.9);
	/* Slightly transparent modal */
	border-radius: 10px;
}
</style>
</head>

<body>
	<nav class="navbar navbar-expand-lg  ">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp"><i
				class="fa-solid fa-phone" style="color: #ffffff;"></i> PhoneBook</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item active"><a class="nav-link active"
						aria-current="page" href="index.jsp"><i
							class="fa-sharp fa-light fa-house" style="color: #ffffff;"></i>
							Home</a></li>

					<li class="nav-item active"></i> <a class="nav-link"
						href="addContact.jsp" style="color: white;"><i
							class="fa-solid fa-plus" style="color: white;"></i> Add Phone No</a></li>
					<li class="nav-item active"><a class="nav-link "
						href="viewContact.jsp" style="color: white;"><i
							class="fa-regular fa-eye" style="color: white;"></i> View Contact</a></li>
				</ul>

				<%
				User user = (User) session.getAttribute("user");

				if (user == null) {
				%>
				<form class="d-flex">
					<a href="login.jsp" class="btn btn-success"> <i
						class="fa-solid fa-right-to-bracket" style="color: #f3f4f7;"></i>
						Login
					</a> <a href="register.jsp" class="btn btn-danger ms-2"> <i
						class="fa-regular fa-user" style="color: #ffffff;"></i> Registor
					</a>
				</form>
				<%
				} else {
				%>
				<form class="d-flex">
					<button class="btn btn-success"><%=user.getName()%></button>
					<a data-bs-toggle="modal" data-bs-target="#exampleModal"
						class="btn btn-danger ms-2">Log Out</a>
				</form>
				<%
				}
				%>

			</div>
		</div>

		<!-- logout popup -->


		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body text-center">
						<h6>Do You Want To LogOut</h6>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<a href="Logout" type="button" class="btn btn-danger">Logout</a>
					</div>
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>
		<!-- logout popup -->


		<!--end od logout popup -->
	</nav>
</body>
</html>