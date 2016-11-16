package com.teamghz.action;

// import this package for using the configure values or other such as mysql-username etc.
// if you want to use the value in this package, just like that: Configure.DRIVER  --(className.valueName)
import com.teamghz.configure.*;
// import this package for connecting the mysql
import com.teamghz.connecter.*;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

public class LoginAction {
	// user name for sign in or sign in
	private String name;
	
	// email
	private String mail;
	
	// password for user
	private String passwd;
	
	// password2
	private String passwd_confirm;
	
	// for name
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	// for password
	public String getPasswd() {
		
		return passwd;
	}
	
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
    // for email
	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPasswd_confirm() {
		return passwd_confirm;
	}
	// password again
	public void setPasswd_confirm(String passwd_confirm) {
		this.passwd_confirm = passwd_confirm;
	}
	
	// Action : Sign In
	public String signIn() {
		if (mail == null || passwd == null || mail.equals("") || passwd.equals("")) {
			return "OTHERERROR";
		}
		String sql = "select * from User where mail=\"" + mail + "\"" ;
		MysqlConnecter mc = new MysqlConnecter();
		ArrayList<Map<String, String>> result =  mc.select(sql);
		// 1 : userid, 2: username, 3 : mail, 4 password, 5, joinintime
		if (result.size() == 0) {
			return "USERNOTEXIST";
		} else if (!passwd.equals(result.get(0).get("4"))) {
			return "PASSWORDERROR";
		} else if (passwd.equals(result.get(0).get("4"))) {
			ServletRequest request = ServletActionContext.getRequest();
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();
			session.setAttribute("usermail", mail);
			session.setAttribute("username", result.get(0).get("2"));
			session.setAttribute("i", 2);
			return "SUCCESS";
		} else {
			return "OTHERERROR";
		}            
	}
	// Action : Sign Up
	public String signUp() {
		String sql_email = "select * from User where mail=\"" + mail + "\"";
		MysqlConnecter mc_email = new MysqlConnecter();
		ArrayList<Map<String, String>> result =  mc_email.select(sql_email);
		if (result.size() != 0) {
			return "EMAILEXIST";
		}
		// insert
		String sql = "insert into User(username, mail, password) "
				+ "values(\"" + name + "\"," + "\"" + mail + "\"," + "\"" + passwd + "\")";
		MysqlConnecter mc = new MysqlConnecter();
		if (mc.update(sql) == 1) {
			ServletRequest request = ServletActionContext.getRequest();
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();
			session.setAttribute("usermail", mail);
			session.setAttribute("username", name);
			session.setAttribute("i", 2);
			return "SUCCESS";
		} else {
			return "INSERTERROR";
		}
	}
	
	public String emailValidate() {
		
		ServletRequest request = ServletActionContext.getRequest();
		String mail = request.getParameter("mail");
		System.out.println("2333");
		System.out.println(mail);
		String sql_email = "select * from User where mail=\"" + mail + "\"";
		MysqlConnecter mc_email = new MysqlConnecter();
		ArrayList<Map<String, String>> result =  mc_email.select(sql_email);
		if (result.size() != 0) {
			return "EMAILEXIST";
		}
		return "VALID";
	}
	
	// Action : About
	public String about() {
		
		return "SUCCESS";
	}

}
