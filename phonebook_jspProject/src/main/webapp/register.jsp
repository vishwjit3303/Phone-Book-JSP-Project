<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>registration</title>
<style>
	.body{
		background-color: #cacccf;
	}
	/* Center the form on the page */
	.card-body {
		max-width: 500px;
		margin: 0 auto;
		padding: 30px;
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		border-radius: 8px;
	}

	/* Style the labels */
	.form-label {
		font-size: 19px;
		font-weight: 600;
		color: white;
	}

	/* Style the form inputs */
	.form-control {
		border-radius: 5px;
		border: 1px solid #ccc;
		padding: 12px;
		font-size: 16px;
		width: 100%;
	}

	/* Focus effect for form inputs */
	.form-control:focus {
		box-shadow: none;
		border-color: #007bff;
	}

	/* Style the submit button */
	.btn-primary {
		background-color: #ffe400; 
		border-color: #f47407;
		padding: 12px 20px;
		font-size: 16px;
		width: 50%;
		border-radius: 5px;
	}

	/* Button hover effect */
	.btn-primary:hover {
		background-color: #0056b3;
		border-color: #0056b3;
	}

	/* Adjust the button style on smaller screens */
	@media (max-width: 576px) {
		.card-body {
			padding: 20px;
		}
	}
</style>

<%@include file="component/allCss.jsp"%>

</head>

<body  style="background-color: #f47407">
	<%@include file="component/navBar.jsp"%>

	<div class="card-body mt-5">
	
	<form action="RegisterServlet" method="post" >
	
	<h2 class="text-center mt-3 text-white">Registration Page</h2>
	
				<%
				String succMsg = (String)session.getAttribute("successMsg");
				String errorMsg = (String)session.getAttribute("errorMsg");
					
				if(succMsg != null){
				%>
				<p class="text-center text-success"><%=succMsg %><p>
				<%
				session.removeAttribute("successMsg");
				}
					
				if( errorMsg != null){
				%>
				<p class="text-center text-danger"><%=errorMsg %><p>
				<%
				session.removeAttribute("errorMsg");
				}
				%>
				
	
		<div class="mb-3 ">
			<label for="exampleInputName" class="form-label">Enter Name</label> 
			<input type="text" name="name" class="form-control" id="exampleInputName" aria-describedby="emailHelp" placeholder="Enter your name">
		</div>

		<div class="mb-3">
			<label for="exampleInputEmail1" class="form-label">Email Address</label> 
			<input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter your email">
		</div>

		<div class="mb-3">
			<label for="exampleInputPassword1" class="form-label">Password</label>
			<input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Enter your password">
		</div>

		<div class="text-center">
			<button type="submit" class="btn btn-primary1 btn-sm " style="background-color: #ffe400; border-color: #f47407;">Register</button>
		</div>
	</form>
</div>
	
	<div style="margin-top:100px" >
		<%@include file="component/footer.jsp" %>
	</div>
	
</body>
</html>