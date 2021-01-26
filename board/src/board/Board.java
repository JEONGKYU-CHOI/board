package board;

import java.sql.Timestamp;


import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.mysql.cj.jdbc.Blob;

public class Board {
	private int id;
	private String boardTitle;
	private String boardContent;
	private String boardName;
	private String boardPassword;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Timestamp wdate;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Timestamp udate;
	private int boardView;

	
	public Board() {}

	public Board(int id, String boardTitle, String boardContent, String boardName, String boardPassword,
			Timestamp wdate, Timestamp udate, int boardView) {
		super();  
		this.id = id;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardName = boardName;
		this.boardPassword = boardPassword;
		this.wdate = wdate;
		this.udate = udate;
		this.boardView = boardView;
		
	}
    
	public int getId() {
		return id;
	}       

	public void setId(int id) {
		this.id = id;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	public String getBoardPassword() {
		return boardPassword;
	}

	public void setBoardPassword(String boardPassword) {
		this.boardPassword = boardPassword;
	}

	public Timestamp getWdate() {
		return wdate;
	}

	public void setWdate(Timestamp wdate) {
		this.wdate = wdate;
	}

	public Timestamp getUdate() {
		return udate;
	}

	public void setUdate(Timestamp udate) {
		this.udate = udate;
	}

	public int getBoardView() {
		return boardView;
	}

	public void setBoardView(int boardView) {
		this.boardView = boardView;
	}

	@Override
	public String toString() {
		return "Board [id=" + id + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", boardName="
				+ boardName + ", boardPassword=" + boardPassword + ", wdate=" + wdate + ", udate=" + udate
				+ ", boardView=" + boardView + "]";
	}


	

	
	
}
