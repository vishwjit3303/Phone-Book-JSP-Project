<%@page import="com.conn.DbConnect"%>
<%@page import="com.dao.ContactDAO"%>
<%@page import="com.entity.Contact"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>view contact</title>
		<%@ include file="component/allCss.jsp" %>
		
		<style type="text/css">
			.crd-ho:hover
			{
				background-color: #f2f0f0;
				
			}
		
		</style>
	</head>
	<body style="background-color: #f47407">
		<%@include file="component/navBar.jsp" %>
	
		<%
		if( user == null){
			session.setAttribute("invalidMsg", "Login Please ...");
			response.sendRedirect("login.jsp");
		}
		%>
		
		<%
		String succMsg = (String)session.getAttribute("succMsg");
		String failMsg = (String)session.getAttribute("failedMsg");
		
		if(succMsg != null)
		{%>
				<div class="alert alert-success" role="alert">
				<%=succMsg %>
				</div>
		<%
		session.removeAttribute("succMsg");
		}
		if( failMsg != null){
			%>
			<p class="text-center text-danger"><%=failMsg %><p>
			<%
			session.removeAttribute("failedMsg");
			}
			%>
		
		<div class="container">
			<div class="row p-4 ">
				
				
				<%

				if(user != null)
				{
				
				ContactDAO dao = new ContactDAO(DbConnect.getConn());
				List<Contact> contact = dao.getAllContact(user.getId());
				
				for(Contact c : contact){
				%>
					<div class="col-md-3 mt-3">
						<div class="card crd-ho">
						<div class="card-body">
							<h5>Name: <%=c.getName() %></h5>
							<p>Phone no: <%=c.getMobile() %></p>
							<p>Email: <%=c.getEmail() %></p>
							<p>About: <%=c.getAbout() %></p>
							
							<div class="text-center">
								<a href="editContact.jsp?cid=<%=c.getId() %>" class="btn btn-success btn-sm">Edit</a>
								<a href="DeleteServlet?cid=<%=c.getId()%>" class="btn btn-danger btn-sm ms-2">Delete</a>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				}
				%>
				
			</div>
		</div>
	
	</body>
</html>