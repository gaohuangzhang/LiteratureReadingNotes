package com.teamghz.action;

import java.util.ArrayList;
import java.util.Map;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.teamghz.configure.*;
import com.teamghz.connecter.MysqlConnecter;

public class TimeLine {
	public String execute() {
		ServletRequest request = ServletActionContext.getRequest();
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession();
		String usermail = (String)session.getAttribute("usermail");
		MysqlConnecter mc = new MysqlConnecter();
		ArrayList<Map<String, String>> result = mc.select("select userid from User where mail='" + usermail + "';");
		String userid = result.get(0).get("1");
		ArrayList<Map<String, String>> actionResult = mc.select("select action, time from Log where userid='" + userid + "';");
		session.setAttribute("timeline", actionResult);
		return "SUCCESS";
	}
}
