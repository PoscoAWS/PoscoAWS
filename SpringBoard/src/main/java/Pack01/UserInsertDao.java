package Pack01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class UserInsertDao {
	UserVO user;
	
	UserInsertDao(){}
	UserInsertDao(UserVO user){
		this.user = user;
	}
	
	public boolean insertUser() {
		try {
			String url = MysqlAddr.URL;
			String user = MysqlAddr.USER;
			String pwd = MysqlAddr.PWD;
	
			PreparedStatement psmt = null;
			Connection con = null;
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user,pwd);
			
			String sql = "insert into user values(?,?,?)";
			
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, this.user.getName());
			psmt.setString(2, this.user.getId());
			psmt.setString(3, this.user.getPw());
			
			psmt.executeUpdate();
			
			psmt.close();
			con.close();
			
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean kakaoSignUp(UserVO userVO) {
		try {
			String url = MysqlAddr.URL;
			String user = MysqlAddr.USER;
			String pwd = MysqlAddr.PWD;
			
			PreparedStatement psmt = null;
			Connection con = null;
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user,pwd);
			
			String sql = "insert into user(name, id) values(?, ?)";
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, userVO.getName());
			psmt.setString(2, userVO.getId());
			
			psmt.executeUpdate();
			
			psmt.close();
			con.close();
			
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	 
}
