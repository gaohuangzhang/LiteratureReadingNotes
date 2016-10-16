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

public class FileUpLoadAction extends ActionSupport{
	 private String username;
	    
	//注意，file并不是指前端jsp上传过来的文件本身，而是文件上传过来存放在临时文件夹下面的文件
	    private File file;
	    
	    //提交过来的file的名字
	    private String fileFileName;
	    private String articlename;
	    //提交过来的file的MIME类型
	    private String fileContentType;

	    public String getArticlename()
	    {
	        return articlename;
	    }

	    public void setArticlename(String articlename)
	    {
	        this.articlename = articlename;
	    }

	    public File getFile()
	    {
	        return file;
	    }

	    public void setFile(File file)
	    {
	    	System.out.println(file);
	        this.file = file;
	    }

	    public String getFileFileName()
	    {
	        return fileFileName;
	    }

	    public void setFileFileName(String fileFileName)
	    {
	        this.fileFileName = fileFileName;
	    }

	    public String getFileContentType()
	    {
	        return fileContentType;
	    }

	    public void setFileContentType(String fileContentType)
	    {
	        this.fileContentType = fileContentType;
	    }
	    
	    @SuppressWarnings("deprecation")
		@Override
	    public String execute() throws Exception
	    {
	        String root = ServletActionContext.getServletContext().getRealPath("/");
	        System.out.println(root);
	        InputStream is = new FileInputStream(file);
	        ServletRequest request = ServletActionContext.getRequest();
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();
			String usermail = (String) session.getAttribute("usermail");
	        File f =new File(Configure.LOCATION+ usermail +  Configure.SEPARATOR);   
	        if  (!f .exists()  && !f.isDirectory())      
	        {       
	            System.out.println("//不存在");  
	            f.mkdir();
	            System.out.println("创建文件夹");
	        } else   
	        {  
	            System.out.println("//目录存在");  
	        }
//	        fileFileName = URLEncoder.encode(fileFileName);
	        File fs = new File(Configure.LOCATION+ usermail + Configure.SEPARATOR, fileFileName);
	        while (true){
	        	if(!fs.exists())    
	        	{    
	        		try {    
	        			fs.createNewFile();    
	        		} catch (IOException e) {    
	        			// TODO Auto-generated catch block    
	        			e.printStackTrace();    
	        		}
	        		break;
	        	} else {
	        		fileFileName = "1" + fileFileName;
	        		fs = new File(Configure.LOCATION+ usermail + Configure.SEPARATOR, fileFileName);
	        	}
	        }
	        String url = Configure.ARTICLE_URL_START + Configure.SEPARATOR + usermail + Configure.SEPARATOR + fileFileName;
	        MysqlConnecter mc = new  MysqlConnecter();
	        ArrayList<Map<String, String>> result = mc.select("select userid from User where mail=\"" + usermail +"\"");
	        String userid = result.get(0).get("1");
	        String sql_article = "insert into Article(userid, articlename, url, status, parentid, childid, comment) values(" 
	        		+ userid + ", \""+ articlename +"\", \""+url+"\", \"NOT_READ\", -1, \"#\", \"\")";
	        System.out.println(sql_article);
	        mc.update(sql_article);
	        ArrayList<Map<String, String>> result1 = mc.select("select articleid from Article where url=\"" + url +"\"");
	        String articleid = result1.get(0).get("1");
	        String sql_log = "insert into Log(userid, articleid, action) values(" + userid + "," + articleid + "," + "\"ADD_ARTICLE\")";
	        System.out.println(sql_log);
	        mc.update(sql_log);
	        OutputStream os = new FileOutputStream(fs);       
	        byte[] buffer = new byte[500];
	        int length = 0;	        
	        while(-1 != (length = is.read(buffer, 0, buffer.length)))
	        {
	            os.write(buffer);
	        }
	        os.close();
	        is.close();    
	        return "SUCCESS";
	    }
}
