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
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listUsers;
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
