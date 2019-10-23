package com.gz.kl.user;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.gz.kl.util.DB;

public class UserMgr {
	private static UserMgr userMgr;

	private UserMgr() {
	};

	public static UserMgr getInstance() {
		if (userMgr == null) {
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
			while (rs.next()) {
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

	// ∑÷“≥≤È—Ø
	public List<User> getUsers(int pageSize, int pageNum) {
		List<User> listUsers = new ArrayList<User>();
		String str = pageSize + "," + pageNum + ";";
		String sql = "select * from user limit " + str;
		Connection conn = DB.getConnection();
		Statement stat = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stat, sql);

		try {
			while (rs.next()) {
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
			while (rs.next()) {
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

	public User useVerification(String username, String password)
			throws UserNotFoundException, PasswordErrorException {
		User user = null;
		if (username == null || password == null) {
			return user;
		}

		String sql = "select * from user where username='" + username + "';";

		Connection conn = DB.getConnection();
		Statement stat = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stat, sql);
		try {
			if (!rs.next()) {
				throw new UserNotFoundException("”√ªßŒ¥’“µΩ£°");
			}
			if (!password.equals(rs.getString("psword"))) {
				throw new PasswordErrorException("√‹¬Î¥ÌŒÛ£°");
			}
			user = new User();
			user = this.getUserFromRs(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stat);
			DB.close(conn);
		}
		return user;
	}

	public boolean useExitCheck(String username) throws UserNotFoundException {
		if (username == null) {
			return false;
		}

		String sql = "select * from user where username='" + username + "';";

		Connection conn = DB.getConnection();
		Statement stat = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stat, sql);
		try {
			if (!rs.next()) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(rs);
			DB.close(stat);
			DB.close(conn);
		}
		return true;
	}

	private User getUserFromRs(ResultSet rs) {
		User user = new User();
		try {
			user.setUserId(rs.getInt("userid"));
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

	public User getUser(int userId) {
		User user = null;

		String sql = "select * from user where userid='" + userId + "';";

		Connection conn = DB.getConnection();
		Statement stat = DB.getStatement(conn);
		ResultSet rs = DB.getResultSet(stat, sql);

		try {
			while (rs.next()) {
				user = this.getUserFromRs(rs);
			}
			DB.close(rs);
			DB.close(stat);
			DB.close(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	public void modifyUser(String userName, String phone, String address,
			int userId) {
		String sql = "update user set username= ? , phone = ? , address = ? where userid = ?";

		Connection conn = DB.getConnection();
		PreparedStatement pspStat = DB.getPreparedStatement(conn, sql);

		try {
			pspStat.setString(1, userName);
			pspStat.setString(2, phone);
			pspStat.setString(3, address);
			pspStat.setInt(4, userId);
			pspStat.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(pspStat);
			DB.close(conn);
		}
	}
	
	public void addUser(String userName, String password, String phone, String address) {
		String sql = "insert into user values (null, ?, ?, ?, ?, ?, 0)";
		
		Connection conn = DB.getConnection();
		PreparedStatement pspStat = DB.getPreparedStatement(conn, sql);
		
		try {
			pspStat.setString(1, userName);
			pspStat.setString(2, password);
			pspStat.setString(3, phone);
			pspStat.setString(4, address);
			pspStat.setDate(5, new Date(System.currentTimeMillis()));
			pspStat.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(pspStat);
			DB.close(conn);
		}
	}
	
	public void deleteUser(int userId) {
		String sql = "delete from user where userid = " + userId;
		
		Connection conn = DB.getConnection();
		Statement stat = DB.getStatement(conn);
		
		try {
			stat.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DB.close(stat);
			DB.close(conn);
		}
	}
}
