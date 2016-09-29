package com.teamghz.action;

// import this package for using the configure values or other such as mysql-username etc.
// if you want to use the value in this package, just like that: Configure.DRIVER  --(className.valueName)
import com.teamghz.configure.*;
// import this package for connecting the mysql
import com.teamghz.connecter.*;


public class LoginAction {
	// user name for sign in or sign in
	private String name;
	// password for user
	private String password;
	// for name
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	// for password
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public String signIn() {
		MysqlConnecter mc = new MysqlConnecter();
		return "SUCCESS";
	}
	public String signUp() {
		MysqlConnecter mc = new MysqlConnecter();
		return "SUCCESS";
	}
	
	
	

}
