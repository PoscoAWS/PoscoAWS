package Pack01.board;

public class CommentDTO {
	int boardNo;
	String id;
	String name;
	String comment;
	CommentDTO(){}
	public CommentDTO(int boardNo, String id, String name, String comment) {
		super();
		this.boardNo = boardNo;
		this.id = id;
		this.name = name;
		this.comment = comment;
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
}
