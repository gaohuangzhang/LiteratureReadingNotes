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
	private String result;
    public String getResult() {
        return result;
    }
	public String searchAllBooks(){
		System.out.println("heeeeeeeee");
		ServletRequest request = ServletActionContext.getRequest();
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		String tmp = "";
		String usermail = (String) session.getAttribute("usermail");
		String sql = "select Article.articleid, Article.articlename, Article.url from Article, User where User.mail='" + usermail +"'"; 
		List<String> lstTree = new ArrayList<String>();
		System.out.println(sql);
		MysqlConnecter mc = new  MysqlConnecter();
		ArrayList<Map<String, String>> books = mc.select(sql);
		for (Map<String, String> m : books) {
			tmp = "{id:" + m.get("1") + ", pId:0, " + "name: \"" + 
		m.get("2") + "\", url:\"readArticle?url=" + m.get("3")+ "&articlename=" + m.get("2") + "&id=" + m.get("1") + "\"}";  
			System.out.println(tmp);
			lstTree.add(tmp);
			tmp = "";
		}
		String s = JSONArray.fromObject(lstTree).toString();
		
		result = s;
		System.out.println(s);
		return "success";
	}
}
