package com.teamghz.action;

public class ReadArticle {
	private String url;
	private String articlename;
	

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	

	public String getArticlename() {
		return articlename;
	}

	public void setArticlename(String articlename) {
		this.articlename = articlename;
	}
	public String readPDF() {
		System.out.println("HEHEH");
		System.out.println(url);
		return "SUCCESS";
	}
}
