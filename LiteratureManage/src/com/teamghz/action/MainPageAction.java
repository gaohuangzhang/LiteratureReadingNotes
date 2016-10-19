package com.teamghz.action;


import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

//import this package for using the configure values or other such as mysql-username etc.
//if you want to use the value in this package, just like that: Configure.DRIVER  --(className.valueName)
import com.teamghz.configure.*;
//import this package for connecting the mysql
import com.teamghz.connecter.*;

public class MainPageAction {
	public void findAllKindOfArticles() {
		ServletRequest request = ServletActionContext.getRequest();
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		String usermail = (String) session.getAttribute("usermail");
		String sql_base = "select Article.articlename, Article.url from Article, User where Article.userid=User.userid and User.mail=";
		String sql_notread = sql_base + "\"" + usermail + "\""+ " and Article.status=\"NOT_READ\""; 
		String sql_readlittle = sql_base + "\"" + usermail + "\""+ " and Article.status=\"COARSE_READ\""; 
		String sql_readall = sql_base+ "\"" + usermail + "\"" + " and Article.status=\"INTENSIVE_READ\"";                   
		String sql_all = sql_base + "\"" + usermail + "\"";	
		MysqlConnecter mc = new  MysqlConnecter();
		ArrayList<Map<String, String>> notread = mc.select(sql_notread);
		System.out.println(sql_notread);
		session.setAttribute("notread", notread);
		
		ArrayList<Map<String, String>> readlittle = mc.select(sql_readlittle);
		System.out.println(sql_readlittle);
		session.setAttribute("readlittle", readlittle);
		
		ArrayList<Map<String, String>> readall = mc.select(sql_readall);
		System.out.println(sql_readall);
		session.setAttribute("readall", readall);
		
		ArrayList<Map<String, String>> all = mc.select(sql_all);
		System.out.println(sql_all);
		session.setAttribute("all", all);
	}

}
