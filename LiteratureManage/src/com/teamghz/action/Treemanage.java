package com.teamghz.action;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.teamghz.connecter.MysqlConnecter;
public class Treemanage {
	private String username;
	public void searchtree(){
		ServletRequest request = ServletActionContext.getRequest();
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		String usermail = (String) session.getAttribute("usermail");
		String sql = "select * from User where mail=\"" + usermail + "\"" ;
		MysqlConnecter mc = new MysqlConnecter();
		ArrayList<Map<String, String>> result =  mc.select(sql);
		String userid=result.get(0).get("1");
		username = result.get(0).get("2");
		session.setAttribute("username", username);
		sql = "select * from Tree where userid=\"" + userid + "\"" ;
		result =  mc.select(sql);
		ArrayList<String> tree = new ArrayList<>();
		String tem ="";
		int i;
		for(i = 0;i < result.size();i++){
			tem ="\""+ result.get(i).get("1")+"|"+ result.get(i).get("3")+"|" +result.get(i).get("2")+"|#"+"\"";
			tree.add(tem);
		}
		session.setAttribute("tree",tree);
		int num = result.size();
		num = 11;
		session.setAttribute("num",num);
	}
}
