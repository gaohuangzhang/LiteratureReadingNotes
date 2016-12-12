package com.teamghz.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.CRC32;
import java.util.zip.CheckedOutputStream;
import net.sf.json.JSONArray;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.teamghz.configure.*;
import com.teamghz.connecter.*;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipOutputStream;

public class Treemanage {
	private String result1;
	private String result2;
	private String msg1;
	private String msg2;
	private String zipPath;

	public String getZipPath() {
		return zipPath;
	}

	public void setZipPath(String zipPath) {
		this.zipPath = zipPath;
	}

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

	public String getAllBooks() {
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
			if (Configure.isOnWindows())
				re3 = re3.replaceAll("\\\\", "\\\\\\\\");
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
			if (Configure.isOnWindows())
				tmp = "{id:" + m.get("1") + ", pId:" + m.get("3") + ",name: \"" + m.get("2") + "\",url:\""
						+ m.get("5").replaceAll("\\\\", "\\\\\\\\") + "\"}";
			else
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
			if (Configure.isOnWindows())
				ele[3] = ele[3].replaceAll("\\\\", "\\\\\\\\");
			sql = "insert into Tree(id,nodename,pid,userid,url) values(" + ele[0] + ",'" + ele[1] + "'," + ele[2] + ","
					+ userid + ",'" + ele[3] + "')";
			res = mc.update(sql);
		}
		return "success";
	}

	public String downloadBooks() {
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
			if (Configure.isOnWindows())
				url[i] = list[i].split(" ")[3].replaceAll("\\\\", "\\\\\\\\");
			else
				url[i] = list[i].split(" ")[3];
			num1 = searchid1.matcher(url[i]);
			if (num1.find()) {
				tmp = num1.group();
				num2 = searchid2.matcher(tmp);
				if (num2.find())
					id.add(num2.group());
			}
		}
		
		String root = ServletActionContext.getServletContext().getRealPath("/");
		String filePath;
		if (Configure.ONTOMCAT)
			filePath = root;
		else
			filePath = Configure.DOWNLOAD;
		
		MysqlConnecter mc = new MysqlConnecter();
		List<File> files = new ArrayList<File>();
		
		for (int i = 0; i < id.size(); i++) {
			ArrayList<Map<String, String>> fileResult = mc.select("select url from Article where articleid='" + id.get(i) + "';");
			files.add(new File(filePath + fileResult.get(0).get("1")));
		}
		ServletRequest request = ServletActionContext.getRequest();
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		String usermail = (String) session.getAttribute("usermail");
		zipPath = filePath + Configure.SLOCATION + usermail + Configure.SEPARATOR + "pack.zip";
		byte[] buffer = new byte[1024];
		try {
			FileOutputStream fos = new FileOutputStream(zipPath);
			CheckedOutputStream cos = new CheckedOutputStream(fos, new CRC32());
			ZipOutputStream out = new ZipOutputStream(cos);
			out.setEncoding("GBK");
			for (int i = 0; i < files.size(); i++) {
				FileInputStream fis = new FileInputStream(files.get(i));
				out.putNextEntry(new ZipEntry(files.get(i).getName()));
				int len;
				while ((len = fis.read(buffer)) > 0)
					out.write(buffer, 0, len);
				out.closeEntry();
				fis.close();
			}
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		zipPath = Configure.SLOCATION + usermail + Configure.SEPARATOR + "pack.zip";
		return "SUCCESS";
	}
}