package com.teamghz.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.teamghz.configure.Configure;
import com.teamghz.connecter.MysqlConnecter;

public class Avatar {
	private String username;	// 用户名
	private File file;	// 文件
	private String fileFileName;	// 文件名
	private String fileContentType;		// 文件内容类型
	private String flag;	// 文件上传状态，TRUE成功，FALSE失败



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

	public String uploadAvatar() throws FileNotFoundException{
		String root = ServletActionContext.getServletContext().getRealPath("/");
		System.out.println(root);
		System.out.println("HERE2" + file);
		InputStream is = new FileInputStream(file);
		ServletRequest request = ServletActionContext.getRequest();		// 获取Servlet请求对象
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();		// 创建session
		String usermail = (String) session.getAttribute("usermail");	// 获取session——用户邮箱
		File f = null;
		
		System.out.println("HERE1");
		if (Configure.ONTOMCAT) {
			f = new File(root + Configure.AVATAR_SLOCATION + Configure.SEPARATOR);
			System.out.println("where: " + root + Configure.LOCATION + usermail + Configure.SEPARATOR);
		} else {
			f = new File(Configure.AVATAR_LOCATION + Configure.SEPARATOR);
		}
		try {
			if (!f.exists() && !f.isDirectory()) {
				System.out.println("没有文件夹");
				f.mkdir();
				System.out.println("创建成功");
			} else {
				System.out.println("文件夹存在");
			}
			fileFileName = fileFileName.replaceAll(" ", "");
			MysqlConnecter mc = new MysqlConnecter();
			ArrayList<Map<String, String>> result = mc.select("select userid from User where mail=\"" + usermail + "\"");
			String userid = result.get(0).get("1");
			System.out.println(fileFileName);
				String pattern = "(\\.jpg|\\.png|\\.svg|\\.jpeg)$";
				Pattern r = Pattern.compile(pattern);
				Matcher m = r.matcher("351190D5-6556-442A-B18B-2A6FEC02CB29.jpg");
				if (m.find( )) {
				System.out.println(m.group(0));
				fileFileName=userid+m.group(0);
				}
			File fs = null;
			if (Configure.ONTOMCAT) {
				fs = new File(root + Configure.AVATAR_SLOCATION + Configure.SEPARATOR, fileFileName);
			} else {
				fs = new File(Configure.AVATAR_LOCATION + Configure.SEPARATOR, fileFileName);
			}
			
			if (!fs.exists()) {
				try {
					fs.createNewFile();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		
			}
			
		
			String url = Configure.AVATAR_URL_START  + Configure.MYSQL_SEPARATOR + fileFileName;	// 文件URL
			
			System.out.println(url);
			
			
			String sql_avatar = "update  User set avatar =\"" + url + "\" where userid=" + userid;
			System.out.println(sql_avatar);
			mc.update(sql_avatar);
			
			String sql_log = "insert into Log(userid, action) values (" + userid + "," + "\"修改了头像\")";
			System.out.println(sql_log);
			mc.update(sql_log);
			OutputStream os = new FileOutputStream(fs);		// 写出到目的文件中
			byte[] buffer = new byte[500];
			int length = 0;
			while (-1 != (length = is.read(buffer, 0, buffer.length))) {
				os.write(buffer);
			}
			os.close();
			is.close();
			flag = "TRUE";
			System.out.println("SUCCESS");
			return "SUCCESS";
		} catch (Exception e) {
			System.out.println("FALSE");
			flag = "FALSE";
			return "FALSE";
		}
	}

}
