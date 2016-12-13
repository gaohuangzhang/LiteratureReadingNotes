package com.teamghz.action;

import java.io.File;
import java.util.ArrayList;
import java.util.Map;


import com.teamghz.configure.Configure;
import com.teamghz.connecter.*;

public class DeleteArticle {
	private String articleid;
	private String flag;
	
	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
	public void setArticleid(String articleid) {
		this.articleid = articleid;
	}

	public String deleteArticle() {
		MysqlConnecter mc = new MysqlConnecter();
		String sql = "select * from Article where articleid=" + articleid;
		String url = "";
		ArrayList<Map<String, String>> re = mc.select(sql);
		if (re.size() != 0) {
			url = re.get(0).get("4");
			sql = "delete from Article where articleid=" + articleid;
			int deletesucess = mc.delete(sql);
			File f = null;
			if (Configure.ONTOMCAT) {
				f = new File(Configure.DOWNLOAD+ url);
			} else {
				f = new File(Configure.DOWNLOAD+ url);
			}
			if (f.exists()) {
				f.delete();
			}
		}
		flag = "TRUE";
		return "success";
	}
}
