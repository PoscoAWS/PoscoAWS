package Pack01;
import java.util.Date;

public class BoardVO {
	int boardNo;
	String name;
	String id;
	String title;
	String contents;
	Date date;
	String file;
	
	public BoardVO() {}
	
	public BoardVO(int boardNo, String name, String id, String title, String contents, Date date, String file) {
		super();
		this.boardNo = boardNo;
		this.name = name;
		this.id = id;
		this.title = title;
		this.contents = contents;
		this.date = date;
		this.file = file;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
}