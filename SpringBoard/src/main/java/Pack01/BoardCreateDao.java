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

public class BoardCreateDao {
	BoardVO board;
	
	
	BoardCreateDao(){}
	
	BoardCreateDao(BoardVO board){
		this.board = board;
	}
	public static void boardInsert(BoardVO board) {
		int res = 0;
		try {
			String url = MysqlAddr.URL;
			String user = MysqlAddr.USER;
			String pwd = MysqlAddr.PWD;
			
			PreparedStatement psmt = null;
			Connection con = null;
			
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user,pwd);
			
			Statement stmt = con.createStatement();
			List<BoardVO> list = new ArrayList<>();
			
			String sql = "insert into board(boardNo, id, name, title, contents, file, date) values(NULL,?,?,?,?,?,now())";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, board.getId());
			psmt.setString(2, board.getName());
			psmt.setString(3, board.getTitle());
			psmt.setString(4, board.getContents());
			psmt.setString(5, board.getFile());
			
		
		    res = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
