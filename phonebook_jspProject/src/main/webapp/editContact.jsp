<%@page import="com.conn.DbConnect"%>
<%@page import="com.dao.ContactDAO"%>
<%@page import="com.entity.Contact"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>edit contact</title>
		<%@ include file="component/allCss.jsp" %>
		
		<style>
.body {
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
	font-size: 16px;
	font-weight: 600;
	color: #333;
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
	background-color: #007bff;
	border-color: #007bff;
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
@media ( max-width : 576px) {
	.card-body {
		padding: 20px;
	}
}
</style>

	</head>
	
	<body>
	
		<%@include file="component/navBar.jsp" %>
	
		<%
		if( user == null){
			session.setAttribute("invalidMsg", "Login Please ...");
			response.sendRedirect("login.jsp");
		}
		%>
			<div class="card-body mt-5">
	
		<%
				String succMsg = (String)session.getAttribute("succMsg");
				System.out.println("Succ meg: "+succMsg);
				String failMsg = (String)session.getAttribute("failMsg");
				System.out.println("Fail meg: "+failMsg);
					
				if(succMsg != null){
				%>
				<p class="text-center text-success"><%=succMsg %><p>
				<%
				session.removeAttribute("succMsg");
				}
					
				if( failMsg != null){
				%>
				<p class="text-center text-danger"><%=failMsg %><p>
				<%
				session.removeAttribute("failMsg");
				}
				%>
				
		<form action="EditContactServlet" method="post">
		
			<h2 class="text-center mt-3 text-success">Add Contact Page</h2>
			<%-- <%= request.getParameter("cid") %> --%>

			
		<%
			int cid = Integer.parseInt(request.getParameter("cid"));
			ContactDAO dao = new ContactDAO(DbConnect.getConn());
			Contact c = dao.getContactbyId(cid);
			
			%>
		
			<input type="hidden" value="<%=cid%>" name="cid">
			
			<div class="mb-3">
				<label for="exampleInputName" class="form-label">Enter Name</label>
				<input type="text" value="<%=c.getName() %>" name="name" class="form-control" id="exampleInputName"
					aria-describedby="emailHelp" placeholder="Enter your name">
			</div>

			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Email Address</label> 
					<input type="email" value="<%=c.getEmail() %>" class="form-control" name="email"
					id="exampleInputEmail1" aria-describedby="emailHelp"
					placeholder="Enter your email">
			</div>

			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Mobile Number</label> 
				<input type="text" value="<%=c.getMobile() %>" name="mobile" class="form-control" id="exampleInputPassword1" placeholder="Enter your password">
			</div>

			<div class="mb-3">
				<label for="about" class="form-label">Write About Us</label>
				<textarea name="about"  id="about" rows="3" name="about" class="form-control"
					placeholder="Write Your Message"><%=c.getAbout() %></textarea>
			</div>


			<div class="text-center">
				<button type="submit" class="btn btn-success btn-sm ">Update
					Contact</button>
			</div>
		</form>
	</div>

	<div style="margin-top: 110px">
		<%@include file="component/footer.jsp"%>
	</div>
		
		
	</body>
</html>