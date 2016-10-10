package com.teamghz.configure;

// this class used for configure your project
// the values in this class should be static and will be visited by other class
// you should eidt these values when your environment changed

public class Configure {
	
	public final static String USERNAME = "root";
	public final static String PASSWORD = "password";
	public final static String DBNAME   = "DBGHZ";
	public final static String DRIVER   = "com.mysql.jdbc.Driver";
	public final static String URL      = "jdbc:mysql://localhost:3306/" + DBNAME+"?characterEncoding=utf8";
	
	
}
