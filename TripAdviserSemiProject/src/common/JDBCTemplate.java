package common;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	private static Properties prop;
	private static String fileName;
	private static String driver;
	private static String url;
	private static String dbId;
	private static String dbPw;
	private static Connection conn = null;
	
	static {
		prop = new Properties();
		fileName = JDBCTemplate.class.getResource("/sql/common/driver.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
			driver = prop.getProperty("driver");
			url = prop.getProperty("url");
			dbId = prop.getProperty("id");
			dbPw = prop.getProperty("pw");
		}
		catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, dbId, dbPw);
			conn.setAutoCommit(false);
		}
		catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs) {
		try {
			if(rs != null && !rs.isClosed()) {
				rs.close();
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void commit() {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.commit();
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback() {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.rollback();
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
