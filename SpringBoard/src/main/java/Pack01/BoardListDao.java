package Pack01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BoardListDao {
	BoardVO board;
	
	BoardListDao(){}
	
	BoardListDao(BoardVO board){
		this.board = board;
	}
	public static List<BoardVO> getList() {
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
			List<BoardVO> list = new ArrayList<>();
			
			String sql = "select * from board";
			psmt = con.prepareStatement(sql);
			
		    rs = stmt.executeQuery(sql);
		    
		    while(rs.next()) {
		    	
		    	int boardNo = rs.getInt("boardNo");

				String id = rs.getString("id");
				String name = rs.getString("name");
				String title = rs.getString("title");

				String contents = rs.getString("contents");

				Date date = rs.getDate("date");	
				
		    }
		    
		    return list;
			
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
		
		
	}
}
