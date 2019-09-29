package com.gz.kl.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.mysql.jdbc.PreparedStatement;

public class DBMgr {
	private static DBMgr dbManager;
	private Connection conn;
	private Statement stat;
	private PreparedStatement prepStat;
	private ResultSet rs;
	
	private DBMgr() {
		
	}
	
	public static DBMgr getDBInstance() {
		if(dbManager == null) {
			dbManager = new DBMgr();
		}
		return dbManager;
	}

	public Connection getConn() {
		return conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}

	public Statement getStat() {
		return stat;
	}

	public void setStat(Statement stat) {
		this.stat = stat;
	}

	public PreparedStatement getPrepStat() {
		return prepStat;
	}

	public void setPrepStat(PreparedStatement prepStat) {
		this.prepStat = prepStat;
	}

	public ResultSet getRs() {
		return rs;
	}

	public void setRs(ResultSet rs) {
		this.rs = rs;
	}
	
	
}
