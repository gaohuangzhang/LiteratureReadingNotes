package com.teamghz.action;

import com.teamghz.connecter.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import org.apache.struts2.ServletActionContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

public class PersonalCenterAction {
	
	public void getShareInfo() {
		ServletRequest request = ServletActionContext.getRequest();
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		MysqlConnecter mc = new  MysqlConnecter();
		try {
		String usermail = (String) session.getAttribute("usermail");
		ArrayList<Map<String, String>> tmp = mc.select("select userid from User where mail=\"" + usermail +"\"");
		String id = tmp.get(0).get("1");
		String sql = "select User.username, User.mail, Article.articlename, Article.url, Article.comment, Share.time, Share.good, Share.bad from User, Article, Share  WHERE Share.userid=User.userid and Share.articleid=Article.articleid";
		ArrayList<Map<String, String>> result = mc.select(sql);
		session.setAttribute("sharelist", result);
		} catch (Exception e) {
			System.out.println("ERROR WHEN GETTING THE SHARE INFOMATIONS");
		}
		
	}
	public void getPersonalArticle() {
		ServletRequest request = ServletActionContext.getRequest();
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		MysqlConnecter mc = new  MysqlConnecter();
		try {
		String usermail = (String) session.getAttribute("usermail");
		String sql = "select Article.articlename, Article.url, Article.status, User.username from Article, User where Article.userid=User.userid and User.mail="+ "\"" + usermail + "\"";	
		ArrayList<Map<String, String>> result = mc.select(sql);
		session.setAttribute("personalbooklist", result);
		} catch (Exception e) {
			System.out.println("ERROR WHEN GETTING THE ARTICLES");
		}
	}
}
