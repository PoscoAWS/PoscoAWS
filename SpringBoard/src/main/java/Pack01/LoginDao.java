package Pack01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class LoginDao {
	String id;
	String pw;
	LoginDao(){}
	LoginDao(String id){
		this.id = id;
	}
	LoginDao(String id, String pw){
		this.id = id;
		this.pw = pw;
	}
	public String loginUser() {
		try {
			String url = MysqlAddr.URL;
			String user = MysqlAddr.USER;
			String pwd = MysqlAddr.PWD;
			
			PreparedStatement psmt = null;
			Connection con = null;
			ResultSet rs = null;
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user,pwd);
			Statement stmt = con.createStatement();
			
			String sql = "select pw, name from user where id = '" + id + "'";
		    rs = stmt.executeQuery(sql);
		    
		    while(rs.next()) {
		    	return (pw.equals(rs.getString(1))) ? rs.getString(2) : null;		    	
		    }
			
		} catch (Exception e) {
		}
		return null;
	}
	
	public boolean kakaoUser(String kakaoUserId) {
		// true : 카카오 아이디 존재
		// false : 카카오 아이디 존재 X
		boolean result = false;
		try {
			String url = MysqlAddr.URL;
			String user = MysqlAddr.USER;
			String pwd = MysqlAddr.PWD;
			
			PreparedStatement psmt = null;
			Connection con = null;
			ResultSet rs = null;
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user,pwd);
			Statement stmt = con.createStatement();
			
			String sql = "select count(*) from user where id = '" + kakaoUserId + "'";
			rs = stmt.executeQuery(sql);
		    
		    while(rs.next()) {
		    	result = (rs.getInt(1) > 0) ? true : false;
		    }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
