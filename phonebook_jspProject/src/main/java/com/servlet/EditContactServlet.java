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


@WebServlet("/EditContactServlet")

public class EditContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cid = Integer.parseInt(request.getParameter("cid"));
		System.out.println("in Edit Servlet cid is: "+cid );
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String about = request.getParameter("about");
		
		Contact c = new Contact();
		c.setName(name);
		c.setEmail(email);
		c.setAbout(about);
		c.setMobile(mobile);
		c.setContactId(cid);
		
		
		
		ContactDAO cdao = new ContactDAO(DbConnect.getConn());
		
		boolean f = cdao.updateContact(c);
		System.out.println("boolean: "+f);
		
		HttpSession session = request.getSession();
		if(f) {
			session.setAttribute("succMsg", "Your Contact Updated Successfully");
			response.sendRedirect("viewContact.jsp");
		}
		else {
			session.setAttribute("failMsg", "Somthing Went Wrong On Server");
			response.sendRedirect("editContact.jsp?cid="+cid);
		}
	}

}
