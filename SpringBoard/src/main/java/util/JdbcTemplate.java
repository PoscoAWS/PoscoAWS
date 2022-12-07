package util;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class JdbcTemplate {
	public static Connection getConnection() {
		Connection con = null;
		String driver = "";
		String url = "";
		String id = "";
		String pw = "";

		Properties prop = new Properties();
		try {
			String currDir = JdbcTemplate.class.getResource(".").getPath();
			prop.load(new FileReader(currDir + "/jdbc.properties"));
			
			driver = prop.getProperty("driver");
			url = prop.getProperty("url");
			id = prop.getProperty("user");
			pw = prop.getProperty("password");
			
			Class.forName(driver);
			
		} catch (ClassNotFoundException e) {
			System.out.println("[ERROR] 드라이버 등록 실패");
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		try {
			con = DriverManager.getConnection(url, id, pw);
		} catch (SQLException e) {
			System.out.println("[ERROR] mysql 연결 실패");
			e.printStackTrace();
		}
		return con; // connection 객체 반환
	}
}
