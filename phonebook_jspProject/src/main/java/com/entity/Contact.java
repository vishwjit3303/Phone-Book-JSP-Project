package com.entity;

public class Contact {

	private int id;
	private String name;
	private String email;
	private String mobile;
	private String about;
	private int userId;
	private int cid;
	
	public Contact() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Contact(String name, String email, String mobile, String about, int userId) {
		super();
//		this.id = id;
		this.name = name;
		this.email = email;
		this.mobile = mobile;
		this.about = about;
		this.userId = userId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public void setContactId(int cid) {
		this.cid = cid;
	}
	
	public int getContactId() {
		return cid;
	}
	
}
