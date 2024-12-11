package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAO {

	private Connection conn;
	
	public UserDAO(Connection conn) {
		
		this.conn = conn;
	}
	
	public boolean userRegister(User u) {
		boolean f = false;
		
		try {
			
			String sql = "INSERT INTO users (name, email, password) VALUES(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			
			int i = ps.executeUpdate();
			
			if(i == 1) {
				f = true;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public User loginUser(String email, String pass) {

		User  user = null;
		
		System.out.println("in loginUSer: ");
		System.out.println("email: "+email+" pass: "+pass);
		
		try {
			
			String sql = "SELECT * FROM users WHERE email=? AND password=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pass);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				user = new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;
		
	}
	
}
