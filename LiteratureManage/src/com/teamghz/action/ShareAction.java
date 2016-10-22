package com.teamghz.action;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.teamghz.connecter.MysqlConnecter;

public class ShareAction {
	private String flag;
	private String id;
	private String feeling;
	
	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFeeling() {
		return feeling;
	}

	public void setFeeling(String feeling) {
		this.feeling = feeling;
	}

	public String shareArticle() {
		ServletRequest request = ServletActionContext.getRequest();
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		String usermail = (String) session.getAttribute("usermail");
		MysqlConnecter mc = new  MysqlConnecter();
		
		String sql_id = "select userid from User where mail=\"" + usermail +"\"";
		System.out.println(sql_id);
		ArrayList<Map<String, String>> r = mc.select(sql_id);
		System.out.println(r.size());
		String userid = r.get(0).get("1");
		System.out.println(feeling);
		feeling = feeling.replaceAll("\"", "\\\\\"");
		String sql = "insert into Share (userid, articleid, feeling) values(" + userid + ", " +id+ ",\"" + feeling + "\")" ;
		System.out.println(sql);
		if (mc.update(sql) > 0) {
			flag = "TRUE";
		    return "SUCCESS";
		}
		else {
			flag = "FALSE";
			return "FALSE";
		}
	}
}
