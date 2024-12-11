package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.ContactDAO;
import com.entity.Contact;

@WebServlet("/AddContactServlet")

public class AddContactServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userid = Integer.parseInt(request.getParameter("userid") );
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String about = request.getParameter("about");
		
		System.out.println("user id: "+userid+"name: "+name+"email: "+email+"mobile: "+mobile+"about: "+about);
	
		Contact c = new Contact(name, email, mobile, about, userid);
		
		ContactDAO cdao = new ContactDAO(DbConnect.getConn());
		
		boolean f = cdao.saveContact(c);
		System.out.println("boolean: "+f);
		
		HttpSession session = request.getSession();
		if(f) {
			session.setAttribute("succMsg", "Your Contact is Saved");
			response.sendRedirect("addContact.jsp");
		}
		else {
			session.setAttribute("failMsg", "Somthing Went Wrong On Server");
			response.sendRedirect("addContact.jsp");
		}
		
	}

}
