package com.teamghz.action;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.teamghz.connecter.MysqlConnecter;
public class Setting {
private String name;
	private int i = 2;
	// email
	private String oldpasswd;
	// password for user
	private String passwd;
	private String password;
	// password2
	private String passwd_confirm;
	
	// for name
	
	public void setName(String name) {
		this.name = name;
	}
	

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
    // for email
	public void setOldpasswd(String oldpasswd) {
		this.oldpasswd = oldpasswd;
	}

	public String getPasswd_confirm() {
		return passwd_confirm;
	}
	public String getOldpasswd() {
		return oldpasswd;
	}
	public String getPasswd() {
		return passwd;
	}
	public String getPassword() {
		return password;
	}
	public String getName() {
		return name;
	}
	// password again
	public void setPasswd_confirm(String passwd_confirm) {
		this.passwd_confirm = passwd_confirm;
	}
	public String setting1(){
		if (passwd == null || passwd_confirm == null || oldpasswd==null
				|| passwd.equals("") || passwd_confirm.equals("")||oldpasswd.equals("")) {
			i = 0;
			return "INSERTERROR";
		}
		ServletRequest request = ServletActionContext.getRequest();
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		String usermail = (String) session.getAttribute("usermail");
		String sql = "select * from User where mail=\"" + usermail + "\"" ;
		MysqlConnecter mc = new MysqlConnecter();
		ArrayList<Map<String, String>> result =  mc.select(sql);
		if(result.size()==0){
			i = 0;
			return "FAILED";}
		password=result.get(0).get("4");
		if (!oldpasswd.equals(result.get(0).get("4"))){
			i = 0;
			return "PASSWORDERROR";}
		if (!passwd.equals(passwd_confirm)) {
			i=0;
			return "PASSWORDERROE";}
		// 1 : userid, 2: username, 3 : mail, 4 password, 5, joinintime
		sql="update User set password=\""+passwd+"\" where mail=\""+usermail+"\"";
		i=mc.update(sql);
		session.setAttribute("i", i);
		if(i==1)
			return "SUCCESS";
		else
			return "FAILED";
	}
	public String setting2(){
		if (name == null 
				|| name.equals("") ) {
			i = 0;
			return "INSERTERROR";
		}
		ServletRequest request = ServletActionContext.getRequest();
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		String usermail = (String) session.getAttribute("usermail");
		MysqlConnecter mc = new MysqlConnecter();
		// 1 : userid, 2: username, 3 : mail, 4 password, 5, joinintime
		String sql="update User set username=\""+name+"\" where mail=\""+usermail+"\"";
		i=mc.update(sql);
		session.setAttribute("i", i);
		if(i==1)
			return "SUCCESS";
		else
			return "FAILED";
	}
}
