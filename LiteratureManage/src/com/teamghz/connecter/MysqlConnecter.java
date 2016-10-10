package com.teamghz.connecter;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.sql.Connection;
import com.teamghz.configure.*;

public class MysqlConnecter {
	private String dbDriver = Configure.DRIVER;
	private String dbUrl = Configure.URL;// 根据实际情况变化
	private String dbUser = Configure.USERNAME;
	private String dbPass = Configure.PASSWORD;

	public Connection getConn() {
		Connection conn = null;
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);// 注意是三个参数
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public int update(String sql) {
		int i = 0;
		/*
		 * String
		 * sql="update author set  authorid=?,name=?,age=?,country=? where authorid=?"
		 * ;//注意要有where条件
		 */
		Connection cnn = getConn();

		try {
			PreparedStatement preStmt = cnn.prepareStatement(sql);
			i = preStmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;// 返回影响的行数，1为执行成功
	}

	public ArrayList<Map<String, String>> select(String sql) {
		int i;
		ArrayList<Map<String, String>> result = new ArrayList<>();
		Connection cnn = getConn();// 此处为通过自己写的方法getConn()获得连接
		try {
			Statement stmt = cnn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Map<String, String> tmp = new HashMap<>();
				for (i = 1; i <= rs.getMetaData().getColumnCount(); i++) {
					tmp.put("" + i, rs.getString(i));
				}
				result.add(tmp);
			}
			// 可以将查找到的值写入类，然后返回相应的对象
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int delete(String sql) {
		/* String sql = "delete from author where authorid=?"; */
		int i = 0;
		Connection conn = getConn();// 此处为通过自己写的方法getConn()获得连接
		try {
			Statement stmt = conn.createStatement();
			i = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;// 如果返回的是1，则执行成功;
	}
}