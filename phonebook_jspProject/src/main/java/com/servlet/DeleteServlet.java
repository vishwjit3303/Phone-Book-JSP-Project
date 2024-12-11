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

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cid = Integer.parseInt(request.getParameter("cid"));
		
		ContactDAO cdo = new ContactDAO(DbConnect.getConn());
		
		boolean f = cdo.deleteContactById(cid);
		
		HttpSession session = request.getSession();
		
		if(f) 
		{
			session.setAttribute("succMsg", "Contact Deleted Successfully...");
			response.sendRedirect("viewContact.jsp");
		}
		else {
			session.setAttribute("failedMsg", "Somthing Is Wrong...");
			response.sendRedirect("viewContact.jsp");
		}
	}



}
