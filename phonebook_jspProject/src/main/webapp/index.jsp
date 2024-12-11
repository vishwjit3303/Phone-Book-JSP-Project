<%@page import="java.sql.Connection"%>
<%@ page import="com.conn.DbConnect" %>
<%@ page import="com.entity.User" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>phone book</title>
		<%@ include file="component/allCss.jsp" %>
		
		<style type="text/css">
		
	.back-img {
		    background: url("images/pbg.jpeg");
		    width: 100%;
		    height: 90vh;
		    padding: 100px;
		    background-repeat: no-repeat;
		    background-position: center center;
		    background-size: cover;
		    background-attachment: fixed;
		}
		
	



			
		</style>
	</head>
	<body>
		<%@include file="component/navBar.jsp" %>
		
		<div class="container-fluid  back-img text-center text-white">
			<h1 class="pt-2">Welcome To Phone Book</h1>
		</div>
		
		
		<div style="margin-top:-30px" >
			<%@include file="component/footer.jsp" %>
		</div>
	</body>
</html>