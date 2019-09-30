package com.gz.kl.user;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.gz.kl.util.DB;

public class UserMgr {
	private static UserMgr userMgr;
	
	private UserMgr() {};
	
	public static UserMgr getInstance() {
		if(userMgr == null) {
			userMgr = new UserMgr();
		}
		return userMgr;
	}
	
	public List<User> getUsers() {
		List<User> listUsers = new ArrayList<User>();
		
		String sql = "select * from user;";
		Connection conn = DB.getConnection();
		Statement stat = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stat, sql);
		
		try {
			while(rs.next()) {
				User user = this.getUserFromRs(rs);
				listUsers.add(user);
			}
			DB.close(rs);
			DB.close(stat);
			DB.close(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listUsers;
	}
	
	//∑÷“≥≤È—Ø
	public List<User> getUsers(int pageSize, int pageNum) {
		List<User> listUsers = new ArrayList<User>();
		String str = pageSize + "," + pageNum + ";";
		String sql = "select * from user limit " + str;
		Connection conn = DB.getConnection();
		Statement stat = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stat, sql);
		
		try {
			while(rs.next()) {
				User user = this.getUserFromRs(rs);
				listUsers.add(user);
			}
			DB.close(rs);
			DB.close(stat);
			DB.close(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listUsers;
	}
	
	public int getTableLength() {
		int length = 0;
		String sql = "select count(userid) as length from user";
		
		Connection conn = DB.getConnection();
		Statement stat = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stat, sql);
		
		try {
			while(rs.next()) {
			length = rs.getInt("length");	
			}
			
			DB.close(rs);
			DB.close(stat);
			DB.close(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return length;
	}
	
	public boolean useVerification(String username, String password) {
		if(username == null || password == null || username.equals("")) {
			return false;
		}
		
		String sql = "select * from user where username='" + username + "';";
		String pwd = null;
		
		Connection conn = DB.getConnection();
		Statement stat = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stat, sql);
		try {
			while(rs.next()) {
				pwd = rs.getString("psword");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(rs);
		DB.close(stat);
		DB.close(conn);
		if(pwd == null) return false;
		return pwd.equals(password.toString())? true:false;
	}

	private User getUserFromRs(ResultSet rs) {
		User user = new User();
		try {
			user.setUserName(rs.getString("username"));
			user.setPhone(rs.getString("phone"));
			user.setAddress(rs.getString("address"));
			user.setRegistTime(rs.getDate("registtime"));
			user.setGrade(rs.getInt("grade"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
}
