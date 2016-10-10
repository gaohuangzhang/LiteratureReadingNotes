package com.teamghz.connecter;
import java.util.ArrayList;
import java.util.Map;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MysqlConnecter mysql = new MysqlConnecter();
		
		String sql = "insert into User(username, mail, password) values(\"动车\",\"123456\",\"123456\")";
		 ArrayList<Map<String, String>> result = mysql.select("select * from User where mail=\"" + "123456" + "\"");
	        // map的遍历方法
	        for (Map<String, String> map : result) {
	            System.out.println("______________________");
	            for (Map.Entry<String, String> entry : map.entrySet()) {
	                System.out.println(entry.getKey() + "--->" + entry.getValue());
	            }
	        }
	        int i = mysql.update(sql);
		//int i = mysql.delete("delete from User where mail=\"" + "123456" + "\"" );
		System.out.println(i);
	      
	}

}
