package Pack01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class LoginDao {
	String id;
	int pw;
	LoginDao(){}
	LoginDao(String id, int pw){
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
		    	return (rs.getInt(1) == pw) ? rs.getString(2) : null;		    	
		    }
		    
		    return null;
			
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
		
		
	}
}
