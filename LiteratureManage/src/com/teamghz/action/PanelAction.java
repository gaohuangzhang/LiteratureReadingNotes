package com.teamghz.action;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.teamghz.configure.*;
import com.teamghz.connecter.*;

public class PanelAction {
	public String signOut() {
		ServletRequest request = ServletActionContext.getRequest();
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		session.invalidate();  
		System.out.println("SignOut");
		return "SUCCESS";
	}
}
