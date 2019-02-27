package tripAdviser.board.model.vo;

import java.util.Date;

public class BoardAnswer {
	//댓글 객체
	private int commentNo;
	private int boardNoRef;
	private String memberId;
	private String content;
	private Date boardDate;
	private int commentLevel;	
	private int commentNoRef;
	
	
	public BoardAnswer() {}


	public BoardAnswer(int commentNo, int boardNoRef, String memberId, String content, Date boardDate, int commentLevel,
			int commentNoRef) {
		super();
		this.commentNo = commentNo;
		this.boardNoRef = boardNoRef;
		this.memberId = memberId;
		this.content = content;
		this.boardDate = boardDate;
		this.commentLevel = commentLevel;
		this.commentNoRef = commentNoRef;
	}


	public int getCommentNo() {
		return commentNo;
	}


	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}


	public int getBoardNoRef() {
		return boardNoRef;
	}


	public void setBoardNoRef(int boardNoRef) {
		this.boardNoRef = boardNoRef;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Date getBoardDate() {
		return boardDate;
	}


	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}


	public int getCommentLevel() {
		return commentLevel;
	}


	public void setCommentLevel(int commentLevel) {
		this.commentLevel = commentLevel;
	}


	public int getCommentNoRef() {
		return commentNoRef;
	}


	public void setCommentNoRef(int commentNoRef) {
		this.commentNoRef = commentNoRef;
	}


	@Override
	public String toString() {
		return "BoardAnswer [commentNo=" + commentNo + ", boardNoRef=" + boardNoRef + ", memberId=" + memberId
				+ ", content=" + content + ", boardDate=" + boardDate + ", commentLevel=" + commentLevel
				+ ", commentNoRef=" + commentNoRef + "]";
	}


	
	
	
}
