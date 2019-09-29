package com.gz.kl.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DB {
	
	public static Connection getConnection () {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsptest?useSSL=true&user=root&password=root");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static Statement getStatement(Connection conn) {
		Statement stat = null;
		try {
			stat = conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stat;
	}
	
	public static PreparedStatement getPreparedStatement(Connection conn, String sql) {
		PreparedStatement prepStat = null;
		try {
			prepStat = conn.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prepStat;
	}
	
	public static ResultSet getResultSet(Statement stat, String sql) {
		ResultSet rs = null;
		try {
			rs = stat.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public static void close (Connection conn) {
		try {
			if( conn != null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close (Statement stat) {
		try {
			if( stat != null) {
				stat.close();
				stat = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close (PreparedStatement pspStat) {
		try {
			if( pspStat != null) {
				pspStat.close();
				pspStat = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close (ResultSet rs) {
		try {
			if( rs != null) {
				rs.close();
				rs = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
