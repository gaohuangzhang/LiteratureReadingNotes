package com.teamghz.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.teamghz.configure.*;
import com.teamghz.connecter.*;

public class Treemanage {
	private String result1;
	private String result2;
    public String getResult1() {
        return result1;
    }
    public String getResult2() {
        return result2;
    }
	public String searchAllBooks(){
		ServletRequest request = ServletActionContext.getRequest();
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		String tmp = "";
		String usermail = (String) session.getAttribute("usermail");
		String sql = "select Article.articleid, Article.articlename, Article.url from Article, User where User.userid=Article.userid and User.mail='" + usermail +"'"; 
		List<String> lstTree = new ArrayList<String>();
		MysqlConnecter mc = new  MysqlConnecter();
		ArrayList<Map<String, String>> books = mc.select(sql);
		for (Map<String, String> m : books) {
			String re3 = m.get("3");
			re3 =re3.replaceAll("\\\\", "\\\\\\\\");
			tmp = "{id:" + m.get("1") + ", pId:0, " + "name: \"" + 
		m.get("2") + "\", url:\"readArticle?url=" + re3+ "&articlename=" + m.get("2") + "&id=" + m.get("1") + "\"}";  
			
			System.out.println(tmp);
			lstTree.add(tmp);
			tmp = "";
		}
		String s = JSONArray.fromObject(lstTree).toString();
		
		result2 = s;
		sql = "select * from User where mail='" + usermail +"'"; 
		books = mc.select(sql);
		String userid = books.get(0).get("1");
		String username = books.get(0).get("2");
		sql = "select * from Tree where userid='" + userid +"'"; 
		books = mc.select(sql);
		if(books.size()==0){
			sql = "insert into Tree(nodename,pid,userid,url) values('"+username+"',0,"+userid+",NULL)";
			int re = mc.update(sql);
			sql = "select * from Tree where userid='" + userid +"'"; 
			books = mc.select(sql);
		}
		lstTree.clear();
		for (Map<String, String> m : books) {
			tmp = "{id:" + m.get("1") + ", pId:"+m.get("3") + ",name: \"" + 
		m.get("2") + "\",url:\""+m.get("5")+"\"}";  
			System.out.println(tmp);
			lstTree.add(tmp);
			tmp = "";
		}
		s = JSONArray.fromObject(lstTree).toString();
		
		result1 = s;
		return "success";
	}
}
