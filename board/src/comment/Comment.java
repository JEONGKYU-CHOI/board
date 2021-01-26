package comment;

import java.sql.Timestamp;
import java.time.LocalDateTime;


import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Comment {

	private int id;
	private int boardId;
	private String commentTitle;
	private String commentContent;
	private String commentPassword;
	private String commentName;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Timestamp wdate;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Timestamp udate;
	
	public Comment() {}

	public Comment(int id, int boardId, String commentTitle, String commentContent, String commentPassword,
			String commentName, Timestamp wdate, Timestamp udate) {
		super();
		this.id = id;
		this.boardId = boardId;
		this.commentTitle = commentTitle;
		this.commentContent = commentContent;
		this.commentPassword = commentPassword;
		this.commentName = commentName;
		this.wdate = wdate;
		this.udate = udate;
	}
       
	public int getId() {
		return id;
	}
     
	public void setId(int id) {
		this.id = id;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getCommentTitle() {
		return commentTitle;
	}

	public void setCommentTitle(String commentTitle) {
		this.commentTitle = commentTitle;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getCommentPassword() {
		return commentPassword;
	}

	public void setCommentPassword(String commentPassword) {
		this.commentPassword = commentPassword;
	}

	public String getCommentName() {
		return commentName;
	}

	public void setCommentName(String commentName) {
		this.commentName = commentName;
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

	@Override
	public String toString() {
		return "Comment [id=" + id + ", boardId=" + boardId + ", commentTitle=" + commentTitle + ", commentContent="
				+ commentContent + ", commentPassword=" + commentPassword + ", commentName=" + commentName + ", wdate="
				+ wdate + ", udate=" + udate + "]";
	}

	
	
}
