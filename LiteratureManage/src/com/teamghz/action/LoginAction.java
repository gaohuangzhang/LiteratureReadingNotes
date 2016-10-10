package com.teamghz.action;

// import this package for using the configure values or other such as mysql-username etc.
// if you want to use the value in this package, just like that: Configure.DRIVER  --(className.valueName)
import com.teamghz.configure.*;
// import this package for connecting the mysql
import com.teamghz.connecter.*;
import java.util.ArrayList;
import java.util.Map;

public class LoginAction {
	// user name for sign in or sign in
	private String name;
	
	// email
	private String mail;
	
	// password for user
	private String password;
	
	// password2
	private String password1;
	
	// for name
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		System.out.println(name);
		this.name = name;
	}
	
	// for password
	public String getPassword() {
		
		return password;
	}
	
	
	public void setPassword(String password) {
		System.out.println(password);
		this.password = password;
	}
	
    // for email
	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPassword1() {
		return password1;
	}
	// password again
	public void setPassword1(String password1) {
		this.password1 = password1;
	}
	
	// Action : Sign In
	public String signIn() {
		System.out.println(name + " " + password);
		String sql = "select * from User where mail=\"" + mail + "\"" ;
		MysqlConnecter mc = new MysqlConnecter();
		ArrayList<Map<String, String>> result =  mc.select(sql);
		// 1 : userid, 2: username, 3 : mail, 4 password, 5, joinintime
		if (result == null) 						 	return "USERNOTEXIST";
		else if (password != result.get(0).get("4")) 	return "PASSWORDERROR";
		else if (password == result.get(0).get("4")) 	return "SUCCESS";
		else 											return "OTHERERROR";
		            
	}
	// Action : Sign Up
	public String signUp() {
		// test password
		if (!password.equals(password1)) 	return "PASSWORDERROE";
		// test email
		String sql_email = "select * from User where mail=\"" + mail + "\"" ;
		MysqlConnecter mc_email = new MysqlConnecter();
		ArrayList<Map<String, String>> result =  mc_email.select(sql_email);
		if (result != null) 				return "EMAILEXIST";
		// insert
		String sql = "insert into User(username, mail, password) "
				+ "values(\"" + name + "\"," + "\"" + mail + "\"," + "\"" + password + "\")";
		MysqlConnecter mc = new MysqlConnecter();
		if (mc.update(sql) == 1) 			return "SUCCESS";
		else 								return "INSERTERROR";
	}
	// Action : About
	public String about() {
		return "SUCCESS";
	}

	

}
