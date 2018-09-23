package com.shxt.framework.user.model;

public class User {
	private Integer user_id;
	private String account;
	private String password;
	private String user_name;
	private Integer status;
	private String role_name;
	public Integer getUser_id() {
		return this.user_id;
	}
	public void setUser_id( Integer user_id ) {
		this.user_id = user_id;
	}
	public String getAccount() {
		return this.account;
	}
	public void setAccount( String account ) {
		this.account = account;
	}
	public String getPassword() {
		return this.password;
	}
	public void setPassword( String password ) {
		this.password = password;
	}
	public String getUser_name() {
		return this.user_name;
	}
	public void setUser_name( String user_name ) {
		this.user_name = user_name;
	}
	public Integer getStatus() {
		return this.status;
	}
	public void setStatus( Integer status ) {
		this.status = status;
	}
	public String getRole_name() {
		return this.role_name;
	}
	public void setRole_name( String role_name ) {
		this.role_name = role_name;
	}
	@Override
	public String toString() {
		return "User [user_id=" + this.user_id + ", account=" + this.account + ", password=" + this.password
				+ ", user_name=" + this.user_name + ", status=" + this.status + ", role_name=" + this.role_name + "]";
	}


}
