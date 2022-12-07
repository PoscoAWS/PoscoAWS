package Pack01;

import java.util.Date;

public class BoardVO {
	int no;
	String id;
	String title;
	String contents;
	Date date;
	
	public BoardVO(int no, String id, String title, String contents, Date date) {
		super();
		this.no = no;
		this.id = id;
		this.title = title;
		this.contents = contents;
		this.date = date;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
