package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnect {

	private static Connection conn;
	
	public static Connection getConn() {
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/phonebook_db";
			String name = "root";
			String password = "root";
			
			// establish connection
			conn = DriverManager.getConnection(url,name,password);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
		
	}
}
