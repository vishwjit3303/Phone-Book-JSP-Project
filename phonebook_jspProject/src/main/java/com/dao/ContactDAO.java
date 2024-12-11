package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Contact;

public class ContactDAO {

	private Connection conn;

	public ContactDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean saveContact( Contact c) {
		
		boolean f = false;
		
		try {
			String sql = "INSERT INTO contact(name,email,contact,about,userid) VALUES(?,?,?,?,?)";
			
			PreparedStatement p = conn.prepareStatement(sql);
			System.out.println("getNAme: "+c.getName());
			p.setString(1, c.getName());
			p.setString(2, c.getEmail());
			p.setString(3, c.getMobile());
			p.setString(4, c.getAbout());
			p.setInt(5, c.getUserId());
			
			int i = p.executeUpdate();
			System.out.println("i is: "+i);
			
			if( i == 1) {
				f = true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public List<Contact> getAllContact(int uid){
		
		List<Contact> list = new ArrayList<Contact>();
		
		Contact c = null;
		
		try {
			String sql = "SELECT * FROM contact WHERE userid = ? ";
			PreparedStatement p = conn.prepareStatement(sql);
			p.setInt(1, uid);
			
			ResultSet rs = p.executeQuery();
			
			while (rs.next()) {
				c = new Contact();
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setMobile(rs.getString(4));
				c.setAbout(rs.getString(5));
				
				list.add(c);
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public Contact getContactbyId(int cid) {
		Contact c = new Contact();
		
		try {
			PreparedStatement p = conn.prepareStatement("SELECT * FROM CONTACT WHERE id = ?");
			p.setInt(1, cid);
			
			ResultSet rs = p.executeQuery();
			
			while(rs.next()) {
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setMobile(rs.getString(4));
				c.setAbout(rs.getString(5));
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return c;
	}
	
	public boolean updateContact(Contact c) {
		boolean f = false;
		
		try {
			String sql = "UPDATE contact SET name=?, email=?, contact=?, about=? WHERE id=?";
			
			
			PreparedStatement p = conn.prepareStatement(sql);
			System.out.println("getNAme: "+c.getName());
			p.setString(1, c.getName());
			p.setString(2, c.getEmail());
			p.setString(3, c.getMobile());
			p.setString(4, c.getAbout());
//			p.setInt(5, c.getUserId());
			p.setInt(5, c.getContactId());
			
			int i = p.executeUpdate();
			System.out.println("i is: "+i);
			
			if( i == 1) {
				f = true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public boolean deleteContactById(int id) {
		
		boolean f = false;
		
		try {
			
			String sql = "DELETE FROM contact WHERE id=?";
			PreparedStatement p = conn.prepareStatement(sql);
			p.setInt(1, id);
			int i = p.executeUpdate();
			
			if( i == 1) {
				f = true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
}
