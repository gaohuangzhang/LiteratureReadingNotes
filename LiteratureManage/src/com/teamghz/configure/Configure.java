package com.teamghz.configure;

// this class used for configure your project
// the values in this class should be static and will be visited by other class
// you should eidt these values when your environment changed

public class Configure {
	
	public final static String USERNAME = "root";

	public final static String PASSWORD = "toor";

	public final static String DBNAME   = "DBGHZ";
	
	public final static String DRIVER   = "com.mysql.jdbc.Driver";
	
	public final static String URL      = "jdbc:mysql://localhost:3306/" + DBNAME +"?characterEncoding=utf8";
	
	/**
	 * true when run on tomcat
	 * false when run on your computer
	 */
	public final static boolean ONTOMCAT = true;
	/**
	 * if run on your computer, edit this please
	 * ---Where is the Files will be save---
	 * Windows: "C:\\somewhere\\LiteratureReadingNotes\\LiteratureManage\\WebContent\\Files\\"
	 * Linux or Mac: such as "/home/z/Github/LiteratureReadingNotes/LiteratureManage/WebContent/Files/"
	 */
	public final static String LOCATION = "/home/hp/LiteratureReadingNotes/LiteratureManage/WebContent/Files/";

	/**
	 * when run on tomcat maybe you want to edit it
	 * where you want to save on the server, 
	 */
	public final static String SLOCATION = "Files/";
	
	public final static String DOWNLOAD = "/home/hp/LiteratureReadingNotes/LiteratureManage/WebContent/";
	/**
	 * Windows: should be "\\";
	 * Linux or Mac: should be "/";
	 */
	public final static String  SEPARATOR = "/";/*windows add twice*/
	
	/**
	 * url begin with this
	 */
	public final static String ARTICLE_URL_START = "Files";
	/**
	 * for mysql url
	 * Windows: "\\\\"
	 * Linux: "/"
	 */
	public final static String MYSQL_SEPARATOR = "/";
	/**
	 * read status
	 * 
	 */
	public static enum STATUS {
		NOT_READ, // not read
		COARSE_READ, // coarse read
		INTENSIVE_READ, // intensive reading
	}
}
