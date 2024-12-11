package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.UserDAO;
import com.entity.User;
import com.mysql.cj.Session;


@WebServlet("/LoginServlet")

public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		
		UserDAO dao = new UserDAO(DbConnect.getConn());
		User u = dao.loginUser(email, pass);
		System.out.println("email: "+email+" pass: "+pass);
		
		HttpSession session = request.getSession();
		
		if( u != null) {
			System.out.println("User is Available");
			
			session.setAttribute("user", u);
			response.sendRedirect("index.jsp");
			
		}
		else {
			System.out.println("User is not available");
			
			session.setAttribute("invalidMsg", "Invalid email or password");
			response.sendRedirect("login.jsp");
		}
		
	}

}
