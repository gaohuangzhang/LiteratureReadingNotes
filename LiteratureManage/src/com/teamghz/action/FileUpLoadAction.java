package com.teamghz.action;

import com.teamghz.configure.*;
import com.teamghz.connecter.*;
import java.io.*;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class FileUpLoadAction extends ActionSupport {
	private String username;

	// 娉ㄦ剰锛宖ile骞朵笉鏄寚鍓嶇jsp涓婁紶杩囨潵鐨勬枃浠舵湰韬紝鑰屾槸鏂囦欢涓婁紶杩囨潵瀛樻斁鍦ㄤ复鏃舵枃浠跺す涓嬮潰鐨勬枃浠�
	private File file;

	// 鎻愪氦杩囨潵鐨刦ile鐨勫悕瀛�
	private String fileFileName;
	private String articlename;
	// 鎻愪氦杩囨潵鐨刦ile鐨凪IME绫诲瀷
	private String fileContentType;

	public String getArticlename() {
		return articlename;
	}

	public void setArticlename(String articlename) {
		this.articlename = articlename;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		System.out.println(file);
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	@SuppressWarnings("deprecation")
	@Override
	public String execute() throws Exception {
		String root = ServletActionContext.getServletContext().getRealPath("/");
		System.out.println(root);
		InputStream is = new FileInputStream(file);
		ServletRequest request = ServletActionContext.getRequest();
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		String usermail = (String) session.getAttribute("usermail");
		File f = new File(Configure.LOCATION + usermail + Configure.SEPARATOR);
		if (!f.exists() && !f.isDirectory()) {
			System.out.println("//涓嶅瓨鍦�");
			f.mkdir();
			System.out.println("鍒涘缓鏂囦欢澶�");
		} else {
			System.out.println("//鐩綍瀛樺湪");
		}
		// fileFileName = URLEncoder.encode(fileFileName);
		File fs = new File(Configure.LOCATION + usermail + Configure.SEPARATOR, fileFileName);
		while (true) {
			if (!fs.exists()) {
				try {
					fs.createNewFile();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			} else {
				fileFileName = "1" + fileFileName;
				fs = new File(Configure.LOCATION + usermail + Configure.SEPARATOR, fileFileName);
			}
		}
		String url = Configure.ARTICLE_URL_START + Configure.SEPARATOR + Configure.SEPARATOR + usermail
				+ Configure.SEPARATOR + Configure.SEPARATOR + fileFileName;
		MysqlConnecter mc = new MysqlConnecter();
		System.out.println(url);
		ArrayList<Map<String, String>> result = mc.select("select userid from User where mail=\"" + usermail + "\"");
		String userid = result.get(0).get("1");
		String sql_article = "insert into Article(userid, articlename, url, status, parentid, childid, comment) values("
				+ userid + ", \"" + articlename + "\", \"" + url + "\", \"NOT_READ\", -1, \"#\", \"\")";
		System.out.println(sql_article);
		mc.update(sql_article);
		ArrayList<Map<String, String>> result1 = mc.select("select articleid from Article where url=\"" + url + "\"");
		String articleid = result1.get(0).get("1");
		String sql_log = "insert into Log(userid, articleid, action) values(" + userid + "," + articleid + ","
				+ "\"ADD_ARTICLE\")";
		System.out.println(sql_log);
		mc.update(sql_log);
		OutputStream os = new FileOutputStream(fs);
		byte[] buffer = new byte[500];
		int length = 0;
		while (-1 != (length = is.read(buffer, 0, buffer.length))) {
			os.write(buffer);
		}
		os.close();
		is.close();
		return "SUCCESS";
	}
}
