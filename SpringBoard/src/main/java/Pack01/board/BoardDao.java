package Pack01.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import Pack01.BoardVO;
import util.JdbcTemplate;

@Repository
public class BoardDao {
	public List<BoardVO> getList() {
		ArrayList<BoardVO> res = null;
		String sql = "select * from board";
		
		try(Connection con = JdbcTemplate.getConnection();
			PreparedStatement pstm = con.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();) {
			
			if(rs != null) {
				res = new ArrayList<BoardVO>();
				while(rs.next()) {
					BoardVO dto = new BoardVO();
					dto.setBoardNo(rs.getInt("boardNo"));
					dto.setName(rs.getString("name"));
					dto.setId(rs.getString("id"));
					dto.setTitle(rs.getString("title"));
					dto.setContents(rs.getString("contents"));
					dto.setDate(rs.getDate("date"));
					res.add(dto);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return res;
	}

	public void updateBoard(BoardVO board) {
		String sql_update = "UPDATE board SET title=?, contents=?, date=now() WHERE boardNo=?";
		
		
		try(Connection con = JdbcTemplate.getConnection();
			PreparedStatement pstm = con.prepareStatement(sql_update);) {
			
			pstm.setString(1, board.getTitle());
			pstm.setString(2, board.getContents());
			pstm.setInt(3, board.getBoardNo());
				
			pstm.executeUpdate();
			

		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
	public void deleteBoard(int boardNo) {
		String sql = "delete from board WHERE boardNo=?";
		
		
		try(Connection con = JdbcTemplate.getConnection();
			PreparedStatement pstm = con.prepareStatement(sql);) {
			
			pstm.setInt(1, boardNo);
			
			pstm.executeUpdate();
			

		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
}
