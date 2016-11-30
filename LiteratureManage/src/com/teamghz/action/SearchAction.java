package com.teamghz.action;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.teamghz.connecter.MysqlConnecter;

public class SearchAction {
	
	private int userid;
	private String username;
	private String mail;
	private String jointime;
	private String avatar;
	private String all;
	private String readlittle;
	private String readall;
	public int getUserid() {
		return userid;
	}
	public String getMail() {
		return mail;
	}
	public String getJointime() {
		return jointime;
	}
	public String getAvatar() {
		return avatar;
	}
	public String getUsername() {
		return username;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getReadlittle() {
		return readlittle;
	}
	public void setReadlittle(String readlittle) {
		this.readlittle = readlittle;
	}
	public String getReadall() {
		return readall;
	}
	public void setReadall(String readall) {
		this.readall = readall;
	}
	public String getAll() {
		return all;
	}
	public void setAll(String all) {
		this.all = all;
	}
	public void searchInfo() {
		ServletRequest request = ServletActionContext.getRequest();
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		String usermail = (String) session.getAttribute("usermail");
		
		String sql_users = "select userid, username from User";
		MysqlConnecter mc = new  MysqlConnecter();
		ArrayList<Map<String, String>> users = mc.select(sql_users);
		session.setAttribute("users", users);
		
		String sql_articles = "select Article.articleid, Article.articlename, Article.url from Article, User where Article.userid = User.userid and User.mail ='" + usermail + "'" ;
		System.out.println(sql_articles);
		ArrayList<Map<String, String>> articles = mc.select(sql_articles);
		session.setAttribute("articles", articles);
		
		String sql_notes = "select Article.articleid, Article.articlename, Article.url, Note.id, Note.notename, Note.time, Note.note from User, Note, Article where " +
		"Note.articleid = Article.articleid and  User.mail='" + usermail + "'";
		System.out.println(sql_notes);
		ArrayList<Map<String, String>> notes = mc.select(sql_notes);
		session.setAttribute("notes", notes);
	}
	public String seePeopleInfo() {
		System.out.println(userid);
		String sql = "select * from User where userid=" + userid;
		String sql_all = "select count(*) from Article where userid=" + userid;
		String sql_readlittle = "select count(*) from Article where status= 'COARSE_READ' and userid=" + userid;
		String sql_readall = "select count(*) from Article where status= 'INTENSIVE_READ' and userid=" + userid;
		MysqlConnecter mc = new  MysqlConnecter();
		ArrayList<Map<String, String>> user = mc.select(sql);
		System.out.println(sql);
		username = user.get(0).get("2");
		System.out.println(username);
		mail = user.get(0).get("3");
		jointime = user.get(0).get("5");
		avatar = user.get(0).get("6");
		System.out.println(sql_all);
		ArrayList<Map<String, String>> a = mc.select(sql_all);
		all = a.get(0).get("1");
		ArrayList<Map<String, String>> rl = mc.select(sql_readlittle);
		readlittle = rl.get(0).get("1");
		ArrayList<Map<String, String>> ra = mc.select(sql_readall);
		readall = ra.get(0).get("1");
		return "SUCCESS";
	}

}
