package Pack01.board;

import java.util.Date;

public class CommentVO {
	int commentNo;
	int boardNo;
	String id;
	String name;
	String comment;
	Date date;
	CommentVO(){}
	public CommentVO(int commentNo, int boardNo, String id, String name, String comment, Date date) {
		super();
		this.commentNo = commentNo;
		this.boardNo = boardNo;
		this.id = id;
		this.name = name;
		this.comment = comment;
		this.date = date;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
