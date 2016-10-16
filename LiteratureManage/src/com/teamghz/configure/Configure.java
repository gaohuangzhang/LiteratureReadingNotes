package com.teamghz.configure;

// this class used for configure your project
// the values in this class should be static and will be visited by other class
// you should eidt these values when your environment changed

public class Configure {
	
	public final static String USERNAME = "root";

	public final static String PASSWORD = "123456";

	public final static String DBNAME   = "DBGHZ";
	
	public final static String DRIVER   = "com.mysql.jdbc.Driver";
	
	public final static String URL      = "jdbc:mysql://localhost:3306/" + DBNAME +"?characterEncoding=utf8";
	
	/**
	 * the location of the user's folder (used for storing pdf files)
	 * 
	 * Windows, you should edit like: "C:\\somewhere\\LiteratureReadingNotes\\LiteratureManage\\WebContent\\Files\\"
	 * Linux or Mac like: "/home/me/Github/LiteratureReadingNotes/LiteratureManage/WebContent/Files/"
	 */
	public final static String LOCATION = "/home/me/Github/LiteratureReadingNotes/LiteratureManage/WebContent/Files/";
	/**
	 * Windows: should be "\\";
	 * Linux or Mac: should be "/";
	 */
	public final static String  SEPARATOR = "/";
	/**
	 * url begin with this
	 */
	public final static String ARTICLE_URL_START = "Files";
	
}
