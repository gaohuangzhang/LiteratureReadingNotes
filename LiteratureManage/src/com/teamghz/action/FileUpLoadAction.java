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
	private File file;
	private String fileFileName;
	private String articlename;
	private String fileContentType;
	private String flag;
	
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

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
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
		File f = null;
		if (Configure.ONTOMCAT) {
			f = new File(root + Configure.SLOCATION + usermail + Configure.SEPARATOR);
			System.out.println("where: " + root + Configure.LOCATION + usermail + Configure.SEPARATOR);
		} else {
			f = new File(Configure.LOCATION + usermail + Configure.SEPARATOR);
			System.out.println("where: " + Configure.LOCATION + usermail + Configure.SEPARATOR);
		}
		try {
			if (!f.exists() && !f.isDirectory()) {
				System.out.println("没有文件夹");
				f.mkdir();
				System.out.println("创建成功");
			} else {
				System.out.println("文件存在");
			}
			fileFileName = fileFileName.replaceAll(" ", "");
			File fs = null;
			if (Configure.ONTOMCAT) {
				fs = new File(root + Configure.SLOCATION + usermail + Configure.SEPARATOR, fileFileName);
			} else {
				fs = new File(Configure.LOCATION + usermail + Configure.SEPARATOR, fileFileName);
			}
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
					if (Configure.ONTOMCAT) {
						fs = new File(root + Configure.SLOCATION + usermail + Configure.SEPARATOR, fileFileName);
					} else {
						fs = new File(Configure.LOCATION + usermail + Configure.SEPARATOR, fileFileName);
					}
				}
			}
			String url = Configure.ARTICLE_URL_START  + Configure.MYSQL_SEPARATOR + usermail
					+ Configure.MYSQL_SEPARATOR  + fileFileName;
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
			flag = "TRUE";
			return "SUCCESS";
		} catch (Exception e) {
			flag = "FALSE";
			return "FALSE";
		}
	}
}
