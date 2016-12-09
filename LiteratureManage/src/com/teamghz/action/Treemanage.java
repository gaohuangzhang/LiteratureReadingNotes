package com.teamghz.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
	private String msg1;
	private String msg2;

	public void setMsg1(String msg1) {
		this.msg1 = msg1;
	}

	public void setMsg2(String msg2) {
		this.msg2 = msg2;
	}

	public String getResult1() {
		return result1;
	}

	public String getResult2() {
		return result2;
	}

	public String searchAllBooks() {
		ServletRequest request = ServletActionContext.getRequest();
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		String tmp = "";
		String usermail = (String) session.getAttribute("usermail");
		String sql = "select Article.articleid, Article.articlename, Article.url from Article, User where User.userid=Article.userid and User.mail='"
				+ usermail + "'";
		List<String> lstTree = new ArrayList<String>();
		MysqlConnecter mc = new MysqlConnecter();
		ArrayList<Map<String, String>> books = mc.select(sql);
		for (Map<String, String> m : books) {
			String re3 = m.get("3");
			tmp = "{id:" + m.get("1") + ", pId:0, " + "name: \"" + m.get("2") + "\", url:\"readArticle?url=" + re3
					+ "&articlename=" + m.get("2") + "&id=" + m.get("1") + "\"}";

			lstTree.add(tmp);
			tmp = "";
		}
		String s = JSONArray.fromObject(lstTree).toString();

		result2 = s;
		sql = "select * from User where mail='" + usermail + "'";
		books = mc.select(sql);
		String userid = books.get(0).get("1");
		String username = books.get(0).get("2");
		sql = "select * from Tree where userid='" + userid + "'";
		books = mc.select(sql);
		if (books.size() == 0) {
			sql = "insert into Tree(nodename,pid,userid,url) values('" + username + "',0," + userid + ",null)";
			int re = mc.update(sql);
			sql = "select * from Tree where userid='" + userid + "'";
			books = mc.select(sql);
		}
		lstTree.clear();
		for (Map<String, String> m : books) {
			tmp = "{id:" + m.get("1") + ", pId:" + m.get("3") + ",name: \"" + m.get("2") + "\",url:\""
					+ m.get("5") + "\"}";
			lstTree.add(tmp);
			tmp = "";
		}
		s = JSONArray.fromObject(lstTree).toString();

		result1 = s;
		return "success";
	}

	public String updateMysql() {
		ServletRequest request = ServletActionContext.getRequest();
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		MysqlConnecter mc = new MysqlConnecter();
		String usermail = (String) session.getAttribute("usermail");
		String sql = "select * from User where mail='" + usermail + "'";
		ArrayList<Map<String, String>> re = mc.select(sql);
		String userid = re.get(0).get("1");
		String[] list = new String[100];
		list = msg1.split("\n");
		String[] ele = new String[4];
		sql = "delete from Tree where userid=" + userid;
		int res = mc.delete(sql);
		for (int i = 0; i < list.length; i++) {
			ele = list[i].split(" ");
			sql = "insert into Tree(id,nodename,pid,userid,url) values(" + ele[0] + ",'" + ele[1] + "'," + ele[2] + ","
					+ userid + ",'" + ele[3] + "')";
			res = mc.update(sql);
		}
		return "success";
	}

	public String generateDocu() {
		Pattern searchid1 = Pattern.compile("id=\\d*");
		Pattern searchid2 = Pattern.compile("\\d+");
		String[] list = new String[100];
		list = msg2.split("\n");
		String[] url = new String[list.length];
		List<String> id = new ArrayList<String>();
		Matcher num1;
		Matcher num2;
		String tmp;
		for (int i = 0; i < list.length; i++) {
			url[i] = list[i].split(" ")[3];
			num1 = searchid1.matcher(url[i]);
			if (num1.find()) {
				tmp = num1.group();
				num2 = searchid2.matcher(tmp);
				if (num2.find())
					id.add(num2.group());
			}
		}
		for (int i = 0; i < id.size(); i++)
			System.out.print(id.get(i) + "\n");
		return "success";
	}
}
