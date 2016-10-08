package com.teamghz.connecter;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MysqlConnecter mysql = new MysqlConnecter();
		String sql = "insert into User(username, mail, password) values(\"dong\",\"123456\",\"123456\")";
		int i = mysql.update(sql);
		System.out.println(i);
	}

}
